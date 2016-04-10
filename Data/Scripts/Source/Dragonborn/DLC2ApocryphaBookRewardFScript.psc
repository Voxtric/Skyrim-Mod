Scriptname DLC2ApocryphaBookRewardFScript extends DLC2ApocryphaBookRewardScript
{Script for Apocrypha Book Reward Set F: Deep Secrets.}

;Global for this book:
GlobalVariable property DLC2BlackBookReward6 Auto

;For [Secret of Strength]:
Message property DLC2ApocryphaBookReward_F1_Prompt Auto
Message property DLC2ApocryphaBookReward_F1_Removed Auto
Spell property DLC2BlackBookNoStaminaSpell Auto

;For [Secret of Arcana]:
Message property DLC2ApocryphaBookReward_F2_Prompt Auto
Message property DLC2ApocryphaBookReward_F2_Removed Auto
Spell property DLC2BlackBookNoMagickaSpell Auto

;For [Secret of Protection]:
Message property DLC2ApocryphaBookReward_F3_Prompt Auto
Message property DLC2ApocryphaBookReward_F3_Removed Auto
Spell property DLC2BlackBookNoDamageSpell Auto


;OnInit, this book forces its specific properties into the parent's generic ones. The parent class can take it from there.
Event OnInit()
	;Global
	AbilityGlobal = DLC2BlackBookReward6
	;#1 - Secret of Strength
	AbilityPrompt01 = DLC2ApocryphaBookReward_F1_Prompt
	AbilityRemoved01 = DLC2ApocryphaBookReward_F1_Removed
	Spell01A = DLC2BlackBookNoStaminaSpell
	;#2 - Secret of Arcana
	AbilityPrompt02 = DLC2ApocryphaBookReward_F2_Prompt
	AbilityRemoved02 = DLC2ApocryphaBookReward_F2_Removed
	Spell02A = DLC2BlackBookNoMagickaSpell
	;#3 - Secret of Protection
	AbilityPrompt03 = DLC2ApocryphaBookReward_F3_Prompt
	AbilityRemoved03 = DLC2ApocryphaBookReward_F3_Removed
	Spell03A = DLC2BlackBookNoDamageSpell
EndEvent