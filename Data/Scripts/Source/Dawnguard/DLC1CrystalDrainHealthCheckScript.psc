Scriptname DLC1CrystalDrainHealthCheckScript extends ActiveMagicEffect  

bool effectApplied = false
bool property healthStop auto
;effect will stop at a set health percentage
bool property bleedoutStop auto
;effect will stop when actor enters bleedout

magicEffect Property HuskEffect auto 

Event OnEffectStart(Actor Target, Actor Caster)
	effectApplied = true
	while effectApplied == true
		if target.HasMagicEffect(huskEffect)
			dispel()
		endif
		if healthStop == true
			if(target.getActorValuePercentage("health") <= 0.25) 
				dispel()
			endif
		endif
		if bleedoutStop == true
			if target.isBleedingout() == true 	
				dispel()
			endif
		endif
	endwhile
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
effectApplied = false
EndEvent