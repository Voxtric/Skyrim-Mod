Scriptname DLC1VyrthurRefBossFightFXScript extends ObjectReference  

;actor Property DLC1SeranaRef auto
spell Property DLC1VampireChangeStagger auto

VisualEffect Property DLC1SEBossBlastBackVFX auto
VisualEffect Property DLC1SEBossGlowingVFX auto
ImageSpaceModifier Property SpellFireImod auto


;SpellStart – right before he kicks off of serana
;SpellRelease – when he releases the blast spell

Event OnLoad()
	Debug.trace(Self + ": OnLoad fired")
	RegisterForAnimationEvent(Self, "SpellStart")
	RegisterForAnimationEvent(Self, "SpellRelease")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    
  	if (asEventName == "SpellStart")
  		SpellFireImod.apply(0.25)
		  DLC1SEBossGlowingVFX.play(Self,10)
      game.ShakeCamera(akSource,0.4,1.0)
      Game.ShakeController(0.25, 0.25, 1.0)
		  UnRegisterForAnimationEvent(Self, "SpellStart")
  	endIf

  	if (asEventName == "SpellRelease")
  		DLC1SEBossGlowingVFX.stop(self)
      DLC1VampireChangeStagger.cast(self,self)
		  DLC1SEBossBlastBackVFX.play(Self,4)
      SpellFireImod.apply(0.60)
      game.ShakeCamera(akSource,1.0,1.6)
      Game.ShakeController(0.5, 0.5, 1.5)
		  UnRegisterForAnimationEvent(Self, "SpellRelease")
  	endIf

endEvent

Event OnUnload()
	UnRegisterForAnimationEvent(Self, "SpellStart")
	UnRegisterForAnimationEvent(Self, "SpellRelease")
endEvent
