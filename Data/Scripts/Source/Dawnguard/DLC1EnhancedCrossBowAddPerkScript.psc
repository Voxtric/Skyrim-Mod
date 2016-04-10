Scriptname DLC1EnhancedCrossBowAddPerkScript extends ObjectReference  
{Adds the perk needed to work with the enhance crossbow to an actor who equips it.}

Perk Property DLC1EnchancedCrossbowArmorPiercingPerk  Auto  

Event OnEquipped(Actor akActor)
	akActor.AddPerk(DLC1EnchancedCrossbowArmorPiercingPerk)	
EndEvent