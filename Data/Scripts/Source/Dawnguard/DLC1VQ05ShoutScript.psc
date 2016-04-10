Scriptname DLC1VQ05ShoutScript extends ActiveMagicEffect  

{Scripted effect for the soul cairn dragon's raise dead shout.}

import debug
import game
import utility


objectReference property gravesMarker01 auto
objectReference property gravesMarker02 auto
objectReference property gravesMarker03 auto
objectReference property gravesMarker04 auto

objectReference property casterMarker auto


objectReference property casterTarget01 auto
objectReference property casterTarget02 auto
objectReference property casterTarget03 auto
objectReference property casterTarget04 auto
objectReference property casterTarget05 auto

spell property shoutFX auto
spell property spellFX auto

explosion property raiseExplosion auto

function spellFXCast()
	spellFX.Cast(casterMarker, casterTarget01)
	spellFX.Cast(casterMarker, casterTarget02)
	spellFX.Cast(casterMarker, casterTarget03)
	spellFX.Cast(casterMarker, casterTarget04)
	spellFX.Cast(casterMarker, casterTarget05)
	wait(2)
	casterTarget01.placeatme(raiseExplosion)
	casterTarget02.placeatme(raiseExplosion)
	casterTarget03.placeatme(raiseExplosion)
	casterTarget04.placeatme(raiseExplosion)
	casterTarget05.placeatme(raiseExplosion)
endfunction

Event OnEffectStart(Actor Target, Actor Caster)
	trace("magic effect start")
		
		if gravesMarker01.isEnabled() == 1
		trace("waking group 1")
			shoutFX.Cast(Caster, casterMarker)
			wait(1)
			spellFXCast()
			gravesMarker01.activate(gravesMarker01)
			wait(3)
			gravesMarker01.disable()
		elseif gravesMarker02.isEnabled() == 1
		trace("waking group 2")
			shoutFX.Cast(Caster, casterMarker)
			wait(1)
			spellFXCast()
			gravesMarker02.activate(gravesMarker02)
			wait(3)
			gravesMarker02.disable()
		elseif gravesMarker03.isEnabled() == 1	
		trace("waking group 3")
			shoutFX.Cast(Caster, casterMarker)
			wait(1)
			spellFXCast()
			gravesMarker03.activate(gravesMarker03)
			wait(3)
			gravesMarker03.disable()
		elseif gravesMarker04.isEnabled() == 1
		trace("waking group 4")
			shoutFX.Cast(Caster, casterMarker)
			wait(1)
			spellFXCast()
			gravesMarker04.activate(gravesMarker04)
			wait(3)
			gravesMarker04.disable()
		endif
endEvent