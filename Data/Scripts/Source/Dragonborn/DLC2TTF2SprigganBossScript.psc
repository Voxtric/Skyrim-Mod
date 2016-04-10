Scriptname DLC2TTF2SprigganBossScript extends ReferenceAlias  

LocationAlias Property Harstrad  Auto  

Event OnDeath(actor akKiller)
	Harstrad.GetLocation().SetCleared()
EndEvent