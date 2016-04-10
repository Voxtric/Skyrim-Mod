Scriptname DLC1VQ05MeetSceneTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ05  Auto  
int Property pTriggered Auto
ReferenceAlias Property pRNPCAlias Auto
int Property pToggleSerana Auto
int Property pTogglePlayer Auto

Event OnTrigger(ObjectReference akActionRef)

	if pToggleSerana == 0
		if akActionRef == pRNPCAlias.GetActorRef()
			if pDLC1VQ05.GetStage() == 10
				pTriggered = pTriggered + 1
				if pTriggered >= 2
					pDLC1VQ05.SetStage(20)
				endif
				pToggleSerana = 1
			endif
		endif
	endif

	if pTogglePlayer == 0
		if akActionRef == pRNPCAlias.GetActorRef()
			if pDLC1VQ05.GetStage() == 10
				pTriggered = pTriggered + 1
				if pTriggered >= 2
					pDLC1VQ05.SetStage(20)
				endif
				pTogglePlayer = 1
			endif
		endif
	endif
	
endEvent