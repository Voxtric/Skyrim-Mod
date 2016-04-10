Scriptname DLC1ChaurusFlyerFXSCRIPT extends activemagiceffect  
{Cotrols the fx for the chaurus flyer}

Actor selfRef

EVENT OnEffectStart(Actor Target, Actor Caster)
		;Play your particles.
		selfRef = caster		
ENDEVENT
EVENT onDying(actor myKiller)
	;selfRef.SetSubGraphFloatVariable("fdampRate", 0.1) ;;speeds up fade rate (max 1 min .1
	selfRef.SetSubGraphFloatVariable("ftoggleBlend", 1.0);;blends between two anims default 0 (0 = there 1 = gone)
ENDEVENT
	