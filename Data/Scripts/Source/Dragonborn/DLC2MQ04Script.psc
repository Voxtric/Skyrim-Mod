Scriptname DLC2MQ04Script extends Quest  Conditional

Location Property DLC2NchardakLocation  Auto 
ReferenceAlias Property Neloth Auto
ReferenceAlias Property NchardakTargetNull Auto
ReferenceAlias Property NchardakTarget01 Auto
ReferenceAlias Property NchardakTarget02 Auto
ReferenceAlias Property NchardakTarget03 Auto
ReferenceAlias Property NchardakTarget04 Auto
ReferenceAlias Property NchardakTarget05 Auto

bool Property bInReadingRoomInterior Auto Conditional
{ This is set to true when the player is 'inside' the Reading Room or elsewhere in Nchardak. It's set back to False if the player ever leaves.}

bool Property bReadingRoomPowered Auto Conditional
{ This is set to true when all four boilers have power, and cleared if their power source is removed. }

DLC2dunNchardakTrackingScript Property DLC2dunNchardakTracking Auto

Function MQ04BoilerPuzzleComplete()
	bReadingRoomPowered = True
	SetStage(500)
EndFunction

Function MQ04BoilerPuzzleIncomplete()
	bReadingRoomPowered = False
EndFunction


Function MQ04AddObjectiveToNeloth()
	MQ04AddObjectiveTo(Neloth.GetReference())
EndFunction

Function MQ04RemoveObjectiveToNeloth()
	MQ04RemoveObjectiveTo(Neloth.GetReference())
EndFunction

Function MQ04AddObjectiveTo(ObjectReference target)
; 	Debug.Trace("AddObjectiveTo: " + target)
	ObjectReference refNull = NchardakTargetNull.GetReference()
	ObjectReference ref01 = NchardakTarget01.GetReference()
	ObjectReference ref02 = NchardakTarget02.GetReference()
	ObjectReference ref03 = NchardakTarget03.GetReference()
	ObjectReference ref04 = NchardakTarget04.GetReference()
	ObjectReference ref05 = NchardakTarget05.GetReference()

	if (target == ref01 || target == ref02 || target == ref03 || target == ref04 || target == ref05)
; 		Debug.Trace("Target is already an objective. Ignoring.")
	Else
		if (ref01 == refNull)
			NchardakTarget01.ForceRefTo(target)
		ElseIf (ref02 == refNull)
			NchardakTarget02.ForceRefTo(target)
		ElseIf (ref03 == refNull)
			NchardakTarget03.ForceRefTo(target)
		ElseIf (ref04 == refNull)
			NchardakTarget04.ForceRefTo(target)
		ElseIf (ref05 == refNull)
			NchardakTarget05.ForceRefTo(target)
		Else
; 			Debug.Trace("Out of available target slots. No target set. Error!")
		EndIf
	EndIf
EndFunction

Function MQ04RemoveObjectiveTo(ObjectReference target)
; 	Debug.Trace("RemoveObjectiveTo: " + target)
	ObjectReference refNull = NchardakTargetNull.GetReference()
	ObjectReference ref01 = NchardakTarget01.GetReference()
	ObjectReference ref02 = NchardakTarget02.GetReference()
	ObjectReference ref03 = NchardakTarget03.GetReference()
	ObjectReference ref04 = NchardakTarget04.GetReference()
	ObjectReference ref05 = NchardakTarget05.GetReference()

	If (ref01 == target)
		NchardakTarget01.ForceRefTo(refNull)
	ElseIf (ref02 == target)
		NchardakTarget02.ForceRefTo(refNull)
	ElseIf (ref03 == target)
		NchardakTarget03.ForceRefTo(refNull)
	ElseIf (ref04 == target)
		NchardakTarget04.ForceRefTo(refNull)
	ElseIf (ref05 == target)
		NchardakTarget05.ForceRefTo(refNull)
	Else
; 		Debug.Trace("Target was not found as an objective. Possible error.")
	EndIf
EndFunction

Function MQ04GiveAllNelothCubes()
	DLC2dunNchardakTracking.GiveAllNelothCubes()
endFunction

Location Property DLC2TelMithrynTowerLocation  Auto  
