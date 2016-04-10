ScriptName RelationshipMarriageSpouseHouseScript extends Quest Conditional

Quest Property BYOHRelationshipAdoption Auto

ReferenceAlias Property SolitudeHouse  Auto  
ReferenceAlias Property WindhelmHouse  Auto  
ReferenceAlias Property MarkarthHouse  Auto  
ReferenceAlias Property RiftenHouse  Auto  
ReferenceAlias Property WhiterunHouse  Auto  
ReferenceAlias Property FalkreathHouse Auto
ReferenceAlias Property HjaalmarchHouse Auto
ReferenceAlias Property PaleHouse Auto
ReferenceAlias Property SpouseHouse Auto

Faction Property JobBlacksmithFaction Auto
Faction Property JobSpellFaction Auto
Faction Property JobApothecaryFaction Auto
Faction Property JobInnkeeperFaction Auto
Faction Property JobMiscFaction Auto

int property SpouseCurrentHome Auto Conditional Hidden


Function MoveSpouseAdoption (Actor Spouse, int NewHouse)
	Debug.Trace("MoveSpouseAdoption called.")
	MoveSpouse(Spouse, TranslateHouseIntToAlias(NewHouse))
EndFunction

Function MoveSpouse (Actor Spouse, ReferenceAlias NewHouse)
	;If Adoption is running, and we haven't moved the spouse yet, queue up a move to make sure the family stays together. Let the spouse start walking, though.
	If (BYOHRelationshipAdoption.IsRunning() && (BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).FirstMoveWithSpouse)
		Debug.Trace("MoveSpouse is queuing an Initial Move to:" + TranslateHouseAliasToInt(NewHouse))
		(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).QueueMoveFamily(TranslateHouseAliasToInt(NewHouse), True)
	EndIf
	
	;If the Adoption system is running, RelationshipMarriage just queues a move.
	;The actual move occurs when RelationshipAdoption calls MoveSpouseAdoption with AllowSpouseToMove=True, triggering the actual move.
	If (BYOHRelationshipAdoption.IsRunning() && !(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).AllowSpouseToMove)
		Debug.Trace("MoveSpouse is queuing a Standard Move to:" + TranslateHouseAliasToInt(NewHouse))
		(BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).QueueMoveFamily(TranslateHouseAliasToInt(NewHouse))
	EndIf
	
	;Allow the spouse to walk away if Adoption isn't running (as in the base game), or if Adoption has had its input.
	If (!BYOHRelationshipAdoption.IsRunning() || (BYOHRelationshipAdoption as BYOHRelationshipAdoptionScript).AllowSpouseToMove)
		;Function puts the player spouse in the correct alias to sandbox in the appropriate house
		;Clear all the other house aliases before setting the new one
		
		Debug.Trace("MoveSpouse has updated the Spouse's packages.")
	
		If SolitudeHouse
			SolitudeHouse.Clear()
		EndIf

		If WindhelmHouse
			WindhelmHouse.Clear()
		EndIf

		If MarkarthHouse
			MarkarthHouse.Clear()
		EndIf

		If RiftenHouse	
			RiftenHouse.Clear()
		EndIf

		If WhiterunHouse
			WhiterunHouse.Clear()
		EndIf

		If FalkreathHouse
			FalkreathHouse.Clear()
		EndIf

		If HjaalmarchHouse
			HjaalmarchHouse.Clear()
		EndIf

		If PaleHouse
			PaleHouse.Clear()
		EndIf

		If SpouseHouse
			SpouseHouse.Clear()
		EndIf

		NewHouse.ForceRefTo(Spouse)
		SpouseCurrentHome = TranslateHouseAliasToInt(NewHouse)
	EndIf	
EndFunction

Function SpouseShop (Actor Spouse)

	;Function checks to see if the player was a vendor before, if not, make them a MiscVendor
	If (Spouse.IsInFaction(JobBlacksmithFaction) == 0) && (Spouse.IsInFaction(JobSpellFaction) == 0) && (Spouse.IsInFaction(JobInnkeeperFaction) ==0) && (Spouse.IsInFaction(JobApothecaryFaction) == 0) && (Spouse.IsInFaction(JobMiscFaction) == 0)
		Spouse.AddtoFaction(JobMiscFaction)
		Spouse.AddtoFaction(JobMerchantFaction)
	EndIf

EndFunction

Faction Property JobMerchantFaction  Auto  


int Function TranslateHouseAliasToInt(ReferenceAlias NewHouse)
	if (newHouse == SolitudeHouse)
		return 1
	ElseIf (newHouse == WindhelmHouse)
		return 2
	ElseIf (newHouse == MarkarthHouse)
		return 3
	ElseIf (newHouse == RiftenHouse)
		return 4
	ElseIf (newHouse == WhiterunHouse)
		return 5
	ElseIf (newHouse == FalkreathHouse)
		return 6
	ElseIf (newHouse == HjaalmarchHouse)
		return 7
	ElseIf (newHouse == PaleHouse)
		return 8
	EndIf
	Debug.Trace("RelationshipMarriageSpouseHouseScript Alias Translation Error!")
	return -1
EndFunction

ReferenceAlias Function TranslateHouseIntToAlias(int NewHouse)
	if (newHouse == 1)
		return SolitudeHouse
	ElseIf (newHouse == 2)
		return WindhelmHouse
	ElseIf (newHouse == 3)
		return MarkarthHouse
	ElseIf (newHouse == 4)
		return RiftenHouse
	ElseIf (newHouse == 5)
		return WhiterunHouse
	ElseIf (newHouse == 6)
		return FalkreathHouse
	ElseIf (newHouse == 7)
		return HjaalmarchHouse
	ElseIf (newHouse == 8)
		return PaleHouse
	EndIf
	Debug.Trace("RelationshipMarriageSpouseHouseScript Int Translation Error!")
	return None
EndFunction

Function UpdateSpouseHouseInt()
	if (SolitudeHouse.GetActorRef() != None)
		SpouseCurrentHome = 1
	ElseIf (WindhelmHouse.GetActorRef() != None)
		SpouseCurrentHome = 2
	ElseIf (MarkarthHouse.GetActorRef() != None)
		SpouseCurrentHome = 3
	ElseIf (RiftenHouse.GetActorRef() != None)
		SpouseCurrentHome = 4
	ElseIf (WhiterunHouse.GetActorRef() != None)
		SpouseCurrentHome = 5
	ElseIf (FalkreathHouse.GetActorRef() != None)
		SpouseCurrentHome = 6
	ElseIf (HjaalmarchHouse.GetActorRef() != None)
		SpouseCurrentHome = 7
	ElseIf (PaleHouse.GetActorRef() != None)
		SpouseCurrentHome = 8
	EndIf
EndFunction