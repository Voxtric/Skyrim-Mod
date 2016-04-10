Scriptname DLC2Book01SetGlobalScript extends ObjectReference  

globalVariable property DLC2Book01ResetHalls auto

event onTriggerEnter(objectReference triggerRef)
	if triggerRef == game.getPlayer()
		DLC2Book01ResetHalls.setValue(1)
	endif
endEvent
