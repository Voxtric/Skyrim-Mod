Scriptname DLC2dunKolbjornTrackAliasDeath extends ReferenceAlias

Quest property myQuest Auto

Auto State Waiting
	Event OnDeath(Actor akKiller)
		GoToState("Inactive")
		(myQuest as DLC2dunKolbjornDeathTrackingScript).ReportDeath()
	EndEvent
EndState

State Inactive
	Event OnDeath(Actor akKiller)
		;Do nothing.
	EndEvent
EndState