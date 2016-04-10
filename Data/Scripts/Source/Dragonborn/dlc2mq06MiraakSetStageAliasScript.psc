Scriptname dlc2mq06MiraakSetStageAliasScript extends ReferenceAlias  
{Sets the stage to start the fight when attacked then goes to blank state}
import game
import debug

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

int testState	; for debugging

auto STATE waitingForPlayer
	Event OnHit(ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		trace(self + " OnHit in waitingForPlayer")
		if prereqStageOPT == -1 || GetOwningQuest().getStageDone(prereqStageOPT) == 1
; 			debug.trace(self + " testforTrigger SUCCEEDED")
			GetOwningQuest().setStage(stage)
			gotoState("hasBeenTriggered")
		endif
	endEvent
endSTATE

STATE hasBeenTriggered
	; this state doesn't do anything
endSTATE

