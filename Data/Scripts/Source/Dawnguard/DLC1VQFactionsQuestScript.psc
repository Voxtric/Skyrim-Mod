Scriptname DLC1VQFactionsQuestScript extends Quest  

Faction Property pFactionA  Auto
Faction Property pFactionB  Auto
Faction Property pFactionC  Auto
Faction Property pFactionD  Auto
Faction Property pPlayerFaction  Auto  


	Event OnInit()

		MakeFactionsAllies(pFactionA, pPlayerFaction)
		MakeFactionsAllies(pFactionC, pPlayerFaction)
		MakeFactionsEnemies(pFactionB, pPlayerFaction)
		MakeFactionsEnemies(pFactionD, pPlayerFaction)

	EndEvent



	Function MakeFactionsAllies(Faction FactionA, Faction FactionB, bool MakeFriendsInstead = false)
       
		if MakeFriendsInstead
			FactionA.SetAlly(FactionB, true, true)
                		else
					FactionA.SetAlly(FactionB)
		endif

	EndFunction

	Function MakeFactionsEnemies(Faction FactionA, Faction FactionB, bool MakeNeutralInstead = false)
       
		if MakeNeutralInstead
			FactionA.SetEnemy(FactionB, true, true)
                		else
					FactionA.SetEnemy(FactionB)
		endif

	EndFunction