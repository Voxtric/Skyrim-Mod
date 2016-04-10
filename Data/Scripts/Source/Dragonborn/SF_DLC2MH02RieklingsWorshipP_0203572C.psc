;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_DLC2MH02RieklingsWorshipP_0203572C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; stop the worshiping
int count = 0
while (count < Rieklings.length)
	Actor riekling = Rieklings[count].GetActorReference()
	if (riekling)
		riekling.PlayIdle(IdleStop)
	endif
	count += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC2MH02PlayerWorshipMarker.MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2MH02PlayerWorshipMarker  Auto  

ReferenceAlias[] Property Rieklings  Auto  

Idle Property IdleStop  Auto  
