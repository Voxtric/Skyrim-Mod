Scriptname DLC2PillarMonsterScript extends Actor  
{See also DLC2PillarShoutTriggerScript}

DLC2PillarShoutTriggerScript property myTrigger auto
{REFERENCE: pointer to the triggerbox with DLC2PillarShoutTriggerScript on it that is in the same location as the Lurker}

;bool DontRespawn = false - doesn't work because it gets reset when the cell resets

Event OnDeath(Actor akKiller)
	if myTrigger
		myTrigger.RegisterMonsterDeath(self)
;		DontRespawn = true - doesn't work because it gets reset when the cell resets
	endif
EndEvent

Function RegisterPillarShoutTrigger(DLC2PillarShoutTriggerScript TriggerThatCreatedMe)
	;obsolete - myTrigger is now a property pointing at the triggerbox directly
	;myTrigger = TriggerThatCreatedMe

EndFunction

Event OnLoad()
	;doesn't work because it gets reset when the cell resets
	;if DontRespawn
	;	disable()
	;endif

	if myTrigger.ShouldMonsterDisableOnLoad()
		disable()
	endif

EndEvent

Event OnCellAttach()
	;fixes Lurker getting stuck under geometry if the cell resets before he gets a chance to get out of his ambush
	if myTrigger ;make sure it's one of the pillar Lurkers and not any random lurker
		if IsEnabled()
			Activate(self)
		endif
	endif

EndEvent