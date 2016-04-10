Scriptname DLC2defaultAddPerkOnEquipScript extends ObjectReference
{Generic script for adding a Perk to the player when an item is equipped.}

Perk property PerkToAdd Auto

Event OnEquipped(Actor akActor)
	if (akActor == Game.GetPlayer())
		Game.GetPlayer().AddPerk(PerkToAdd)
	EndIf
EndEvent

Event OnUnequipped(Actor akActor)
	if (akActor == Game.GetPlayer())
		Game.GetPlayer().RemovePerk(PerkToAdd)
	EndIf
EndEvent