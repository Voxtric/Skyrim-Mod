Scriptname DLC1VQ07BasinPourActScript extends ObjectReference  Conditional

Quest Property pDLC1VQ07 Auto
Message Property pDLC1VQ07BasinCombatMessage Auto

Event OnActivate(ObjectReference akActionRef)

	if pDLC1VQ07.GetStage() == 100
		if akActionRef == Game.GetPlayer()
			if Game.GetPlayer().IsInCombat() == 0
				Game.EnableFastTravel(false)
				GetLinkedRef().Activate(akActionRef)
				pDLC1VQ07.SetStage(105)
			elseif Game.GetPlayer().IsInCombat() == 1
				pDLC1VQ07BasinCombatMessage.Show()
			endif
		endif
	endif

endEvent