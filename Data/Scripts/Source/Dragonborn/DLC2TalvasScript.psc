Scriptname DLC2TalvasScript extends Actor  

GlobalVariable Property PCConjurationAdept  Auto  
GlobalVariable Property PCDestructionAdept  Auto  

GlobalVariable Property DLC2AshGuardianForSale  Auto  
GlobalVariable Property DLC2WhirlwindCloakForSale  Auto  

Quest Property DLC2TTR3a  Auto  
Quest Property DLC2TTR3b  Auto  

Event OnLoad()
	if DLC2TTR3a.IsCompleted() == true
		if game.GetPlayer().GetBaseActorValue("Conjuration") >= PCConjurationAdept.GetValue()
			DLC2AshGuardianForSale.SetValue(0)
		endif
	endif
	if DLC2TTR3b.IsCompleted() == true
		if game.GetPlayer().GetBaseActorValue("Destruction") >= PCDestructionAdept.GetValue()
			DLC2WhirlwindCloakForSale.SetValue(0)
		endif
	endif
EndEvent
