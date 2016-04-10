Scriptname DLC2dunKolbjornArmorEffectScript extends ActiveMagicEffect
{Script for the the Kolbjorn Barrow Armor piece, which has a chance to paralyze melee attackers.}

Spell property DLC2dunKolbjornArmorParalyze Auto
Sound property MAGParalysisEnchantment Auto
Keyword property WeapTypeBow Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if ((akSource as Weapon) != None && !akSource.HasKeyword(WeapTypeBow) && (akAggressor as Actor) != None)
		int roll = Utility.RandomInt(0, 99)
; 		;Debug.Trace("Armor Roll: " + roll)
		if (roll < 5)
			MAGParalysisEnchantment.Play(akAggressor)
			DLC2dunKolbjornArmorParalyze.Cast(akAggressor)
		EndIf
	EndIf
EndEvent