scriptName DLC1EnableDisableLinkToggleScript extends ObjectReference
{
- This script enables or disables linked ref based on which type user defines in properties.  On Activator, or OnTriggerEnter, whichever is first.
}

import debug

bool property PlayerOnly = true auto
{default = true}

int property EnableDisableToggle = 0 auto
{
0 (default) - enable on enter, disable on leave
1 - disable on enter, enable on leave
}

ObjectReference myLink

;************************************

function HandleOnEnterOnLeave(int iNum, bool bEnteredTrigger)
	if(bEnteredTrigger)
		if(iNum == 0)
			myLink.enable()
		else
			myLink.disable()
		endif
	else
		if(iNum == 0)
			myLink.disable()
		else
			myLink.enable()
		endif
	endif
endFunction

;************************************

Event onTriggerEnter(ObjectReference akActionRef)
	myLink = GetLinkedRef() as ObjectReference
	if(PlayerOnly)
		if(akActionRef == Game.GetPlayer())
			HandleOnEnterOnLeave(EnableDisableToggle, true)
		endif
	else
		HandleOnEnterOnLeave(EnableDisableToggle, true)
	endif
endEvent

Event onTriggerLeave(ObjectReference akActionRef)
	myLink = GetLinkedRef() as ObjectReference
	if(PlayerOnly)
		if(akActionRef == Game.GetPlayer())
			HandleOnEnterOnLeave(EnableDisableToggle, false)
		endif
	else
		HandleOnEnterOnLeave(EnableDisableToggle, false)
	endif
endEvent

;************************************