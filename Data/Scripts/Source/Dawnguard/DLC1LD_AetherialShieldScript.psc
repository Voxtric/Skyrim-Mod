Scriptname DLC1LD_AetherialShieldScript extends ObjectReference
{Script for the DLC1LD Aetherial Shield reward item}

Perk property DLC1LD_AetherialShieldPerk Auto

;When the player equips the shield, give them the associated perk.
Event OnEquipped(Actor akActor)
	;Debug.Trace("Aetherial Shield Perk Added.")
	akActor.AddPerk(DLC1LD_AetherialShieldPerk)
EndEvent

;When the player removes the shield, remove the perk.
Event OnUnequipped(Actor akActor)
	;Debug.Trace("Aetherial Shield Perk Removed.")
	akActor.RemovePerk(DLC1LD_AetherialShieldPerk)
EndEvent