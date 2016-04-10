Scriptname DLC1RadiantScript extends Quest Conditional
{Master script for DLC1 Radiant Quests. Attached to DLC1_Radiant quest.}

ReferenceAlias Property CurrentQuestGiver auto

Faction Property DLC1RadiantVampireBanditNecroAllys auto
Faction Property BanditFaction auto
Faction Property NecromancerFaction auto

keyword Property DLC1RadiantHunterStart auto
keyword Property DLC1RadiantVampireStart auto
keyword Property DLC1RadiantHunterTechStart auto

globalVariable Property DLC1IntroCompletedHunter auto
globalVariable Property DLC1IntroCompletedVampire auto

Location Property DLC1HunterHQLocation auto
Location Property DLC1VampireCastleLocation auto

Perk Property DLC1VampireTurnPerk auto

int Property QuestState auto hidden	;0 = unset, 1 = quest is starting, 2 = quest is running

;for use with IsHighProfileTarget()
Formlist Property DLC1RadiantHighProfileFactions auto

DLC1VampireTurnScript Property DLC1VampireTurn auto

ObjectReference Property DLC1VendorChestSorineJurardRef auto

ObjectReference Property DLC1DawnguardArmoredTrollSpawnMarker auto

ActorBase Property DLC1LvlTrollArmoredPlayerFollower auto
ReferenceAlias Property TrollFollower auto	
bool property PlayerHasTroll auto Conditional hidden
DialogueFollowerScript property DialogueFollower auto
Message Property DLC1TrollFollowerDismissedMsg auto
GlobalVariable Property DLC1TrollCost auto

MiscObject Property Gold001 auto


objectReference Property DLC1BloodChaliceActivatorEmptyRef auto
objectReference Property DLC1BloodChaliceActivatorFullRef auto


globalVariable Property GameDaysPassed auto
GlobalVariable Property DLC1VampireChaliceLevel auto
GlobalVariable Property DLC1VampireChaliceStopDay auto	;when does the player's extra power stop, expressed in terms of GameDaysPassed
Spell Property DLC1VampireChalicePower auto
float ChaliceStopDay

Spell Property DLC1dunRedwaterDenPower auto
Spell Property DLC1dunRedwaterDenWithdrawl auto
GlobalVariable Property DLC1dunRedwaterDenPowerStopDay auto
GlobalVariable Property DLC1dunRedwaterDenWithdrawalStopDay auto



Faction Property CrimeFactionEastmarch auto
Faction Property CrimeFactionFalkreath auto
Faction Property CrimeFactionHaafingar auto
Faction Property CrimeFactionHjaalmarch auto
Faction Property CrimeFactionPale auto
Faction Property CrimeFactionReach auto
Faction Property CrimeFactionRift auto
Faction Property CrimeFactionWhiterun auto
Faction Property CrimeFactionWinterhold auto

Location Property EastmarchHoldLocation auto
Location Property FalkreathHoldLocation auto
Location Property HaafingarHoldLocation auto
Location Property HjaalmarchHoldLocation auto
Location Property PaleHoldLocation auto
Location Property ReachHoldLocation auto
Location Property RiftHoldLocation auto
Location Property WhiterunHoldLocation auto
Location Property WinterholdHoldLocation auto

keyword Property LocTypeHold auto

ActorBase Property LvlVampire auto

potion Property DLC1BloodPotion auto
LeveledItem Property DLC1RadiantReward auto

Faction Property DLC1HunterFaction auto
Faction Property DLC1VampireFaction auto

GlobalVariable Property DLC1WENextSpecialAttackDay auto

Quest Property DLC1VQ01 auto
Quest Property DLC1VQ02 auto
Quest Property DLC1VQ03Hunter auto
Quest Property DLC1VQ03Vampire auto
Quest Property DLC1VQ04 auto
Quest Property DLC1VQ05 auto
Quest Property DLC1VQ06 auto
Quest Property DLC1VQ07 auto
Quest Property DLC1VQ08 auto

bool isQuestAccepted


ActorBase[] Property DisguisedHunterActorBases auto
ActorBase[] Property DisguisedVampireActorBases auto


keyword Property Vampire auto

Event OnUpdateGameTime()
	;right now the only thing that is calling RegisterForGameTime is ChaliceDrink()
	;if that changes you'll need to wrap this in an if statement: "if GameDaysPassed <= ChaliceStopDay"
	;(and pad the RegisterForGameTime a few extra hours to be on the safe side)
	Game.GetPlayer().RemoveSpell(DLC1VampireChalicePower)

EndEvent

function IntroQuestCompleted(bool isHunterQuest = false, bool isVampireQuest = false)
	globalVariable GlobalToSet
	int QuestType

	Actor PlayerRef = Game.GetPlayer()

	if isHunterQuest
		GlobalToSet = DLC1IntroCompletedHunter
		PlayerRef.AddToFaction(DLC1HunterFaction)
		QuestType = 1
	elseif isVampireQuest
		GlobalToSet = DLC1IntroCompletedVampire
		PlayerRef.addToFaction(DLC1VampireFaction)
		QuestType = 2
	endif

	Debug.Trace(self + "IntroQuestCompleted() setting global " + GlobalToSet + " to 1, and will call CreateQuest(" + QuestType + ")")
	GlobalToSet.SetValue(1)
	CreateQuest(QuestType)

	;add support for new Tech "questline"
	if isHunterQuest
		Debug.Trace(self + "IntroQuestCompleted() calling CreateQuestHunterTech()")
		CreateQuestHunterTech()
	endif

EndFunction

Function CreateQuestHunter()
	Debug.Trace(self + "CreateQuestHunter()")
	CreateQuest(1)
EndFunction

Function CreateQuestVampire()
	Debug.Trace(self + "CreateQuestVampire()")
	CreateQuest(2)
EndFunction

Function CreateQuestHunterTech()
	Debug.Trace(self + "CreateQuestHunterTech()")
	CreateQuest(3)
EndFunction

Function CreateQuestBasedOnLocation(Location Loc)
	Debug.Trace(self + "CreateQuestBasedOnLocation(" + Loc +")")

	If Loc != None

		if (Loc == DLC1HunterHQLocation || DLC1HunterHQLocation.IsChild(Loc))
			CreateQuestHunter()
			CreateQuestHunterTech()
		elseif (Loc == DLC1VampireCastleLocation || DLC1VampireCastleLocation.IsChild(Loc))
			CreateQuestVampire()
		else
			Debug.Trace(self + "CreateQuestBasedOnLocation(" + Loc +") is NOT creating a quest: as Location is neither DLC1HunterHQLocation nor DLC1VampireCastleLocation")
		endif

	else
		Debug.Trace(self + "CreateQuestBasedOnLocation(" + Loc +") is NOT creating a quest: as Location is None. ")
	endif
EndFunction

Function CreateQuest(int QuestType)
	if QuestState > 0 && QuestType !=3   ;added type 3 after the fact, which can happen simultaneously with the other types of quests
		Debug.Trace(self + "CreateQuest() Not starting quest, because QuestState[" + QuestState + "] > 0 meaning a radiant quest is already starting or running.")
		RETURN

	elseif QuestType == 1 && DLC1IntroCompletedHunter.GetValue() != 1
		Debug.Trace(self + "CreateQuest() will not start a Hunter quest because DLC1IntroCompletedHunter global != 1")
		RETURN

	elseif QuestType == 2 && DLC1IntroCompletedVampire.GetValue() != 1
		Debug.Trace(self + "CreateQuest() will not start a Hunter quest because DLC1IntroCompletedVampire global != 1")
		RETURN

	elseif QuestType == 3 && DLC1IntroCompletedHunter.GetValue() != 1
		Debug.Trace(self + "CreateQuest() will not start a HunterTech quest because DLC1IntroCompletedHunter global != 1")
		RETURN

	endif

	if QuestType != 3  ;note, there is only one quest that can fire for type 3, so while waste of time, nothing will break if we send an event to the story manager to start that quest and it's already running, it will simply fail to start
		QuestState = 1	;lock the function from creating more quests
	endif

	;QuestType 1 = hunter, 2 = vampire, 3 = hunterTech
	if (QuestType) == 1
	
		Debug.Trace(self + "CreateQuest() calling DLC1RadiantHunterStart.SendStoryEvent() to create a hunter radiant quest")
		if DLC1RadiantHunterStart.SendStoryEventAndWait(akLoc = None, akRef1 = None, akRef2 = None, aiValue1 = 0, aiValue2 = 0)
			Debug.Trace(self + "CreateQuest() SUCCESS!")
			QuestState = 1
		else
			Debug.Trace(self + "CreateQuest() FAILED TO START A QUEST!", 2)
			QuestState = 0
		endif

	elseif (QuestType) == 2

		Debug.Trace(self + "calling DLC1RadiantVampireStart.SendStoryEvent() to create a vampire radiant quest")
		if DLC1RadiantVampireStart.SendStoryEventAndWait(akLoc = None, akRef1 = None, akRef2 = None, aiValue1 = 0, aiValue2 = 0)
			Debug.Trace(self + "CreateQuest() SUCCESS!")
			QuestState = 1
		else
			Debug.Trace(self + "CreateQuest() FAILED TO START A QUEST!", 2)
			QuestState = 0
		endif	

	elseif (QuestType) == 3
	
		Debug.Trace(self + "CreateQuest() calling DLC1RadiantHunterTechStart.SendStoryEvent() to create a hunter radiant quest")
		if DLC1RadiantHunterTechStart.SendStoryEventAndWait(akLoc = None, akRef1 = None, akRef2 = None, aiValue1 = 0, aiValue2 = 0)
			Debug.Trace(self + "CreateQuest() SUCCESS!")
;			QuestState = 1
		else
			Debug.Trace(self + "CreateQuest() FAILED TO START A QUEST!", 2)
;			QuestState = 0
		endif

	endif

EndFunction

Function StopQuestAndStartNewOne(Quest CallingQuest, int QuestType)
	;QuestType 1 = hunter, 2 = vampire
	Debug.Trace(self + "StopQuestAndStartNewOne() will call stop() on " + CallingQuest)
	CallingQuest.Stop()

	;make sure the current quest finishes shutting down before starting a new one. Just in case this is the only quest that can fill alias.
	int waitingFor
	While CallingQuest.IsStopped() == false
		utility.wait(1)
		waitingFor += 1
		Debug.Trace(self + "StopQuestAndStartNewOne waiting for CallingQuest[ " +  CallingQuest+ "] to stop before starting new one. WaitingFor: " + WaitingFor)
	endWhile

	Debug.Trace(self + "StopQuestAndStartNewOne() calling CreateQuest()")
	
	if QuestType != 3
		QuestState = 0
	endif
	
	CreateQuest(QuestType)
EndFunction

Function StopQuestAndStartNewOneHunter(Quest CallingQuest)
	StopQuestAndStartNewOne(CallingQuest, 1)
EndFunction

Function StopQuestAndStartNewOneVampire(Quest CallingQuest)
	StopQuestAndStartNewOne(CallingQuest, 2)
EndFunction

Function StopQuestAndStartNewOneHunterTech(Quest CallingQuest)
	StopQuestAndStartNewOne(CallingQuest, 3)
EndFunction


bool Function IsActorInFactionInFormlist(Actor ActorToCheck, Formlist FormlistToCheck)
	int count = 0
	int maxSize = FormlistToCheck.GetSize()
	
	faction currentFaction

	while (count < maxSize)
		currentFaction = FormlistToCheck.GetAt(count) as Faction
		if currentFaction && ActorToCheck.IsInFaction(currentFaction)
			RETURN TRUE
		endif
		count += 1
	endwhile

	RETURN FALSE
EndFunction


;for use with DLC1RV03KillActorMonitorScript
bool Function IsHighProfileTarget(ObjectReference akVictim)
	Actor Victim = akVictim as Actor

	return IsActorInFactionInFormlist(Victim, DLC1RadiantHighProfileFactions)

EndFunction

Function QuestGiverObjective(ObjectReference ReferenceToMakeQuestGiver)
	Debug.Trace(self + "QuestGiverObjective() ReferenceToMakeQuestGiver == " + ReferenceToMakeQuestGiver)
	
	if isQuestAccepted == false

		;turn off object
		SetObjectiveDisplayed(10, abDisplayed = false,  abForce = false)

		;turn it back on after making new questgiver
		CurrentQuestGiver.ForceRefTo(ReferenceToMakeQuestGiver)

		SetObjectiveDisplayed(10, abDisplayed = true,  abForce = true)

	else
		Debug.Trace(self + "QuestGiverObjective() is not turning on objective because isQuestAccepted == true")

	endif


EndFunction

Function QuestAccepted(Quest QuestThatStarted) ;called by DLC1Rxxx quests
	isQuestAccepted = true
	TurnOffQuestGiverObjective()
EndFunction

Function TurnOffQuestGiverObjective() 
	SetObjectiveDisplayed(10, abDisplayed = false,  abForce = false)
EndFunction

Function GiveQuestReward(int ChanceForBloodPotion = 0)

	bool bloodPotion = Utility.RandomInt(1, 100) <= ChanceForBloodPotion

	if bloodPotion
		Game.GetPlayer().AddItem(DLC1BloodPotion, 3)
	else
		Game.GetPlayer().AddItem(DLC1RadiantReward, 1)
	endif

	isQuestAccepted = false

EndFunction


;Called by DLC1RH05 and passes in the item the player got as DLC1RH05DwarvenTechScript attached to the item which holds a property of which global to turn on for leveled lists
Function EnableDwarvenTech(DLC1RH05DwarvenTechScript DwarvenTechItem)
	
	globalVariable myGlobal = DwarvenTechItem.myGlobal

	Debug.Trace(self + "EnableDwarvenTech([" + DwarvenTechItem + "]) setting myGlobal[" + myGlobal + "] to 0 and resetting DLC1VendorChestSorineJurardRef")
	myGlobal.SetValue(0)
	DLC1VendorChestSorineJurardRef.Reset()

EndFunction

Function MakeTrollFollower(ObjectReference TrollToMakeFollower = None, bool ChargePlayer = true)
{if TrollToMakeFollower == None, create one instead}
	Debug.Trace(self + "MakeTrollFollower(), TrollToMakeFollower (new one if none):" + TrollToMakeFollower)

	if ChargePlayer == true
		Game.GetPlayer().RemoveItem(Gold001, DLC1TrollCost.GetValue() as int)
	endif

	if TrollToMakeFollower
		TrollFollower.ForceRefTo(TrollToMakeFollower)
	else
		TrollFollower.ForceRefTo(DLC1DawnguardArmoredTrollSpawnMarker.PlaceAtMe(DLC1LvlTrollArmoredPlayerFollower))
	endif
		

	PlayerHasTroll = true

	if DialogueFollower.pPlayerAnimalCount.GetValue() >= 1
		DialogueFollower.DismissAnimal()
	endif
		
	DialogueFollower.pPlayerAnimalCount.SetValue(1)

	TrollFollower.GetActorReference().SetPlayerTeammate(abCanDoFavor = false)
	
EndFunction

Function TrollDies();called by DLC1RadiantTrollFollowerScript on TrollFollower alias
	debug.Trace(self + "TrollDies()")
	PlayerHasTroll = false
	TrollFollower.Clear()
	DialogueFollower.pPlayerAnimalCount.SetValue(0)
	
	(TrollFollower.GetReference() as DLC1TrollArmoredPlayerFollower).DeleteMe()

EndFunction

function TrollAbandoned(Actor Troll)
	debug.Trace(self + "TrollAbandoned()")
	PlayerHasTroll = false
	TrollFollower.Clear()
	DialogueFollower.pPlayerAnimalCount.SetValue(0)
	Troll.Delete()
	
	DLC1TrollFollowerDismissedMsg.Show()
EndFunction

Function TrollWait()

	TrollFollower.GetActorReference().SetAv("WaitingForPlayer", 1)

EndFunction

Function TrollFollow()

	TrollFollower.GetActorReference().SetAv("WaitingForPlayer", 0)

EndFunction

Function TrollDismissed()
	DLC1TrollArmoredPlayerFollower Troll = TrollFollower.GetActorReference() as DLC1TrollArmoredPlayerFollower

	PlayerHasTroll = false
	Troll.setav("aggression", 1)
	TrollFollower.Clear()
	DialogueFollower.pPlayerAnimalCount.SetValue(0)
	Troll.StopCombatAlarm()
	Troll.SetPlayerTeammate(false)

	Troll.DeleteMe()

	DLC1TrollFollowerDismissedMsg.Show()
EndFunction

Function ChaliceRemoved()
	;disable chalices
	Debug.Trace(self + "ChaliceRemoved()")
	DLC1BloodChaliceActivatorEmptyRef.disable()
	DLC1BloodChaliceActivatorFullRef.disable()
EndFunction

Function ChaliceFilled()
	;enable the blood filled one
	Debug.Trace(self + "ChaliceFilled()")
	DLC1BloodChaliceActivatorEmptyRef.disable()
	DLC1BloodChaliceActivatorFullRef.enable()

EndFunction

function ChalicePowerUp()
	int NewLevel = (DLC1VampireChaliceLevel.GetValue() as int) + 1

	if NewLevel > 4
		Debug.Trace(self + "ChalicePowerUp() NewLevel > 4, clamping down to 4")
		NewLevel = 4
	endif	

	Debug.Trace(self + "ChalicePowerUp() current DLC1VampireChaliceLevel NewLevel:" + NewLevel)
	
	Game.GetPlayer().RemoveSpell(DLC1VampireChalicePower)

	DLC1VampireChaliceLevel.SetValue(NewLevel)

EndFunction

function ChaliceDrink()
	float today = GameDaysPassed.GetValue()
	float chaliceLevel = DLC1VampireChaliceLevel.GetValue()
	int daysToHavePower

	RemoveRedwaterDenEffects(today)

	if chaliceLevel == 0
		daysToHavePower = 1

	elseif chaliceLevel == 1
		daysToHavePower = 3

	elseif chaliceLevel == 2
		daysToHavePower = 5

	elseif chaliceLevel == 3
		daysToHavePower = 7

	else
		daysToHavePower = 9

	endif

	;ChaliceStopDay defined at top script
	ChaliceStopDay = today + daysToHavePower

	Debug.Trace(self + "ChaliceDrink() setting DLC1VampireChaliceStopDay to " + ChaliceStopDay)
	DLC1VampireChaliceStopDay.SetValue(ChaliceStopDay)
	
	RegisterForSingleUpdateGameTime(24 * daysToHavePower)

	if Game.GetPlayer().HasKeyword(Vampire)
		Game.GetPlayer().AddSpell(DLC1VampireChalicePower)
	endif

EndFunction

Function RemoveRedwaterDenEffects(float today)
	if Game.GetPlayer().HasSpell(DLC1dunRedwaterDenPower)
		Game.GetPlayer().RemoveSpell(DLC1dunRedwaterDenPower)
		DLC1dunRedwaterDenPowerStopDay.SetValue(today - 1)
	endif

	if Game.GetPlayer().HasSpell(DLC1dunRedwaterDenWithdrawl)
		 Game.GetPlayer().RemoveSpell(DLC1dunRedwaterDenWithdrawl)
		 DLC1dunRedwaterDenWithdrawalStopDay.SetValue(today - 1)
	endif

EndFunction


faction function GetCrimeFactionForHoldLocation(Location HoldLocation)

	Faction FactionToReturn

	if HoldLocation == EastmarchHoldLocation
		FactionToReturn = CrimeFactionEastmarch

	elseif HoldLocation == FalkreathHoldLocation
		FactionToReturn = CrimeFactionFalkreath

	elseif HoldLocation == HaafingarHoldLocation
		FactionToReturn = CrimeFactionHaafingar

	elseif HoldLocation == HjaalmarchHoldLocation
		FactionToReturn = CrimeFactionHjaalmarch

	elseif HoldLocation == PaleHoldLocation
		FactionToReturn = CrimeFactionPale

	elseif HoldLocation == ReachHoldLocation
		FactionToReturn = CrimeFactionReach

	elseif HoldLocation == RiftHoldLocation
		FactionToReturn = CrimeFactionRift

	elseif HoldLocation == WhiterunHoldLocation
		FactionToReturn = CrimeFactionWhiterun

	elseif HoldLocation == WinterholdHoldLocation
		FactionToReturn = CrimeFactionWinterhold

	endif

	return FactionToReturn

EndFunction

bool Function IsActorCurrentlyInLocation(Actor ActorToCheck, location LocationToCheck)
	
	bool ReturnVal = false

	if ActorToCheck.IsInLocation(LocationToCheck)
		returnVal = true
	endif

	Debug.Trace(self + "IsActorCurrentlyInLocation(" + ActorToCheck + ", " + LocationToCheck + ") == " + returnVal)

	return returnVal

EndFunction

location Function GetCurrentHoldLocationForActor(Actor ActorToCheck)
	
	location LocationToReturn

	if IsActorCurrentlyInLocation(ActorToCheck, EastmarchHoldLocation)
		LocationToReturn = EastmarchHoldLocation

	elseif IsActorCurrentlyInLocation(ActorToCheck, FalkreathHoldLocation)
		LocationToReturn = FalkreathHoldLocation

	elseif IsActorCurrentlyInLocation(ActorToCheck, HaafingarHoldLocation)
		LocationToReturn = HaafingarHoldLocation

	elseif IsActorCurrentlyInLocation(ActorToCheck, HjaalmarchHoldLocation)
		LocationToReturn = HjaalmarchHoldLocation

	elseif IsActorCurrentlyInLocation(ActorToCheck, PaleHoldLocation)
		LocationToReturn = PaleHoldLocation

	elseif IsActorCurrentlyInLocation(ActorToCheck, ReachHoldLocation)
		LocationToReturn = ReachHoldLocation

	elseif IsActorCurrentlyInLocation(ActorToCheck, RiftHoldLocation)
		LocationToReturn = RiftHoldLocation

	elseif IsActorCurrentlyInLocation(ActorToCheck, WhiterunHoldLocation)
		LocationToReturn = WhiterunHoldLocation

	elseif IsActorCurrentlyInLocation(ActorToCheck, WinterholdHoldLocation)
		LocationToReturn = WinterholdHoldLocation

	endif

	Debug.Trace(self + "GetCurrentHoldLocationForActor(" + ActorToCheck + ") returning: " + LocationToReturn)

	return LocationToReturn

EndFunction

faction function GetCrimeFactionForActorsCurrentLocation(Actor ActorToCheck)
	Debug.Trace(self + "GetCrimeFactionForActorsCurrentLocation(" + ActorToCheck + ")")

	Location CurrentHoldLocation = GetCurrentHoldLocationForActor(ActorToCheck)
	Faction FactionToReturn = GetCrimeFactionForHoldLocation(CurrentHoldLocation)

	Debug.Trace(self + "GetCrimeFactionForActorsCurrentLocation(" + ActorToCheck +") returning: " + FactionToReturn)

	Return FactionToReturn

EndFunction

bool Function AddActorToCrimeFactionForCurrentLocation(Actor ActorToAddCrimeFactionTo)
	Debug.Trace(self + "AddActorToCrimeFactionForCurrentLocation(" + ActorToAddCrimeFactionTo + ")")

	bool ReturnVal

	faction crimeFaction = GetCrimeFactionForActorsCurrentLocation(ActorToAddCrimeFactionTo)

	if CrimeFaction
		ActorToAddCrimeFactionTo.SetCrimeFaction(crimeFaction)
		returnVal = true
	else
		returnVal = false
	endif

	Debug.Trace(self + "AddActorToCrimeFactionForCurrentLocation(" + ActorToAddCrimeFactionTo + ") adding to crime faction: " + crimeFaction)

	return returnVal
EndFunction

bool Function AddAliasToCrimeFactionForCurrentLocation(ReferenceAlias AliasToAddCrimeFactionTo)
	Debug.Trace(self + "AddAliasToCrimeFactionForCurrentLocation(" + AliasToAddCrimeFactionTo + ")")

	bool ReturnVal = AddActorToCrimeFactionForCurrentLocation(AliasToAddCrimeFactionTo.GetActorReference())

	Return ReturnVal

EndFunction


Function SetDLC1WENextSpecialAttackDay(bool ForceNextWildernessEncounter = false)
;used for special attack the player node in the wilderness encounters, called by DLC1WE07 and DLC1WE08
	;remember the quests are conditioned not to start if Harkon/Isran is dead

	int DaysUntilNextAttack = 5 ;default value

	if ForceNextWildernessEncounter
		debug.trace(self + "SetDLC1WENextSpecialAttackDay() forcing next Wilderness Encounter")
		DLC1WENextSpecialAttackDay.SetValue(0)
		RETURN

	elseif DLC1VQ06.GetStageDone(10)
		DaysUntilNextAttack = 3

	elseif DLC1VQ07.GetStageDone(10)
		DaysUntilNextAttack = 2

	endif

	DLC1WENextSpecialAttackDay.SetValue(GameDaysPassed.GetValue() + DaysUntilNextAttack)

	debug.trace(self + "SetDLC1WENextSpecialAttackDay() DLC1WENextSpecialAttackDay = " + DLC1WENextSpecialAttackDay.GetValue())

EndFunction

function GimpAlias(ReferenceAlias AliasToGimp)
{used to make the preexisting boss in the dungeon easier to deal with because i'm spawning a boss vampire that hangs out with him}
	Float GimpPercentage = 0.5	;take this * value, subtract that from value, that'll be your new value

	Actor ActorRef = AliasToGimp.GetActorReference()

	float health = ActorRef.GetActorValue("health")
	float stamina = ActorRef.GetActorValue("stamina")
	float magicka = ActorRef.GetActorValue("magicka")

	Debug.Trace(self + "GimpAlias() starting health, stamina, magicka:" + health + "," + stamina + ", " + magicka)

	health = health - (health * GimpPercentage)
	stamina = stamina - (stamina * GimpPercentage)
	magicka = magicka - (magicka * GimpPercentage)


	ActorRef.ModActorValue("health", - health)
	ActorRef.ModActorValue("stamina", - stamina)
	ActorRef.ModActorValue("magicka", - magicka)

	health = ActorRef.GetActorValue("health")
	stamina = ActorRef.GetActorValue("stamina")
	magicka = ActorRef.GetActorValue("magicka")

	Debug.Trace(self + "GimpAlias() gimped health, stamina, magicka:" + health + "," + stamina + ", " + magicka)


EndFunction

Function CreateDisguisedHunter(ReferenceAlias AliasToForceInto, ReferenceAlias AliasToCreateAt, bool isInitiallyDisabled = true)
	CreateDisguisedActorAndForceIntoAlias(AliasToForceInto, AliasToCreateAt, 1, isInitiallyDisabled)
EndFunction


Function CreateDisguisedVampire(ReferenceAlias AliasToForceInto, ReferenceAlias AliasToCreateAt, bool isInitiallyDisabled = true)
	CreateDisguisedActorAndForceIntoAlias(AliasToForceInto, AliasToCreateAt, 2, isInitiallyDisabled)
EndFunction

function CreateDisguisedActorAndForceIntoAlias(ReferenceAlias AliasToForceInto, ReferenceAlias AliasToCreateAt, int Type, bool isInitiallyDisabled = true)
{Type 1 = Hunter, 2 = Vampire}

	ObjectReference CreateAtRef = AliasToCreateAt.GetReference()
	Actor ActorRef

	if type == 1
		ActorRef = CreateAtRef.PlaceAtMe(PlaceAtMeFromArray(DisguisedHunterActorBases)) as Actor
	else ;assume 2
		ActorRef = CreateAtRef.PlaceAtMe(PlaceAtMeFromArray(DisguisedVampireActorBases)) as Actor
	endif

	if isInitiallyDisabled
		ActorRef.disable()
	endif

	AliasToForceInto.ForceRefTo(ActorRef)

EndFunction

ActorBase Function PlaceAtMeFromArray(ActorBase[] ArrayToCreateFrom)
	
	int index = utility.RandomInt(1, ArrayToCreateFrom.Length) - 1
	
	Return ArrayToCreateFrom[index]


EndFunction