Scriptname DLC2dunNchardakWaterPlane extends ObjectReference Conditional
{Script for the movable water planes in Nchardak.}

Quest property DLC2dunNchardakTracking Auto		;Tracking/Registry quest.
float[] property WaterStages Auto					;Array of potential water heights.
int property startingWaterStage Auto					;Which index we actually start at.
float property WaterTranslationSpeed = 50.0 Auto	;Speed of water translation.

Actor player
Sound property QSTNchardakWaterRise2DLPM Auto
int QSTNchardakWaterRise2DLPMID = -1
Sound property QSTNchardakWaterDrain2DLPM Auto
int QSTNchardakWaterDrain2DLPMID = -1

ObjectReference[] property WaterObjectsRegistry Auto	;Array of DLC2dunNchardakWaterRegisteredScripts.
int WaterObjectsRegistryIndex
bool isTranslating
float myUpdateLastZ03
float myUpdateLastZ02
float myUpdateLastZ01

bool initialized = False		;Local variables.
bool performInitialSnap
bool rising
int Property myWaterStage = -1	Auto Hidden Conditional
float myX
float myY
float myZ
float myInitialZ
float myAngleX
float myAngleY
float myAngleZ

Function OnCellAttach()
; 	;Debug.Trace("NCHARDAK WATER: Attached.")
	;On first attach, initialize.
	if (!initialized)
		InitializeWater()
	EndIf
	;Wait for 3D to load before attempting to move the water. Otherwise, it asserts.
	performInitialSnap = True
	RegisterForSingleUpdate(0.25)
EndFunction

Function OnCellDetach()
	StopWaterSFX()	;Stop the raise/drain SFX to prevent them from playing indefinately.	
	Self.StopTranslation()	;Again, don't move the water, or it asserts.
	UnregisterForUpdate()		;Unregister to make sure we aren't registered indefinately.
EndFunction

;When initialized, store off local variables.
Function InitializeWater()
	player = Game.GetPlayer()
	myX = Self.GetPositionX()
	myY = Self.GetPositionY()
	myInitialZ = Self.GetPositionZ()
	if (WaterStages.Length == 0)
; 		Debug.Trace("ERROR: " + Self + " has no water stages, or an incorrect starting stage.")
	Else
		myZ = WaterStages[startingWaterStage]
	EndIf
	myAngleX = Self.GetAngleX()
	myAngleY = Self.GetAngleY()
	myAngleZ = Self.GetAngleZ()
	myWaterStage = startingWaterStage
	initialized = True
; 	;Debug.Trace("NCHARDAK WATER: Initialized.")
EndFunction

;OnUpdate is registered for by OnCellAttach, and waits for the water's 3D to load.
;When it does, and only when it does, it snaps the water to the correct position.
Function OnUpdate()
	If (!Is3DLoaded())
; 		;Debug.Trace("NCHARDAK WATER: 3D Not Yet Loaded.")
		RegisterForSingleUpdate(0.25)
	ElseIf(performInitialSnap)
; 		;Debug.Trace("NCHARDAK WATER: Position Set.")
		performInitialSnap = False
		Self.TranslateTo(myX, myY, myZ, myAngleX, myAngleY, myAngleZ, 100000)
		Self.Activate(Self)	;Activate self to alert associated waterfalls to a change in height.
		PerformWaterUpdate()
	Else
		PerformWaterUpdate()
		if (isTranslating)
			RegisterForSingleUpdate(2)
		EndIf
	EndIf
EndFunction

;Returns the current water stage.
int Function GetWaterStage()
	if (myWaterStage < 0)
		return startingWaterStage
	Else
		return myWaterStage
	EndIf
EndFunction

;Returns the current water height.
float Function GetWaterHeight()
	return Self.GetPositionZ()
EndFunction

;Increment or decrement the water's height to the next listed array position.
Function IncrementWaterStage(bool shouldIncrement)
; 	;Debug.Trace("IncrementWaterStage - " + shouldIncrement)
	if (shouldIncrement)
		SetWaterStage(myWaterStage + 1)
	Else
		SetWaterStage(myWaterStage - 1)
	EndIf
EndFunction

;Set the water's height to the specified array position.
;Don't animate it yet-- wait for BeginWaterStageTranslation instead to give the VFX/SFX time to play out-- but do make sure that
;anything that depends on the water height, such as the pedestals, is updated.
Function SetWaterStage(int newStage)
; 	;Debug.Trace(newStage)
	if (newStage != myWaterStage)
		if (WaterStages.Length == 0)
; 			Debug.Trace("ERROR: " + Self + " still has no water stages!")
		ElseIf (newStage < 0 || newStage >= WaterStages.Length)
; 			Debug.Trace("ERROR: " + Self + " was passed " + newStage + ", which is invalid for it. Ignoring.")
		Else
			;Is the water going to rise or fall?
			if (newStage > myWaterStage)
				rising = True
			Else
				rising = False
			EndIf
			myWaterStage = newStage
			myZ = WaterStages[newStage]
			(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).UpdatePollingCounter(True)	;Update the status of objects that are affected by the water.
; 			;Debug.Trace("Setting Water Height (but not translating yet!).")
		EndIf
	EndIf
EndFunction

Function BeginWaterStageTranslation()
; 	;Debug.Trace("Translating water to new height.")
	isTranslating = True
	Self.StopTranslation()
	StartWaterSFX(rising)
	Self.TranslateTo(myX, myY, myZ, myAngleX, myAngleY, myAngleZ, WaterTranslationSpeed)	;Move the water.
	Self.Activate(Self)	;Activate self to alert associated waterfalls to a change in height.
	Self.RegisterForSingleUpdate(1)	;Register for updates to alert WaterRegistered objects to a change in height.
EndFunction

Event OnTranslationComplete()
	;When translation ends, let the tracking quest know.
	isTranslating = False
	StopWaterSFX()
	PerformWaterUpdate()			;One final update for all registered objects.
	(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).UpdatePollingCounter(False)
EndEvent

Event OnActivate(ObjectReference akActivator)
	;Do nothing.
	;Water planes are only activated by themselves, and this activation is only used to alert the waterfalls (which have been ActivateParented to the plane) that they need to update.
EndEvent

Function StartWaterSFX(bool isRising)
	StopWaterSFX()
	if (isRising)
		QSTNchardakWaterRise2DLPMID = QSTNchardakWaterRise2DLPM.Play(player)
	Else
		QSTNchardakWaterDrain2DLPMID = QSTNchardakWaterDrain2DLPM.Play(player)
	EndIf
EndFunction

Function StopWaterSFX()
	if (QSTNchardakWaterRise2DLPMID >= 0)
		Sound.StopInstance(QSTNchardakWaterRise2DLPMID)
		QSTNchardakWaterRise2DLPMID = -1
	EndIf
	if (QSTNchardakWaterDrain2DLPMID >= 0)
		Sound.StopInstance(QSTNchardakWaterDrain2DLPMID)
		QSTNchardakWaterDrain2DLPMID = -1
	EndIf
EndFunction


;--------------
;Registration ------------------------------------------------------------------
;--------------
;Add a new object to the tracking quest's registry.
int Function RegisterWaterObject(ObjectReference obj)
	int index = GetRegistryIndex(obj)
	if (index >= 0)
		;If the object is already in the index, don't add it again. Just return its location.
		return index
	Else
		WaterObjectsRegistryIndex = WaterObjectsRegistryIndex + 1
		index = WaterObjectsRegistryIndex
		if (index >= WaterObjectsRegistry.Length)
; 			Debug.Trace("ERROR: " + Self + " is out of Water Registry indexes!")
		Else
			WaterObjectsRegistry[index] = obj
			return index
		EndIf
	EndIf
EndFunction

;Remove an object from the registry.
bool Function UnregisterWaterObject(ObjectReference obj)
	int index = GetRegistryIndex(obj)
	if (index == -1)
; 		Debug.Trace("ERROR: " + obj + " was not found in registry for " + Self)
		return False
	Else
		WaterObjectsRegistry[index] = None
		return True	
	EndIf
EndFunction

;Returns the location of this object in the index, or -1 if it's not in the index.
int Function GetRegistryIndex(ObjectReference obj)
	int i = 0
	While (i <= WaterObjectsRegistryIndex)
		if (WaterObjectsRegistry[i] == obj)
			return i
		EndIf
		i = i + 1
	EndWhile
	return -1
EndFunction

bool Function PerformWaterUpdate()
; 	;Debug.Trace("WATER UPDATE FOR: " + Self + " -----------------------------")
	myUpdateLastZ03 = myUpdateLastZ02
	myUpdateLastZ02 = myUpdateLastZ01
	myUpdateLastZ01 = Self.GetPositionZ()
	if ((myUpdateLastZ03 == myUpdateLastZ02) && (myUpdateLastZ02 == myUpdateLastZ01))
; 		;Debug.Trace("Bailing out of update because water has stopped moving.")
		return True
	EndIf
	int i = 0
	While (i <= WaterObjectsRegistryIndex)
		if ((WaterObjectsRegistry[i] as DLC2dunNchardakWaterRegisteredScript) != None)
			(WaterObjectsRegistry[i] as DLC2dunNchardakWaterRegisteredScript).WaterUpdate(myUpdateLastZ01)
		EndIf
		i = i + 1
	EndWhile
; 	;Debug.Trace("-----------------------------------------")
	return False
EndFunction