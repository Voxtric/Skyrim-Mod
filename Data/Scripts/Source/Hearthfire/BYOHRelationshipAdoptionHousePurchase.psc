Scriptname BYOHRelationshipAdoptionHousePurchase extends Quest
{New House Purchase functions to enable, swap, and track the children's bedrooms.}

;----------------------------------------------------------------------------------------------------
;New Enable Markers for Childrens' Bedrooms
;------------------------------------------
ObjectReference property SolitudePlayerHouseDecorateLivingRoomSupplemental Auto
ObjectReference property SolitudePlayerHouseDecorateLivingRoomSupplementalDisable Auto
ObjectReference property SolitudePlayerHouseDecorateChildRoom Auto
ObjectReference property SolitudePlayerHouseDecorateChildDisable Auto

ObjectReference property WindhelmPlayerHouseDecorateChildRoom Auto
ObjectReference property WindhelmPlayerHouseDecorateChildRoomSpecialDisable Auto

ObjectReference property MarkarthPlayerHouseDecorateAlchemy Auto
ObjectReference property MarkarthPlayerHouseDecorateChildRoom Auto
ObjectReference property MarkarthPlayerHouseDecorateChildRoomSpecialDisable Auto

ObjectReference property RiftenPlayerHouseDecorateEnchanting Auto
ObjectReference property RiftenPlayerHouseDecorateChildRoom Auto

ObjectReference property WhiterunPlayerHouseAlchemyLaboratory Auto
ObjectReference property WhiterunPlayerHouseChildBedroom Auto


;----------------------------------------------------------------------------------------------------
;Other data needed for initial setup & state testing.
;----------------------------------------------------
bool HasRunStartup = False					;Has the DLC Startup function run?

Quest property RelationshipAdoptable Auto	;Pre-Adoption quest quest.

ObjectReference property SolitudePlayerHouseDecorateLivingRoom Auto			;Markers whose state we need to test against.
ObjectReference property MarkarthPlayerHouseDecorateAlchemyDisable Auto
ObjectReference property RiftenPlayerHouseDecorateEnchantingDisable Auto
ObjectReference property WhiterunPlayerHouseAlchemyLaboratoryStart Auto

GlobalVariable property HDSolitudeChildRoom Auto	;Cost of the childrens' bedrooms in each house.
GlobalVariable property HDWindhelmChildRoom Auto
GlobalVariable property HDMarkarthChildRoom Auto
GlobalVariable property HDRiftenChildRoom Auto
GlobalVariable property HDWhiterunChildRoom Auto


;This function is called exactly once, when the DLC starts.
;It Enables/Disables the new house Enable Markers to make absolutely sure they're in the correct state relative to any prior purchases.
Function BYOHRelationshipAdoptionHousePurchaseSTARTUP()
	if (!HasRunStartup)
		HasRunStartup = True
		
		;Fixup Solitude
		if (SolitudePlayerHouseDecorateLivingRoom.IsDisabled())
			SolitudePlayerHouseDecorateChildRoom.Disable()
			SolitudePlayerHouseDecorateLivingRoomSupplemental.Disable()
			SolitudePlayerHouseDecorateLivingRoomSupplementalDisable.Enable()
			SolitudePlayerHouseDecorateChildDisable.Enable()
		Else
			SolitudePlayerHouseDecorateChildRoom.Disable()
			SolitudePlayerHouseDecorateLivingRoomSupplementalDisable.Disable()
			SolitudePlayerHouseDecorateLivingRoomSupplemental.Enable()
			SolitudePlayerHouseDecorateChildDisable.Enable()
		EndIf
	
		;Fixup Windhelm
		WindhelmPlayerHouseDecorateChildRoom.Disable()
		WindhelmPlayerHouseDecorateChildRoomSpecialDisable.Enable()
	
		;Fixup Markarth
		MarkarthPlayerHouseDecorateChildRoom.Disable()
		MarkarthPlayerHouseDecorateChildRoomSpecialDisable.Enable()
		if (MarkarthPlayerHouseDecorateAlchemy.IsDisabled())
			MarkarthPlayerHouseDecorateAlchemyDisable.Enable()
		Else
			MarkarthPlayerHouseDecorateAlchemyDisable.Disable()
		EndIf
	
		;Fixup Riften
		RiftenPlayerHouseDecorateChildRoom.Disable()
		if (RiftenPlayerHouseDecorateEnchanting.IsDisabled())
			RiftenPlayerHouseDecorateEnchantingDisable.Enable()
		Else
			RiftenPlayerHouseDecorateEnchantingDisable.Disable()
		EndIf
	
		;Fixup Whiterun
		WhiterunPlayerHouseChildBedroom.Disable()
		if (WhiterunPlayerHouseAlchemyLaboratory.IsDisabled())
			WhiterunPlayerHouseAlchemyLaboratoryStart.Enable()
		Else
			WhiterunPlayerHouseAlchemyLaboratoryStart.Disable()
		EndIf
		
		;Update the HousePurchase quest's stored globals to make sure the new values get picked up for text replacement.
		UpdateCurrentInstanceGlobal(HDSolitudeChildRoom)
		UpdateCurrentInstanceGlobal(HDWindhelmChildRoom)
		UpdateCurrentInstanceGlobal(HDMarkarthChildRoom)
		UpdateCurrentInstanceGlobal(HDRiftenChildRoom)
		UpdateCurrentInstanceGlobal(HDWhiterunChildRoom)
	EndIf
EndFunction


;----------------------------------------------------------------------------------------------------
;Solitude - Child's Bedroom is a new room.
;-----------------------------------------

Function Solitude_EnableLivingRoom()
	;Debug.Trace("Solitude_EnableLivingRoom called.")
	SolitudePlayerHouseDecorateLivingRoomSupplementalDisable.Disable()
	SolitudePlayerHouseDecorateLivingRoom.Enable()
	if (SolitudePlayerHouseDecorateChildRoom.IsDisabled())
		;Debug.Trace("Enabling supplemental.")
		SolitudePlayerHouseDecorateLivingRoomSupplemental.Enable()
	EndIf
EndFunction

Function Solitude_EnableChildBedroom()
	;Debug.Trace("Solitude_EnableChildBedroom called.")
	SolitudePlayerHouseDecorateLivingRoomSupplemental.Disable()
	
	SolitudePlayerHouseDecorateLivingRoomSupplementalDisable.Disable()
	SolitudePlayerHouseDecorateChildDisable.Disable()
	SolitudePlayerHouseDecorateChildRoom.Enable()
	
	;Notify Adoptable that we have a child's room.
	(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
EndFunction


;----------------------------------------------------------------------------------------------------
;Windhelm - Child's Bedroom is new room.
;---------------------------------------

Function Windhelm_EnableChildBedroom()
	;Debug.Trace("Windhelm_EnableChildBedroom called.")
	WindhelmPlayerHouseDecorateChildRoomSpecialDisable.Disable()
	WindhelmPlayerHouseDecorateChildRoom.Enable()
	
	;Notify Adoptable that we have a child's room.
	(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
EndFunction


;----------------------------------------------------------------------------------------------------
;Markarth - Child's Bedroom swaps for Alchemy Lab
;------------------------------------------------

Function Markarth_EnableChildBedroom()
	;Debug.Trace("Markarth_EnableChildBedroom called.")
	;Debug.Trace("Now disabling: " + MarkarthPlayerHouseDecorateAlchemyDisable.IsDisabled() + " " + MarkarthPlayerHouseDecorateAlchemyDisable)
	MarkarthPlayerHouseDecorateAlchemyDisable.Disable()
	MarkarthPlayerHouseDecorateAlchemy.Disable()
	MarkarthPlayerHouseDecorateChildRoomSpecialDisable.Disable()
	MarkarthPlayerHouseDecorateChildRoom.Enable()
	
	;Notify Adoptable that we have a child's room.
	(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
	
	;Debug.Trace("Disabled: " + MarkarthPlayerHouseDecorateAlchemyDisable.ISDisabled() + " " + MarkarthPlayerHouseDecorateAlchemyDisable)
EndFunction

Function Markarth_EnableChildBedroomAlternative()
	;Debug.Trace("Markarth_EnableChildBedroomAlternative called.")
	MarkarthPlayerHouseDecorateAlchemyDisable.Disable()
	MarkarthPlayerHouseDecorateChildRoom.Disable()
	MarkarthPlayerHouseDecorateChildRoomSpecialDisable.Enable()
	MarkarthPlayerHouseDecorateAlchemy.Enable()
	
	;Notify Adoptable that we (no longer?) have this room.
	(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
EndFunction


;----------------------------------------------------------------------------------------------------
;Riften - Child's Bedroom swaps for Enchanting Lab
;-------------------------------------------------

Function Riften_EnableChildBedroom()
	;Debug.Trace("Riften_EnableChildBedroom called.")
	RiftenPlayerHouseDecorateEnchantingDisable.Disable()
	RiftenPlayerHouseDecorateEnchanting.Disable()
	RiftenPlayerHouseDecorateChildRoom.Enable()
	
	;Notify Adoptable that we have a child's room.
	(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
EndFunction

Function Riften_EnableChildBedroomAlternative()
	;Debug.Trace("Riften_EnableChildBedroomAlternative called.")
	RiftenPlayerHouseDecorateEnchantingDisable.Disable()
	RiftenPlayerHouseDecorateChildRoom.Disable()
	RiftenPlayerHouseDecorateEnchanting.Enable()
	
	;Notify Adoptable that we (no longer?) have this room.
	(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
EndFunction


;----------------------------------------------------------------------------------------------------
;Whiterun - Child's Bedroom swaps for Alchemy Lab
;------------------------------------------------

Function Whiterun_EnableChildBedroom()
	;Debug.Trace("Whiterun_EnableChildBedroom called.")
	WhiterunPlayerHouseAlchemyLaboratoryStart.Disable()
	WhiterunPlayerHouseAlchemyLaboratory.Disable()
	WhiterunPlayerHouseChildBedroom.Enable()
		
	;Notify Adoptable that we have a child's room.
	(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
EndFunction

Function Whiterun_EnableChildBedroomAlternative()
	;Debug.Trace("Whiterun_EnableChildBedroomAlternative called.")
	WhiterunPlayerHouseAlchemyLaboratoryStart.Disable()
	WhiterunPlayerHouseChildBedroom.Disable()
	WhiterunPlayerHouseAlchemyLaboratory.Enable()
	
	;Notify Adoptable that we (no longer?) have this room.
	(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
EndFunction
