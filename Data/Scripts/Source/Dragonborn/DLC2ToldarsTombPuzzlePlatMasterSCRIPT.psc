Scriptname DLC2ToldarsTombPuzzlePlatMasterSCRIPT extends ObjectReference Hidden 

import debug
import utility

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto
Keyword Property LinkCustom06 Auto
Keyword Property LinkCustom07 Auto
Keyword Property LinkCustom08 Auto
Keyword Property LinkCustom09 Auto

ObjectReference Property Hazard01 Auto 
ObjectReference Property Hazard02 Auto 
ObjectReference Property Hazard03 Auto 
ObjectReference Property Hazard04 Auto 
ObjectReference Property Hazard05 Auto 
ObjectReference Property Hazard06 Auto 

Int Property LvlThreshold01 Auto
Int Property LvlThreshold02 Auto
Int Property LvlThreshold03 Auto
Int Property LvlThreshold04 Auto
Int Property LvlThreshold05 Auto

bool Property bPuzzleSolved = FALSE Auto Hidden
int Property iCountSafeHits Auto Hidden

Quest Property MyQuest Auto
Int Property StageToSetOnFirstFail Auto
Int Property StageToSetOnFirstHalfWayPoint Auto
Int Property StageToSetOnComplete Auto

Bool Property bAlreadyFailedOnce Auto
Bool Property bAlreadyHitHalfwayPoint Auto

bool property ShowDebugMessages = TRUE auto

Event OnTriggerLeave(ObjectReference TriggerRef)
		; Whenever the player leaves the trigger the puzzle should reset.
	if !bPuzzleSolved
		if (ShowDebugMessages)
; 			debug.Trace("Player left the Master Trigger.  Send OnActivate() to all plates.")
		endif
		Activate(Self)
		iCountSafeHits = 0
		Hazard01.DisableNoWait()
		Hazard02.DisableNoWait()
		Hazard03.DisableNoWait()
		Hazard04.DisableNoWait()
		Hazard05.DisableNoWait()
		Hazard06.DisableNoWait()
		if (ShowDebugMessages)
; 			debug.Trace("Disabling hazards a second time")
		endif
		utility.Wait(0.25)
		Hazard01.DisableNoWait()
		Hazard02.DisableNoWait()
		Hazard03.DisableNoWait()
		Hazard04.DisableNoWait()
		Hazard05.DisableNoWait()
		Hazard06.DisableNoWait()
	endif
EndEvent


Function PressurePlateHit(bool bSafeHit)
		; Any time a plate is hit it should be handled here.
	if (ShowDebugMessages)
		if (bSafeHit)
; 			debug.Trace("PressurePlateHit() a SAFE Plate!")
		else
; 			debug.Trace("PressurePlateHit() an UNSAFE Plate!")
		endif
	endif

	if (bSafeHit)
		if (ShowDebugMessages)
; 			debug.Trace("Increasing iCountSafeHits to " + (iCountSafeHits + 1))
		endif
		iCountSafeHits = iCountSafeHits + 1

		if (iCountSafeHits == 4) && (!bAlreadyHitHalfwayPoint)
			bAlreadyHitHalfwayPoint = TRUE
			myQuest.SetStage(StageToSetOnFirstHalfWayPoint)
		endif

		if iCountSafeHits == 9
			if (ShowDebugMessages)
; 				debug.Trace("All plates pressed correctly.  YOU WIN!")
			endif
			bPuzzleSolved = TRUE
			GetLinkedRef().Activate(self)
				; Switch all plates to OFF
			(GetLinkedRef(LinkCustom01) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			(GetLinkedRef(LinkCustom02) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			(GetLinkedRef(LinkCustom03) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			(GetLinkedRef(LinkCustom04) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			(GetLinkedRef(LinkCustom05) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			(GetLinkedRef(LinkCustom06) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			(GetLinkedRef(LinkCustom07) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			(GetLinkedRef(LinkCustom08) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			(GetLinkedRef(LinkCustom09) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("PuzzleSolved")
			myQuest.SetStage(StageToSetOnComplete)
		endif
	else

		if !bAlreadyFailedOnce
			bAlreadyFailedOnce = TRUE
			myQuest.SetStage(StageToSetOnFirstFail)
		endif

		if (ShowDebugMessages)
; 			debug.Trace("Restting iCountSafeHits back to ZERO")
		endif

		if Game.GetPlayer().GetLevel() > LvlThreshold05
			if (ShowDebugMessages)
				debug.Notification("Players level of " + Game.GetPlayer().GetLevel() + " is greater than " + LvlThreshold05 + " so enabling hazards " + Hazard06)
			endif
			Hazard06.EnableNoWait()
		elseif Game.GetPlayer().GetLevel() > LvlThreshold04
			if (ShowDebugMessages)
				debug.Notification("Players level of " + Game.GetPlayer().GetLevel() + " is greater than " + LvlThreshold04 + " so enabling hazards " + Hazard05)
			endif
			Hazard05.EnableNoWait()
		elseif Game.GetPlayer().GetLevel() > LvlThreshold03
			if (ShowDebugMessages)
				debug.Notification("Players level of " + Game.GetPlayer().GetLevel() + " is greater than " + LvlThreshold03 + " so enabling hazards " + Hazard04)
			endif
			Hazard04.EnableNoWait()
		elseif Game.GetPlayer().GetLevel() > LvlThreshold02
			if (ShowDebugMessages)
				debug.Notification("Players level of " + Game.GetPlayer().GetLevel() + " is greater than " + LvlThreshold02 + " so enabling hazards " + Hazard03)
			endif
			Hazard03.EnableNoWait()
		elseif Game.GetPlayer().GetLevel() > LvlThreshold01
			if (ShowDebugMessages)
				debug.Notification("Players level of " + Game.GetPlayer().GetLevel() + " is greater than " + LvlThreshold01 + " so enabling hazards " + Hazard02)
			endif
			Hazard02.EnableNoWait()
		elseif Game.GetPlayer().GetLevel() <= LvlThreshold01
			if (ShowDebugMessages)
				debug.Notification("Players level of " + Game.GetPlayer().GetLevel() + " is less than or equal to " + LvlThreshold01 + " so enabling hazards " + Hazard01)
			endif
			Hazard01.EnableNoWait()
		endif

		iCountSafeHits = 0
		SuspendPlates()
	endif
EndFunction

Function SuspendPlates()
	(GetLinkedRef(LinkCustom01) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
	(GetLinkedRef(LinkCustom02) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
	(GetLinkedRef(LinkCustom03) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
	(GetLinkedRef(LinkCustom04) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
	(GetLinkedRef(LinkCustom05) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
	(GetLinkedRef(LinkCustom06) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
	(GetLinkedRef(LinkCustom07) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
	(GetLinkedRef(LinkCustom08) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
	(GetLinkedRef(LinkCustom09) as DLC2ToldarsTombPuzzlePlateSCRIPT).GoToState("Suspended")
EndFunction
