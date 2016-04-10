Scriptname DLC2ApoFontActScript extends ObjectReference
{when activated, casts spell on player}

Spell property mySpell auto
{spell to cast when activated}

Message property myMessage auto
{message to display when font is depleted and then activated}

bool doOnce = false

;******************************************************
Event onCellAttach()
	doOnce = false
	self.playanimation("Play02")
endEvent

;******************************************************

Auto State waiting
	Event onActivate(objectReference triggerRef)
		if(!doOnce)
			doOnce = true
			self.playanimation("Play01")
			mySpell.Cast(game.getPlayer(), game.getPlayer())
		else
			myMessage.show()
		endif
	endEvent
endSTATE

;******************************************************