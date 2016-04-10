Scriptname DLC2dunNchardakPedestalScript extends DLC2dunNchardakSubmersible
{Script for the Nchardak Control Cube Pedestals. For legacy reasons, this script controls *all* types of pedestals and all of their individual variations.}

;Properties related to the pedestal itself.
MiscObject property DLC2dunNchardakCube Auto	;The cube base object.
bool property ShouldExtrude = False Auto		;Should this pedestal give the cube back immediately upon use? (Red vs. Blue)
bool property StartsFilled = False Auto			;Should a cube be initially placed in this pedestal?
bool property SuppressActivation = False Auto	;Should we suppress activation from the player, and only allow it from non-Actor references? Used by the bridge puzzle pedestals in the Aqueduct.
bool property ifExtrudeUseOnlyOnce = True Auto	;Internal: If this is an Extrude pedestal, should we only allow the player to use it if it isn't in the 'used' state?
float property AdditionalReturnDelay = 0.0 Auto	;Additional wait time before we allow this pedestal to be activated again.
Message property FailureMessageNoCube Auto		;Message to display if the player is out of control cubes.
Message property FailureMessageAlreadyOpen Auto	;Message to display for extrude pedestals if they can only be used once and have already been used.

;Properties related to pedestal interaction effects. Only used for Hold pedestals (ShouldExtrude=False).
Sound property AMBRumbleShakeGreybeards Auto	;Rumble & Shake Audio (Lv1)
Sound property AmbRumbleShake Auto				;Rumble & Shake Audio (Lv2)
int property RumbleShakeIntensity = 0 Auto		;Intensity for rumble and shake when cubes are inserted or removed. 0=None, 1=Light(Unused?), 2=Normal(Water)

;Properties related to the MQ04 Quest Objectives
bool property isBoilerPedestal = False Auto			;Is this one of the four pedestals that controls the boilers?
bool property isBoilerWaterPedestal = False Auto		;Is this one of the three pedestals that controls the water level in the Great Chamber area?

;Actions to trigger when a cube is inserted or removed.
bool Act_HasPerformedAction = False								;Internal: For 'Hold' pedestals, have we performed the 'Insert' action? If so, the next interaction performs the 'Remove' action.
ObjectReference property Act_WaterPlaneToModify01 Auto		;Move this water plane.
bool property Act_WaterPlane01ShouldIncrement = False Auto	;Should we move it up or down?
ObjectReference property Act_ObjectToActivate01 Auto			;Activate these objects.
ObjectReference property Act_ObjectToActivate02 Auto
ObjectReference property Act_ObjectToActivate03 Auto
ObjectReference property Act_ObjectToEnable Auto
ObjectReference property Act_ObjectToDisable Auto
ObjectReference property Act_ObjectToActivateOnRemoveOnly01 Auto
ObjectReference property Act_SealedDoor Auto					;Door seal to break.
ObjectReference property Act_Boiler Auto						;Boiler to start.
ObjectReference property Act_Piston Auto						;Linked chain of pistons to stop or start.
ObjectReference property Act_Dust Auto
Quest property Act_QuestToSet Auto								;On insertion, set this quest stage.
int property Act_StageToSet Auto

bool initialized = False				;Internal: Have we initialized yet?
bool isWaitingForLoop = False		;Internal: Are we waiting for the 'Loop' animation event?
bool property nextEventIsBackward = False auto hidden		;Internal: For Extude pedestals (only), which animation do we play next?


;----------------
;Initialization ------------------------------------------------------------------
;----------------

;If the pedestal begins with a cube in place, record its action as having been performed.
;This allows us to 'undo' the action when the player takes the cube, typically raising the water level.
Event OnInit()
	Act_HasPerformedAction = StartsFilled
EndEvent

;When first attached, run our initialization.
Event OnLoad()
	;Initialize the pedestal.
	if (!initialized)
		initialized = True
		if (StartsFilled)
			Self.PlayAnimationAndWait("Forward", "Left")
			GoToState("Filled")
		EndIf
	Else
		;NEW: For Hold pedestals only, play the animation for the state we *should* be in, just in case we're not in that state.
		if (!shouldExtrude)
			if (GetState() == "Empty")
; 				Debug.Trace("PEDESTAL: " + Self + " sets to Empty/Backward.")
				Self.PlayAnimation("Backward")
			ElseIf (GetState() == "Filled")
; 				Debug.Trace("PEDESTAL: " + Self + " sets to Filled/Forward.")
				Self.PlayAnimation("Forward")
			Else
; 				Debug.Trace("PEDESTAL: " + Self + " wasn't in either the Empty or Filled states.")
			EndIf
		EndIf
	EndIf
EndEvent


;--------------
;States ------------------------------------------------------------------
;--------------

;EMPTY STATE: The pedestal doesn't have a cube in it. Interaction means inserting a cube.
Auto State Empty
	Event OnActivate(ObjectReference akActivator)
		if (SuppressActivation)
			;For the bridge pedestals in the Aqueduct, we suppress direct activation to allow them to be managed by a single puzzle controller.
			;We then ignore activation from all actors, accepting it only from the controller.
; 			;Debug.Trace(akActivator)
			if ((akActivator as Actor) == None)
				if (Game.GetPlayer().GetItemCount(DLC2dunNchardakCube) > 0)
					GoToState("Busy")
; 					;Debug.Trace("Inserting")
					InsertCubePlayer()
; 					;Debug.Trace("Returning Activation Complete call.")
					(akActivator as DLC2dunNchardakAqueductController).ActivationComplete()
				Else
					FailureMessageNoCube.Show()
				EndIf
			EndIf
		Else			
			if (akActivator == Game.GetPlayer())
				if (akActivator.GetItemCount(DLC2dunNchardakCube) > 0)
					GoToState("Busy")
					InsertCubePlayer()
				Else
					FailureMessageNoCube.Show()
				EndIf
			EndIf
		EndIf
	EndEvent
EndState

;FILLED STATE: The pedestal is a 'Hold' pedestal, and has a cube in it. Interaction means removing the cube.
State Filled
	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			GoToState("Busy")
			RemoveCubePlayer()
		EndIf
	EndEvent
EndState

;BUSY STATE: The player has inserted a cube, and the pedestal is animating. Do nothing on interaction.
State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState


;------------------------------
;Inserting and Removing Cubes ------------------------------------------------------------------
;------------------------------

;The player inserts a cube into the pedestal.
Function InsertCubePlayer()
	GoToState("Busy")
	
	;Is this an 'Extrude' pedestal (which just returns the cube) or a 'Hold' pedestal (which keeps it)?
	if (shouldExtrude)
		if (nextEventIsBackward)
			if (ifExtrudeUseOnlyOnce)
				FailureMessageAlreadyOpen.Show()
			Else
				(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).TakeACube(False)
				Self.PlayAnimation("Backward")
				nextEventIsBackward = False
				UndoActionInstant()
				Utility.Wait(0.75)
				UndoAction(0)
				Utility.Wait(0.75)
				;Return the cube to the player.
				(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).GiveACube(False)
				Utility.Wait(AdditionalReturnDelay)
				GoToState("Empty")
			EndIf
		Else
			(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).TakeACube(False)
			Self.PlayAnimation("Forward")
			nextEventIsBackward = True
			DoActionInstant()
			Utility.Wait(0.75)
			DoAction(0)
			Utility.Wait(0.75)
			;Return the cube to the player.
			(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).GiveACube(False)
			Utility.Wait(AdditionalReturnDelay)
			GoToState("Empty")
		EndIf
	Else
		(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).TakeACube(True)
		Self.PlayAnimation("Forward")
		DoActionInstant()
		;Self.PlayAnimationAndWait("Forward", "Left")
		;Update the MQ04 quest objectives as needed.
		Utility.Wait(0.5)
		(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).HandleCubeObjectiveEvent(Self, isBoilerPedestal, isBoilerWaterPedestal, True, False)
		DoAction(1)
		PlayFX()
		DoAction(2)
		Utility.Wait(AdditionalReturnDelay)
		failsafeDontSubmerge = True
		CheckSubmerged()
		GoToState("Filled")
	EndIf
EndFunction

;The player removes a cube from the pedestal.
Function RemoveCubePlayer()
	GoToState("Busy")
	Self.PlayAnimation("Backward")
	UndoActionInstant()
	;Self.PlayAnimationAndWait("Backward", "Idle")
	;Update the MQ04 quest objectives as needed.
	Utility.Wait(0.5)
	(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).HandleCubeObjectiveEvent(Self, isBoilerPedestal, isBoilerWaterPedestal, False, False)
	(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).GiveACube(True)
	UndoAction(1)
; 	;Debug.Trace("Ready for FX")
	PlayFX()
; 	;Debug.Trace("Ready to Undo")
	UndoAction(2)
; 	;Debug.Trace("Undone")
	Utility.Wait(AdditionalReturnDelay)
	failsafeDontSubmerge = False
	CheckSubmerged()
	GoToState("Empty")
EndFunction


;Neloth inserts a cube into the pedestal.
Function InsertCubeNeloth()
	GoToState("Busy")
	
	;Is this an 'Extrude' pedestal (which just returns the cube) or a 'Hold' pedestal (which keeps it)?
	if (shouldExtrude)
		if (nextEventIsBackward)
			Self.PlayAnimation("Backward")
			nextEventIsBackward = False
			Utility.Wait(0.75)
			UndoAction(0)
		Else
			Self.PlayAnimation("Forward")
			nextEventIsBackward = True
			Utility.Wait(0.75)
			DoAction(0)
		EndIf
		Utility.Wait(0.75)
		Utility.Wait(AdditionalReturnDelay)
		GoToState("Empty")
	Else
		Self.PlayAnimation("Forward")
		DoActionInstant()
		;Self.PlayAnimationAndWait("Forward", "Left")
		;Update the MQ04 quest objectives as needed.
		Utility.Wait(0.5)
		(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).HandleCubeObjectiveEvent(Self, isBoilerPedestal, isBoilerWaterPedestal, True, True)
		DoAction(1)
		PlayFX()
		DoAction(2)
		Utility.Wait(AdditionalReturnDelay)
		failsafeDontSubmerge = True
		CheckSubmerged()
		GoToState("Filled")
	EndIf
EndFunction

;Neloth removes the cube from the pedestal. Returns 'true' if he successfully took it.
bool Function RemoveCubeNeloth()
; 	;Debug.Trace("RemoveCubeNeloth")
	if (Self.GetState() == "Filled")
		GoToState("Busy")
		Self.PlayAnimation("Backward")
		UndoActionInstant()
		;Self.PlayAnimationAndWait("Backward", "Idle")
		;Update the MQ04 quest objectives as needed.
		Utility.Wait(0.5)
		(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).HandleCubeObjectiveEvent(Self, isBoilerPedestal, isBoilerWaterPedestal, False, True)
		UndoAction(1)
		PlayFX()
		UndoAction(2)
		Utility.Wait(AdditionalReturnDelay)
		failsafeDontSubmerge = False
		CheckSubmerged()
		GoToState("Empty")
		return True
	Else
		return False
	EndIf
EndFunction

;The re-sealable door to the Aqueduct calls this function to reset the extrude pedestal.
Function ResetExtrudePedestal()
	if (nextEventIsBackward)
		GoToState("Busy")
		Self.PlayAnimation("Backward")
		nextEventIsBackward = False
		Utility.Wait(1.5)
		Utility.Wait(AdditionalReturnDelay)
		GoToState("Empty")
	EndIf
EndFunction

;Play VFX/SFX for the pedestal. Hold Pedestals only.
Function PlayFX()
; 	;Debug.Trace("PlayFX Called with Intensity: " + RumbleShakeIntensity)
	if (RumbleShakeIntensity == 0)
		;DEFAULT
		;Don't play any effects at all.
		Return
	ElseIf (RumbleShakeIntensity == 1)
		;Play distant rumble sfx, light rumble, no shake.
		AMBRumbleShakeGreybeards.Play(Self)
		Game.ShakeCamera(Self, 0.15, 1)
		Game.GetPlayer().RampRumble(0.15, 1, 1600)
		Utility.Wait(1)
	ElseIf (RumbleShakeIntensity == 2)
		;WATER PEDESTALS
		AMBRumbleShakeGreybeards.Play(Self)
		Utility.Wait(0.25)
		Game.GetPlayer().RampRumble(0.15, 1.5, 1600)
		Game.ShakeCamera(Self, 0.15, 1.5)
		Utility.Wait(3)
	EndIf
EndFunction

;--------------------
;Performing Actions ------------------------------------------------------------------
;--------------------

Function DoActionInstant()
	If (Act_WaterPlaneToModify01 != None)
		(Act_WaterPlaneToModify01 as DLC2dunNchardakWaterPlane).IncrementWaterStage(Act_WaterPlane01ShouldIncrement)
	EndIf
EndFunction

;WhichActions: 0=All, 1=Non-Water Only, 2=Water Only
Function DoAction(int whichActions)
; 	;Debug.Trace("Nchardak: " + Self + " is doing action.")
	if (whichActions < 2)
		If (Act_QuestToSet != None)
			Act_QuestToSet.SetStage(Act_StageToSet)
		EndIf
		If (Act_SealedDoor != None)
			(Act_SealedDoor as DLC2dunNchardakDoorSeal).ReleaseSeal()
		EndIf
		If (Act_Boiler != None)
			(Act_Boiler as DLC2dunNchardakBoilerFX).InsertBoilerCube()
		EndIf
		If (Act_Piston != None)
			DLC2DwePistonScript piston = Act_Piston as DLC2DwePistonScript
			While (piston != None)
				piston.Start()
				piston = piston.GetLinkedRef() as DLC2DwePistonScript
			EndWhile
		EndIf
		If (Act_ObjectToActivate01 != None)
			Act_ObjectToActivate01.Activate(Self)
		EndIf
		If (Act_ObjectToActivate02 != None)
			Act_ObjectToActivate02.Activate(Self)
		EndIf
		If (Act_ObjectToActivate03 != None)
			Act_ObjectToActivate03.Activate(Self)
		EndIf
		If (Act_ObjectToEnable != None)
; 			;Debug.Trace("DoAction is Enabling ObjectToEnable " + Act_ObjectToEnable)
			Act_ObjectToEnable.Enable()
		EndIf
		If (Act_ObjectToDisable != None)
; 			;Debug.Trace("DoAction is Disabling ObjectToDisable " + Act_ObjectToDisable)
			Act_ObjectToDisable.Disable()
		EndIf
		If (Act_Dust != None)
			Act_Dust.Activate(Self)
		EndIf
	EndIf
	if (whichActions != 1)
; 		;Debug.Trace("LOWERING WATER")
		If (Act_WaterPlaneToModify01 != None)
			(Act_WaterPlaneToModify01 as DLC2dunNchardakWaterPlane).BeginWaterStageTranslation()
		EndIf
	EndIf
EndFunction

Function UndoActionInstant()
	If (Act_WaterPlaneToModify01 != None)
; 		;Debug.Trace("UndoActionInstant modifies water plane: " + !Act_WaterPlane01ShouldIncrement)
		(Act_WaterPlaneToModify01 as DLC2dunNchardakWaterPlane).IncrementWaterStage(!Act_WaterPlane01ShouldIncrement)
	EndIf
EndFunction

;WhichActions: 0=All, 1=Non-Water Only, 2=Water Only
Function UndoAction(int whichActions)
; 	;Debug.Trace("Nchardak: " + Self + " is undoing action.")
	if (whichActions < 2)
		If (Act_QuestToSet != None)
			Act_QuestToSet.SetStage(Act_StageToSet)
		EndIf
		If (Act_SealedDoor != None)
			(Act_SealedDoor as DLC2dunNchardakDoorSeal).RestoreSeal()
		EndIf
		If (Act_Boiler != None)
			(Act_Boiler as DLC2dunNchardakBoilerFX).RemoveBoilerCube()
		EndIf
		If (Act_Piston != None)
			DLC2DwePistonScript piston = Act_Piston as DLC2DwePistonScript
			While (piston != None)
				piston.Stop() 
				piston = piston.GetLinkedRef() as DLC2DwePistonScript
			EndWhile
		EndIf
		If (Act_ObjectToActivateOnRemoveOnly01 != None)
			Act_ObjectToActivateOnRemoveOnly01.Activate(Self)
		EndIf
		If (Act_ObjectToActivate01 != None)
			Act_ObjectToActivate01.Activate(Self)
		EndIf
		If (Act_ObjectToActivate02 != None)
			Act_ObjectToActivate02.Activate(Self)
		EndIf
		If (Act_ObjectToActivate03 != None)
			Act_ObjectToActivate03.Activate(Self)
		EndIf
		If (Act_ObjectToEnable != None)
; 			;Debug.Trace("UndoAction is Disabling ObjectToEnable " + Act_ObjectToEnable)
			Act_ObjectToEnable.Disable()
		EndIf
		If (Act_ObjectToDisable != None)
; 			;Debug.Trace("UndoAction is Enabling ObjectToDisable " + Act_ObjectToDisable)
			Act_ObjectToDisable.Enable()
		EndIf
	EndIf
	if (whichActions != 1)
; 		;Debug.Trace("RAISING WATER")
		If (Act_WaterPlaneToModify01 != None)
			(Act_WaterPlaneToModify01 as DLC2dunNchardakWaterPlane).BeginWaterStageTranslation()
		EndIf
	EndIf
	Act_HasPerformedAction = False
EndFunction