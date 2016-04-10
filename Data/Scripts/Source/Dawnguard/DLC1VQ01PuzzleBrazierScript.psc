Scriptname DLC1VQ01PuzzleBrazierScript extends ObjectReference  
;Script that goes on each of the Brazier pieces for the puzzle
;Controls the animation and sends an activate event to the controller when in the correct position
import debug
message property wontBudge auto
;message to show before puzzle is activated
objectReference property puzzleController auto
;where th emain script lives
bool property solved = false auto hidden
bool property locked = false auto hidden
;Variable determines if the Brazier is in the correct state, 1 means the correct state. Starts false
;int property solvedState auto
;Property that allows user to select which of the three states is the correct state for this particular piece
;1= Top, 2= Mid, 3 = Bot
int property brazierID auto
;Property on each brazier to identify which track it is in, also lets me determine the 'correct' state for each brazier
objectReference property xmarkerInner auto
objectReference property xmarkerOuter auto
;If the brazier is in the mid position, the direction it goes depends on the player's location related to these two xmarkers

bool property isAnimating = false auto hidden

EffectShader property CastShader auto 
VisualEffect property TargVFX auto 

sound property QSTSeranaTombBrazierFireLPM auto
sound Property FXSeranaTombDrainLife2D auto

int property flameSoundInstanceID auto hidden

DLC1VQ01PuzzleControllerScript mainScript


auto state mid
	Event OnCellAttach()
	mainScript = puzzleController as DLC1VQ01PuzzleControllerScript
	playAnimation("mid")
	;if solvedState == 1
	;if top is the correct state, start with solved being true
		;solved = 1
	endEvent 
	Event onBeginState()
		puzzleController.Activate(puzzleController)
	endEvent
	Event OnActivate(objectReference triggerRef)
		if mainScript.Getstate() == "Solution" && isAnimating == 0
			if triggerRef.getDistance(xmarkerInner) < triggerRef.getDistance(xmarkerOuter)
				isAnimating = 1
				self.PlayAnimationandWait("outer", "Done")
				isAnimating = 0
				goToState("outer")
				if solved == 1	
					playAnimation("flameon")
					FXSeranaTombDrainLife2D.play(game.getplayer())
					flameSoundInstanceID = QSTSeranaTombBrazierFireLPM.play(xmarkerOuter)
					triggerRef.RampRumble(0.1, 1, 64)
					;(triggerRef as Actor).DamageActorValue("health",((triggerRef as Actor).GetActorValue("Health") * 0.25))
					;(triggerRef as Actor).DamageActorValue("magicka",((triggerRef as Actor).GetActorValue("magicka") * 0.5))
					;(triggerRef as Actor).DamageActorValue("stamina",((triggerRef as Actor).GetActorValue("stamina") * 0.5))
					TargVFX.Play(triggerRef,2.0,xmarkerOuter)   
					CastShader.Play(self,2.0)   
				endif
			elseif triggerRef.getDistance(xmarkerOuter) < triggerRef.getDistance(xmarkerInner)
				isAnimating = 1
				self.PlayAnimationAndWait("inner", "Done")
				isAnimating = 0
				goToState("inner")
				if solved == 1	
					playAnimation("flameon")
					FXSeranaTombDrainLife2D.play(game.getplayer())
					flameSoundInstanceID = QSTSeranaTombBrazierFireLPM.play(xmarkerInner)
					triggerRef.RampRumble(0.1, 1, 64)
					;(triggerRef as Actor).DamageActorValue("health",((triggerRef as Actor).GetActorValue("Health") * 0.25))
					;(triggerRef as Actor).DamageActorValue("magicka",((triggerRef as Actor).GetActorValue("magicka") * 0.5))
					;(triggerRef as Actor).DamageActorValue("stamina",((triggerRef as Actor).GetActorValue("stamina") * 0.5))
					TargVFX.Play(triggerRef,2.0,xmarkerinner)   
					CastShader.Play(self,2.0)   
				endif
			endif
		elseif isAnimating == 1
		;do nothing	
		else
			wontBudge.show()
		endif
		if solved == 0
			sound.stopInstance(flameSoundInstanceID)
		endif
	EndEvent
endState

state inner
	Event onBeginState()
		puzzleController.Activate(puzzleController)
		if brazierID == 2 || brazierID == 3 || brazierID == 5
			solved = 1
			;WaitForAnimationEvent("done")
			;playAnimation("flameon")
		endif
	EndEvent
	Event onActivate(objectReference triggerRef)
		if mainScript.Getstate() == "Solution" && locked == 0 && isAnimating == 0 
			isAnimating = 1 
			goToState("mid")
			self.PlayAnimationandWait("mid", "Done")
			isAnimating = 0
			if solved == 1	
				playAnimation("flameon")
				triggerRef.RampRumble(0.1, 1, 64)
				;(triggerRef as Actor).DamageActorValue("health",((triggerRef as Actor).GetActorValue("Health") * 0.25))
				;(triggerRef as Actor).DamageActorValue("magicka",((triggerRef as Actor).GetActorValue("magicka") * 0.5))
				;(triggerRef as Actor).DamageActorValue("stamina",((triggerRef as Actor).GetActorValue("stamina") * 0.5))
				TargVFX.Play(triggerRef,2.0,xmarkerInner)   
				CastShader.Play(self,2.0)   
			endif
		elseif isAnimating == 1
		;do nothing
		else
			wontBudge.show()
		endif
		if solved == 0
			sound.stopInstance(flameSoundInstanceID)
		endif
	EndEvent
	Event onEndState()
		if brazierID == 2 || brazierID == 3 || brazierID == 5
			solved = 0
		endif
	EndEvent
endState


state outer
	Event onBeginState()
		puzzleController.Activate(puzzleController)
		if brazierID == 1 || brazierID == 4
			solved = 1
			;WaitForAnimationEvent("done")
			;playAnimation("flameon")
		endif
	EndEvent
	Event OnActivate(objectReference triggerRef)
		if mainScript.Getstate() == "Solution"  && locked == 0 && isAnimating == 0
			isAnimating = 1
			goToState("mid")
			self.PlayAnimationandWait("mid", "done")
			isAnimating = 0
			if solved == 1	
				playAnimation("flameon")
				triggerRef.RampRumble(0.1, 1, 64)
				;(triggerRef as Actor).DamageActorValue("health",((triggerRef as Actor).GetActorValue("Health") * 0.25))
				;(triggerRef as Actor).DamageActorValue("magicka",((triggerRef as Actor).GetActorValue("magicka") * 0.5))
				;(triggerRef as Actor).DamageActorValue("stamina",((triggerRef as Actor).GetActorValue("stamina") * 0.5))
				TargVFX.Play(triggerRef,2.0,xmarkerOuter)   
				CastShader.Play(self,2.0)   
			endif
		elseif isAnimating == 1
		;do nothing
		else
			wontBudge.show()
		endif
		if solved == 0
			sound.stopInstance(flameSoundInstanceID)
		endif
	EndEvent
	Event onEndState()
		if brazierID == 1 || brazierID == 4
			solved = 0
		endif
	EndEvent
endState

state Done
	Event onBeginState()
		if brazierID == 2 || brazierID == 3 || brazierID == 5
		playAnimation("finalOn")
		flameSoundInstanceID = QSTSeranaTombBrazierFireLPM.play(xmarkerOuter)
		;playAnimation("Flameon")
		;playAnimationandWait("Outer", "Done")
		;playAnimation("Flameon")
		endif
	EndEvent
	Event OnActivate(objectReference triggerRef)
		wontBudge.show()
	EndEvent
endState