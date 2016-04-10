Scriptname DLC1VQ08SceneTriggerScript extends ObjectReference  

Quest Property pDLC1VQ08 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if pDLC1VQ08.IsRunning()
			if pDLC1VQ08.GetStageDone(50) == 0
				pDLC1VQ08.SetStage(50)
				GoToState("Done")
			endif
		endif
	endif
EndEvent

State Done
	Event OnTriggerEnter(ObjectReference akActionRef)
		;Do Nothing
	EndEvent
EndState