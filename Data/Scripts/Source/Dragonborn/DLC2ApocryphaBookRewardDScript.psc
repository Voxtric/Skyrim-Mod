Scriptname DLC2ApocryphaBookRewardDScript extends DLC2ApocryphaBookRewardScript
{Script for Black Book Reward Set D: Seeker's Path.}

;Global for this book:
GlobalVariable property DLC2BlackBookReward4 Auto

;For all three Seeker abilities:
Perk property DLC2BlackBookSeekerPerks Auto

;For [Seeker of Might]:
Message property DLC2ApocryphaBookReward_D1_Prompt Auto
Message property DLC2ApocryphaBookReward_D1_Removed Auto
Spell property DLC2BlackBookSeekerCombatSpell Auto

;For [Seeker of Sorcery]:
Message property DLC2ApocryphaBookReward_D2_Prompt Auto
Message property DLC2ApocryphaBookReward_D2_Removed Auto
Spell property DLC2BlackBookSeekerMagicSpell Auto

;For [Seeker of Shadows]:
Message property DLC2ApocryphaBookReward_D3_Prompt Auto
Message property DLC2ApocryphaBookReward_D3_Removed Auto
Spell property DLC2BlackBookSeekerStealthSpell Auto

;OnInit, this book forces its specific properties into the parent's generic ones. The parent class can take it from there.
Event OnInit()
	;Global
	AbilityGlobal = DLC2BlackBookReward4
	;#1 - Seeker of Might
	AbilityPrompt01 = DLC2ApocryphaBookReward_D1_Prompt
	AbilityRemoved01 = DLC2ApocryphaBookReward_D1_Removed
	Spell01A = DLC2BlackBookSeekerCombatSpell
	Perk01A = DLC2BlackBookSeekerPerks
	;#2 - Seeker of Sorcery
	AbilityPrompt02 = DLC2ApocryphaBookReward_D2_Prompt
	AbilityRemoved02 = DLC2ApocryphaBookReward_D2_Removed
	Spell02A = DLC2BlackBookSeekerMagicSpell
	Perk02A = DLC2BlackBookSeekerPerks
	;#3 - Seeker of Shadows
	AbilityPrompt03 = DLC2ApocryphaBookReward_D3_Prompt
	AbilityRemoved03 = DLC2ApocryphaBookReward_D3_Removed
	Spell03A = DLC2BlackBookSeekerStealthSpell
	Perk03A = DLC2BlackBookSeekerPerks
EndEvent