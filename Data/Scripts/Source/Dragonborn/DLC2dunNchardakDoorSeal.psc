Scriptname DLC2dunNchardakDoorSeal extends DLC2dunNchardakSubmersible Conditional
{Script for the door seals in Nchardak that the player opens with the red pedestals.}

ObjectReference property LinkedDoor Auto						;The door this seal seals (if any).
ObjectReference property PermittedActivator Auto				;For special cases (the Centurion Door), one specific activator we allow to open the door.
ObjectReference property LinkedPedestal Auto					;For special cases (doors that reseal), the extrude pedestal that opens the door, so we can reset it when we reclose.
bool property IsLoadDoor = True Auto							;When the seal is released, allow the player to activate load doors. Auto-open standard doors.
bool property NoReallyThisShouldBeSubmersible = False Auto	;Overrides the default 'True' submersibility, since we don't need or want most sealed doors to be submersible.
bool property ActivationShouldToggle = False Auto				;For activation by Permitted Activators only, should we toggle the gate open and closed?
Message property SealedDoorMessage Auto							;Message to display on interaction.

bool initialized									;Have we initialized the seal yet?
bool isWaitingFor3DToLoad						;Are we waiting for our 3D to load?
bool Property isSealed = True Auto Conditional	;Are we still sealed?
int doorIndex										;Registry index on DLC2dunNchardakTracking used to clear the door's name alias.
bool busy = False									;Are we in the process of opening or closing?
bool isReleasingSeal = False						;Are we in the process of opening? Used to determine if OnUpdate should process this.
bool isRestoringSeal = False						;Are we in the process of closing? Used to determine if OnUpdate should process this.

Event OnCellAttach()
	if (!initialized)
		isActuallySubmersible = NoReallyThisShouldBeSubmersible
		Parent.OnCellAttach()
		
		;All doors are initially closed.
		Self.PlayAnimation("StartClosed")
		
		;Block activation on both the seal and the linked door.
		Self.BlockActivation(True)
		Self.SetNoFavorAllowed(True)
		if (LinkedDoor != None)
			LinkedDoor.BlockActivation(True)
			LinkedDoor.SetNoFavorAllowed(True)
			;Request a registry index from the Nchardak Tracking Quest.
			doorIndex = (DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).RegisterObject(LinkedDoor)
			(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).ClearName(doorIndex, LinkedDoor)
		EndIf
		if (!isSealed)
			ReleaseSeal()
		EndIf
	EndIf
	if (Is3DLoaded())
		if (!isSealed)
			Self.PlayAnimation("StartOpen")
		Else
			Self.PlayAnimation("StartClosed")
		EndIf
	Else
		isWaitingFor3DToLoad = True
		RegisterForSingleUpdate(0.1)	
	EndIf
EndEvent

Function ReleaseSeal()
	;Handle this in an OnUpdate event thread to avoid blocking the pedestal thread.
	isSealed = False
	isReleasingSeal = True
	RegisterForSingleUpdate(0.1)
EndFunction

;For doors that we want to re-seal when submerged...
Function RestoreSeal()
	;Handle this in an OnUpdate event thread to avoid blocking the main thread.
	isSealed = True
	isRestoringSeal = True
	RegisterForSingleUpdate(0.1)
EndFunction

Event OnUpdate()
	if (isWaitingFor3DToLoad)
		if (Is3DLoaded())
			isWaitingFor3DToLoad = False
			if (!isSealed)
				Self.PlayAnimation("StartOpen")
			Else
				Self.PlayAnimation("StartClosed")
			EndIf
		Else
			isWaitingFor3DToLoad = True
			RegisterForSingleUpdate(0.1)	
		EndIf
	ElseIf (isReleasingSeal)
		If (busy)
			RegisterForSingleUpdate(1)
		Else
			busy = True
			isReleasingSeal = False
			RegisterForAnimationEvent(Self, "Opened")
			Self.PlayAnimation("Open")
			if (LinkedDoor != None)
				LinkedDoor.Lock(False)
				if (IsLoadDoor)
					(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).RestoreName(doorIndex)
					LinkedDoor.BlockActivation(False)
					LinkedDoor.SetNoFavorAllowed(False)
; 					Debug.Trace("Allowing Favor On: " + Self)
				Else
					LinkedDoor.SetOpen(True)
				EndIf
			EndIf
			busy = False
		EndIf
	ElseIf (isRestoringSeal)
		If (busy)
			RegisterForSingleUpdate(1)
		Else
			busy = True
			isRestoringSeal = False
			RegisterForAnimationEvent(Self, "Closed")
			Self.PlayAnimation("Close")
			if (LinkedDoor != None)
				(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).ClearName(doorIndex, LinkedDoor)
				LinkedDoor.BlockActivation(True)
				(LinkedPedestal as DLC2dunNchardakPedestalScript).ResetExtrudePedestal()
			EndIf
			busy = False
		EndIf
	EndIf
EndEvent

Event OnAnimationEvent(ObjectReference source, string eventName)
	if (eventName == "Closed")
; 		Debug.Trace("Closed received.")
		UnregisterForAnimationEvent(Self, "Closed")
		busy = False
	Else
; 		Debug.Trace("Opened received.")
		UnregisterForAnimationEvent(Self, "Opened")
		busy = False
	EndIf
EndEvent

Event OnActivate(ObjectReference akActivator)
	if (akActivator == PermittedActivator)
		if (isSealed)
			ReleaseSeal()
		ElseIf (!isSealed && ActivationShouldToggle)
			RestoreSeal()
		EndIf
	EndIf
EndEvent