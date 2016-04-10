Scriptname DLC2dunKolbjornRalisAliasScript extends ReferenceAlias
{Alias script for Ralis on DLC2dunKolbjornQST. Handles events and updates that advance quest stages.}

Quest property DLC2dunKolbjornQST Auto	;The quest.
Location property DLC2KolbjornBarrowLocation Auto	;Kolbjorn Barrow's location.
ObjectReference property DLC2dunKolbjorn_PlayerOutsideKolbjornMarker Auto

Actor player		;The player.
Actor selfActor	;Ralis

Event OnInit()
	player = Game.GetPlayer()
EndEvent

Event OnUpdate()
; 	;Debug.Trace("Ralis updates. We're waiting for the player to leave...")
	if (Self.GetActorRef().GetDistance(player) < 8500 || player.GetCurrentLocation() == DLC2KolbjornBarrowLocation)
; 		;Debug.Trace("Ralis is too close, or the player is in Kolbjorn's location. Re-registering.")
		RegisterForSingleUpdate(10)
	Else
; 		Debug.Trace("Advancing Kolbjorn exterior.")
		if (DLC2dunKolbjornQST.IsStageDone(75) && !DLC2dunKolbjornQST.IsStageDone(99))
			DLC2dunKolbjornQST.SetStage(99)
		ElseIf (DLC2dunKolbjornQST.IsStageDone(175) && !DLC2dunKolbjornQST.IsStageDone(199))
			DLC2dunKolbjornQST.SetStage(199)
		ElseIf (DLC2dunKolbjornQST.IsStageDone(275) && !DLC2dunKolbjornQST.IsStageDone(299))
			DLC2dunKolbjornQST.SetStage(299)
		ElseIf (DLC2dunKolbjornQST.IsStageDone(375) && !DLC2dunKolbjornQST.IsStageDone(399))
			DLC2dunKolbjornQST.SetStage(399)
		ElseIf (player.GetDistance(DLC2dunKolbjorn_PlayerOutsideKolbjornMarker) > 8500 && DLC2dunKolbjornQST.IsStageDone(550) && !DLC2dunKolbjornQST.IsStageDone(600))
; 			;Debug.Trace("Cleaning up Kolbjorn.")
			DLC2dunKolbjornQST.SetStage(600)
		EndIf
	EndIf
EndEvent