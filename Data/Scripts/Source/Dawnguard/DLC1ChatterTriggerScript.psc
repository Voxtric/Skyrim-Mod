Scriptname DLC1ChatterTriggerScript extends ObjectReference  
{script used to trigger chatter scenes}

import game
import debug

GlobalVariable property FriendTravelChatter auto	

int property chatterValue auto
{ value to set}

Faction property TriggerFaction auto
{actor faction that trigger is looking for}

auto STATE waitingForActor
	EVENT onTriggerEnter(objectReference triggerRef)
		; check for correct actor
		actor actorRef = triggerRef as actor
		if actorRef != None && actorRef.IsInFaction(triggerFaction)
			SetChatterValue(chatterValue)
			gotoState("hasBeenTriggered")
			disable()
			trace(self+" triggered by "+actorRef)
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

function SetChatterValue(int newValue)
	; only set if larger than current
	if FriendTravelChatter.GetValueInt() < newValue
		FriendTravelChatter.SetValue(newValue)
	endif
endFunction
