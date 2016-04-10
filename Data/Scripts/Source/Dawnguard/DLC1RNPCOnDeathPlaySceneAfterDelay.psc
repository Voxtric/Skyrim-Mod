Scriptname DLC1RNPCOnDeathPlaySceneAfterDelay extends Actor  


int Property SecondsToWait auto
Scene Property DesiredScene auto


Event OnDeath(Actor akKiller)
	Utility.Wait(SecondsToWait)	
	if (!Game.GetPlayer().IsInCombat())
		if (DesiredScene != None)
			DesiredScene.Start()
		endif
	endif
EndEvent
