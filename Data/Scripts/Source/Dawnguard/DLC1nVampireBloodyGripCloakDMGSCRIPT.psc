Scriptname DLC1nVampireBloodyGripCloakDMGSCRIPT extends ActiveMagicEffect  

IDLE PROPERTY gripIdle AUTO
ACTOR victim

EVENT onEffectStart(Actor akTarget, Actor akCaster)
	victim = akTarget

	if(!victim.playIdle(gripIdle))
		victim.playIdle(gripIdle)
	endif

endEVENT