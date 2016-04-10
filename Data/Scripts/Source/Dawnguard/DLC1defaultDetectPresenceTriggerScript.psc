Scriptname DLC1defaultDetectPresenceTriggerScript extends ObjectReference conditional
{Sets a boolean property if the designated actor is within the trigger.}

bool Property PresenceDetected auto conditional
{Whether or not the designated actor is within the trigger.}

ReferenceAlias Property AliasToSense auto
{An alias to look for; if this property is set, we won't care about the actor property.}

Actor Property ActorToSense auto
{An alias to look for; if neither this property nor the Alias property is set, we assume we're looking for the Player.}



bool Function __IsWatched(ObjectReference akActivator)
	; first check for alias
	if     (AliasToSense != None && AliasToSense.GetReference() != None)
		if (akActivator == AliasToSense.GetReference())
			return true
		endif
	; then check for actor
	elseif (ActorToSense != None)
		if (akActivator == ActorToSense)
			return true
		endif
	; finally, check for player
	elseif (akActivator == Game.GetPlayer())
		return true
	; it's not the thing we care about
	else
		return false
	endif
EndFunction


Event OnTriggerEnter(ObjectReference akActivator)
	if (__IsWatched(akActivator))
		PresenceDetected = true
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (__IsWatched(akActivator))
		PresenceDetected = false
	endif
EndEvent
