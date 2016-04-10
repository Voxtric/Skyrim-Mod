Scriptname DLC01SoulCairnTargetScript extends ObjectReference  
{When these targets are hit, activate the linked reference.}

import game

bool property doOnce = true  auto
objectReference property myTargetObject auto hidden
static property sc_TargetMote auto

auto STATE waiting

	EVENT onLoad()
		myTargetObject = placeatme(sc_TargetMote)
		myTargetObject.setScale(2.0)
	endEVENT

	Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		debug.trace("I was hit by "+akProjectile)
		(getLinkedRef() as objectReference).activate(self)
		if (doOnce)
			GoToState("allDone")
		EndIf

;/ 		bool bLoop = TRUE		

		while myTargetObject.getScale() > 0.1 && bLoop

			myTargetObject.setScale(myTargetObject.getScale() - 0.075)

			if myTargetObject.getScale() > 3.0
				; uh-oh, it wrapped around and scaled up!
				myTargetObject.setScale(0.1)
				bLoop = FALSE
			endif

			utility.wait(0.025)
		endWhile
 /;		myTargetObject.disable(TRUE)
	endEvent
endSTATE

STATE allDone
	;do nothing
endSTATE
