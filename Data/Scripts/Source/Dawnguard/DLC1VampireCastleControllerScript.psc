Scriptname DLC1VampireCastleControllerScript extends Quest  Conditional

DLC1_2StateActivatorWithGlobal property pMainGate auto hidden
objectReference property pDLC1VCMainGateRef auto
Location property DLC1VampireCastleGuildhallLocation auto
ObjectReference Property DLC1VCRubbleToCourtyardMarker  Auto  
ObjectReference Property DLC1VCSeranaRoom auto
ObjectReference Property DLC1VCSeranaRoomDisused auto
bool Property SeranasRoomEnabled auto hidden
ObjectReference Property DLC1VCBanquetLockdown auto
ObjectReference Property DLC1VCValericasRoom auto
ObjectReference Property DLC1VCValericasGarden auto
bool property ValericasGardenEnabled auto hidden
ObjectReference Property DLC1VCValericasGardenRuined auto
ObjectReference Property DLC_VCGHtoExt auto
ObjectReference Property DLC1VQ08LoadDoorEnableMarker auto
ObjectReference Property DLC1VQ08BossRoomCleanupRef auto
ObjectReference Property DLC1VCBossRoomGargoylesParent auto
ObjectReference Property DLC1VQTutorialDoor auto
Cell Property DLC1VampireCastleGuildhall auto
Faction Property DLC1VampireFaction auto
Faction Property NoFaction auto hidden
bool Property BossCellIsAttached auto  hidden
bool Property GuildhallIsAttached auto  hidden
bool Property MoveListInUse auto hidden
ObjectReference Property DLC1VQ08ActorCleanupMarker auto
ObjectReference Property DLC1VQ08CleanUpChestRef auto
ObjectReference Property DLC1VQ08CleanUpGuildhallPoR auto
ObjectReference Property DLC1VQ08CleanUpBossRoomPoR auto
ObjectReference Property DLC1VQ08TutorialRoomEnableMarker auto
ObjectReference Property DLC1VQ08TutorialRoomBlackplaneMarker auto
ObjectReference Property DLC1VCExtToDungeon02 auto
ObjectReference Property DLC1VCBalconyDoorEnableParent auto
ObjectReference Property DLC1VCBossDoorGH Auto
ObjectReference Property DLC1VCBossDoor Auto
Bool Property BossRoomCleanupComplete = False auto hidden
Bool Property BossRoomCleanupStarted = False auto hidden
Quest Property DLC1VQ08 auto

FormList Property DLC1VQ08flBossRoomTrackingList  Auto  
{List to track objects to move later}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Front gate Controls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetGateOpen()
	pMainGate.SetOpen(True)
endFunction

Function SetGateClosed()
	pMainGate.SetOpen(False)
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Room enable/disable controls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This enables the door from the keep to the courtyard
Function EnableDoorToCourtyard()
	while game.getPlayer().isInLocation(DLC1VampireCastleGuildhallLocation )
		utility.wait(30.0)
	endwhile
	DLC1VCRubbleToCourtyardMarker.disable()
endFunction

;This controls the rubble state of Seranas room
Function CleanSeranasRoom(bool enableState = True)
	if enableState
		SeranasRoomEnabled = True
		DLC1VCSeranaRoom.enable()
		DLC1VCSeranaRoomDisused.disable()
	else
		SeranasRoomEnabled = False
		DLC1VCSeranaRoom.disable()
		DLC1VCSeranaRoomDisused.enable()
	endif
endFunction

;This controls clutter for when Valerica returns from the Soul Cairn
Function EnableValericasRoom(bool enableState = True)
	if enableState
		DLC1VCValericasRoom.enable()
	else
		DLC1VCValericasRoom.disable()
	endif
endFunction

;This cleans up the garden in the courtyard
Function EnableValericasGarden(bool enableState = True)
	if enableState
		ValericasGardenEnabled = True
		DLC1VCValericasGarden.enable()
		DLC1VCValericasGardenRuined.disable()
	else
		ValericasGardenEnabled = False
		DLC1VCValericasGarden.disable()
		DLC1VCValericasGardenRuined.enable()
	endif
endFunction

Function LockBalconyDoor(bool lockState = True)
	if Lockstate
		DLC1VCExtToDungeon02.SetLockLevel(255) 
		DLC1VCExtToDungeon02.Lock()
		DLC1VCBalconyDoorEnableParent.Disable()
	else
		DLC1VCExtToDungeon02.SetLockLevel(0) 
		DLC1VCExtToDungeon02.Lock(False)
		DLC1VCBalconyDoorEnableParent.Enable()
	endif
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Banquet hall lockdown controls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This locks down the Banquet hall so that the player cannot loot the castle
Function LockdownBanquetHall(bool banquetLockState = True)
	if banquetLockState
		DLC1VCBanquetLockdown.enable()
		DLC_VCGHtoExt.SetLockLevel(255) 
		DLC_VCGHtoExt.Lock()
		DLC1VQTutorialDoor.BlockActivation()
		DLC1VampireCastleGuildhall.SetFactionOwner(NoFaction) ;Set to empty faction property to clear owner
	else
		DLC1VCBanquetLockdown.disable()
		DLC_VCGHtoExt.SetLockLevel(0)
		DLC_VCGHtoExt.Lock(False)
		DLC1VQTutorialDoor.BlockActivation(False)
		DLC1VampireCastleGuildhall.SetFactionOwner(DLC1VampireFaction)
	endif
endFunction

;Clearer function to unlock the banquet
Function UnlockBanquetHall()
	LockdownBanquetHall(False)
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		BossDoor lockdown controls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Function LockBossRoomDoor(bool BossRoomLockState = True)
	if BossRoomLockState
		DLC1VCBossDoorGH.BlockActivation()
		DLC1VCBossDoor.BlockActivation()
	else
		DLC1VCBossDoorGH.BlockActivation(False)
		DLC1VCBossDoor.BlockActivation(False)
		DLC1VCBossDoor.SetLockLevel(0) 
		DLC1VCBossDoor.Lock(False)
	endif
endFunction

;Clearer function to unlock the banquet
Function UnlockBossRoomDoor()
	LockBossRoomDoor(False)
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Boss/Tutorial room clean up controls
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;These functions moves any objects left behind to somewhere safe to retrieve them.

import utility

Function StartTutorialRoomCleanup()
	debug.Trace(self + ": TUTORIAL ROOM CLEANUP STARTING")
;	(DLC1VQ08BossRoomCleanupRef as DLC1VQ08BossRoomCleanupScript).SetActive(true)
;	DLC1VQ08BossRoomCleanupRef.Enable()
;	While !DLC1VQ08BossRoomCleanupRef.is3dLoaded()
;		utility.wait(1.0)
;		debug.Trace(self + ": WAITING FOR " + DLC1VQ08BossRoomCleanupRef + " TO ATTACH")
;	endWhile
	
	utility.wait(3.0)
;	While BossCellIsAttached
;		utility.wait(3.0)
;	endWhile
	(DLC1VQ08BossRoomCleanupRef as DLC1VQ08BossRoomCleanupScript).SetActive(false)
	While (DLC1VQ08BossRoomCleanupRef as DLC1VQ08BossRoomCleanupScript).bIsActive
		utility.wait(0.1)
	endwhile
	DLC1VQ08BossRoomCleanupRef.Disable()
	FinishTutorialRoomCleanup()
endFunction

Function FinishTutorialRoomCleanup()
	debug.Trace(self + ": TUTORIAL ROOM CLEANUP FINISHING")
	PrintCleanupList()
	;DLC1VQ08LoadDoorEnableMarker.Disable()
	;(DLC1VQ08BossRoomCleanupRef as DLC1VQ08BossRoomCleanupScript).SetActive(false)
	;Done, clear it out
	ProcessCleanupList()
	
			;These are out since we are trying a different method
	;DLC1VQTutorialDoor.SetLockLevel(0)
	;DLC1VQTutorialDoor.Lock(False)
	;DLC1VQTutorialDoor.SetOpen(True)
endFunction

Function ProcessCleanupList()
	debug.Trace(self + ": PROCESS CLEANUP STARTING")
	int cfIndex = 0
	Form CurrentCleanupRef
    while (cfIndex < DLC1VQ08flBossRoomTrackingList.GetSize())
		;Debug.Trace(cfIndex + ">> " + (DLC1VQ08flBossRoomTrackingList.GetAt(cfIndex) as ObjectReference))
		CurrentCleanupRef = DLC1VQ08flBossRoomTrackingList.GetAt(cfIndex)
		Debug.Trace(self + ": Processing # " + cfIndex + " >> " + CurrentCleanupRef)
		if CurrentCleanupRef as Actor
			Debug.Trace(self + ": moving Actor - " + CurrentCleanupRef)
			(CurrentCleanupRef as Actor).moveto(DLC1VQ08ActorCleanupMarker)
;		elseif (DLC1VQ08flBossRoomTrackingList.GetAt(cfIndex) as weapon) || (CurrentCleanupRef as armor)\
;		|| (CurrentCleanupRef as MiscObject) || (CurrentCleanupRef as Book)\
;		|| (CurrentCleanupRef as SoulGem) || (CurrentCleanupRef as Ingredient)\
;		|| (CurrentCleanupRef as Key) || (CurrentCleanupRef as Ammo)\
;		|| (CurrentCleanupRef as Potion) || (CurrentCleanupRef as Scroll)
		else
			DLC1VQ08CleanUpChestRef.AddItem(CurrentCleanupRef)
;		else
;			Debug.Trace(self + ": Don't know how to process this ref")
;			Debug.Trace(self + ": " + cfIndex + ">> " + (DLC1VQ08flBossRoomTrackingList.GetAt(cfIndex) as ObjectReference))
		endif
		cfIndex += 1
	endWhile
	debug.Trace(self + ": PROCESS CLEANUP FINISHED")
	DLC1VQ08flBossRoomTrackingList.Revert()
	BossRoomCleanupComplete = True
endFunction

;Debug Function to print a list of all objects in the cleanup formlist
Function PrintCleanupList()
	Debug.Trace(self + ": Dumping list of objects in clean up formList")
	int cfIndex = 0
    while (cfIndex < DLC1VQ08flBossRoomTrackingList.GetSize())
		Debug.Trace(self + ": " + cfIndex + ">> " + (DLC1VQ08flBossRoomTrackingList.GetAt(cfIndex) as ObjectReference))
		cfIndex += 1
	endWhile
endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			CellAttach events, captured from scripts on traplinkers in the respecive rooms
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetGuildHallCellAttached()
	debug.Trace(self + ": Guildhall attached")
	GuildhallIsAttached = True
	if DLC1VQ08.isRunning() && !BossRoomCleanupComplete && !BossRoomCleanupStarted
		(DLC1VQ08BossRoomCleanupRef as DLC1VQ08BossRoomCleanupScript).SetActive(true)
		DLC1VQ08TutorialRoomBlackplaneMarker.Enable()
		BossRoomCleanupStarted = True
		StartTutorialRoomCleanup()
	endif
endFunction

Function SetGuildhallCellDetached()
	debug.Trace(self + ": Guildhall detached")
	GuildhallIsAttached = False
endFunction

Function SetBossCellDetached()
	debug.Trace(self + ": Boss cell attached")
	BossCellIsAttached = False
	;ShutDownBossRoom()
endFunction

Function SetBossCellAttached()
	debug.Trace(self + ": Boss cell detached")
	BossCellIsAttached = True
	
	;If VQ08 is running make the door appear locked, this is cleared later in a call from the quest
	if DLC1VQ08.isRunning()
		DLC1VCBossDoor.SetLockLevel(255) 
		DLC1VCBossDoor.Lock()
	endif
endFunction

