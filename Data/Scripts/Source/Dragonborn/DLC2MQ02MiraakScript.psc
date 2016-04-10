Scriptname DLC2MQ02MiraakScript extends ReferenceAlias  Conditional

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)

	if AkAggressor == Game.GetPlayer()
		if GetOwningQuest().GetStage() < 20
			GetOwningQuest().SetStage(20)
		endif
	endif

EndEvent


Event OnEnterBleedout()

	GetOwningQuest().SetStage(22)

EndEvent
