Scriptname DLC2dunFrostmoonQSTRingScript extends Quest
{Quest script for DLC2dunFrostmoonQST. Primarily manages ring equip/unequip events.}

GlobalVariable property DLC2dunFrostmoonCurrentRing Auto ;Ring the player currently has equipped. 0=None, 1=Bloodlust, 2=Moon, 3=Instinct, 4=Hunt
Armor property DLC2dunFrostmoonRingBloodlust Auto
Armor property DLC2dunFrostmoonRingMoon Auto
Armor property DLC2dunFrostmoonRingInstinct Auto
Armor property DLC2dunFrostmoonRingHunt Auto
Actor player
ReferenceAlias property PlayerAlias Auto

Function FrostmoonRingEquipped(int ringID)
; 	;Debug.Trace("Equipped " + ringID)
	UnregisterForUpdate()
	DLC2dunFrostmoonCurrentRing.SetValue(ringID)
EndFunction

Function FrostmoonRingUnequipped(int ringID)
; 	;Debug.Trace("Unequipped " + ringID)
	RegisterForSingleUpdate(3)
EndFunction

Event OnUpdate()
	if (player == None)
		player = Game.GetPlayer()
	EndIf
	if (!(player.IsEquipped(DLC2dunFrostmoonRingBloodlust) || player.IsEquipped(DLC2dunFrostmoonRingMoon) || \
		player.IsEquipped(DLC2dunFrostmoonRingInstinct) || player.IsEquipped(DLC2dunFrostmoonRingHunt)))
; 		;Debug.Trace("Nullifying Frostmoon Ring global.")
		DLC2dunFrostmoonCurrentRing.SetValue(0)
	EndIf
EndEvent

