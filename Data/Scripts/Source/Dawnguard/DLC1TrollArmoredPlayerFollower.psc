Scriptname DLC1TrollArmoredPlayerFollower extends Actor  
{Attached to DLC1LvlTrollArmoredPlayerFollower actor}

bool MarkedForDelete

Function DeleteMe()
	MarkedForDelete = true

	if Is3DLoaded() == false
		Delete()
	endif	

EndFunction

Event OnCellDetach()
	if MarkedForDelete
		Delete()
	endif
EndEvent

Event OnDetachedFromCell()
	if MarkedForDelete
		Delete()
	endif
	
EndEvent

