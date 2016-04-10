Scriptname DLC1VQ03ManageFactions extends Quest  
{This script causes the PlayerFaction 
and the DLC1MothPriestFaction to be made
friends on init.}

faction property PlayerFaction auto
faction property DLC1MothPriestFaction auto

Event OnInit()
	;playerFaction.setAlly(DLC1MothPriestFaction, true, true)
	;playerFaction.setEnemy(DLC1PriestEscortVampires, true, true)

debug.trace(self + "manage factions")

EndEvent
Faction Property DLC1PriestEscortVampires  Auto  
