Scriptname DLC2dunKolbjornWarpToDestination extends Actor

Event OnLoad()
	if (!Self.IsDead())
		Self.EvaluatePackage()
		Self.MoveToPackageLocation()
		Self.EvaluatePackage()
	EndIf
EndEvent