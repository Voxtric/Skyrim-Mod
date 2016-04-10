Scriptname DLC1DarkfallCaveBridgeScript extends ObjectReference  
{For Darkfall Cave - plays an animation on a bridge on trigger enter}

auto State waiting
	Event onTriggerEnter(objectReference akActionRef)
		ObjectReference myRef = GetLinkedRef()
		if(akActionRef == game.getPlayer())
			goToState("done")
			myRef.DamageObject(100.0)
		endif
	endEvent
endState

;************************************

state done
	;do nothing
endState

;************************************