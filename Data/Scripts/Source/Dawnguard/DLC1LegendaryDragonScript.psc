Scriptname DLC1LegendaryDragonScript extends Actor  

Keyword Property DLC1LegendaryDragon  Auto  


Event OnDeath(actor Killer)
	if HasKeyWord(DLC1LegendaryDragon) == True
		Game.AddAchievement(60)
	endif
EndEvent