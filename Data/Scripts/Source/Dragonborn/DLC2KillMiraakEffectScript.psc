Scriptname DLC2KillMiraakEffectScript extends ActiveMagicEffect  
{This script makes it so Miraak can be killed}

Event OnEffectStart(Actor Target, Actor Caster)
	Target.EndDeferredKill()
	Target.getActorBase().SetEssential(false)
	Target.getActorBase().setInvulnerable(false)
	Target.setGhost(false)
	;Target.KillEssential(Caster)
EndEvent