Scriptname DLC2ApocryphaBookRewardBScript extends DLC2ApocryphaBookRewardScript
{Script for Black Book Reward Set B: Trade Secrets.}

;Global for this book:
GlobalVariable property DLC2BlackBookReward2 Auto

;For [Black Market]:
Message property DLC2ApocryphaBookReward_B1_Prompt Auto
Message property DLC2ApocryphaBookReward_B1_Removed Auto
Spell property DLC2ConjureDremoraMerchant Auto

;For [Secret Servant]:
Message property DLC2ApocryphaBookReward_B2_Prompt Auto
Message property DLC2ApocryphaBookReward_B2_Removed Auto
Spell property DLC2ConjureDremoraButler Auto

;For [Bardic Knowledge]:
Message property DLC2ApocryphaBookReward_B3_Prompt Auto
Message property DLC2ApocryphaBookReward_B3_Removed Auto
Spell property DLC2ConjureBardInstruments Auto


;OnInit, this book forces its specific properties into the parent's generic ones. The parent class can take it from there.
Event OnInit()
	;Global
	AbilityGlobal = DLC2BlackBookReward2
	;#1 - Black Market
	AbilityPrompt01 = DLC2ApocryphaBookReward_B1_Prompt
	AbilityRemoved01 = DLC2ApocryphaBookReward_B1_Removed
	Spell01A = DLC2ConjureDremoraMerchant
	;#2 - Secret Servant
	AbilityPrompt02 = DLC2ApocryphaBookReward_B2_Prompt
	AbilityRemoved02 = DLC2ApocryphaBookReward_B2_Removed
	Spell02A = DLC2ConjureDremoraButler
	;#3 - Bardic Knowledge
	AbilityPrompt03 = DLC2ApocryphaBookReward_B3_Prompt
	AbilityRemoved03 = DLC2ApocryphaBookReward_B3_Removed
	Spell03A = DLC2ConjureBardInstruments 
EndEvent