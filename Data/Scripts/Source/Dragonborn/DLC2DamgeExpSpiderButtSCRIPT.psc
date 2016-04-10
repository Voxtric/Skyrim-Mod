Scriptname DLC2DamgeExpSpiderButtSCRIPT extends ObjectReference  
{Changes your albino spider butts to damaged butts on hit}

MiscObject Property DLC2ExpSpiderAlbinoButtDamaged Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	
	self.placeatme(DLC2ExpSpiderAlbinoButtDamaged, 1)
	self.disable()
	self.delete()

EndEvent

