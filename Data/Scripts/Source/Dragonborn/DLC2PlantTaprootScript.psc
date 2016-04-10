Scriptname DLC2PlantTaprootScript extends ReferenceAlias

Quest Property DLC2TTF2  Auto  

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		DLC2TTF2.SetStage(400)
	endIf
EndEvent