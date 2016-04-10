Scriptname DLC2AcolyteMaskEffectScript extends ObjectReference
{Script used for DLC2's three Acolyte Priest Masks.}

Perk property ElementBoostPerk Auto
{Perk that boosts the magnitude of spells of this element.}

Actor player

Event OnInit()
	player = Game.GetPlayer()
EndEvent

Event OnEquipped(Actor akActor)
	if (akActor == player)
		player.AddPerk(ElementBoostPerk)
	EndIf
EndEvent

Event OnUnequipped(Actor akActor)
	if (akActor == player)
		player.RemovePerk(ElementBoostPerk)
	EndIf
EndEvent