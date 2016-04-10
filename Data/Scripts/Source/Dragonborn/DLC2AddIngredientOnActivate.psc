Scriptname DLC2AddIngredientOnActivate extends ObjectReference Hidden 

Ingredient Property Nirnroot Auto

Int Property NumberToGive Auto


Auto STATE WaitingForActivate

	EVENT onActivate(ObjectReference TriggerRef)
		GoToState("AlreadyActivated")
		(TriggerRef as Actor).additem(Nirnroot, NumberToGive)
	endEVENT

endSTATE


STATE AlreadyActivated
	;Do Nothing
endSTATE