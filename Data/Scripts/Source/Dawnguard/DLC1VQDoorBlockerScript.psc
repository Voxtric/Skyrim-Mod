Scriptname DLC1VQDoorBlockerScript extends ObjectReference  Conditional

Faction Property pDLC1VQDoorBlockerFaction Auto

Event OnActivate(ObjectReference akActionRef)
	; only do this check if activation is blocked
	if IsActivationBlocked() == false
; 		debug.trace(self + "OnActivate " + akActionRef + " - not blocked, normal activation")
		return
	endif

	bool bAllowActivation = false

	if (akActionRef == Game.GetPlayer())
; 		debug.trace(self + "OnActivate - player, allow activation")
		bAllowActivation = true
	else
		Actor actorRef = akActionRef as Actor
; 		debug.trace(self + "OnActivate - " + actorRef)
		if actorRef && (actorRef.isInFaction( pDLC1VQDoorBlockerFaction ))
; 			debug.trace(self + "OnActivate - " + actorRef + ": allow activation")
			bAllowActivation = true
		else
; 			debug.trace(self + "OnActivate - " + actorRef + ": activation BLOCKED")
		endif
	endif

	if bAllowActivation
; 		debug.trace(self + "OnActivate - " + akActionRef + " Activate()")
		Activate(akActionRef, true)
	endif
EndEvent