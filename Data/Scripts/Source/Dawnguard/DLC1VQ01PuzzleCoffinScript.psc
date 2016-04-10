Scriptname DLC1VQ01PuzzleCoffinScript extends ObjectReference  

import debug
import utility

objectReference property coffin auto 
objectReference property puzzleController auto
actor property Serana auto 
quest property DLC1VQ01 auto
;scene property SeranaGetScrollScene auto

DLC1VQ01PuzzleControllerScript mainScript

Event OnInit()
	mainScript = puzzleController as DLC1VQ01PuzzleControllerScript
EndEvent

auto State waiting
	Event OnActivate(objectReference triggerRef)
			gotoState("done")
			Serana.BlockActivation()
			coffin.PlayAnimation("open")
			Debug.Trace("RNPC: anim sent...")
			Utility.Wait(2.2)
			serana.setGhost(false)
			Debug.Trace("RNPC: wait done...")
			DLC1VQ01.setstage(20)
			Debug.Trace("RNPC: 20 set...")
			Utility.Wait(1.0)
			DLC1VQ01.setstage(30)
			Debug.Trace("RNPC: 30 set...")
			serana.evaluatePackage()
			Debug.Trace("RNPC: initial forcegreet should be running...")
			; while SeranaGetScrollScene.isPlaying() == 1
				; wait(3)
			; endWhile
			; coffin.PlayAnimation("taken")
			;sendAnimationEvent(Serana, "DLC01CoffinEnterInstant")
			self.disable()
	EndEvent
endState

State Done
EndState
