Scriptname DLC01SoulCairnFissureScript extends ObjectReference  

message property noGemMSG auto
message property GemFilledMSG auto
formlist property SoulGemsEmpty auto
formlist property SoulGemsFilled auto
bool property bAllowBlackSouls auto

EVENT onActivate(objectReference actronaut)
	; scan the activating actor's inventory for empties.
	; modder note - it's important that the two formlists match indices.  Update one, please update the other.  Or this will break.
	bool looping = TRUE
	int i = 0
	while looping
		if actronaut.getItemCount(soulGemsEmpty.getAt(i)) >= 1
			looping = FALSE
			fillSoul(actronaut, i)
			disable()
			delete()
		else
			if i > soulGemsEmpty.getSize()
				looping = FALSE
				noGemMSG.show()
			endif
		endif
		
		i += 1
		
	endWhile
endEVENT


FUNCTION FillSoul(objectReference recipient, int index)
	recipient.removeItem(soulGemsEmpty.getAt(index), 1, true)
	recipient.addItem(soulGemsFilled.getAt(index),1, true)
	GemFilledMSG.show()
endFUNCTION
