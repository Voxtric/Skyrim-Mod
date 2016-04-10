Scriptname BYOHHouseHorseScript extends ObjectReference  
{enable horse on load after buying}

BYOHHouseScript Property BYOHHouseQuest  Auto  

ReferenceAlias Property PlayersHorse  Auto  

; on load, check variable of my house quest to see if I should be enabled
Event OnCellAttach()
	if BYOHHouseQuest.bBoughtHorse && IsEnabled() == false
		Enable()
		PlayersHorse.ForceRefTo(self)
		game.IncrementStat( "Horses Owned" )
	endif
endEvent

Event OnCellDetach()
	if ((self as ObjectReference) as Actor).IsDead()
		BYOHHouseQuest.HouseAnimalDied(self)
	endif
endEvent
