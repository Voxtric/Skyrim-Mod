Scriptname DLC1VQ08BossRoomCleanupScript extends ObjectReference  
{track all objects that enter the trigger so they can be moved when we disable the boss room}


EVENT onTriggerEnter(objectReference akActionRef)
	if bIsActive
		AddToList(akActionRef)
	endif
endEVENT

Event OnTriggerLeave(ObjectReference akActionRef)
	if bIsActive && getParentCell().IsAttached()
		Debug.Trace(self + ": Removing " + akActionRef + " from Cleanup List")
		DLC1VQ08flBossRoomTrackingList.RemoveAddedForm(akActionRef)
	endif
endEVENT


function AddToList(ObjectReference akActionRef)
	; check to see if we should add this to our list
	; 
	; not the player, duh
	if akActionRef == Game.GetPlayer()
		return
	endif

	; add to list
	
	if !DLC1VQ08flBossRoomTrackingList.hasForm(akActionRef)
		Debug.Trace(self + ": Adding " + akActionRef + " to Cleanup List")
		DLC1VQ08flBossRoomTrackingList.AddForm(akActionRef)
	else
		Debug.Trace(self + ": Already has " + akActionRef + " in the Cleanup List")
	endif
endFunction



; use this to turn on/off object tracking
; (turn OFF before disabling)
function SetActive(bool bActive)
	bIsActive = bActive
endFunction

; this clears list when trigger is done being used
function ClearList()
	DLC1VQ08flBossRoomTrackingList.Revert()
endFunction

; PROPERTIES
bool Property bIsActive = true auto hidden			; set to false to turn off tracking

FormList Property DLC1VQ08flBossRoomTrackingList  Auto  
{List to track objects to move later}

