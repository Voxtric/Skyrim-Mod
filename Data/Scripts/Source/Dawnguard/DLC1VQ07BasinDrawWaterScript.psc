Scriptname DLC1VQ07BasinDrawWaterScript extends ObjectReference

Message Property pDLC1VQ07BasinCombatMessage Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if Game.GetPlayer().IsInCombat() == 0
			GetLinkedRef().Activate(akActionRef)
		elseif Game.GetPlayer().IsInCombat() == 1
			pDLC1VQ07BasinCombatMessage.Show()
		endif
	endif

endEvent
