Scriptname DLC2dunKolbjornRingSilverEffectScript extends ActiveMagicEffect
{Script for the the Kolbjorn Ring of Necromancy, which causes reanimated creatures to explode on death.}

Explosion property ExplosionRuneFrost01 Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	GetTargetActor().PlaceAtMe(ExplosionRuneFrost01)
	GetTargetActor().DamageAV("Health", 10000)
EndEvent