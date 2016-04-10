Scriptname DLC2ApocryphaBookRewardCScript extends DLC2ApocryphaBookRewardScript
{Script for Black Book Reward Set C: Dragonborn Legends.}

;Global for this book:
GlobalVariable property DLC2BlackBookReward3 Auto

;For [Dragonborn Force]:
Message property DLC2ApocryphaBookReward_C1_Prompt Auto
Message property DLC2ApocryphaBookReward_C1_Removed Auto
Spell property DLC2BlackBookDragonbornForceSpell Auto

;For [Dragonborn Flame]:
Message property DLC2ApocryphaBookReward_C2_Prompt Auto
Message property DLC2ApocryphaBookReward_C2_Removed Auto
Spell property DLC2BlackBookDragonbornFlameSpell Auto

;For [Dragonborn Frost]:
Message property DLC2ApocryphaBookReward_C3_Prompt Auto
Message property DLC2ApocryphaBookReward_C3_Removed Auto
Spell property DLC2BlackBookDragonbornFrostSpell Auto

;OnInit, this book forces its specific properties into the parent's generic ones. The parent class can take it from there.
Event OnInit()
	;Global
	AbilityGlobal = DLC2BlackBookReward3
	;#1 - Dragonborn Force
	AbilityPrompt01 = DLC2ApocryphaBookReward_C1_Prompt
	AbilityRemoved01 = DLC2ApocryphaBookReward_C1_Removed
	Spell01A = DLC2BlackBookDragonbornForceSpell
	;#2 - Dragonborn Flame
	AbilityPrompt02 = DLC2ApocryphaBookReward_C2_Prompt
	AbilityRemoved02 = DLC2ApocryphaBookReward_C2_Removed
	Spell02A = DLC2BlackBookDragonbornFlameSpell
	;#3 - Dragonborn Frost
	AbilityPrompt03 = DLC2ApocryphaBookReward_C3_Prompt
	AbilityRemoved03 = DLC2ApocryphaBookReward_C3_Removed
	Spell03A = DLC2BlackBookDragonbornFrostSpell
EndEvent