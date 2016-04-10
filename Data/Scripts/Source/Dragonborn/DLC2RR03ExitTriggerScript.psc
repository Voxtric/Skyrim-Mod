Scriptname DLC2RR03ExitTriggerScript extends ObjectReference  Conditional

Quest Property pDLC2RR03 Auto
Quest Property pDLC2RR03Priest Auto
ReferenceAlias Property pSeeker Auto
int Property pAuxQuestStarted Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDLC2RR03.GetStage() >= 30
		if pSeeker.GetActorRef().IsDead() == 0
			if pAuxQuestStarted == 0
				pDLC2RR03Priest.Start()
				pAuxQuestStarted = 1
			endif
		endif
	endif

	if akActionRef == Game.GetPlayer()
		if pDLC2RR03.GetStage() >= 30
			pDLC2RR03.SetStage(50)
		endif
	endif

endEvent 