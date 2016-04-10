Scriptname DLC1dunHarkonFontActorMoveScript extends Actor  

ObjectReference property FontActorLocation Auto

Event OnCellAttach()
	Self.MoveTo(FontActorLocation)
EndEvent