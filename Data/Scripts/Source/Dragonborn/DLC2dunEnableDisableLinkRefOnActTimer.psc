Scriptname DLC2dunEnableDisableLinkRefOnActTimer extends ObjectReference  
{enable OR disable linked ref on activate after x amount of time}

import utility

bool Property bEnableOnActivate = true  Auto  
{true (default) = enable linked ref
false = disable linked ref
}

float property myTimer auto
{timer before enabling disabling after activation}

Keyword Property LinkedRefKeyword  Auto  
{optional - if supplied, use this for GetLinkedRef}

;******************************************************

auto State Waiting
	Event OnActivate (objectReference triggerRef)
		ObjectReference myRef = GetLinkedRef(LinkedRefKeyword)
		if(myRef)
			GoToState("done")
			wait(myTimer)
			if(bEnableOnActivate)
				myRef.Enable(true)
			else
				myRef.Disable(true)
			endif
		endif
	endEvent
endState

;******************************************************

State done
	;do nothing
endState

;******************************************************