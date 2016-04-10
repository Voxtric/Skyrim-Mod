Scriptname DLC2SoulStealMiraak extends ReferenceAlias  
{Script attached to Miraak alias in DLC2SoulSteal quest}

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;	if akAggressor == Game.GetPlayer()
;		Debug.Trace(self + "OnHit by player")
;		(GetOwningQuest() as DLC2SoulStealScript).PlayerAttackedMiraak()
;	endif
EndEvent

Event OnCellDetach()
; 	Debug.Trace(self + "OnCellDetach()")
	(GetOwningQuest() as DLC2SoulStealScript).MiraakDetached()
EndEvent

Event OnDetachedFromCell()
; 	Debug.Trace(self + "OnDetachedFromCell()")
	(GetOwningQuest() as DLC2SoulStealScript).MiraakDetached()
EndEvent