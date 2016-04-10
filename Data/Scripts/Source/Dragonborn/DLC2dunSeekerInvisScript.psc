Scriptname DLC2dunSeekerInvisScript extends Actor
{when in combat, have Seeker become invisible}

import Utility
import Debug

Spell property mySpell auto
{spell to cast when entering combat}

bool property startIvis = false auto
{default = false}

int property myDistance = 512 auto hidden
{how close before variable01 is set to true}

int property mySpeedMult = 3000 auto hidden
{how fast while invisible}

int property mySpeedNormal = 100 auto hidden
{how fast while not invisible}

bool doOnce = false
bool close = true

;******************************************************

Event onUpdate()
	while(!close)
		if(self.getDistance(game.getPlayer()) < myDistance)
			close = true
			gotoState("ReturnToNormal")
		endif
	endWhile
endEvent

;******************************************************

auto State Waiting

	Event onCellAttach()
		if(startIvis == true) && (!isDead())
			SetAlpha(0, false)
			self.setAV("SpeedMult", mySpeedMult)
			disable(0)
			enable(0)
			SetAlpha(0, false)
		endif
	endEvent

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
	  bool abBashAttack, bool abHitBlocked)
		gotoState("ReturnToNormal")
	endEvent

	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	  if (akTarget == Game.GetPlayer())
	    if (aeCombatState == 1)
		    if(!doOnce)
				doOnce = true
				close = false
				mySpell.Cast(self, self)
				self.setAV("SpeedMult", mySpeedMult)
				wait(1)
				SetAlpha(0, false)
				evaluatePackage()
				disable(0)
				enable(0)
				SetAlpha(0, false)
				registerForSingleUpdate(0)
			endif
	    endIf
	  endIf
	endEvent

endState
;******************************************************

State ReturnToNormal
	Event onBeginState()
		close = true
		setAV("Variable01", 1)
		self.setAV("SpeedMult", mySpeedNormal)
		disable(0)
		enable(0)
		evaluatePackage()
		SetAlpha(1, false)
	endEvent
endState

;******************************************************