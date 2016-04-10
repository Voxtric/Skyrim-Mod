Scriptname DLC2RR01CariusFightScript extends Actor 

{On Combat start, start scene and summon three Ash Spawn.}

import game
import debug

Actor Property AshSpawn01 auto
Actor Property AshSpawn02 auto
Actor Property AshSpawn03 auto
;ObjectReference Property caster01 auto
;spell Property resurrection auto
;spell Property reanimateSelf auto
Scene Property BossFightScene auto


auto State Waiting
	Event onCombatStateChanged(Actor AkTarget, int aeCombatState)
			if(aeCombatState == 1) && self.isInInterior() == true
				bossFightScene.Start()
				AshSpawn01.Activate(AshSpawn01)
				AshSpawn02.Activate(AshSpawn02)
				AshSpawn03.Activate(AshSpawn03)
				;goToState("waitingForDeath")
			endif
	EndEvent
EndState

;State waitingForDeath
;	Event onDying(Actor myKiller)
;		ashSpawn01.kill()
;		ashSpawn02.kill()
;		ashSpawn03.kill()
;		goToState("allDone")
;	EndEvent
;EndState

State allDone
EndState