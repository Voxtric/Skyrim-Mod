Scriptname DLC1SummonFromSoulCairnFXSCRIPT extends Actor
{Adds fx}

VisualEffect Property DLC1DeadDragonParticlesEffect auto
EffectShader Property SummonFXS auto
EffectShader Property UnSummonFXS auto
Float Property FxsTime = 0.1 auto
Bool Property IAMDragon = false auto

	Event onLoad()
		if  DLC1DeadDragonParticlesEffect
			DLC1DeadDragonParticlesEffect.play(self, -1)
		endif
		if SummonFXS
			SummonFXS.play(self, FxsTime)
		endif
	ENDEVENT
	
	Event OnDying(Actor akKiller)
		if  DLC1DeadDragonParticlesEffect
			DLC1DeadDragonParticlesEffect.stop(self)
		endif
		if IAMDragon == true
			self.PlaySubgraphAnimation("SkinFadeOut")
		endif
		if UnSummonFXS
			UnSummonFXS.play(self, FxsTime)
		endif
	ENDEVENT
	
	