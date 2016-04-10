Scriptname DLC2ApocryphaBookRewardAScript extends DLC2ApocryphaBookRewardScript
{Script for Black Book Reward Set A: Social Insights.}

;Global for this book:
GlobalVariable property DLC2BlackBookReward1 Auto

;For [Scholar's Insight]:
Message property DLC2ApocryphaBookReward_A1_Prompt Auto
Message property DLC2ApocryphaBookReward_A1_Removed Auto
Perk property DLC2BlackBookSkillBookPerk Auto
Spell property DLC2BlackBookSkillBookSpell Auto

;For [Companion's Insight]:
Message property DLC2ApocryphaBookReward_A2_Prompt Auto
Message property DLC2ApocryphaBookReward_A2_Removed Auto
Perk property DLC2BlackBookCompanionsSafePerk Auto
Spell property DLC2BlackBookCompanionsSafeSpell Auto

;For [Lover's Insight]:
Message property DLC2ApocryphaBookReward_A3_Prompt Auto
Message property DLC2ApocryphaBookReward_A3_Removed Auto
Perk property DLC2BlackBookHagglingPerk Auto
Spell property DLC2BlackBookHagglingSpell Auto


;OnInit, this book forces its specific properties into the parent's generic ones. The parent class can take it from there.
Event OnInit()
	;Global
	AbilityGlobal = DLC2BlackBookReward1
	;#1 - Scholar's Insight
	AbilityPrompt01 = DLC2ApocryphaBookReward_A1_Prompt
	AbilityRemoved01 = DLC2ApocryphaBookReward_A1_Removed
	Spell01A = DLC2BlackBookSkillBookSpell
	;Perk01A = DLC2BlackBookSkillBookPerk - Applied via spell.
	;#2 - Companion's Insight
	AbilityPrompt02 = DLC2ApocryphaBookReward_A2_Prompt
	AbilityRemoved02 = DLC2ApocryphaBookReward_A2_Removed
	Spell02A = DLC2BlackBookCompanionsSafeSpell
	;Perk02A = DLC2BlackBookCompanionsSafePerk - Applied via spell.
	;#3 - Lover's Insight
	AbilityPrompt03 = DLC2ApocryphaBookReward_A3_Prompt
	AbilityRemoved03 = DLC2ApocryphaBookReward_A3_Removed
	Spell03A = DLC2BlackBookHagglingSpell
	;Perk03A = DLC2BlackBookHagglingPerk - Applied via spell.
EndEvent