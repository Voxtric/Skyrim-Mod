Scriptname DLC2dunIldariScript extends Actor
{script to handle Ildari's death scene}

import debug
import utility

Armor property myArmor auto
{Ildari's Necklace}

Idle property myIdle auto
{kill move idle}

MiscObject property myHeartStone auto
{Heartstone}

Perk property myPerk auto

;******************************************************

Event onCellAttach()
	if((!self.IsBleedingOut()) && (!IsDead()))
		gotoState("waiting")
		self.AllowBleedoutDialogue(false)
	endif
endEvent

;******************************************************

Auto State waiting
	Event onActivate(objectReference triggerRef)
	endEvent

	Event OnEnterBleedout()
		;need to go to state to handle activation
		game.getPlayer().addPerk(myPerk)
		self.SetNoBleedoutRecovery(true)
		self.AllowBleedoutDialogue(true)
		gotoState("ripHeartOut")
	endEvent

endState

;******************************************************

State ripHeartOut
	Event onActivate(objectReference triggerRef)
		if(triggerRef == game.getPlayer())
			;need to player animation and remove heartstone from Ildari
			gotoState("doNothing")
			self.GetActorBase().SetEssential(false)
			game.getPlayer().playIdleWithTarget(myIdle, self)
			Game.ForceThirdPerson()
			if(game.getPlayer().playIdleWithTarget(myIdle, self))
			else
			endif
			self.removeItem(myArmor, 1)
			self.killEssential(game.getPlayer())
			wait(5)
			game.getPlayer().additem(myHeartStone,  1)
			game.getPlayer().removePerk(myPerk)
		endif
	endEvent
endState

;******************************************************

State doNothing
	Event onActivate(objectReference triggerRef)
		;doNothing
	endEvent
endState

;******************************************************