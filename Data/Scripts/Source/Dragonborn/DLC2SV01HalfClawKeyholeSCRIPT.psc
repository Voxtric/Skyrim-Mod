Scriptname DLC2SV01HalfClawKeyholeSCRIPT extends ObjectReference Hidden 

Message property ActivateWithoutObjMessage auto

Quest Property MyQuest Auto
Int Property StagetoSetOnFirstKey Auto
Int Property StagetoSetOnSecondKey Auto

MiscObject property myMiscObject auto
{the MiscObject needed to activate the keyhole}

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto

auto STATE WaitingForActivate
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		if (game.GetPlayer().GetItemCount(myMiscObject) >= 1)
			playAnimation("Trigger01")
			MyQuest.SetStage(StagetoSetOnFirstKey)
			GoToState("Unlocked")
		else
			ActivateWithoutObjMessage.show()
			GoToState("WaitingForActivate")
		endif
	EndEvent
EndSTATE


STATE Busy

EndSTATE


STATE Unlocked
	Event OnBeginState()
		if (GetLinkedRef(LinkCustom03) as DLC2SV01HalfClawKeyholeSCRIPT).GetState() == "Unlocked"
			MyQuest.SetStage(StagetoSetOnSecondKey)
			utility.Wait(3)
			GetLinkedRef(LinkCustom04).EnableNoWait(1)
			utility.Wait(0.5)
			GetLinkedRef(LinkCustom01).Activate(self)
			GetLinkedRef(LinkCustom02).Activate(self)
		else
			utility.Wait(3)
			GetLinkedRef(LinkCustom04).EnableNoWait(1)
		endif
	EndEvent
EndSTATE
