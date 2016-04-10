Scriptname DLC2ApoKillTrigSCRIPT extends ObjectReference Hidden 

Actor Property ActorToKill Auto
{Actor to kill when they enter the trigger.  If NONE then it will kill all actors.  (Defaults to the player)}

Event OnTriggerEnter(ObjectReference akActionRef)

	if (!ActorToKill)
		(akActionRef as Actor).Kill()
	elseif (akActionRef == ActorToKill)
		ActorToKill.Kill()
	endif

EndEvent
