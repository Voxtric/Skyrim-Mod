Scriptname DLC1MagicEatenByBatsScript extends ActiveMagicEffect  
{20 Million every second...}


VisualEffect Property DLC1VampireBatsVFX auto
ImpactDataSet Property BloodSprayBleedImpactSetRed auto
EffectShader Property DLC1BatsEatenBloodSplats Auto
EffectShader Property DLC1VampBatsEatenByBatsSkinFXS Auto
;sound Property BatsEatingSound auto

; bool bIsFinishing = False
;Actor Target
sound MySoundRef

;/ Event OnInit()
	;MySoundRef = BatsEatingSound
	;Target = self.GetTargetActor()
EndEvent /;

Event OnEffectStart(Actor Target, Actor Caster)
	Utility.wait(0.9)
	DLC1BatsEatenBloodSplats.Play(Target,5.0)
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	; bIsFinishing = 1
	if Target.isdead()
		;MySoundRef.play(Target)
		DLC1VampireBatsVFX.Play(Target,1.0,Caster)
		DLC1VampBatsEatenByBatsSkinFXS.Play(Target,5.0)
		Utility.wait(0.4)
		DecalSpray(Target,2)
	endif
	DLC1BatsEatenBloodSplats.stop(Target)
	Utility.wait(5.0)
EndEvent


function DecalSpray(Actor BleedingActor, int xTimes)
	Float VectorX
	Float VectorY
	while xTimes > 0
		VectorX = (Utility.RandomFloat(-0.6, 0.6))
		VectorY = (Utility.RandomFloat(-0.6, 0.6))
		BleedingActor.ApplyHavokImpulse(VectorX, VectorY, 0.7, 50.0)
		BleedingActor.PlayImpactEffect(BloodSprayBleedImpactSetRed,"MagicEffectsNode",VectorX, VectorY, -0.9, 512, false, false)
		Utility.wait(0.28)
		BleedingActor.ApplyHavokImpulse(VectorY, VectorX, 0.7, 45.0)
		Utility.wait(0.38)
		xTimes = (xTimes - 1)
	endwhile
endfunction
