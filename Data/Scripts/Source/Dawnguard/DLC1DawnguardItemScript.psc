Scriptname DLC1DawnguardItemScript extends ObjectReference  
{Adds the perk that makes wielder do more damageto / take less damage from undead}

Perk Property DLC1DawnguardItemPerk auto

Event OnEquipped(Actor akActor)
	debug.trace(self + "OnEquipped() akActor:" + akActor)
	akActor.AddPerk(DLC1DawnguardItemPerk)
EndEvent