Scriptname DLC2FrostmoonWerewolfItemManager extends Quest

Actor player

Armor property DLC2dunFrostmoonRingInvulnerability Auto
Armor property DLC2dunFrostmoonRingRegenerate Auto
Armor property DLC2dunFrostmoonRingHowls Auto
Armor property DLC2dunFrostmoonRingSlowTime Auto

Function RegisterForAnimationEvents()
	player = Game.GetPlayer()
; 	Debug.Trace("Registered")
	RegisterForAnimationEvent(player, "IdleWerewolfTransformation")
	RegisterForAnimationEvent(player, "HowlStart")
	RegisterForAnimationEvent(player, "SetRace")
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String akEvent)
; 	Debug.Trace("Recieved " + akEvent)
; 	Debug.Trace(player.IsEquipped(DLC2dunFrostmoonRingInvulnerability))
; 	Debug.Trace(player.IsEquipped(DLC2dunFrostmoonRingRegenerate))
; 	Debug.Trace(player.IsEquipped(DLC2dunFrostmoonRingHowls))
; 	Debug.Trace(player.IsEquipped(DLC2dunFrostmoonRingSlowTime))
; 	Debug.Trace(player.GetEquippedWeapon())
	if (akEvent == "IdleWerewolfTransformation")
; 		Debug.Trace("Event Received!")
		Debug.MessageBox("Event Received!")
	EndIf
EndEvent