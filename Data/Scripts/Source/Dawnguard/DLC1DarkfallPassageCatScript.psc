Scriptname DLC1DarkfallPassageCatScript extends ObjectReference  
{for Darkfall Passage - enables the sabra cat on activate and moves the cat to a specific marker}

ObjectReference property myMarker auto  ;the marker the cat gets moved to

;************************************

auto State Waiting
	Event OnActivate (objectReference triggerRef)
		ObjectReference myRef = GetLinkedRef()
		if(myRef)
			goToState("done")
				myRef.enableNoWait()
				myRef.moveTo(myMarker)
		endif
	endEvent
endState

;************************************

state done
	;do nothing
endState

;************************************