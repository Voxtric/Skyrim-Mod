;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_SF_DLC2MQ06MiraakSprintS_020382FA Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;debug.Trace(self + ": Dragon Kill scene has ended")
ObjectReference SelfRef
ObjectReference Target
SelfRef = Miraak.getReference()
Actor SelfActor = Miraak.getActorReference()
selfActor.RemoveSpell(DLC2MiraakSprintFXSpell)
(Miraak as DLC2MQ06MiraakBossBattle).SprintSceneEnded()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Miraak  Auto  

SPELL Property DLC2MiraakSprintFXSpell  Auto  
