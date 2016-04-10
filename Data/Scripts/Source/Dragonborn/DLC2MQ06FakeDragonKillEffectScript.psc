Scriptname DLC2MQ06FakeDragonKillEffectScript extends ActiveMagicEffect  

ReferenceAlias Property Miraak auto

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	debug.Trace(self + ": Dragon Kill scene has ended")
	(Miraak as DLC2MQ06MiraakBossBattle).DragonKillSceneEnded()
endEvent