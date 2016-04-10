Scriptname BYOHHouseCarriageScript extends ObjectReference  
{enable carriage on load after buying}

BYOHHouseScript Property BYOHHouseQuest  Auto  

; on load, check variable of my house quest to see if I should be enabled
Event OnCellAttach()
	if BYOHHouseQuest.bBoughtCarriage
		Enable()
	endif
endEvent

