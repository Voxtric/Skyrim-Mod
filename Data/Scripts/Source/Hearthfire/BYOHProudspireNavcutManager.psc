Scriptname BYOHProudspireNavcutManager extends ObjectReference
{Enables the appropriate Navcut gemoetry when you enter Proudspire. Corrects a Navmesh healing error that occurs if you aren't in the cell at the time.}

ObjectReference property NavcutChildRoom1 Auto

ObjectReference property SolitudePlayerHouseChildBedroom Auto

Event OnCellAttach()
	Debug.Trace("Attaching")
	Utility.Wait(0.5)
	Debug.Trace("Disabling")
	NavcutChildRoom1.Disable()
	Utility.Wait(0.5)
	Debug.Trace("Enabling")
	if (SolitudePlayerHouseChildBedroom.IsDisabled())
		NavcutChildRoom1.Enable()
	EndIf
	Debug.Trace("Done")
EndEvent
