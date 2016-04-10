Scriptname DLC2SpectralDragonDeathScript extends Actor  

Event OnLoad()
	RegisterForSingleUpdateGameTime(0.33)
EndEvent

Event OnUpdateGameTime()
	PlaceAtMe(FireExplosion)
	utility.wait(1)
	Disable()
EndEvent

Event OnDeath(actor akKiller)
	PlaceAtMe(FireExplosion)
	utility.wait(1)
	Disable()
EndEvent


Explosion Property FireExplosion  Auto  
