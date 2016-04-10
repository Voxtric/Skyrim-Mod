Scriptname DLC1MagicSoulRendScript extends ActiveMagicEffect  
{This script is used to reanimate an actor after it is killed}

Import Game

;======================================================================================;
;  PROPERTIES  /
;=============/

Spell property SpellRef auto
{The name of the Reanimate Spell. (REQUIRED!)}
MagicEffect Property ReanimateEffect Auto
{We need this effect to prevent killing and reanimating an already reanimated actor}

;======================================================================================;
;  VARIABLES   /
;=============/
actor CasterActor
actor Victim
bool bIsCastYet = False
bool bIsReanimatedAlready = False
bool bIsReadyToGo = False
booL bIsDying = False
;======================================================================================;
;  EVENTS      /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	victim = target
	CasterActor = Caster
	if (victim.HasMagicEffect(ReanimateEffect))
		bIsReanimatedAlready = True
		Self.Dispel()
	endIf
	bIsReadyToGo = true
	utility.wait(0.5)
	if (bIsDying) == False
		Self.Dispel()
	endif
EndEvent

Event OnDying(Actor Killer)
	bIsDying = true
EndEvent

;/ Event OnDying(Actor Killer)
	while (bIsReadyToGo == False)
		Utility.Wait(0.1)
	endwhile
		debug.trace("Victem is Dead is returning: " + Victim.IsDead())
	While Victim.IsDead() == False
		Utility.Wait(0.1)
	EndWhile
	CastTheSpell()
EndEvent /;

;/ Event OnDying(Actor Killer)
	While bIsReadyToGo == False
		Utility.Wait(0.25)
	EndWhile
	Utility.Wait(1.0)
	CastTheSpell()
EndEvent /;


Event OnDeath(Actor Killer)
	debug.trace("The OnDeath Event Fired, returning: " + Victim.IsDead() + "For Victim.IsDead.")
	While bIsReadyToGo == False
		Utility.Wait(0.1)
	EndWhile
	CastTheSpell()
	Self.Dispel()
EndEvent


Function CastTheSpell()
	If bIsReanimatedAlready == False
		If bIsCastYet == False
			bIsCastYet = True
			if victim.IsDead()
				SpellRef.Cast(CasterActor,Victim)
			endif
		EndIf
	EndIf
EndFunction
