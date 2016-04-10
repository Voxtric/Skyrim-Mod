Scriptname BYOHVampireCoffinScript extends ObjectReference  
{ Script for vampire coffin }

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		RegisterForSleep()
	endif
endEvent

Event OnSleepStop(bool abInterrupted)
	UnregisterForSleep()
	if Game.GetPlayer().HasKeyword(Vampire)
		Game.GetPlayer().RemoveSpell(BYOHVampireSleepRested)
		BYOHVampireSleepMsg.Show()
		Game.GetPlayer().AddSpell(BYOHVampireSleepRested, abVerbose = false)
	endif
endEvent

Event OnCellDetach()
	; NOTE: this only works if there aren't any normal beds in the same space as the coffin
	UnregisterForSleep()
endEvent

Message Property BYOHVampireSleepMsg Auto  
Spell Property BYOHVampireSleepRested Auto


Keyword Property Vampire  Auto  
