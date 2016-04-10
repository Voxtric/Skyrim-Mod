Scriptname DLC1VQ02HarkonScript extends ReferenceAlias  
{Script on DLC1VQ02 Harkon Alias}

DLC1VampireTurnScript property DLC1VampireTurn auto

Event OnRaceSwitchComplete()
	DLC1VampireTurn.HarkonChangedRace()
EndEvent
