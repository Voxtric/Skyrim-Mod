Scriptname DLC1VampireTutorialNoPickpocket extends ReferenceAlias  
{Blocks the player from being able to pickpocket Harkon during the DLC11 Vampire Tutorial}

Message Property MQ101PickpocketMessage Auto

Event OnActivate(ObjectReference akActionRef)
; 	debug.trace(self + "activating Harkon")
	If akActionRef == Game.GetPlayer() && Self.GetActorRef().IsActivationBlocked() == true
; 	debug.trace(self + "Player has activated Harkon during the Tutorial")
		If Game.GetPlayer().IsSneaking()
; 			debug.trace(self +"Player is attempting to pickpocket Harkon")
			;don't allow pickpocketing
			MQ101PickpocketMessage.Show()
		Else
; 			debug.trace(self + "Player is talking to Harkon")
			Self.GetActorRef().Activate(Game.GetPlayer(), abDefaultProcessingOnly = true)
		EndIf
	EndIf
EndEvent