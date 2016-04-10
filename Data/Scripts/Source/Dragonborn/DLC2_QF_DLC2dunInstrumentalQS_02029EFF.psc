;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname DLC2_QF_DLC2dunInstrumentalQS_02029EFF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Instrumental 02

if(BardActiveGlobal.getValueInt() == 1)
 Instrumental02.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Instrumental01

if(BardActiveGlobal.getValueInt() == 1)
  Instrumental01.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Instrumental01 last played

Instrumental02.stop()

;Utility.wait(1)

setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;called when bard is summoned
;need to choose another scene

BardActiveGlobal.setValueInt(1)
Instrumental01.stop()
Instrumental02.stop()

;Utility.wait(1)

setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; stop all scenes

BardActiveGlobal.setValueInt(0)
Instrumental01.stop()
Instrumental02.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Instrumental02 last played

Instrumental01.stop()

;Utility.wait(1)

setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
 
Scene Property Instrumental01  Auto  

Scene Property Instrumental02  Auto  

GlobalVariable Property BardActiveGlobal  Auto  
