;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_QF_DLC1VampireSleep_01008E3B Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC1VampireSleepScript
Quest __temp = self as Quest
DLC1VampireSleepScript kmyQuest = __temp as DLC1VampireSleepScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RegisterForSleep()
Game.GetPlayer().AddPerk(kmyquest.DLC1VampireSleepPerk)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
