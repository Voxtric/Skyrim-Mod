Scriptname DLC1FerrymanScript extends ObjectReference conditional
{new simple furniture version}


bool property bSitting auto Conditional

; ***** VARIABLES **********
Actor meAsActor

;**************************


Event OnSit(ObjectReference akFurniture)
	if akFurniture == GetLinkedRef()
		bSitting = true
	endif
endEvent

Event OnGetUp(ObjectReference akFurniture)
	if akFurniture == GetLinkedRef()
		bSitting = false
	endif
endEvent
