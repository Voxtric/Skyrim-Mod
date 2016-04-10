Scriptname DLC1VigCharmFXScript extends ActiveMagicEffect  
import Debug
import Utility

VisualEffect Property DLC1VigilantCharmedHeadVisualEffect auto

Actor selfRef

EVENT OnEffectStart(Actor Target, Actor Caster)	
	selfRef = caster	
	DLC1VigilantCharmedHeadVisualEffect.play(selfRef, -1)
ENDEVENT

Event OnEffectFinish(Actor akTarget, Actor akCaster)		
	DLC1VigilantCharmedHeadVisualEffect.Stop(selfRef)
ENDEVENT

EVENT OnDying(actor myKiller)	
	DLC1VigilantCharmedHeadVisualEffect.stop(selfRef)
ENDEVENT
