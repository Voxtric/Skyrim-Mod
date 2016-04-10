Scriptname DLC1VQ07GeleborHelloTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ07  Auto  
int Property pTriggered Auto
GlobalVariable Property pDLC1VQ07Trigger Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if pDLC1VQ07.GetStage() == 10
			if akActionRef == Game.GetPlayer()
				if pDLC1VQ07.GetStageDone(30) == 0
					pDLC1VQ07Trigger.SetValue(1)
					pDLC1VQ07.SetStage(30)
					pTriggered = 1
				endif
			endif
		endif
	endif

endEvent