Scriptname DLC2DialogueRRQuestScript extends Quest  Conditional

ObjectReference Property pDLC2RRSolstheimLandingMarker Auto
ObjectReference Property pDLC2RRWindhelmLandingMarker Auto
MiscObject Property pGold001 Auto
;int Property pCostToSail Auto
Worldspace Property DLC2SolstheimWorld Auto
Int Property ShrineTrigger=0  Auto  Conditional
GlobalVariable Property DLC2CostToSail  Auto  
{cost in gold to sail to Solstheim}
GlobalVariable Property DLC2CostToSailx2  Auto  
{cost in gold to sail to Solstheim, paying double}


bool Property FirstTimeToSolstheim = true auto
ObjectReference Property PlayerPlatformInSolstheim auto
ObjectReference Property BoatNavmeshCutter auto
ObjectReference Property BoatRideTarget auto
MusicType Property ArrivalMusic auto
bool Property RidingTheBoat = false auto conditional
bool Property GjalundShouldTalk = false auto conditional
Idle Property BoatRideAnim auto
Idle Property IdleStop auto
ImageSpaceModifier Property FadeToBlack auto
ImageSpaceModifier Property HoldBlack auto
ImageSpaceModifier Property FadeFromBlack auto
ObjectReference[] Property DisableList auto
ReferenceAlias Property DLC2RRASGjalundAlias auto
ObjectReference Property GjalundOutOfSightMarker auto
ObjectReference Property RavenRockBoat auto


Function FadeOut()
	FadeToBlack.Apply()
	Utility.Wait(2.1)
	FadeToBlack.PopTo(HoldBlack)
EndFunction

Function FadeIn()
	HoldBlack.PopTo(FadeFromBlack)
	Utility.Wait(3)
	FadeFromBlack.Remove()
EndFunction

Function SetSail(actor akSpeaker, int iCostFlag = 1)
	; iCostFlag: 0 = free, 1 = normal, 2 = double
	Game.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = true, abSneaking = true, abMenu = true, abActivate = true, abJournalTabs = true)

	Game.GetPlayer().StopCombatAlarm()

	while (akSpeaker.IsInDialogueWithPlayer())
; 			Debug.Trace("DLC2 Boat Ride: Waiting for Gjalund to finish talking...")
			Utility.Wait(0.5)
	endwhile

	; black you out
	FadeOut()
	bool faded = true


	if Game.GetPlayer().GetWorldSpace() == DLC2SolstheimWorld
		; to Skyrim
; 		debug.trace(self + " to Skyrim")
		if iCostFlag == 1
			Game.GetPlayer().RemoveItem(pGold001, DLC2CostToSail.GetValueInt())
		elseif iCostFlag == 2
			Game.GetPlayer().RemoveItem(pGold001, DLC2CostToSailx2.GetValueInt())
		endif
		Game.FastTravel(pDLC2RRWindhelmLandingMarker)
	else
		; to Solstheim
; 		debug.trace(self + " to Solstheim")

		if iCostFlag == 1
			Game.GetPlayer().RemoveItem(pGold001, DLC2CostToSail.GetValueInt())
		elseif iCostFlag == 2
			Game.GetPlayer().RemoveItem(pGold001, DLC2CostToSailx2.GetValueInt())
		endif

		if (FirstTimeToSolstheim)
			FirstTimeToSolstheim = false
			; faded = false
			FirstTimeTravel()
			
; 			Debug.Trace("DLC2 Boat Ride: Fading in...")
			; wait until boat is loaded *or* 3 seconds have passed
			int fadeInDelayCount = 0
			while ((!RavenRockBoat.Is3DLoaded()) && fadeInDelayCount < 30)
				Utility.Wait(0.1)
				fadeInDelayCount += 1
			endwhile
		else
			Game.FastTravel(pDLC2RRSolstheimLandingMarker)
		endif
	endif

	Game.EnablePlayerControls()
	
	if (faded)
		; fade back in
		FadeIn()
	endif

	Game.RequestAutoSave()
endFunction


;; begin follower hilarity -- need to deal with any follower who is not zone-limited
Faction Property WIFollowerCommentFaction auto ; easiest way to check if Serana is currently following

Package Property FollowPackageTemplate auto
Package Property FollowPlayerPackageTemplate auto

ReferenceAlias Property ProperFollower auto
ReferenceAlias Property ProperFollowerAnimal auto

ReferenceAlias Property DA11Verulus auto
Package Property DA11VerulusFollowPlayerPackage auto

ReferenceAlias Property TG08ABrynjolf auto
Package Property TG08ABrynjolfFollowsPlayer auto

ReferenceAlias Property TG08BBrynjolf auto
Package Property TG08BBrynjolfFollowsPlayer auto

ReferenceAlias Property TG08BKarliah auto
Package Property TG08BKarliahFollowsPlayer auto

ReferenceAlias Property TG05Mercer auto
Package Property TG05MercerFollowsPlayerInRuins auto
Package Property TG05MercerFollowsPlayerInRuinsPostDoor auto

ReferenceAlias Property T01Enmon auto
Package Property T01EnmonFollowPlayer auto

ReferenceAlias Property T01Fjotra auto
Package Property T01FjotraFollowPlayer auto

ReferenceAlias Property MQ203Esbern auto
Package Property MQ203EsbernFollowPlayerToSkyHaven auto
Package Property MQ203EsbernFollowPlayerToRiverwood auto

ReferenceAlias Property MQ203Delphine auto
Package Property MQ203DelphineFollowPlayerToSkyHaven auto

ReferenceAlias Property C01Farkas auto
Package Property C01ObserverFollowPackage auto

ReferenceAlias Property C03Aela auto
Package Property C03AelaFollowsPlayerToCamp auto

ReferenceAlias Property C05Vilkas auto 
Package Property C05VilkasFollowPlayer auto

ReferenceAlias Property CR12Aela auto
Package Property CR12AelaFollowPlayer auto

ReferenceAlias Property CR13Questgiver auto
Package Property CR13QuestgiverFollowPlayer auto

ReferenceAlias Property CR14Questgiver auto
Package Property CR14QuestgiverFollowPlayer auto

ReferenceAlias Property MS14Thonnir auto
Package Property MS14ThonnirFollowPC auto

ReferenceAlias Property T03Maurice auto
Package Property T03MauriceFollowPlayer auto

ReferenceAlias Property DBFollower1 auto
Package Property DBInitiate1StateFollowPackage auto

ReferenceAlias Property DBFollower2 auto
Package Property DBInitiate2StateFollowPackage auto

ReferenceAlias Property Cicero auto
Package Property DBCiceroStateFollowPackage auto

ReferenceAlias Property CR08Victim auto
Package Property CR08VictimFollowPlayerPackage auto

ReferenceAlias Property DA03Barbas auto
Package Property DA03BarbasFollowPlayer auto

ReferenceAlias Property DA14Gleda auto
Package Property DA14SammyFollow auto

FormList Property DLC2BoatRideDispelList auto

ObjectReference Property StowPoint auto
ObjectReference Property FollowerReturnPoint auto

Actor[] __currentFollowers
int __numberOfFollowers = 0

bool Function RunningFollowPackage(Actor subject)
	Package currentTemplate = subject.GetCurrentPackage().GetTemplate()
	if (currentTemplate == FollowPackageTemplate || currentTemplate == FollowPlayerPackageTemplate)
		return true
	else
		return false
	endif	
EndFunction

Function AddToFollowerList(Actor follower)
	if (follower == None)
; 		Debug.TraceStack("DLC2 Boat Ride: Won't track a null follower.")
		return
	endif

	if (__currentFollowers.Find(follower) >= 0)
		; already have this follower, moving on
; 		Debug.Trace("DLC2 Boat Ride: Already tracking follower " + follower)
		return
	endif

	__currentFollowers[__numberOfFollowers] = follower
	__numberOfFollowers += 1
EndFunction

Function StowFollowers()
	__currentFollowers = new Actor[32]

	; dismiss summons
	int count = 0
	while (count < DLC2BoatRideDispelList.GetSize())
		Spell gone = DLC2BoatRideDispelList.GetAt(count) as Spell
		if (gone != None)
			Game.GetPlayer().DispelSpell(gone)
		endif
		count += 1
	endwhile

	; Serana
	Quest DLC1SampleForm = Game.GetFormFromFile(0x0000352A, "Dawnguard.esm") as Quest
	if (DLC1SampleForm != None)
		; Dawnguard is loaded; check for Serana
		Actor Serana = Game.GetFormFromFile(0x00002B74, "Dawnguard.esm") as Actor
		if (Serana != None)
			if ( (Serana.IsInFaction(WIFollowerCommentFaction)) || RunningFollowPackage(Serana) )
				AddToFollowerList(Serana)
			endif
		else
			; uh oh
; 			Debug.Trace("ERROR: Dawnguard loaded, but couldn't find Serana.")
		endif
	endif

	; proper followers
	if (ProperFollower.GetActorReference() != None && ProperFollower.GetActorReference().GetActorValue("WaitingForPlayer") == 0.0)
		AddToFollowerList(ProperFollower.GetActorReference())
	endif
	if (ProperFollowerAnimal.GetActorReference() != None && ProperFollowerAnimal.GetActorReference().GetActorValue("WaitingForPlayer") == 0.0)
		AddToFollowerList(ProperFollowerAnimal.GetActorReference())
	endif

	;; begin special cases
	if (DA11Verulus.GetOwningQuest().IsRunning() && DA11Verulus.GetActorReference() != None)
		if (DA11Verulus.GetActorReference().GetCurrentPackage() == DA11VerulusFollowPlayerPackage)
			AddToFollowerList(DA11Verulus.GetActorReference())
		endif
	endif

	if (TG08ABrynjolf.GetOwningQuest().IsRunning() && TG08ABrynjolf.GetActorReference() != None)
		if (TG08ABrynjolf.GetActorReference().GetCurrentPackage() == TG08ABrynjolfFollowsPlayer)
			AddToFollowerList(TG08ABrynjolf.GetActorReference())
		endif
	endif

	if (TG08BBrynjolf.GetOwningQuest().IsRunning() && TG08BBrynjolf.GetActorReference() != None)
		if (TG08BBrynjolf.GetActorReference().GetCurrentPackage() == TG08BBrynjolfFollowsPlayer)
			AddToFollowerList(TG08BBrynjolf.GetActorReference())
		endif
	endif

	if (TG08BKarliah.GetOwningQuest().IsRunning() && TG08BKarliah.GetActorReference() != None)
		if (TG08BKarliah.GetActorReference().GetCurrentPackage() == TG08BKarliahFollowsPlayer)
			AddToFollowerList(TG08BKarliah.GetActorReference())
		endif
	endif

	if (TG05Mercer.GetOwningQuest().IsRunning() && TG05Mercer.GetActorReference() != None)
		if (TG05Mercer.GetActorReference().GetCurrentPackage() == TG05MercerFollowsPlayerInRuins)
			AddToFollowerList(TG05Mercer.GetActorReference())
		endif
		if (TG05Mercer.GetActorReference().GetCurrentPackage() == TG05MercerFollowsPlayerInRuinsPostDoor)
			AddToFollowerList(TG05Mercer.GetActorReference())
		endif
	endif

	if (T01Enmon.GetOwningQuest().IsRunning() && T01Enmon.GetActorReference() != None)
		if (T01Enmon.GetActorReference().GetCurrentPackage() == T01EnmonFollowPlayer)
			AddToFollowerList(T01Enmon.GetActorReference())
		endif
	endif

	if (T01Fjotra.GetOwningQuest().IsRunning() && T01Fjotra.GetActorReference() != None)
		if (T01Fjotra.GetActorReference().GetCurrentPackage() == T01FjotraFollowPlayer)
			AddToFollowerList(T01Fjotra.GetActorReference())
		endif
	endif

	if (MQ203Esbern.GetOwningQuest().IsRunning() && MQ203Esbern.GetActorReference() != None)
		if (MQ203Esbern.GetActorReference().GetCurrentPackage() == MQ203EsbernFollowPlayerToRiverwood)
			AddToFollowerList(MQ203Esbern.GetActorReference())
		endif
		if (MQ203Esbern.GetActorReference().GetCurrentPackage() == MQ203EsbernFollowPlayerToSkyHaven)
			AddToFollowerList(MQ203Esbern.GetActorReference())
		endif
	endif

	if (MQ203Delphine.GetOwningQuest().IsRunning() && MQ203Delphine.GetActorReference() != None)
		if (MQ203Delphine.GetActorReference().GetCurrentPackage() == MQ203DelphineFollowPlayerToSkyHaven)
			AddToFollowerList(MQ203Delphine.GetActorReference())
		endif
	endif

	if (C01Farkas.GetOwningQuest().IsRunning() && C01Farkas.GetActorReference() != None)
		if (C01Farkas.GetActorReference().GetCurrentPackage() == C01ObserverFollowPackage)
			AddToFollowerList(C01Farkas.GetActorReference())
		endif
	endif

	if (C03Aela.GetOwningQuest().IsRunning() && C03Aela.GetActorReference() != None)
		if (C03Aela.GetActorReference().GetCurrentPackage() == C03AelaFollowsPlayerToCamp)
			AddToFollowerList(C03Aela.GetActorReference())
		endif
	endif

	if (C05Vilkas.GetOwningQuest().IsRunning() && C05Vilkas.GetActorReference() != None)
		if (C05Vilkas.GetActorReference().GetCurrentPackage() == C05VilkasFollowPlayer)
			AddToFollowerList(C05Vilkas.GetActorReference())
		endif
	endif

	if (CR12Aela.GetOwningQuest().IsRunning() && CR12Aela.GetActorReference() != None)
		if (CR12Aela.GetActorReference().GetCurrentPackage() == CR12AelaFollowPlayer)
			AddToFollowerList(CR12Aela.GetActorReference())
		endif
	endif

	if (CR13Questgiver.GetOwningQuest().IsRunning() && CR13Questgiver.GetActorReference() != None)
		if (CR13Questgiver.GetActorReference().GetCurrentPackage() == CR13QuestgiverFollowPlayer)
			AddToFollowerList(CR13Questgiver.GetActorReference())
		endif
	endif

	if (CR14Questgiver.GetOwningQuest().IsRunning() && CR14Questgiver.GetActorReference() != None)
		if (CR14Questgiver.GetActorReference().GetCurrentPackage() == CR14QuestgiverFollowPlayer)
			AddToFollowerList(CR14Questgiver.GetActorReference())
		endif
	endif

	if (MS14Thonnir.GetOwningQuest().IsRunning() && MS14Thonnir.GetActorReference() != None)
		if (MS14Thonnir.GetActorReference().GetCurrentPackage() == MS14ThonnirFollowPC)
			AddToFollowerList(MS14Thonnir.GetActorReference())
		endif
	endif

	if (T03Maurice.GetOwningQuest().IsRunning() && T03Maurice.GetActorReference() != None)
		if (T03Maurice.GetActorReference().GetCurrentPackage() == T03MauriceFollowPlayer)
			AddToFollowerList(T03Maurice.GetActorReference())
		endif
	endif

	if (DBFollower1.GetOwningQuest().IsRunning() && DBFollower1.GetActorReference() != None)
		if (DBFollower1.GetActorReference().GetCurrentPackage() == DBInitiate1StateFollowPackage)
			AddToFollowerList(DBFollower1.GetActorReference())
		endif
	endif

	if (DBFollower2.GetOwningQuest().IsRunning() && DBFollower2.GetActorReference() != None)
		if (DBFollower2.GetActorReference().GetCurrentPackage() == DBInitiate2StateFollowPackage)
			AddToFollowerList(DBFollower2.GetActorReference())
		endif
	endif

	if (Cicero.GetOwningQuest().IsRunning() && Cicero.GetActorReference() != None)
		if (Cicero.GetActorReference().GetCurrentPackage() == DBCiceroStateFollowPackage)
			AddToFollowerList(Cicero.GetActorReference())
		endif
	endif

	if (CR08Victim.GetOwningQuest().IsRunning() && CR08Victim.GetActorReference() != None)
		if (CR08Victim.GetActorReference().GetCurrentPackage() == CR08VictimFollowPlayerPackage)
			AddToFollowerList(CR08Victim.GetActorReference())
		endif
	endif

	if (DA03Barbas.GetOwningQuest().IsRunning() && DA03Barbas.GetActorReference() != None)
		if (DA03Barbas.GetActorReference().GetCurrentPackage() == DA03BarbasFollowPlayer)
			AddToFollowerList(DA03Barbas.GetActorReference())
		endif
	endif

	if (DA14Gleda.GetOwningQuest().IsRunning() && DA14Gleda.GetActorReference() != None)
		if (DA14Gleda.GetActorReference().GetCurrentPackage() == DA14SammyFollow)
			AddToFollowerList(DA14Gleda.GetActorReference())
		endif
	endif
	;; end special cases

	; churn through the actors we found
	count = 0
	while (count < __numberOfFollowers)
		Actor follower = __currentFollowers[count]
; 		Debug.Trace("DLC2 Boat Ride: Stowing follower " + follower)
		follower.MoveTo(StowPoint)
		follower.EnableAI(false)
		
		count += 1
	endwhile

EndFunction

Function RestoreFollowers()
	int count = 0
	while (count < __numberOfFollowers)
		Actor follower = __currentFollowers[count]
; 		Debug.Trace("DLC2 Boat Ride: Restoring follower " + follower)
		follower.MoveTo(FollowerReturnPoint)
		follower.EnableAI(true)

		count += 1
	endwhile

	__currentFollowers = None
	__numberOfFollowers = 0
EndFunction
;; end follower hilarity

Function FirstTimeTravel()
	RidingTheBoat = true

	Game.ForceFirstPerson()

	DLC2RRASGjalundAlias.GetActorRef().MoveTo(GjalundOutOfSightMarker)
	int count = 0
	while (count < DisableList.length)
		DisableList[count].DisableNoWait()
		count += 1
	endwhile

	; PlayerPlatformInSolstheim.Enable()
	BoatNavmeshCutter.Enable()
	Game.FastTravel(BoatRideTarget)

	StowFollowers()

	Game.GetPlayer().PlayIdle(BoatRideAnim)

	ArrivalMusic.Add()

	FadeIn()

; 	Debug.Trace("DLC2 Boat Ride: Waiting for CaptainTalk event...")
	; Game.GetPlayer().WaitForAnimationEvent("CaptainTalk")
	Utility.Wait(7)
	GjalundShouldTalk = true

; 	Debug.Trace("DLC2 Boat Ride: Waiting for BoatRideFade event...")
	Game.GetPlayer().WaitForAnimationEvent("BoatRideFadeOut")
	; Utility.Wait(15)
	FadeOut()

	Game.GetPlayer().PlayIdle(IdleStop)

	FinishBoatRide()
	RidingTheBoat = false
EndFunction

bool __finishedBoatRide = false
Function FinishBoatRide()
	if (__finishedBoatRide)
		return
	endif
	__finishedBoatRide = true

	int count = 0
	while (count < DisableList.length)
		DisableList[count].EnableNoWait()
		count += 1
	endwhile

	; PlayerPlatformInSolstheim.Disable()
	BoatNavmeshCutter.Disable()

	RestoreFollowers()

	Utility.Wait(2.0)
EndFunction

