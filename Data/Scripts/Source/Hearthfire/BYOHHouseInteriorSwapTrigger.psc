Scriptname BYOHHouseInteriorSwapTrigger extends ObjectReference  
{tracks objects dropped inside the exterior part of the house so they can be moved when the interior is created and that part of the exterior becomes inaccessible}

bool bFirstLoad = false

event OnLoad()
	; let run for a couple of seconds and then disable
	if IsEnabled() && bFirstLoad == false
		debug.trace(self + " OnLoad - disable in 2 seconds")
		bFirstLoad = true
		RegisterForSingleUpdate(2.0)
	endif
endEvent

event OnUpdate()
	debug.trace(self + " OnUpdate - disabling")
	Disable()
endEvent

EVENT onTriggerEnter(objectReference akActionRef)
	MoveObject(akActionRef)
endEVENT

; move tracked objects
function MoveObject(ObjectReference itemRef)
 	debug.trace(self + "MoveObject: " + itemRef)

	if (itemRef as Actor)
		itemRef.MoveTo(MoveMarker)
	else
	; otherwise, put in container
		debug.trace(self + "Moving into container " + MoveContainer)
		MoveContainer.AddItem(itemRef)
	endif

endFunction

; PROPERTIES

ObjectReference Property MoveContainer Auto
{container to move the items to when the trigger is enabled}

ObjectReference Property MoveMarker Auto
{container to move actors to when the trigger is enabled}



