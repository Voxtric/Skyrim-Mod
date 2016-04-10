Scriptname DLC1VQ08NoFollowDoorAliasScript extends referenceAlias  
{block activation by non-quest NPCs to keep followers out}

;This is removed because the quest is handling it.
;Event OnInit()

;	BlockActivation()

;EndEvent

ActorBase Property DCL1Serana Auto
bool Property interiorDoor = False auto

Event OnActivate(ObjectReference akActionRef)
	; only do this check if activation is blocked
	if getReference().IsActivationBlocked() == false
; 		debug.trace(self + "OnActivate " + akActionRef + " - not blocked, normal activation")
		return
	endif
	
	if interiorDoor
		;Do Nothing! Block activate will be turned off once the quest is over.
	elseif (akActionRef == Game.GetPlayer()) || ((akActionRef as actor).getActorBase() == DCL1Serana)
; 		debug.trace(self + "OnActivate - player, allow activation")
		self.getReference().Activate(akActionRef, true)
	endif

EndEvent
