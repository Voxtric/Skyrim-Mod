Scriptname DLC2dunNchardakTrackingScript extends Quest Conditional
{Quest for the DLC2 Nchardak tracking quest, which manages the cubes, pedestals, and water levels in Nchardak.}

ObjectReference[] property Cubes Auto					;References to the cube objects (5)
ObjectReference[] property CubeContainers Auto			;Inaccessible containers we can store the cubes in when the player doesn't have them. Safer than using an XMarker, etc.
ObjectReference[] property Registry Auto				;Array of objects that might be affected by the water level in Nchardak.
ReferenceAlias[] property NameClearingAliases Auto	;Array of aliases, equal in length to the Registry, we can use to clear names on activators affected by the water level.

MiscObject property DLC2dunNchardakCube Auto			;Base object for the cube.
Location property DLC2NchardakLocation Auto			;Nchardak's location.
GlobalVariable property DLC2dunNchardakCubeCount Auto	;Number of cubes the player has. Maintained for text replacement.

;MQ04 Quest Objective data.
Quest property DLC2MQ04 Auto								;MQ04 Quest, which has the objectives.
int property CubesInNeloth = 1 Auto	Conditional				;Number of cubes being carried by Neloth. Initially two.
int property CubesInBoilerPedestals = 0 Auto			;Number of cubes in Boiler pedestals. Initially none.
int property CubesInWaterPedestals = 0 Auto			;Number of cubes in Water pedestals. Initially one (the one Neloth inserted).
int property CubesInOtherPedestals = 4 Auto			;Number of cubes in other types of pedestals. Initially four (1 in Console, 2 in Workshop, 1 in Aqueduct)
bool property areBoilersReady = False Auto
ObjectReference property WaterPedestal01 Auto
ObjectReference property WaterPedestal02 Auto
ObjectReference property WaterPedestal03 Auto
ObjectReference property BoilerPedestal01 Auto
ObjectReference property BoilerPedestal02 Auto
ObjectReference property BoilerPedestal03 Auto
ObjectReference property BoilerPedestal04 Auto

;Messages to display when cubes are added/removed.
Message property DLC2dunNchardakCubeRemovedMessageManyLeft Auto
Message property DLC2dunNchardakCubeRemovedMessageOneLeft Auto
Message property DLC2dunNchardakCubeRemovedMessageNoneLeft Auto
Message property DLC2dunNchardakCubeRemovedMessageManyAdded Auto
Message property DLC2dunNchardakCubeRemovedMessageOneAdded Auto

;Internal variables.
int registryIndex = -1		;Last filled registry slot.
int pollCounter = 0			;How many water planes are polling this quest?
bool pollIsRunning = False	;Are we currently polling this quest?
bool BoilerObjectiveActive	;Should the 'Boiler'-state objectives be active?

;--------------
;Registration ------------------------------------------------------------------
;--------------
;Add a new object to the tracking quest's registry.
int Function RegisterObject(ObjectReference obj)
	int index = GetRegistryIndex(obj)
	if (index >= 0)
		;If the object is already in the index, don't add it again. Just return its location.
		return index
	Else
		registryIndex = registryIndex + 1
		index = registryIndex
		if (index >= NameClearingAliases.Length)
; 			Debug.Trace("ERROR: Nchardak Tracking received an index request, but is out of indices!")
		Else
			Registry[index] = obj
			return index
		EndIf
	EndIf
EndFunction

;Returns the location of this object in the index, or -1 if it's not in the index.
int Function GetRegistryIndex(ObjectReference obj)
	int i = 0
	While (i <= registryIndex)
		if (Registry[i] == obj)
			return i 
		EndIf
		i = i + 1
	EndWhile
	return -1
EndFunction


;--------------
;Polling ------------------------------------------------------------------
;--------------

;Keep track of how many objects want us to poll for updates.
Function UpdatePollingCounter(bool shouldIncrement)
	;Actually, we don't really need to poll anymore. Just run a single update and be done with it.
	OnUpdate()
EndFunction

Event OnUpdate()
	int i = 0
	While (i < Registry.Length)
		if (Registry[i] == None)
			Return
		EndIf
; 		;Debug.Trace("Checking: " + Registry[i])
		if ((Registry[i] as DLC2dunNchardakSubmersible) != None)
			(Registry[i] as DLC2dunNchardakSubmersible).CheckSubmerged()
		EndIf
		i = i + 1
	EndWhile
	;We could re-register for an update here, if we needed to poll repeatedly.
	;But we don't anymore, since we're using staged water heights instead of height values.
EndEvent


;------------------
;Request Handling ------------------------------------------------------------------
;------------------

;Handle a request to clear the object's name.
Function ClearName(int index, ObjectReference obj)
	NameClearingAliases[index].ForceRefTo(obj)	
EndFunction

;Handle a request to un-clear the object's name.
Function RestoreName(int index)
	NameClearingAliases[index].Clear()
EndFunction

;Handle a request to take a cube from the 'pile' and give it to the player.
Function TakeACube(bool displayMessage = True)
	int i = 0
	While (i < Cubes.Length)
		if (Game.GetPlayer().GetItemCount(Cubes[i]) > 0)
			Game.GetPlayer().RemoveItem(Cubes[i], 1, True, CubeContainers[i])
			int cubeCount = Game.GetPlayer().GetItemCount(DLC2dunNchardakCube)
			DLC2dunNchardakCubeCount.SetValue(cubeCount)
			Self.UpdateCurrentInstanceGlobal(DLC2dunNchardakCubeCount)
			if (displayMessage)
				if (cubeCount == 0)
					DLC2dunNchardakCubeRemovedMessageNoneLeft.Show()
				ElseIf (cubeCount == 1)
					DLC2dunNchardakCubeRemovedMessageOneLeft.Show()
				Else
					DLC2dunNchardakCubeRemovedMessageManyLeft.Show()
				EndIf
			EndIf
			Return
		Else
			i = i + 1
		EndIf
	EndWhile
; 	Debug.Trace("ERROR: Nchardak Tracking: TakeACube exited without removing a cube. Error!")
EndFunction

;Handle a request to take a cube from the player.
Function GiveACube(bool displayMessage = True)
	int i = 0
	While (i < Cubes.Length)
		if (Game.GetPlayer().GetItemCount(Cubes[i]) == 0)
			Game.GetPlayer().AddItem(Cubes[i], 1, True)
			int cubeCount = Game.GetPlayer().GetItemCount(DLC2dunNchardakCube)
			DLC2dunNchardakCubeCount.SetValue(cubeCount)
			Self.UpdateCurrentInstanceGlobal(DLC2dunNchardakCubeCount)
			if (displayMessage)
				if (cubeCount == 1)
					DLC2dunNchardakCubeRemovedMessageOneAdded.Show()
				Else
					DLC2dunNchardakCubeRemovedMessageManyAdded.Show()
				EndIf
			EndIf
			Return
		Else
			i = i + 1
		EndIf
	EndWhile
; 	Debug.Trace("ERROR: Nchardak Tracking: GiveACube exited without adding a cube. Error!")
EndFunction

; Neloth gives all the cubes he "has" to the player
Function GiveAllNelothCubes()
	While (CubesInNeloth > 0)
		GiveACube()
		HandleCubeObjectiveEvent(Game.GetPlayer(), False, False, True, True)
	EndWhile
EndFunction

;----------------------
;Objective Management ------------------------------------------------------------------
;----------------------

Function HandleCubeObjectiveEvent(ObjectReference pedestal, bool isBoilerPedestal, bool isBoilerWaterPedestal, bool wasInserted, bool byNeloth)
	if (DLC2MQ04.IsRunning())
		bool NelothHadACube = (CubesInNeloth > 0)
		UpdateCubeCounters(pedestal, isBoilerPedestal, isBoilerWaterPedestal, wasInserted, byNeloth)
		
		;Manage objectives pointing to Neloth.
		if (NelothHadACube && CubesInNeloth == 0)
			RemoveObjectiveToNeloth()
		EndIf
		
		;See if we're ready to move on to the Boiler phase of the process.
; 		;Debug.Trace("Status 1: " + areBoilersReady + ", " + justChanged)
		bool justChanged = areBoilersReady
		UpdateBoilersReady()
		justChanged = (justChanged != areBoilersReady)
		
; 		;Debug.Trace("Status 2: " + areBoilersReady + ", " + justChanged)
		
		if (justChanged && !areBoilersReady)
			HideBoilerObjectives()
		EndIf
		
		;Where are we in the quest?
		if (areBoilersReady)
			;If we're in the process of getting the boilers started...
			if (wasInserted && !byNeloth)
				if (isBoilerPedestal)
					;The player has inserted a cube into a boiler pedestal. Great, clear that pedestal.
					RemoveObjectiveToPedestal(pedestal)
				ElseIf (isBoilerWaterPedestal)
					;The player has inserted a cube into a water pedestal. Great, clear the water pedestal objective.
					RemoveObjectiveToWaterPedestal()
				EndIf
			Else
				RemoveObjectiveToPedestal(pedestal)
				ShowBoilerObjectives(pedestal)
			EndIf
		Else
			;Otherwise, we aren't that far along yet. So we're tracking individual cubes.
			if (wasInserted)
				;If the player inserts a cube somewhere, add an objective to it.
; 				;Debug.Trace("Add Objective")
				AddObjectiveToPedestal(pedestal)
			Else
				;If the player takes a cube, remove the objective from it.
				RemoveObjectiveToPedestal(pedestal)
			EndIf
		EndIf
		
		;Manage objectives pointing to Neloth.
		if (!NelothHadACube && CubesInNeloth > 0)
			AddObjectiveToNeloth()
		EndIf
	
		;Check to see if the boilers have started and MQ04 can proceed.
		UpdateBoilersDone(wasInserted, pedestal)
	EndIf
EndFunction


;Update the various cube counters.
Function UpdateCubeCounters(ObjectReference pedestal, bool isBoilerPedestal, bool isBoilerWaterPedestal, bool wasInserted, bool byNeloth)
	;If Neloth is involved, update his count.
	if (byNeloth)
		if (wasInserted)
			CubesInNeloth = CubesInNeloth - 1
		Else
			CubesInNeloth = CubesInNeloth + 1
		EndIf
	EndIf

	;Update Boiler Pedestal count.
	if (isBoilerPedestal)
		if (wasInserted)
			CubesInBoilerPedestals = CubesInBoilerPedestals + 1
		Else
			CubesInBoilerPedestals = CubesInBoilerPedestals - 1
		EndIf
	EndIf
	
	;Update Water Pedestal count.
	if (isBoilerWaterPedestal)
		if (wasInserted)
			CubesInWaterPedestals = CubesInWaterPedestals + 1
		Else
			CubesInWaterPedestals = CubesInWaterPedestals - 1
		EndIf
	EndIf
	
	;Update Other Pedestal count.
	if (!isBoilerPedestal && !isBoilerWaterPedestal && pedestal != Game.GetPlayer())
		if (wasInserted)
			CubesInOtherPedestals = CubesInOtherPedestals + 1
		Else
			CubesInOtherPedestals = CubesInOtherPedestals - 1
		EndIf
	EndIf
EndFunction

;Determine if we should show the boiler objectives.
Function UpdateBoilersReady()
	if (CubesInNeloth == 0 && CubesInOtherPedestals == 0 && CubesInWaterPedestals <= 1)
		areBoilersReady = True
	Else
		areBoilersReady = False
	EndIf
EndFunction

Function UpdateBoilersDone(bool wasInserted, ObjectReference pedestal)
	bool done = False
	
	if ((((WaterPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (WaterPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && (wasinserted || pedestal != WaterPedestal01)) || \
		(((WaterPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (WaterPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Filled")&& (wasinserted || pedestal != WaterPedestal02)) || \
		(((WaterPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (WaterPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Filled")&& (wasinserted || pedestal != WaterPedestal03)))
		;One cube in a water pedestal...
		if ((((BoilerPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (BoilerPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && (wasinserted || pedestal != BoilerPedestal01))  && \
			(((BoilerPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (BoilerPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && (wasinserted || pedestal != BoilerPedestal02))  && \
			(((BoilerPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (BoilerPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && (wasinserted || pedestal != BoilerPedestal03))  && \
			(((BoilerPedestal04 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (BoilerPedestal04 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && (wasinserted || pedestal != BoilerPedestal04)))
			;All boilers filled.
			done = True
		EndIf
	EndIf
	
	if (done)
		(DLC2MQ04 as DLC2MQ04Script).MQ04BoilerPuzzleComplete()
	Else
		(DLC2MQ04 as DLC2MQ04Script).MQ04BoilerPuzzleIncomplete()
	EndIf
EndFunction



Function ShowBoilerObjectives(ObjectReference pedestal)
; 	;Debug.Trace("Now showing Boiler objectives.")
	if (((((WaterPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (WaterPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Filled")) && pedestal != WaterPedestal01)  || \
		(((WaterPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (WaterPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && pedestal != WaterPedestal02) || \
		(((WaterPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (WaterPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && pedestal != WaterPedestal03))
		;Player has one cube in a water pedestal, so no need to do anything.
; 		;Debug.Trace("WATER: Confirmed")
		RemoveObjectiveToPedestal(WaterPedestal01)
		RemoveObjectiveToPedestal(WaterPedestal02)
		RemoveObjectiveToPedestal(WaterPedestal03)
	Else
; 		;Debug.Trace("WATER: Shown")
		AddObjectiveToPedestal(WaterPedestal01)
	EndIf
	
	if (((BoilerPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (BoilerPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && pedestal != BoilerPedestal01)
		;Boiler is filled, so don't do anything.
; 		;Debug.Trace("BOILER 01: Confirmed")
		RemoveObjectiveToPedestal(BoilerPedestal01)
	Else
		AddObjectiveToPedestal(BoilerPedestal01)
; 		;Debug.Trace("BOILER 01: Shown")
	EndIf
		
	if (((BoilerPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (BoilerPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && pedestal != BoilerPedestal02)
		;Boiler is filled, so don't do anything.
; 		;Debug.Trace("BOILER 02: Confirmed")
		RemoveObjectiveToPedestal(BoilerPedestal02)
	Else
		AddObjectiveToPedestal(BoilerPedestal02)
; 		;Debug.Trace("BOILER 02: Shown")
	EndIf
	
	if (((BoilerPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (BoilerPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && pedestal != BoilerPedestal03)
		;Boiler is filled, so don't do anything.
; 		;Debug.Trace("BOILER 03: Confirmed")
		RemoveObjectiveToPedestal(BoilerPedestal03)
	Else
		AddObjectiveToPedestal(BoilerPedestal03)
; 		;Debug.Trace("BOILER 03: Shown")
	EndIf
	
	if (((BoilerPedestal04 as DLC2dunNchardakPedestalScript).GetState() == "Busy" || (BoilerPedestal04 as DLC2dunNchardakPedestalScript).GetState() == "Filled") && pedestal != BoilerPedestal04)
		;Boiler is filled, so don't do anything.
; 		;Debug.Trace("BOILER 04: Confirmed")
		RemoveObjectiveToPedestal(BoilerPedestal04)
	Else
		AddObjectiveToPedestal(BoilerPedestal04)
; 		;Debug.Trace("BOILER 04: Shown")
	EndIf	
EndFunction

Function HideBoilerObjectives()
	if ((WaterPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Empty")
		RemoveObjectiveToPedestal(WaterPedestal01)
	EndIf
	if ((WaterPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Empty")
		RemoveObjectiveToPedestal(WaterPedestal02)
	EndIf
	if ((WaterPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Empty")
		RemoveObjectiveToPedestal(WaterPedestal03)
	EndIf
	
	if ((BoilerPedestal01 as DLC2dunNchardakPedestalScript).GetState() == "Empty")
		RemoveObjectiveToPedestal(BoilerPedestal01)
	EndIf
	if ((BoilerPedestal02 as DLC2dunNchardakPedestalScript).GetState() == "Empty")
		RemoveObjectiveToPedestal(BoilerPedestal02)
	EndIf
	if ((BoilerPedestal03 as DLC2dunNchardakPedestalScript).GetState() == "Empty")
		RemoveObjectiveToPedestal(BoilerPedestal03)
	EndIf
	if ((BoilerPedestal04 as DLC2dunNchardakPedestalScript).GetState() == "Empty")
		RemoveObjectiveToPedestal(BoilerPedestal04)
	EndIf
EndFunction

Function AddObjectiveToWaterPedestal()
	AddObjectiveToPedestal(WaterPedestal01)
EndFunction

Function RemoveObjectiveToWaterPedestal()
	RemoveObjectiveToPedestal(WaterPedestal01)
EndFunction


Function AddObjectiveToNeloth()
	(DLC2MQ04 as DLC2MQ04Script).MQ04AddObjectiveToNeloth()
EndFunction

Function RemoveObjectiveToNeloth()
	(DLC2MQ04 as DLC2MQ04Script).MQ04RemoveObjectiveToNeloth()
EndFunction

Function AddObjectiveToPedestal(ObjectReference pedestal)
	(DLC2MQ04 as DLC2MQ04Script).MQ04AddObjectiveTo(pedestal)
EndFunction

Function RemoveObjectiveToPedestal(ObjectReference pedestal)
	(DLC2MQ04 as DLC2MQ04Script).MQ04RemoveObjectiveTo(pedestal)
EndFunction