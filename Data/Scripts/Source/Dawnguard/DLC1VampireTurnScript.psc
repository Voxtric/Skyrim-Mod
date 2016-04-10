Scriptname DLC1VampireTurnScript extends Quest  
{Script attached to DLC1VampireTurn quest, manages player turning people into vampires. 
And also, player turning into a vampire through the quest line if he isn't already}

ReferenceAlias Property NewVampire1 auto
ReferenceAlias Property NewVampire2 auto
ReferenceAlias Property NewVampire3 auto
ReferenceAlias Property NewVampire4 auto
ReferenceAlias Property NewVampire5 auto

Race Property ArgonianRace auto
Race Property BretonRace auto
Race Property DarkElfRace auto
Race Property ElderRace auto
Race Property HighElfRace auto
Race Property ImperialRace auto
Race Property KhajiitRace auto
Race Property NordRace auto
Race Property OrcRace auto
Race Property RedguardRace auto
Race Property WoodElfRace auto

Race Property ArgonianRaceVampire auto
Race Property BretonRaceVampire auto
Race Property DarkElfRaceVampire auto
Race Property ElderRaceVampire auto
Race Property HighElfRaceVampire auto
Race Property ImperialRaceVampire auto
Race Property KhajiitRaceVampire auto
Race Property NordRaceVampire auto
Race Property OrcRaceVampire auto
Race Property RedguardRaceVampire auto
Race Property WoodElfRaceVampire auto

Faction Property DLC1PlayerTurnedVampire auto	
Faction Property DLC1RV07ThankFaction auto

Quest Property DLC1RV06 auto
Quest Property DLC1RV07 auto
ReferenceAlias Property DLC1RV06Spouse auto
ReferenceAlias Property DLC1RV07Candidate auto
Faction Property DLC1RV07CoffinOwnerFaction auto

PlayerVampireQuestScript Property PlayerVampireQuest auto
perk Property DLC1VampireTurnPerk auto
spell Property DLC1VampireCalm auto
keyword Property Vampire auto

spell Property DLC1VampireChange auto

Spell Property DLC1VampireChangeFX auto

Idle Property IdleVampireStandingFeedFront_Loose auto
Idle Property pa_VampireLordChangePlayer auto

Quest Property DLC1VQ02 auto
Race Property DLC1VampireBeastRace auto
Armor Property DLC1ClothesVampireLordRoyalArmor auto
Armor Property DLC1VampireLordCape auto
Actor Property DLC1HarknonActorRef auto
ObjectReference Property DLC1VQ02PlayerWakeupMarker auto
ObjectReference Property DLC1VQ02HarkonWakeupMarker auto
ObjectReference Property DLC1VQ02PlayerWakeupMarkerReject auto
ImageSpaceModifier Property FadeToBlackImod auto
ImageSpaceModifier Property SleepyTimeFadeIn auto

faction Property DLC1PotentialVampireFaction auto

quest Property DLC1VQ03Vampire auto
ReferenceAlias Property DLC1VQ03VampireDexion auto

CompanionsHousekeepingScript Property C00 auto

ReferenceAlias Property DisguisedVampireLordName auto

ImageSpaceModifier Property DLC1HarkonBiteFadeToBlackImod auto

Outfit Property DLC1HarkonOutfit auto
Outfit Property DLC1HarkonDummyOutfit auto

TextureSet Property EyesMaleHumanVampire01 auto

globalvariable Property DLC1VampireFeedStartTime auto
keyword Property DLC1VampireFeedBystanderStart auto

idle Property DLC1PairEnd auto

 ;used for NPCs
Function PlayerBitesMe(Actor ActorToTurn)
	Debug.Trace(self + "PlayerBitesMe()" + ActorToTurn)

	StartQuestDLC1VampireFeedBystander(ActorToTurn)

	if ActorToTurn.IsInFaction(DLC1PotentialVampireFaction) && ActorToTurn.IsInFaction(DLC1PlayerTurnedVampire) == False
		TurnMeIntoVampire(ActorToTurn)

	elseif DLC1VQ03VampireDexion && DLC1VQ03VampireDexion.GetActorReference() == ActorToTurn
		if DLC1VQ03Vampire.getStageDone(67)
			DLC1VQ03Vampire.SetStage(70)
		endif

	endif

EndFunction

Function StartQuestDLC1VampireFeedBystander(Actor ActorToTurn)
	DLC1VampireFeedStartTime.SetValue(utility.GetCurrentGameTime())
	DLC1VampireFeedBystanderStart.SendStoryEvent(akRef1 = ActorToTurn)
EndFunction

Function TurnMeIntoVampire(Actor ActorToTurn)
	Debug.Trace(self + "TurnMeIntoVampire([" + ActorToTurn + "])")

	ReferenceAlias OpenReferenceAlias = GetNextAlias()

	Debug.Trace(self + "TurnMeIntoVampire() Will put actor in OpenReferenceAlias:" + OpenReferenceAlias)

	OpenReferenceAlias.ForceRefTo(ActorToTurn) 

	;communicate successfully turned into vampire
	if DLC1RV06.IsRunning() && ActorToTurn == DLC1RV06Spouse.GetActorReference()
		Debug.Trace(self + "TurnMeIntoVampire() turning player Spouse, so setting stage 100 on DLC1RV06")
		DLC1RV06.setStage(100)
	endif

	;communicate successfully turned into vampire
	if DLC1RV07.IsRunning() && ActorToTurn == DLC1RV07Candidate.GetActorReference()
		Debug.Trace(self + "TurnMeIntoVampire() turning candidate, so setting stage 100 on DLC1RV07")
		DLC1RV07.setStage(100)
	endif

EndFunction

Function CompleteChange(ReferenceAlias AliasToTurn)
	Actor ActorToTurn = AliasToTurn.GetActorReference()

	Actor PlayerRef = Game.GetPlayer()

	if ActorToTurn

		if Game.GetPlayer().IsInLocation(ActorToTurn.GetCurrentLocation()) == false


;			race VampRace = GetVampireRace(ActorToTurn)
;			Debug.Trace(self + "CompleteChange() turn into race:" + VampRace)
;			ActorToTurn.SetRace(VampRace)
;*** SETTING RACE CAUSED PROBLEMS, we are now only giving them red eyes.

			Debug.Trace(self + "CompleteChange() will put into GiveMeRedEyes alias, and add to DLC1PlayerTurnedVampire faction. "  + ActorToTurn)
			
			((Self as Quest) as DLC1ReferenceAliasArrayScript).ForceRefInto(ActorToTurn)
			ActorToTurn.AddToFaction(DLC1PlayerTurnedVampire)


			if ActorToTurn.GetRelationshipRank(PlayerRef) < 1
				Debug.Trace(self + "CompleteChange() SetRelationshipRank to 1 with player")
				ActorToTurn.SetRelationshipRank(PlayerRef, 1)
			endif

			if DLC1RV07.IsRunning() && ActorToTurn == DLC1RV07Candidate.GetActorReference()
				Debug.Trace(self + "CompleteChange() making DLC1RV07 Candidate, setting DLC1RV07 stage 50, and adding to DLC1RV07ThankFaction")
				DLC1RV07.SetStage(50)
				ActorToTurn.AddToFaction(DLC1RV07ThankFaction)
				ActorToTurn.AddToFaction(DLC1RV07CoffinOwnerFaction)
				playerRef.AddToFaction(DLC1RV07CoffinOwnerFaction)
			endif

		else
			Debug.Trace(self + "CompleteChange() player is in same location as NewVampire, not yet completing the change." + ActorToTurn)
		
		endif

	endif


EndFunction

Function PlayerChangedLocationCompleteChange()
{Called by DLC1VampireTurnPlayerScript when player changes location}
	CompleteChange(NewVampire1)
	CompleteChange(NewVampire2)
	CompleteChange(NewVampire3)
	CompleteChange(NewVampire4)
	CompleteChange(NewVampire5)
EndFunction


ReferenceAlias Function GetNextAlias()
	
	ReferenceAlias ReferenceAliasToReturn

	if NewVampire1.GetReference() == false
		ReferenceAliasToReturn = NewVampire1 
	elseif NewVampire2.GetReference() == false
		ReferenceAliasToReturn = NewVampire2
	elseif NewVampire3.GetReference() == false
		ReferenceAliasToReturn = NewVampire3
	elseif NewVampire4.GetReference() == false
		ReferenceAliasToReturn = NewVampire4
	elseif NewVampire5.GetReference() == false
		ReferenceAliasToReturn = NewVampire5
	else
		Debug.Trace(self + "WARNING: GetNextAlias() couldn't find an empty alias", 2)
	endif

	RETURN ReferenceAliasToReturn
EndFunction

Function MakeAliasesEyesRed()
	Debug.Trace(self + "MakeAliasesEyesRed()")

	ReferenceAlias[] RedEyeAliasArray = ((self as quest) as DLC1ReferenceAliasArrayScript).AliasArray

	int i = 0
	while (i < RedEyeAliasArray.Length)

		if RedEyeAliasArray[i].GetActorReference()
			MakeMyEyesRed(RedEyeAliasArray[i])
		endif

		i += 1
	endwhile

EndFunction

Function MakeMyEyesRed(ReferenceAlias AliasWhoseActorToGiveRedEyes)
{Called OnLoad() by DLC1VampireTurnRedEyes, and by MakeAliasesEyesRed()}
	Actor ActorToChange = AliasWhoseActorToGiveRedEyes.GetActorReference()

	Debug.Trace(self + "MakeMyEyesRed()" + AliasWhoseActorToGiveRedEyes + ActorToChange)
	ActorToChange.SetEyeTexture(EyesMaleHumanVampire01)
EndFunction

;used for NPCs -- OBSOLETE, doesn't work as intended
race Function GetVampireRace(Actor ActorToTurn)
	race myRace = ActorToTurn.GetRace()

	race returnRace

	if (myRace == ArgonianRace)
		returnRace = ArgonianRaceVampire

	elseif(myRace == BretonRace)
		returnRace = BretonRaceVampire

	elseif(myRace == DarkElfRace)
		returnRace =  DarkElfRaceVampire

	elseif(myRace == ElderRace)
		returnRace =  ElderRaceVampire
	
	elseif(myRace == HighElfRace)
		returnRace =  HighElfRaceVampire
	
	elseif(myRace == ImperialRace)
		returnRace =  ImperialRaceVampire
	
	elseif(myRace == KhajiitRace)
		returnRace =  KhajiitRaceVampire
	
	elseif(myRace == NordRace)
		returnRace =  NordRaceVampire

	elseif(myRace == OrcRace)
		returnRace =  OrcRaceVampire

	elseif(myRace == RedguardRace)
		returnRace =  RedguardRaceVampire

	elseif(myRace == WoodElfRace)
		returnRace =  WoodElfRaceVampire

	else
		returnRace =  None

	endif

	Debug.Trace(self + "GetVampireRace() returning race:" + returnRace)

	RETURN returnRace

EndFunction

Function HarkonBitesPlayer(bool isPlayerRecieveingHarkonsGift = true)
	Actor PlayerRef = Game.GetPlayer()

	Debug.Trace(self + "HarkonBitesPlayer()")

	DLC1HarkonBiteFadeToBlackImod.Apply()

	;fade to black
	Debug.Trace(self + "HarkonBitesPlayer() make vampire fade to black")
	if isPlayerRecieveingHarkonsGift == true
		ReceiveHarkonsGift(DLC1HarknonActorRef, PlayStandardBiteAnim = false)
	else
		;**PLAY RED**
	endif

	
	;move player to coffin and make vampire and move harkon to player
	Debug.Trace(self + "HarkonBitesPlayer() moving player")
	if isPlayerRecieveingHarkonsGift == true
		Debug.Trace(self + "PlayIdle(DLC1PairEnd)")
		PlayerRef.PlayIdle(DLC1PairEnd)
		PlayerRef.MoveTo(DLC1VQ02PlayerWakeupMarker)
		HarkonChangeBackFromVampireLord()
		DLC1HarknonActorRef.MoveTo(DLC1VQ02HarkonWakeupMarker)

		DLC1HarkonBiteFadeToBlackImod.PopTo(SleepyTimeFadeIn)
		
		DLC1VQ02.SetStage(40)
		
	else
		utility.wait(5)

		PlayerRef.MoveTo(DLC1VQ02PlayerWakeupMarkerReject)
		DLC1HarkonBiteFadeToBlackImod.PopTo(SleepyTimeFadeIn)
		DLC1VQ02.SetStage(30)

	endif


EndFunction

;used for Player
Function ReceiveHarkonsGift(Actor GiftGiver, bool IsSeranaGiving = false, bool PlayStandardBiteAnim = true)
	Debug.Trace(self + "ReceiveHarkonsGift() IsSeranaGiving ==" + IsSeranaGiving)
	Actor PlayerRef = Game.GetPlayer()

	bool animPlayed

	if PlayStandardBiteAnim
		animPlayed = GiftGiver.PlayIdleWithTarget(IdleVampireStandingFeedFront_Loose, PlayerRef)
		Debug.Trace(self + "ReceiveHarkonsGift() IdleVampireStandingFeedFront_Loose animPlayed: " + animPlayed)

	else ;assume Lord form bite
		animPlayed = GiftGiver.PlayIdleWithTarget(pa_VampireLordChangePlayer, PlayerRef)
		Debug.Trace(self + "ReceiveHarkonsGift() pa_VampireLordChangePlayer animPlayed: " + animPlayed)

	endif	


	if playerRef.GetRace().HasKeyword(Vampire) == false
		Debug.Trace(self + "ReceiveHarkonsGift() player is not yet a vampire, making him a vampire")
		PlayerVampireQuest.VampireChange(PlayerRef)
	else
		utility.wait(3)
	endif

	if (C00.PlayerHasBeastBlood)
		Debug.Trace(self + "ReceiveHarkonsGift() curing Lycanthropy by calling C00.CurePlayer() on CompanionsHouseKeepingScript")
		C00.CurePlayer()
	endif

	Debug.Trace(self + "ReceiveHarkonsGift() adding DLC1VampireChange spell and DLC1VampireTurnPerk so player can turn people into vampires")
	PlayerRef.AddSpell(DLC1VampireChange)
	PlayerRef.AddPerk(DLC1VampireTurnPerk)


	;was adding this spell so new vampire who didn't have a calm spell and didn't know about getting calm power at higher level wouldn't be confused by the quest
	;Bruce asked we try it without and if we get push back during playtests we can put it back in
	;his concern is having two very similar powers
	;PlayerRef.AddSpell(DLC1VampireCalm, abVerbose = false)

EndFunction

;used for Player
Function ReceiveSeranasGift(Actor GiftGiver)
	ReceiveHarkonsGift(GiftGiver, IsSeranaGiving = true)
EndFunction

Function NPCTransformIntoVampireLord(actor ActorToTurn, bool RoyalOutfit = False, bool HarkonForceGreet = False)
	Debug.Trace(self + "NPCTransformIntoVampireLord()")

	;ActorToTurn.SetRace(DLC1VampireBeastRace)
	DLC1VampireChangeFX.Cast(ActorToTurn, ActorToTurn)	;this sets the race
	
	if RoyalOutfit
		ActorToTurn.EquipItem(DLC1ClothesVampireLordRoyalArmor, abPreventRemoval = true)
		ActorToTurn.EquipItem(DLC1VampireLordCape, abPreventRemoval = true)
	endif

	if HarkonForceGreet
		;Game.DisablePlayerControls()  ;enabled in HarkonChangedRace

	endif

EndFunction

Function HarkonChangedRace()
;called by DLC1VQ02HarkonScript attached to DLC1VQ02 Harkon Alias

	;assumes the first time he transforms is to set this stage
	if DLC1VQ02.GetStageDone(15) == false
		;Game.EnablePlayerControls()
		DLC1VQ02.SetStage(15) ;causes Harkon to forcegreet player
		DLC1HarknonActorRef.evaluatePackage()
	endif

	; When Harkon reverts back from being a Vampire Lord, fix his clothing.
	if DLC1HarknonActorRef.GetRace() != DLC1VampireBeastRace
		DLC1HarknonActorRef.RemoveItem(DLC1ClothesVampireLordRoyalArmor, 999)
		DLC1HarknonActorRef.RemoveItem(DLC1VampireLordCape, 999)
		DLC1HarknonActorRef.SetOutfit(DLC1HarkonDummyOutfit)
		DLC1HarknonActorRef.SetOutfit(DLC1HarkonOutfit)
	endif

EndFunction

Function HarkonChangeBackFromVampireLord()
	Debug.Trace(self + "HarkonChangeBackFromVampireLord()")
	DLC1HarknonActorRef.SetRace(NordRace)
EndFunction

Function NameVampireLord(Actor ActorToRename)
	setStage(10) ;to start storing text
	DisguisedVampireLordName.ForceRefTo(ActorToRename)
	DisguisedVampireLordName.Clear()
EndFunction
