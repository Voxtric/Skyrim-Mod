Scriptname DLC1_BF_FallingDebrisControllerSCRIPT extends ObjectReference Hidden 
{
	Master Script over all the triggers it's linked to that have the DLC1_BF_FallingDebrisTrigSCRIPT

	Can be linked up to 8 different triggers.  Controls when each trigger is allowed to drop debris on the player.
}


import utility
import debug

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto
Keyword Property LinkCustom06 Auto
Keyword Property LinkCustom07 Auto
Keyword Property LinkCustom08 Auto
Keyword Property LinkCustom09 Auto
Keyword Property LinkCustom10 Auto

Float Property TimeBeforeEachPlayerCheck = 6.0 Auto

Bool Property AlreadyChangedWeather = FALSE Auto


Bool Property DoOnce Auto Hidden
{Bool for making sure script in OnCellAttach() only runs once}


Event OnActivate(ObjectReference akActionRef)
	Trace(self + " Running OnActivate()")
	if akActionRef == Self
		Trace(self + " Quest Called OnActivate()")
		BeginFalling()
	else
		Trace(self + " Trigger " + akActionRef + " Called OnActivate()")
		FoundPlayer()
	endif

EndEvent


Event OnCellAttach()

	; Ping all triggers with AssignDebrisController() function so they can find me
	if DoOnce == FALSE
		if (GetLinkedRef(LinkCustom01))
			(GetLinkedRef(LinkCustom01) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom02))
			(GetLinkedRef(LinkCustom02) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom03))
			(GetLinkedRef(LinkCustom03) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom04))
			(GetLinkedRef(LinkCustom04) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom05))
			(GetLinkedRef(LinkCustom05) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom06))
			(GetLinkedRef(LinkCustom06) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom07))
			(GetLinkedRef(LinkCustom07) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom08))
			(GetLinkedRef(LinkCustom08) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom09))
			(GetLinkedRef(LinkCustom09) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		if (GetLinkedRef(LinkCustom10))
			(GetLinkedRef(LinkCustom10) as DLC1_BF_FallingDebrisTrigSCRIPT).AssignDebrisController(Self)
		endif
		DoOnce = TRUE
	endif

EndEvent




	; Called by one of the DLC1_BF_FallingDebrisTrig triggers once they've found the player
Function FoundPlayer()
	Trace(self + " FoundPlayer()")
	if (GetLinkedref(LinkCustom01))
		FoundPlayerCompress(GetLinkedref(LinkCustom01))
	endif
	if (GetLinkedref(LinkCustom02))
		FoundPlayerCompress(GetLinkedref(LinkCustom02))
	endif
	if (GetLinkedref(LinkCustom03))
		FoundPlayerCompress(GetLinkedref(LinkCustom03))
	endif
	if (GetLinkedref(LinkCustom04))
		FoundPlayerCompress(GetLinkedref(LinkCustom04))
	endif
	if (GetLinkedref(LinkCustom05))
		FoundPlayerCompress(GetLinkedref(LinkCustom05))
	endif
	if (GetLinkedref(LinkCustom06))
		FoundPlayerCompress(GetLinkedref(LinkCustom06))
	endif
	if (GetLinkedref(LinkCustom07))
		FoundPlayerCompress(GetLinkedref(LinkCustom07))
	endif
	if (GetLinkedref(LinkCustom08))
		FoundPlayerCompress(GetLinkedref(LinkCustom08))
	endif
	if (GetLinkedref(LinkCustom09))
		FoundPlayerCompress(GetLinkedref(LinkCustom09))
	endif
	if (GetLinkedref(LinkCustom10))
		FoundPlayerCompress(GetLinkedref(LinkCustom10))
	endif

	; Wait determined amount of time then tell the triggers to check for the player again.
	Wait(TimeBeforeEachPlayerCheck)
	BeginFalling()

EndFunction

	; Compressed function for FoundPlayer()
Function FoundPlayerCompress(ObjectReference akLink)
	Trace(self + " Telling " + akLink + " CheckForPlayer = FALSE")
	(akLink as DLC1_BF_FallingDebrisTrigSCRIPT).CheckForPlayer = FALSE
EndFunction




	; Called by certain quest stage in DLC1_BF_DunTempleQst so the linked triggers will find the player
Function BeginFalling()
	Trace(self + " BeginFalling()")
	if (GetLinkedref(LinkCustom01))
			BeginFallingCompress(GetLinkedref(LinkCustom01))
	endif
	if (GetLinkedref(LinkCustom02))
			BeginFallingCompress(GetLinkedref(LinkCustom02))
	endif
	if (GetLinkedref(LinkCustom03))
			BeginFallingCompress(GetLinkedref(LinkCustom03))
	endif
	if (GetLinkedref(LinkCustom04))
			BeginFallingCompress(GetLinkedref(LinkCustom04))
	endif
	if (GetLinkedref(LinkCustom05))
			BeginFallingCompress(GetLinkedref(LinkCustom05))
	endif
	if (GetLinkedref(LinkCustom06))
			BeginFallingCompress(GetLinkedref(LinkCustom06))
	endif
	if (GetLinkedref(LinkCustom07))
			BeginFallingCompress(GetLinkedref(LinkCustom07))
	endif
	if (GetLinkedref(LinkCustom08))
			BeginFallingCompress(GetLinkedref(LinkCustom08))
	endif
	if (GetLinkedref(LinkCustom09))
			BeginFallingCompress(GetLinkedref(LinkCustom09))
	endif
	if (GetLinkedref(LinkCustom10))
			BeginFallingCompress(GetLinkedref(LinkCustom10))
	endif
EndFunction

	; Compressed function for BeginFalling()
Function BeginFallingCompress(ObjectReference akLink)
	Trace(self + " Activating " + akLink)
	akLink.Activate(akLink)
EndFunction



	;Called by certain stage in quest to force the triggers all to simulate a collapse
Function ControllerForceCollapse()
	Trace(self + " ControllerForceCollapse()")
	if (GetLinkedref(LinkCustom01))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom01))
	endif
	if (GetLinkedref(LinkCustom02))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom02))
	endif
	if (GetLinkedref(LinkCustom03))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom03))
	endif
	if (GetLinkedref(LinkCustom04))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom04))
	endif
	if (GetLinkedref(LinkCustom05))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom05))
	endif
	if (GetLinkedref(LinkCustom06))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom06))
	endif
	if (GetLinkedref(LinkCustom07))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom07))
	endif
	if (GetLinkedref(LinkCustom08))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom08))
	endif
	if (GetLinkedref(LinkCustom09))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom09))
	endif
	if (GetLinkedref(LinkCustom10))
			ControllerForceCollapseCompress(GetLinkedref(LinkCustom10))
	endif
EndFunction

	; Compressed function for ControllerForceCollapse()
Function ControllerForceCollapseCompress(ObjectReference akLink)
	Trace(self + " Activating " + akLink + " and telling it to ForceCollapse")
	(akLink as DLC1_BF_FallingDebrisTrigSCRIPT).ForceCollapse = TRUE
	akLink.Activate(akLink)
EndFunction



	; Called by the quest in final explosion stage (700 as of this comment)
Function TryToDisableLightBeams()
	if (GetLinkedref(LinkCustom01))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom01))
	endif
	if (GetLinkedref(LinkCustom02))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom02))
	endif
	if (GetLinkedref(LinkCustom03))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom03))
	endif
	if (GetLinkedref(LinkCustom04))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom04))
	endif
	if (GetLinkedref(LinkCustom05))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom05))
	endif
	if (GetLinkedref(LinkCustom06))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom06))
	endif
	if (GetLinkedref(LinkCustom07))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom07))
	endif
	if (GetLinkedref(LinkCustom08))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom08))
	endif
	if (GetLinkedref(LinkCustom09))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom09))
	endif
	if (GetLinkedref(LinkCustom10))
		TryToDisableLightBeamsCompress(GetLinkedref(LinkCustom10))
	endif

EndFunction

	; Compressed function for TryToDisableLightBeams()
Function TryToDisableLightBeamsCompress(ObjectReference akLink)
	(akLink as DLC1_BF_FallingDebrisTrigSCRIPT).TryToDisableLightBeams()
EndFunction