Scriptname DLC2DweKineticResonatorScript extends ObjectReference

bool property startInActiveState = False Auto
Keyword property LinkKeyword Auto

Function OnCellLoad()
	if (startInActiveState)
		OnActivate(Self)
	EndIf
EndFunction

Auto State Inactive
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		OnActivate(akAggressor)
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		PlayAnimationAndWait("Open", "Trans01")
		GetLinkedRef(LinkKeyword).Activate(Self)
		GoToState("Active")
	EndEvent
EndState

State Active
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		OnActivate(akAggressor)
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		PlayAnimationAndWait("Close", "Trans02")
		GetLinkedRef(LinkKeyword).Activate(Self)
		GoToState("Inactive")
	EndEvent
EndState

State Busy
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do Nothing
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		;Do Nothing
	EndEvent
EndState