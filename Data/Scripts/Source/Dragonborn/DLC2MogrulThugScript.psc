Scriptname DLC2MogrulThugScript extends ObjectReference  

Event Unload()
	if DLC2TT1b.GetStage() > 50
		Disable()
	endif
EndEvent

Event OnDeath()
	DLC2TT1b.SetStage(50)
EndEvent

Quest Property DLC2TT1b  Auto  
