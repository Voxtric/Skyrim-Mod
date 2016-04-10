Scriptname DLC2MQ04NchardakBookActivator extends ObjectReference  
{passes on the player's activation to the linked ref}

auto State WaitingToBeActivated
	EVENT onActivate(ObjectReference triggerRef)
		if triggerRef == Game.getPlayer()
			gotoState("Activated")
			; pass activation to the black book
			GetLinkedRef().Activate(triggerRef)
			if DLC2BookDungeonController.IsReadingAllowed(false)
				; disable activator
				Disable()
				; make book disappear
				GetLinkedRef(LinkCustom01).PlayAnimation("Stage2")
			else
				gotoState("WaitingToBeActivated")
			endif
		endif
	endEVENT
EndState

state activated
; empty
endState

Keyword Property LinkCustom01  Auto  
DLC2BookDungeonControllerScript Property DLC2BookDungeonController Auto
