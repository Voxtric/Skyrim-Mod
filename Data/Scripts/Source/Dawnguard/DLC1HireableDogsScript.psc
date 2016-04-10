Scriptname DLC1HireableDogsScript extends Quest  Conditional

Faction Property PlayerFollowerFaction  Auto  

DialogueFollowerScript Property DialogueFollower Auto

GlobalVariable Property PlayerAnimalCount Auto

DLC1RadiantScript property DLC1Radiant auto

Function HireDog(actor NewDog)
	(DialogueFollower as DialogueFollowerScript).SetAnimal(NewDog)
	DialogueFollower.pPlayerAnimalCount.SetValue(1)

	NewDog.SetPlayerTeammate(abCanDoFavor = false)
EndFunction

Function BootCurrentAnimalAndHireDog(actor NewDog)
	if DLC1Radiant.PlayerHasTroll == True
		DLC1Radiant.TrollDismissed()
	elseif PlayerAnimalCount.GetValue() >= 1
		(DialogueFollower as DialogueFollowerScript).DismissAnimal()
	endif
	HireDog(NewDog)
endFunction

