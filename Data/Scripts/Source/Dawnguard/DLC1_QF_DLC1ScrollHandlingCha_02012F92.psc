;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC1ScrollHandlingCha_02012F92 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;check if player has given Elder Scroll to College


if MQ206.GetStageDone(100) == 1
if Game.GetPlayer().GetItemCount(DA04ElderScroll) == 0

;if Scroll Donated var is 0, set to 1

DialogueWinterholdCollegeQuestScript QuestScript = DialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript

if QuestScript.ScrollDonated == 0

QuestScript.ScrollDonated = 1

endif

endif
endif
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ206  Auto  

Book Property DA04ElderScroll  Auto  

Quest Property DialogueWinterholdCollege  Auto  
