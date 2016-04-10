;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_SF_DLC1_BF_DunTempleQSTS_02013F86 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if ((GetOwningQuest() as DLC1_BF_DunTempleQstSCRIPT).PlayerWerewolfQuest.IsRunning())
               ((GetOwningQuest() as DLC1_BF_DunTempleQstSCRIPT).PlayerWerewolfQuest as PlayerWerewolfChangeScript).ShiftBack()
endif
if ((GetOwningquest() as DLC1_BF_DunTempleQstSCRIPT).DLC1PlayerVampireQuest.IsRunning())
                ((GetOwningQuest() as DLC1_BF_DunTempleQstSCRIPT).DLC1PlayerVampireQuest as DLC1PlayerVampireChangeScript).ShiftBack()
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
