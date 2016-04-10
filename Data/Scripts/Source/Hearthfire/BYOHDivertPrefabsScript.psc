Scriptname BYOHDivertPrefabsScript extends ObjectReference
{Disables (not diverts) all items in prefab bookshelves and weapon racks if this marker is disabled. If it is enabled, reenables them.}

Keyword property LinkCustom01 Auto

Event OnCellAttach()
	bool shouldBeDisabled = Self.GetLinkedRef().IsDisabled()
	;Is this object a bookshelf?
	PlayerBookshelfContainerScript bcs = ((Self as ObjectReference) as PlayerBookShelfContainerScript)
	if (bcs != None)
		;Yes, so update the state of the books.
		if (shouldBeDisabled && !Self.GetLinkedRef(LinkCustom01).IsDisabled())
			MoveBooks(bcs)
		EndIf
		Debug.Trace("Bookshelf processed. Object state was: " + shouldBeDisabled)
	Else
		;Is this object a Weapon Rack?
		WeaponRackActivateScript wras = ((Self as ObjectReference) as WeaponRackActivateScript)
		if (wras != None)
			;Yes, so update the state of the weapon and the trigger.
			if (shouldBeDisabled)
				Self.Disable()
				if (wras.PlayersDroppedWeapon != None)
					wras.PlayersDroppedWeapon.Disable()
				EndIf
			Else
				if (wras.PlayersDroppedWeapon != None)
					wras.PlayersDroppedWeapon.Enable()
					Self.Disable()
				Else
					Self.Enable()
				EndIf
			EndIf
			Debug.Trace("Weapon Rack processed. Object state was: " + shouldBeDisabled)
		Else
			;That's all the prefabs we need to disable, at least for now.
			Debug.Trace("Unidentified Prefab.")
		EndIf
	EndIf		
EndEvent


Function MoveBooks(PlayerBookshelfContainerScript bcs)
	if (bcs.PlacedBook01 != None)
		Self.RemoveItem(bcs.PlacedBook01, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook01Ref.Disable()
		bcs.PlacedBook01Ref.Delete()
	EndIf
	if (bcs.PlacedBook02 != None)
		Self.RemoveItem(bcs.PlacedBook02, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook02Ref.Disable()
		bcs.PlacedBook02Ref.Delete()
	EndIf
	if (bcs.PlacedBook03 != None)
		Self.RemoveItem(bcs.PlacedBook03, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook03Ref.Disable()
		bcs.PlacedBook03Ref.Delete()
	EndIf
	if (bcs.PlacedBook04 != None)
		Self.RemoveItem(bcs.PlacedBook04, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook04Ref.Disable()
		bcs.PlacedBook04Ref.Delete()
	EndIf
	if (bcs.PlacedBook05 != None)
		Self.RemoveItem(bcs.PlacedBook05, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook05Ref.Disable()
		bcs.PlacedBook05Ref.Delete()
	EndIf
	if (bcs.PlacedBook06 != None)
		Self.RemoveItem(bcs.PlacedBook06, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook06Ref.Disable()
		bcs.PlacedBook06Ref.Delete()
	EndIf
	if (bcs.PlacedBook07 != None)
		Self.RemoveItem(bcs.PlacedBook07, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook07Ref.Disable()
		bcs.PlacedBook07Ref.Delete()
	EndIf
	if (bcs.PlacedBook08 != None)
		Self.RemoveItem(bcs.PlacedBook08, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook08Ref.Disable()
		bcs.PlacedBook08Ref.Delete()
	EndIf
	if (bcs.PlacedBook09 != None)
		Self.RemoveItem(bcs.PlacedBook09, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook09Ref.Disable()
		bcs.PlacedBook09Ref.Delete()
	EndIf
	if (bcs.PlacedBook10 != None)
		Self.RemoveItem(bcs.PlacedBook10, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook10Ref.Disable()
		bcs.PlacedBook10Ref.Delete()
	EndIf
	if (bcs.PlacedBook11 != None)
		Self.RemoveItem(bcs.PlacedBook11, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook11Ref.Disable()
		bcs.PlacedBook11Ref.Delete()
	EndIf
	if (bcs.PlacedBook12 != None)
		Self.RemoveItem(bcs.PlacedBook12, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook12Ref.Disable()
		bcs.PlacedBook12Ref.Delete()
	EndIf
	if (bcs.PlacedBook13 != None)
		Self.RemoveItem(bcs.PlacedBook13, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook13Ref.Disable()
		bcs.PlacedBook13Ref.Delete()
	EndIf
	if (bcs.PlacedBook14 != None)
		Self.RemoveItem(bcs.PlacedBook14, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook14Ref.Disable()
		bcs.PlacedBook14Ref.Delete()
	EndIf
	if (bcs.PlacedBook15 != None)
		Self.RemoveItem(bcs.PlacedBook15, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook15Ref.Disable()
		bcs.PlacedBook15Ref.Delete()
	EndIf
	if (bcs.PlacedBook16 != None)
		Self.RemoveItem(bcs.PlacedBook16, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook16Ref.Disable()
		bcs.PlacedBook16Ref.Delete()
	EndIf
	if (bcs.PlacedBook17 != None)
		Self.RemoveItem(bcs.PlacedBook17, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook17Ref.Disable()
		bcs.PlacedBook17Ref.Delete()
	EndIf
	if (bcs.PlacedBook18 != None)
		Self.RemoveItem(bcs.PlacedBook18, 1, False, Self.GetLinkedRef(LinkCustom01))
		bcs.PlacedBook18Ref.Disable()
		bcs.PlacedBook18Ref.Delete()
	EndIf
EndFunction