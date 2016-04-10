Scriptname DLC2WaterScript extends ObjectReference

Event OnActivate(ObjectReference Me)
	if Me == Game.GetPlayer()
		if Me.GetItemCount(Taproot) >= 3
			ObjectReference Taproot1Ref = Me.PlaceAtMe(DLC2TaprootSoaked, 1, false, false)
			SoakedTaproot1.ForceRefTo(Taproot1Ref)
			Me.AddItem(Taproot1Ref)

			ObjectReference Taproot2Ref = Me.PlaceAtMe(DLC2TaprootSoaked, 1, false, false)
			SoakedTaproot2.ForceRefTo(Taproot2Ref)
			Me.AddItem(Taproot2Ref)

			ObjectReference Taproot3Ref = Me.PlaceAtMe(DLC2TaprootSoaked, 1, false, false)
			SoakedTaproot3.ForceRefTo(Taproot3Ref)
			Me.AddItem(Taproot3Ref)

			DLC2TTF2.SetStage(200)
		endIf
	endIf
EndEvent

Ingredient Property Taproot  Auto  

ReferenceAlias Property SoakedTaproot1  Auto  
ReferenceAlias Property SoakedTaproot2  Auto  
ReferenceAlias Property SoakedTaproot3  Auto  

MiscObject Property DLC2TaprootSoaked  Auto  

Quest Property DLC2TTF2  Auto  
