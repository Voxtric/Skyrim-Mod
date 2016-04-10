Scriptname DLC2DunDBDeadActorTrig extends ObjectReference Hidden 


Keyword Property LinkCustom01 Auto
{Link to first door that opens when a dead actor enters this trigger}
Keyword Property LinkCustom02 Auto
{Link to second door that opens when a second dead actor enters this trigger}
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto

Quest Property MyQuest Auto
Int Property StageToSetOnComplete Auto



auto STATE WaitingForFirstCorpse 
	Event OnTriggerEnter(objectReference triggerRef)

		if (triggerRef as Actor).IsDead()
			;GoToState("WaitingForSecondCorpse")
			GoToState("Done")
			GetLinkedRef(LinkCustom03).EnableNoWait()
			utility.Wait(1)
			MyQuest.SetStage(StageToSetOnComplete)
			GetLinkedRef(LinkCustom04).EnableNoWait()
			utility.Wait(1.15)
			GetLinkedRef(LinkCustom05).EnableNoWait()
			utility.Wait(0.5)
			GetLinkedRef(LinkCustom01).Activate(self)
			GetLinkedRef(LinkCustom02).Activate(self)
		endif

	EndEvent
EndSTATE


STATE WaitingForSecondCorpse
	Event OnTriggerEnter(objectReference triggerRef)

		if (triggerRef as Actor).IsDead()
			GoToState("Done")
			GetLinkedRef(LinkCustom02).Activate(self)
		endif

	EndEvent
EndSTATE


STATE Done
	; Do Nothing
EndSTATE