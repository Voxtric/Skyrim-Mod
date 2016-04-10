Scriptname DLC2DunFloorPathPuzzleSCRIPT extends ObjectReference Hidden 

import debug
import utility


Sound Property FloorAppearSound auto
Sound Property FloorHideSound auto

	; Contains the two possible NavCut primitives
Keyword Property LinkCustom01 auto
Keyword Property LinkCustom02 auto

	; Door that may need activated when the player has reached the goal
Keyword Property LinkCustom03 auto

Float Property TimeToActivateNextBlock = 1.0 auto
{Time until this platform activates the next, inherits from previous block (DEFAULT = 1)}
Float Property TimeToDisableSelf = 2.0 auto
{Time until this platform disables itself (after activating the next block), inherits from previous block (DEFAULT = 2)}
Float Property TimeToResetActivation = 4.0 auto
{Time until this platform allows itself to be activated again (after block disables itself), inherits from previous block (DEFAULT = 4)}

Bool bStayVisible = FALSE


auto STATE WaitingToBeActivated

	Event OnActivate(ObjectReference akActionRef)
		if (akActionRef as defaultActivateSelf)
			GoToState("Done")
			bStayVisible = TRUE
			Wait( ((Game.GetPlayer().GetDistance(self) * 0.001) + 0.5) )
			Trace("Waited " + ((Game.GetPlayer().GetDistance(self) * 0.001) + 0.5) + " seconds to enable " + self)
			self.EnableNoWait(TRUE)
			Wait(0.1)
			FloorAppearSound.Play(self)
			if GetLinkedRef(LinkCustom01)
				GetLinkedRef(LinkCustom01).DisableNoWait()
			endif
			if GetLinkedRef(LinkCustom02)
				GetLinkedRef(LinkCustom02).DisableNoWait()
			endif
			if GetLinkedRef(LinkCustom03)
				GetLinkedRef(LinkCustom03).DisableNoWait()
			endif
		else
			GoToState("Busy")
			if GetLinkedRef()
				(GetLinkedRef() as DLC2DunFloorPathPuzzleSCRIPT).TimeToActivateNextBlock = TimeToActivateNextBlock
				(GetLinkedRef() as DLC2DunFloorPathPuzzleSCRIPT).TimeToDisableSelf = TimeToDisableSelf
				(GetLinkedRef() as DLC2DunFloorPathPuzzleSCRIPT).TimeToResetActivation = TimeToResetActivation
			endif
			EnableNoWait(FALSE)
			Wait(0.1)
			FloorAppearSound.Play(self)
			Wait(TimeToActivateNextBlock)
			if GetLinkedRef()
				GetLinkedRef().Activate(self)
			endif
			Wait(TimeToDisableSelf)
			if (bStayVisible)
				EnableNoWait(TRUE)
				Wait(0.1)
				FloorAppearSound.Play(self)
			else
				FloorHideSound.Play(self)
				DisableNoWait(TRUE)
			endif
			Wait(TimeToResetActivation)
			if (bStayVisible)
				GoToState("Busy")
			else
				GoToState("WaitingToBeActivated")
			endif
		endif

	EndEvent

EndSTATE


STATE Busy

	Event OnActivate(ObjectReference akActionRef)
		if (akActionRef as defaultActivateSelf)
			GoToState("Done")
			bStayVisible = TRUE
			;Wait(RandomFloat(1.0, 3.0))
			Wait( ((Game.GetPlayer().GetDistance(self) * 0.001) + 0.5) )
			Trace("Waited " + ((Game.GetPlayer().GetDistance(self) * 0.001) + 0.5) + " seconds to enable " + self)
			self.EnableNoWait(TRUE)
			Wait(0.1)
			FloorAppearSound.Play(self)
			if GetLinkedRef(LinkCustom01)
				GetLinkedRef(LinkCustom01).DisableNoWait()
			endif
			if GetLinkedRef(LinkCustom02)
				GetLinkedRef(LinkCustom02).DisableNoWait()
			endif
			if GetLinkedRef(LinkCustom03)
				GetLinkedRef(LinkCustom03).DisableNoWait()
			endif
		endif
	EndEvent

EndSTATE


STATE Done
	; Done doing stuff
EndSTATE