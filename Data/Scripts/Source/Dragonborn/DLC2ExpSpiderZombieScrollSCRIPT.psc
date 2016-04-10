Scriptname DLC2ExpSpiderZombieScrollSCRIPT extends ActiveMagicEffect  


Quest Property DLC2ExpSpiderQuest Auto



actor selfRef

EVENT OnEffectStart(Actor Target, Actor Caster)
; 	;debug.Trace("Effect Started! " + Target)
	selfRef = Target
	(DLC2ExpSpiderQuest as DLC2ReferenceAliasArrayScript).ForceRefInto(selfRef)
	selfRef.SetPlayerTeammate(TRUE, FALSE)
	selfRef.StopCombat()
	selfRef.EvaluatePackage()
EndEvent


EVENT OnEffectFinish(Actor Target, Actor Caster)
; 	;debug.Trace("Effect STOPPED! " + Target)
	(DLC2ExpSpiderQuest as DLC2ReferenceAliasArrayScript).ClearRefFrom(selfRef)
	selfRef.SetPlayerTeammate(FALSE, FALSE)
EndEvent
	