;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_PF_DLC2MQ06MiraakWhirlwi_0202A6C9 Extends Package Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(Actor akActor)
;BEGIN CODE
;/
ObjectReference SelfRef
ObjectReference Target
SelfRef = Miraak.getReference()
Actor SelfActor = Miraak.getActorReference()
selfActor.RemoveSpell(DLC2MiraakSprintFXSpell)
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
; Debug.Trace(self + ": Starting Sprint Begin script, apply Sprint FX!!")
ObjectReference SelfRef
ObjectReference Target
SelfRef = Miraak.getReference()
Actor SelfActor = Miraak.getActorReference()
Target = SprintTarget.getReference()
utility.wait(waitTime)
;DLC2MiraakSprintFXSpell.Cast(SelfActor, SelfActor)
selfActor.AddSpell(DLC2MiraakSprintFXSpell)
utility.wait(0.1)
SelfRef.TranslateToRef(Target,TranslateSpeed, 0.0)
;DLC2MQ06MiraakSprintScene.stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Miraak  Auto  

ReferenceAlias Property SprintTarget  Auto  

Float Property translateSpeed = 6000.0 Auto  

Float Property WaitTime = 0.3 Auto  

Scene Property DLC2MQ06MiraakSprintScene  Auto  

SPELL Property DLC2MiraakSprintFXSpell  Auto  
