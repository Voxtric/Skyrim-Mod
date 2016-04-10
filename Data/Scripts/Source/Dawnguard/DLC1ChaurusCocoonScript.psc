ScriptName DLC1ChaurusCocoonScript extends ObjectReference
{Script for the Chaurus Cocoon. Activates itself on hit to trigger the ambush; when hit or activated, destroys itself.}

Race property DLC1ChaurusHunterRace auto
Keyword property LinkCustom01 auto

Auto State Ready
	;On hit, the cocoon activates itself to trigger its ambush, if any.
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		GoToState("Done")	
	EndEvent

	;When activated (typically by the ambush triggering), destroys itself.
	Event OnActivate(ObjectReference akActivator)
		GoToState("Done")
	EndEvent
	
	Event onEndState()
		Self.Activate(Self)
		Self.DamageObject(10000000000)
		Self.GetLinkedRef(LinkCustom01).Disable()
	EndEvent
EndState

State Done
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do Nothing
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		;Do Nothing.
		Debug.Trace("Ping B")
	EndEvent
EndState