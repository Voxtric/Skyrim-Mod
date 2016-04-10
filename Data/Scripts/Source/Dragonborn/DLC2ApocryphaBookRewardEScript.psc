Scriptname DLC2ApocryphaBookRewardEScript extends DLC2ApocryphaBookRewardScript
{Script for Black Book Reward Set E: Occult Magic.}

;Global for this book:
GlobalVariable property DLC2BlackBookReward5 Auto

;For [Mora's Agony]:
Message property DLC2ApocryphaBookReward_E1_Prompt Auto
Message property DLC2ApocryphaBookReward_E1_Removed Auto
Spell property DLC2MorasAgony Auto

;For [Mora's Grasp]:
Message property DLC2ApocryphaBookReward_E2_Prompt Auto
Message property DLC2ApocryphaBookReward_E2_Removed Auto
Spell property DLC2MorasGrasp Auto

;For [Mora's Boon]:
Message property DLC2ApocryphaBookReward_E3_Prompt Auto
Message property DLC2ApocryphaBookReward_E3_Removed Auto
Spell property DLC2BlackBookHealSpell Auto

;OnInit, this book forces its specific properties into the parent's generic ones. The parent class can take it from there.
Event OnInit()
	;Global
	AbilityGlobal = DLC2BlackBookReward5
	;#1 - Mora's Agony
		AbilityPrompt01 = DLC2ApocryphaBookReward_E1_Prompt
		AbilityRemoved01 = DLC2ApocryphaBookReward_E1_Removed
		Spell01A = DLC2MorasAgony
	;#2 - Mora's Grasp
		AbilityPrompt02 = DLC2ApocryphaBookReward_E2_Prompt
		AbilityRemoved02 = DLC2ApocryphaBookReward_E2_Removed
		Spell02A = DLC2MorasGrasp
	;#3 - Mora's Boon
		AbilityPrompt03 = DLC2ApocryphaBookReward_E3_Prompt
		AbilityRemoved03 = DLC2ApocryphaBookReward_E3_Removed
		Spell03A = DLC2BlackBookHealSpell
EndEvent