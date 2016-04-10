Scriptname BYOHBreezehomeNavcutManager extends ObjectReference
{Enables the appropriate Navcut gemoetry when you enter Breezehome. Corrects a Navmesh healing error that occurs if you aren't in the cell at the time.}

ObjectReference property NavcutChildRoom1 Auto
ObjectReference property NavcutChildRoom2 Auto
ObjectReference property NavcutLab1 Auto

ObjectReference property WhiterunPlayerHouseChildBedroom Auto
ObjectReference property WhiterunPlayerHouseAlchemyLaboratory Auto

Event OnCellAttach()
	Debug.Trace("Attaching")
	Utility.Wait(0.5)
	Debug.Trace("Disabling")
	DisableAllNavcuts()
	Utility.Wait(0.5)
	Debug.Trace("Enabling")
	if (!WhiterunPlayerHouseChildBedroom.IsDisabled())
		NavcutChildRoom1.Enable()
		NavcutChildRoom2.Enable()
	ElseIf (!WhiterunPlayerHouseAlchemyLaboratory.IsDisabled())
		NavcutLab1.Enable()
	EndIf
	Debug.Trace("Done")
EndEvent

Event OnCellDetach()
	NavcutChildRoom1.Enable()
	NavcutChildRoom2.Enable()
	NavcutLab1.Enable()
EndEvent

Function DisableAllNavcuts()
	NavcutChildRoom1.Disable()
	NavcutChildRoom2.Disable()
	NavcutLab1.Disable()
EndFunction

Function Recut()
	OnCellAttach()
EndFunction
