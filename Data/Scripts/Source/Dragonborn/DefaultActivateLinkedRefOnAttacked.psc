Scriptname DefaultActivateLinkedRefOnAttacked extends Actor
{Activates the specified linkedref when attacked.}

Keyword property LinkKeyword Auto
bool property onlyOnce = True Auto
bool property onlyPlayer = False Auto
int property minNumberHits = 1 auto
{Minimum number of hits required to trigger the stage set. Allows for some leniancy, if desired.}

;Internally -- Actual number of hits received.
int actualHits = 0

Auto State Waiting
	Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if (aggressor == Game.GetPlayer() || !onlyPlayer)
			actualHits = actualHits + 1
			if (actualHits >= minNumberHits)
				Self.GetLinkedRef(LinkKeyword).Activate(Self)
				if (onlyOnce)
					GoToState("Inactive")
				EndIf
			EndIf
		EndIf
	EndEvent
EndState

State Inactive
EndState

