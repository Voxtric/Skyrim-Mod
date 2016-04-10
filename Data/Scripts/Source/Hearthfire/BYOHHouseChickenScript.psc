Scriptname BYOHHouseChickenScript extends ObjectReference  
{enable chickens when bought}

BYOHHouseScript Property BYOHHouseQuest  Auto  

int Property ID = 1 Auto
{ which "number" am I? }

; on load, check variable of my house quest to see if I should be enabled
Event OnCellAttach()
	if BYOHHouseQuest.numChickens >= ID
		Enable()
	endif
endEvent

