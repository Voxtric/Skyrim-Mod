Scriptname DLC1VQ01GargoyleTriggerScript extends ObjectReference  

quest property DLC1VQ02 auto

Event onTriggerEnter(objectReference triggerRef)	
	if DLC1VQ02.getStage() == 5
		DLC1VQ02.SetStage(6)	; put Serana directly into combat with gargoyles
		getLinkedRef().Activate(getLinkedRef())
		self.disable()
	endif 
endEvent