Scriptname DLC1PlayerFactionRelationScript extends Quest  
{Script attached DLC1PlayerFactionRelation quest}

Faction Property PlayerFaction auto

Faction[] Property AllyFactions auto
Faction[] Property FriendFactions auto
Faction[] Property EnemyFactions auto
Faction[] Property NeutralFactions auto



Event OnInit()

	ProcessArrays()

EndEvent

Function ProcessArrays()
	int currentElement = 0
   	while (currentElement < AllyFactions.Length)
    	AllyFactions[currentElement].SetAlly(PlayerFaction)
    	currentElement += 1
   	endWhile

	CurrentElement = 0
	while (currentElement < FriendFactions.Length)
		FriendFactions[currentElement].SetAlly(PlayerFaction, true, true)
		currentElement += 1
	endWhile
	
	CurrentElement = 0
	while (currentElement < EnemyFactions.Length)
		EnemyFactions[currentElement].SetEnemy(PlayerFaction)
		currentElement += 1
	endWhile

	CurrentElement = 0
	while (currentElement < NeutralFactions.Length)
		NeutralFactions[currentElement].SetEnemy(PlayerFaction, true, true)
		currentElement += 1
	endWhile
EndFunction