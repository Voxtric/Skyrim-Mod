Scriptname DLC1VQ05DragonDeathScript extends Actor  

import game
import debug

;objectReference property skeletonKillMarker auto
;objectReference property markerLink auto hidden
;int property howManyskeletons auto
;int property skeletonID = 0 auto hidden

VisualEffect Property DLC1DeadDragonParticlesEffect auto
EffectShader Property DLC1DragonSummonFXS auto
EffectShader Property DLC1DragonUnSummonFXS auto

Quest property DLC1VQDragon auto


Actor Property skeleton01 auto
Actor Property skeleton02 auto
Actor Property skeleton03 auto
Actor Property skeleton04 auto
Actor Property skeleton05 auto
Actor Property skeleton06 auto
Actor Property skeleton07 auto
Actor Property skeleton08 auto
Actor Property skeleton09 auto
Actor Property skeleton10 auto
Actor Property skeleton11 auto
Actor Property skeleton12 auto
Actor Property skeleton13 auto
Actor Property skeleton14 auto
Actor Property skeleton15 auto
Actor Property skeleton16 auto
Actor Property skeleton17 auto
Actor Property skeleton18 auto
Actor Property skeleton19 auto
Actor Property skeleton20 auto
sound Property DeathSound Auto

auto State Waiting
	;Event onCellAttach()
	;		DLC1DeadDragonParticlesEffect.play(self, -1)
	;		DLC1DragonSummonFXS.play(self, 6)
	;Endevent

	Event onDying(Actor Killer)
		gotoState("Done")
		self.blockactivation()
		skeleton01.kill()
		skeleton02.kill()
		skeleton03.kill()
		skeleton04.kill()
		skeleton05.kill()
		skeleton06.kill()
		skeleton07.kill()
		skeleton08.kill()
		skeleton09.kill()
		skeleton10.kill()
		skeleton11.kill()
		skeleton12.kill()
		skeleton13.kill()
		skeleton14.kill()
		skeleton15.kill()
		skeleton16.kill()
		skeleton17.kill()
		skeleton18.kill()
		skeleton19.kill()
		skeleton20.kill()
		utility.wait(6)
		DLC1DeadDragonParticlesEffect.stop(self)
		self.PlaySubgraphAnimation("SkinFadeOut")
		DeathSound.play (self)
		DLC1DragonSummonFXS.play(self, 10)
		utility.wait(6)
		self.disable(1)
		self.blockActivation(false)
		DLC1VQDragon.SetStage(10)
	EndEvent
EndState

State Done
	Event onCellAttach()
		DLC1DeadDragonParticlesEffect.play(self, -1)
		DLC1DragonSummonFXS.play(self, 6)
	Endevent
	Event onDying(Actor Killer)
		utility.wait(6)
		DLC1DeadDragonParticlesEffect.stop(self)
		self.PlaySubgraphAnimation("SkinFadeOut")
		DeathSound.play (self)
		DLC1DragonSummonFXS.play(self, 10)
		utility.wait(6)
		self.disable(1)
	Endevent
EndState