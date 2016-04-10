Scriptname DLC2TribalWerebearScript extends Actor  


Spell Property WerebearChange auto
int Property TransformDistance = 500 auto


Function Transform()
	; do nothing by default
EndFunction

Auto State human
	Function Transform()
		GoToState("bear")
		StopCombat()
		StopCombatAlarm()
		WerebearChange.Cast(self)
		; SetAv("aggression", 3)
		; SetAv("confidence", 4)
		StartCombat(Game.GetPlayer())
	EndFunction	


	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Transform()
	EndEvent
EndState

State bear
	Event OnBeginState()
		UnregisterForUpdate() ; being overly cautious
	EndEvent
EndState


Event OnLoad()
	RegisterForSingleUpdate(1)
EndEvent

Event OnCellAttach()
	RegisterForSingleUpdate(1)
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	if (Game.GetPlayer().GetDistance(self) <= TransformDistance)
		Transform()
	else
		RegisterForSingleUpdate(1)
	endif
EndEvent
