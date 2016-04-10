Scriptname DLC1_NPCMentalModelScript extends Quest Conditional

;; BEGIN AXES
; Short-term variables; range from -3 to 3
;  Affects attitude in the immediate present
int __axisMin = -3
int __axisMax =  3

int[] __axisHistoryGuardedToOpen
int[] __axisHistorySeriousToPlayful

int Property DebugGuardedToOpen
	Function set(int val)
		__axisGuardedToOpen = val
	EndFunction
EndProperty

int Property DebugSeriousToPlayful
	Function set(int val)
		__axisSeriousToPlayful = val
	EndFunction
EndProperty

int __axisGuardedToOpen = 0 conditional
int Property AxisGuardedToOpen
	int function get()
		return __axisGuardedToOpen
	endfunction
	function set(int newValue)
		int oldValue = __axisGuardedToOpen
		__axisGuardedToOpen = ClampInt(newValue, __axisMin, __axisMax)
		if (oldValue < 0 && __axisGuardedToOpen >= 0)
			AxisCrossedOver()
		elseif (oldValue >= 0 && __axisGuardedToOpen < 0)
			AxisCrossedOver()
		endif
	endfunction
EndProperty

int __axisSeriousToPlayful = 0 conditional
int Property AxisSeriousToPlayful
	int function get()
		return __axisSeriousToPlayful
	endfunction
	function set(int newValue)
		int oldValue = __axisSeriousToPlayful
		__axisSeriousToPlayful = ClampInt(newValue, __axisMin, __axisMax)
		if (oldValue < 0 && __axisSeriousToPlayful >= 0)
			AxisCrossedOver()
		elseif (oldValue >= 0 && __axisSeriousToPlayful < 0)
			AxisCrossedOver()
		endif
	endfunction
EndProperty


; animation states that don't 100% map to our internal nomenclature
Function SlamToOpen()
	Debug.Trace("RNPC: Forcing to 'open' animation base.")
	__axisSeriousToPlayful = -3
	__axisGuardedToOpen = 3
	AxisCrossedOver()
EndFunction

Function SlamToGuarded()
	Debug.Trace("RNPC: Forcing to 'guarded' animation base.")
	__axisSeriousToPlayful = -3
	__axisGuardedToOpen = -3
	AxisCrossedOver()
EndFunction

Function SlamToPlayful()
	Debug.Trace("RNPC: Forcing to 'playful' animation base.")
	__axisSeriousToPlayful = 3
	__axisGuardedToOpen = 3
	AxisCrossedOver()
EndFunction

Function SlamToSerious()
	Debug.Trace("RNPC: Forcing to 'serious' animation base.")
	__axisSeriousToPlayful = 3
	__axisGuardedToOpen = -3
	AxisCrossedOver()
EndFunction

;; END AXES


;; BEGIN ASSESSMENTS
; Long-term variables; range from 0 to 10
;  Affects opinion of the player over the course of the relationship
float __assessmentMin =  0.0
float __assessmentMax = 10.0

float[] __assessmentHistoryIntelligence
float[] __assessmentHistoryIndependence

float __playerAssessmentIntelligence = 0.0 conditional
float Property PlayerAssessmentIntelligence
	float function get()
		return __playerAssessmentIntelligence
	endfunction
	function set(float newValue)
		__playerAssessmentIntelligence = ClampFloat(newValue, __assessmentMin, __assessmentMax)
	endfunction
EndProperty

float __playerAssessmentIndependence = 0.0 conditional
float Property PlayerAssessmentIndependence
	float function get()
		return __playerAssessmentIndependence
	endfunction
	function set(float newValue)
		__playerAssessmentIndependence = ClampFloat(newValue, __assessmentMin, __assessmentMax)
	endfunction
EndProperty
;; END ASSESSMENTS


;; BEGIN DERIVED VARIABLES
; Variables that are not pushed directly from the system, but evaluated
;   from other variables. Essentially they just make for easier conditions
;   for packages/conversations/whatnot.


; How close the NPC will follow the player (the actual distances being
;   defined in the appropriate packages). The package stack should start
;   with "Far" on top, so that it is the default. 
bool Property FollowDistanceFar auto conditional
bool Property FollowDistanceMedium auto conditional
bool Property FollowDistanceClose auto conditional

;; END DERIVED VARIABLES


;; ANCHORS
; Anchors are the general place in the personality that the character
;  will return to after a time. The anchor moves as the attitudes towards
;  the player adjust more permamently.

; starts the game serious and slightly guarded
int __axisAnchorGuardedToOpen = -1
int __axisAnchorSeriousToPlayful = -2

; assessment on first waking up from stasis 
;   -- average intelligence, slightly above average independence
float __assessmentAnchorIntelligence = 5.0
float __assessmentAnchorIndependence = 6.5
;; END ANCHORS


;; BEGIN UTILITY FUNCTIONS
Function DebugOutput()
	Debug.OpenUserLog("RNPC_MentalModel")
	Debug.TraceUser("RNPC_MentalModel", " "\
				+ __axisGuardedToOpen + " "\
				+ __axisSeriousToPlayful + " "\
				+ __playerAssessmentIntelligence + " "\
				+ __playerAssessmentIndependence + " "\
				)
EndFunction

Function DumpHistory()
	Debug.OpenUserLog("RNPC_HistoryDump")
	Debug.TraceUser("RNPC_HistoryDump", "FRAME-------------------------------")
	int count = 0
	while (count < __historySize)
		Debug.TraceUser("RNPC_HistoryDump", "" \
					+ __axisHistoryGuardedToOpen[count] + " " \
					+ __axisHistorySeriousToPlayful[count] + " " \
					+ __assessmentHistoryIntelligence[count] + " " \
					+ __assessmentHistoryIndependence[count] + " " \
					)
		count += 1
	endwhile
EndFunction

int Function ClampInt(int value, int min, int max)
	if (value > max)
		value = max
	endif
	if (value < min)
		value = min
	endif
	return value
EndFunction

float Function ClampFloat(float value, float min, float max)
	if (value > max)
		value = max
	endif
	if (value < min)
		value = min
	endif
	return value
EndFunction

Function ModAxis(int axisIndex, int amount)
	; 1 = serious/playful, 2 = guarded/open
	if (axisIndex == 1)
		AxisSeriousToPlayful += amount
	endif
	if (axisIndex == 2)
		AxisGuardedToOpen += amount
	endif	
EndFunction

Function ModAssessment(int assessmentIndex, float amount)
	; 1 = <not used>, 2 = intelligence, 3 = Independence
	if (assessmentIndex == 1)
		; unused
	endif
	if (assessmentIndex == 2)
		PlayerAssessmentIndependence += amount
	endif
	if (assessmentIndex == 3)
		PlayerAssessmentIndependence += amount
	endif
EndFunction

Function IncreaseSerious(int amount = 1)
	ModAxis(1, -amount)
EndFunction

Function IncreasePlayful(int amount = 1)
	ModAxis(1, amount)
EndFunction

Function IncreaseGuarded(int amount = 1)
	ModAxis(2, -amount)
EndFunction

Function IncreaseOpen(int amount = 1)
	ModAxis(2, amount)
EndFunction

Function DecreaseSerious(int amount = 1)
	ModAxis(1, amount)
EndFunction

Function DecreasePlayful(int amount = 1)
	ModAxis(1, -amount)
EndFunction

Function DecreaseGuarded(int amount = 1)
	ModAxis(2, amount)
EndFunction

Function DecreaseOpen(int amount = 1)
	ModAxis(2, -amount)
EndFunction



;;; ASSESSMENT INCREMENTS AND FUNCTIONS
float __minorAssessment = 0.25
float __moderateAssessment = 0.5
float __majorAssessment = 1.0


Function IncreaseIntelligenceMinor()
	ModAssessment(2, __minorAssessment)
EndFunction

Function IncreaseIntelligenceModerate()
	ModAssessment(2, __moderateAssessment)
EndFunction

Function IncreaseIntelligenceMajor()
	ModAssessment(2, __majorAssessment)
EndFunction


Function DecreaseIntelligenceMinor()
	ModAssessment(2, -__minorAssessment)
EndFunction

Function DecreaseIntelligenceModerate()
	ModAssessment(2, -__moderateAssessment)
EndFunction

Function DecreaseIntelligenceMajor()
	ModAssessment(2, -__majorAssessment)
EndFunction


Function IncreaseIndependenceMinor()
	ModAssessment(3, __minorAssessment)
EndFunction

Function IncreaseIndependenceModerate()
	ModAssessment(3, __moderateAssessment)
EndFunction

Function IncreaseIndependenceMajor()
	ModAssessment(3, __majorAssessment)
EndFunction


Function DecreaseIndependenceMinor()
	ModAssessment(3, -__minorAssessment)
EndFunction

Function DecreaseIndependenceModerate()
	ModAssessment(3, -__moderateAssessment)
EndFunction

Function DecreaseIndependenceMajor()
	ModAssessment(3, -__majorAssessment)
EndFunction
;;; END ASSESSMENT INCREMENTS AND FUNCTIONS


Idle Property RF_MoodChangeGuarded auto
Idle Property RF_MoodChangeOpen auto
Idle Property RF_MoodChangeSerious auto
Idle Property RF_MoodChangePlayful auto

bool __axisCrossingTimeout = false

Function AxisCrossedOver()
	if (__axisCrossingTimeout)
		return
	endif
	Debug.Trace("RNPC: Axis crossed.")
	__axisCrossingTimeout = true
	if     (__axisGuardedToOpen <  0 && __axisSeriousToPlayful <  0)
		RNPC.GetActorReference().PlayIdle(RF_MoodChangeGuarded)
	elseif (__axisGuardedToOpen >= 0 && __axisSeriousToPlayful <  0)
		RNPC.GetActorReference().PlayIdle(RF_MoodChangeOpen)
	elseif (__axisGuardedToOpen <  0 && __axisSeriousToPlayful >= 0)
		RNPC.GetActorReference().PlayIdle(RF_MoodChangeSerious)
	elseif (__axisGuardedToOpen >= 0 && __axisSeriousToPlayful >= 0)
		RNPC.GetActorReference().PlayIdle(RF_MoodChangePlayful)
	endif
	Utility.Wait(0.1)
	__axisCrossingTimeout = false
EndFunction

;; END UTILITY FUNCTIONS



;; NPC references
Actor Property Serana auto
ReferenceAlias Property RNPC auto
ReferenceAlias Property RNPC_Essential auto
ReferenceAlias Property RNPC_Keywords auto
;; END NPC references


DLC1NPCMonitoringPlayerScript Property MonitoringQuest auto


int __historySize = 10  ; if this changes, make sure to update 
						;   array declarations below in Setup()


bool __isSetup = false
Function Setup(int forceNPC=0)
	; make sure this only gets called once
	if (__isSetup)
		return
	endif
	__isSetup = true

	Debug.Trace("RNPC: Initiating NPC mental model.")

	; init history tracking
	__axisHistoryGuardedToOpen = new int[10]
	__axisHistorySeriousToPlayful = new int[10]
	__assessmentHistoryIntelligence = new float[10]
	__assessmentHistoryIndependence = new float[10]

	; fill dem arrays
	int count = 0
	while (count < __historySize)
		; everything starts at initial anchor values
		__axisHistoryGuardedToOpen[count] = __axisAnchorGuardedToOpen
		__axisHistorySeriousToPlayful[count] = __axisAnchorSeriousToPlayful
		__assessmentHistoryIntelligence[count] = __assessmentAnchorIntelligence
		__assessmentHistoryIndependence[count] = __assessmentAnchorIndependence
		count += 1
	endwhile

	; set initial values to anchors
	__axisGuardedToOpen = __axisAnchorGuardedToOpen
	__axisSeriousToPlayful = __axisAnchorSeriousToPlayful

	; put Serana into the alias so she'll pick up the right
	;  keywords
	RNPC_Keywords.ForceRefTo(RNPC.GetReference())

	RegisterForSingleUpdate(SecondsBetweenPeriodicUpdates)
EndFunction




;; FOLLOW BEHAVIOR STUFF
bool Property QuestLineCompleted auto conditional

Quest Property DialogueFollower auto
ReferenceAlias Property CentralFollowerAlias auto

bool Property SimpleFollow auto conditional

bool Property PlayerSettled auto conditional

bool Property LockedIn auto conditional
GlobalVariable Property FollowerCount auto

bool Property CanFollow auto conditional
bool Property IsFollowing auto conditional

bool Property IsWillingToWait auto conditional
bool Property IsWaiting auto conditional

bool Property IsDismissed auto conditional
bool Property CanBeDismissed auto conditional

; HACKHACK for VQ04 ending window
bool Property TurnOffComeWithMe = false auto conditional


; The CenterMarker of the cell where she should sandbox if the player
;  has ditched her.
ReferenceAlias Property HomeMarker auto

; Possible values for said marker
ObjectReference Property PreChoiceMarker auto
ObjectReference Property VampHomeMarker auto
ObjectReference Property HunterHomeMarker auto


; faction so she'll comment on the world
Faction Property WIFollowerCommentFaction auto

;; END FOLLOW BEHAVIOR STUFF


Function LockIn()
	Debug.Trace("RNPC: Locking.")
	LockedIn = true

	EngageFollowBehavior(false)

	FollowerCount.SetValue(1)
EndFunction

Function Unlock()
	Debug.Trace("RNPC: Unlocking.")
	LockedIn = false

	DisengageFollowBehavior()

	FollowerCount.SetValue(0)
EndFunction

Function EngageFollowBehavior(bool allowDismiss=false)
	Debug.Trace("RNPC: Engaging follow.")
	if ( (CentralFollowerAlias.GetReference() == None) && (FollowerCount.GetValue() == 0) )
		FollowerCount.SetValue(1)
	endif

	if (QuestLineCompleted)
		allowDismiss = true
	endif
	IsFollowing = true
	IsWaiting = false
	SimpleFollow = false
	CanFollow = true
	IsDismissed = false
	CanBeDismissed = allowDismiss
	RNPC.GetActorReference().SetPlayerTeammate()
	RNPC.GetActorReference().EvaluatePackage()
	RNPC.GetActorReference().AddToFaction(WIFollowerCommentFaction)
	MonitoringQuest.Start()
EndFunction

Function DisengageFollowBehavior()
	Debug.Trace("RNPC: Disengaging follow.")
	
	IsFollowing = false
	IsWaiting = false
	CanBeDismissed = true
	RNPC.GetActorReference().SetPlayerTeammate(false)
	RNPC.GetActorReference().EvaluatePackage()	
	RNPC.GetActorReference().RemoveFromFaction(WIFollowerCommentFaction)
	if ( (CentralFollowerAlias.GetReference() == None) && (FollowerCount.GetValue() == 1) )
		FollowerCount.SetValue(0)
	endif
	MonitoringQuest.Stop()
EndFunction

Function SetHomeMarker(int choiceSet, ObjectReference newHomeMarker=None)
	if (newHomeMarker != None)
		HomeMarker.ForceRefTo(newHomeMarker)
	else
		if     (choiceSet == 1)
			HomeMarker.ForceRefTo(HunterHomeMarker)
		elseif (choiceSet == 2)
			HomeMarker.ForceRefTo(VampHomeMarker)
		endif 
	endif

	;? insert logic to move her there if she's unloaded and not following the player
EndFunction

Function Wait()
	Debug.Trace("RNPC: Being told to wait...")
	if (!IsWillingToWait)
		Debug.Trace("RNPC: ... but not listening.")
		IsWaiting = true
	else
		Debug.Trace("RNPC: ... and obeying.")
		IsWaiting = true
		RNPC.GetActorReference().SetAV("WaitingForPlayer", 1)
		RNPC.GetActorReference().EvaluatePackage()
		(RNPC as DLC1RNPCAliasScript).RegisterForUpdateGameTime(72)
	endif
EndFunction

Function StopWaiting()
	if (IsDismissed)
		EngageFollowBehavior(CanBeDismissed)
	else
		IsWaiting = false
		(RNPC as DLC1RNPCAliasScript).UnregisterForUpdateGameTime()
		RNPC.GetActorReference().SetAV("WaitingForPlayer", 0)
		RNPC.GetActorReference().EvaluatePackage()
	endif
EndFunction

Function FinishWaiting()
	IsWaiting = false
	RNPC.GetActorReference().SetAV("WaitingForPlayer", 0)
	if (CanBeDismissed)
		DisengageFollowBehavior()
		Dismiss()
	endif
	RNPC.GetActorReference().EvaluatePackage()
EndFunction

Function Dismiss()
	if (CanBeDismissed)
		DisengageFollowBehavior()
		IsDismissed = true
		if (CentralFollowerAlias.GetReference() == RNPC.GetReference())
			(DialogueFollower as DialogueFollowerScript).DismissFollower()
		endif
		RNPC.GetActorReference().SetPlayerTeammate(false)
	endif
EndFunction



int Property SecondsBetweenPeriodicUpdates auto

Event OnUpdate()
	Debug.Trace("RNPC: Periodic update check.")
	
	; print debug info for state variables
	DebugOutput()

	; record history
	int count = 0
	while (count < (__historySize - 1))
		__axisHistoryGuardedToOpen[count] = __axisHistoryGuardedToOpen[count+1]
		__axisHistorySeriousToPlayful[count] = __axisHistorySeriousToPlayful[count+1]
		__assessmentHistoryIntelligence[count] = __assessmentHistoryIntelligence[count+1]
		__assessmentHistoryIndependence[count] = __assessmentHistoryIndependence[count+1]
		count += 1
	endwhile

	__axisHistoryGuardedToOpen[__historySize - 1] = __axisGuardedToOpen
	__axisHistorySeriousToPlayful[__historySize - 1] = __axisSeriousToPlayful
	__assessmentHistoryIntelligence[__historySize - 1] = __playerAssessmentIntelligence
	__assessmentHistoryIndependence[__historySize - 1] = __playerAssessmentIndependence


	; calculate follow distance
	; TEMP: just keep it at whatever it is
	if     (FollowDistanceFar)
		FollowDistanceFar = true
		FollowDistanceMedium = false
		FollowDistanceClose = false
	elseif (FollowDistanceMedium)
		FollowDistanceFar = false
		FollowDistanceMedium = true
		FollowDistanceClose = false
	elseif (FollowDistanceClose)
		FollowDistanceFar = false
		FollowDistanceMedium = false
		FollowDistanceClose = true
	else
		FollowDistanceFar = false
		FollowDistanceMedium = false
		FollowDistanceClose = false
	endif

	if (QuestLineCompleted)
		; just in case something went screwy somewhere and these
		;   got stuck
		CanFollow = true
		IsWillingToWait = true
		CanBeDismissed = true
	endif

	CheckOutfit()

	;? regress towards anchors

	;? analyze long-term trends to move anchors

	;? print debug info after transformations
	
	RegisterForSingleUpdate(SecondsBetweenPeriodicUpdates)
EndEvent

Function QuestLineFinish()
	; lock in relationship
EndFunction


FormList Property SunDamageExceptionList auto
Armor Property VampArmor auto
Armor Property Hoodie auto

Function CheckOutfit()
	Actor rnpcActor = RNPC.GetActorReference()

	bool shouldWearHood = false
	if (rnpcActor.IsInInterior())
		shouldWearHood = false ; redundant line is redundant
	else
		WorldSpace currentSpace = RNPC.GetReference().GetWorldSpace()
		if (SunDamageExceptionList.Find(currentSpace) < 0)
			shouldWearHood = true
		else
			shouldWearHood = false
		endif
	endif

	; put on hood if we're outside
	if (!shouldWearHood)
		if (rnpcActor.IsEquipped(VampArmor) && rnpcActor.IsEquipped(Hoodie))
			Debug.Trace("RNPC: Inside, taking off hood.")
			; rnpcActor.UnEquipItem(Hoodie) ; Ricky says this is no longer needed
			rnpcActor.RemoveItem(Hoodie)
		endif
	else
		if (rnpcActor.IsEquipped(VampArmor) && !rnpcActor.IsEquipped(Hoodie))
			Debug.Trace("RNPC: Outside, putting on hood.")
			rnpcActor.AddItem(Hoodie)
			rnpcActor.EquipItem(Hoodie)
		endif
	endif
EndFunction

;; QUEST BITS
bool Property LikesPlayerPostQuest = false auto conditional
bool Property PlayerInsultedFamily = false auto conditional
bool Property ToldPlayerSheDidntWantCure = false auto conditional
bool Property WillingToTradeItemsWithPlayer = false auto conditional
bool Property CutOffCureDiscussion = false auto conditional
bool Property PlayerTalkedAboutParents = false auto conditional
bool Property PlayerParentsAlive = false auto conditional
bool Property PlayerLikedParents = false auto conditional
bool Property PlayerOrphan = false auto conditional
bool Property TalkedAboutKillingHarkon = false auto conditional
bool Property PlayerNaive = false auto conditional
bool Property TalkedAboutKillingHarkonForReal = false auto conditional
int  Property MentionedLoneliness = 0 auto conditional
bool Property BelievesPlayerIsMarried = false auto conditional
bool Property HappyHomeLife = false auto conditional
bool Property UnhappyHomeLife = false auto conditional
bool Property SpouseIsMale = false auto conditional
bool Property DTR = false auto conditional
bool Property HadMarriageTalk = false auto conditional
bool Property TalkedPostQuest = false auto conditional
;; /QUEST BITS
