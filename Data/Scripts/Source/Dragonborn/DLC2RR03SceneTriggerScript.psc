Scriptname DLC2RR03SceneTriggerScript extends ObjectReference  Conditional

int Property pTriggered Auto
Scene Property pDLC2RR03OptionalScene Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTriggered == 0
			pDLC2RR03OptionalScene.Start()
			pTriggered = 1
		endif
	endif

endEvent