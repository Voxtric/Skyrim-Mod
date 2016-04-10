;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_QF_DLC1ScrollHandling_01011A83 Extends Quest Hidden

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
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ206  Auto  

Book Property DA04ElderScroll  Auto  

Quest Property DialogueWinterholdCollege  Auto  
