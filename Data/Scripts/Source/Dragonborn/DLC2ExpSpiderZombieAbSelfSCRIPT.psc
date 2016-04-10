Scriptname DLC2ExpSpiderZombieAbSelfSCRIPT extends ActiveMagicEffect Hidden 

VisualEffect Property DLC2ExpSpiderFaceGrabEffect Auto
{face spider}
Faction Property DLC2ExpSpiderEnemyFaction Auto
{Facion to add this actor to}
actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)
; 		debug.Trace("Effect Started!")
		selfRef = Caster
		DLC2ExpSpiderFaceGrabEffect.Play(selfRef, -1) ;add face spider to victim
		selfRef.RemoveFromFaction(BanditFaction)
		selfRef.AddToFaction(DLC2ExpSpiderEnemyFaction)
	EndEvent
	
	
	
	
Faction Property BanditFaction  Auto  
