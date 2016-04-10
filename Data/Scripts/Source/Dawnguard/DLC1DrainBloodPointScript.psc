Scriptname DLC1DrainBloodPointScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Debug.Trace("VAMPIRE DRAIN: effect applied")
	Victim = akTarget
	SpellCaster = akCaster
EndEvent

Event OnDying(Actor akKiller)
	Debug.Trace("VAMPIRE DRAIN: Target dying")
	if akKiller == Game.GetPlayer()
		If Victim.HasMagicEffect(ReanimateSecondaryFFAimed) == false && Victim.HasSpell(GhostAbilityNew) == false
			Debug.Trace("VAMPIRE DRAIN: Absorb Health spell - is not a ghost or a commanded actor")
			if ProhibitedCreatures.HasForm( GetTargetActor().GetRace() ) == False
				DLC1VampireBloodPoints.Value += 1
				If DLC1VampireTotalPerksEarned.Value < DLC1VampireMaxPerks.Value
					DLC1BloodPointsMsg.Show()
					if DLC1VampireBloodPoints.Value >= DLC1VampireNextPerk.Value
						DLC1VampireBloodPoints.Value -= DLC1VampireNextPerk.Value
						DLC1VampirePerkPoints.Value += 1
						DLC1VampireTotalPerksEarned.Value += 1
						DLC1VampireNextPerk.Value = DLC1VampireNextPerk.Value + 2
						DLC1VampirePerkEarned.Show()
					endif
				endif
				Game.GetPlayer().SetActorValue("VampirePerks", DLC1VampireBloodPoints.Value / DLC1VampireNextPerk.Value*100)				
			endif
		endif
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Debug.Trace("VAMPIRE DRAIN: effect finished")
	if victim.IsDead()
		Utility.Wait(0.1)
	endif
endEvent

actor SpellCaster
actor Victim

FormList Property ProhibitedCreatures  Auto  

Message Property DLC1BloodPointsMsg  Auto  

GlobalVariable Property DLC1VampireBloodPoints  Auto  
GlobalVariable Property DLC1VampireNextPerk  Auto  
GlobalVariable Property DLC1VampirePerkPoints  Auto  

Message Property DLC1VampirePerkEarned  Auto  

GlobalVariable Property DLC1VampireMaxPerks  Auto  

GlobalVariable Property DLC1VampireTotalPerksEarned  Auto  

MagicEffect Property ReanimateSecondaryFFAimed  Auto  

SPELL Property GhostAbilityNew  Auto  
