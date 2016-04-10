Scriptname DLC2PillarShoutTriggerScript extends ObjectReference  

;This is the trigger box surrounding the Standing Stone
;It needs a linked ref to a marker with keyword DLC2LinkPillarToggle that all the actors who work there should be linked to with the same keyword
;It needs a linked ref to a marker with the keyword DLC2LinkPillarMonsterSpawn
;In needs a DLC2LinkPillarStandingStone which is a link to the standing stone its surrounding


Spell Property DLC2VoiceBendToWill1 auto
{BASEOBJECT PROPERTY}

Spell Property DLC2VoiceBendToWill2 auto
{BASEOBJECT PROPERTY}

Spell Property DLC2VoiceBendToWill3 auto
{BASEOBJECT PROPERTY}

keyword Property DLC2LinkPillarToggle auto
{BASEOBJECT PROPERTY}

;OBSOLETE
;keyword Property DLC2LinkPillarMonsterSpawn auto
;{BASEOBJECT PROPERTY}

keyword Property DLC2LinkPillarMonster auto
{BASEOBJECT PROPERTY}

keyword Property DLC2LinkPillarStandingStone auto
{BASEOBJECT PROPERTY}

quest Property DLC2PillarDestroyed auto
{BASEOBJECT PROPERTY}

keyword Property DLC2PillarDestroyedStart auto
{BASEOBJECT PROPERTY}

Explosion Property TempExplosion auto
{BASEOBJECT PROPERTY}

ActorBase Property DLC2PillarMonster auto
{BASEOBJECT PROPERTY}


ObjectReference[] Property RefsToDisableArray auto
{REFERENCE PROPERTY - This might be a temp thing - array of refs to disable when the standing stone explodes}


;DLC2MQ03 hooks:
quest  Property QuestToSetStagesIn auto ;would be DLC2MQ03
{REFERENCE PROPERTY - Optional: Quest whose stages we will be setting (probably DLC2MQ03)}

ReferenceAlias Property QuestMonsterAlias auto
{REFERENCE PROPERTY - Optional: Which alias to shove the spawned monster into
IMPORTANT! THIS SCRIPT ASSUMES THE QUEST IS RUNNING AT THE TIME THE MONSTER SPAWNS}

int Property QuestStageToSetWhenPillarIsDestroyed auto
{REFERENCE PROPERTY - Optional: stage to set when the player shouts at the pillar and it explodes}

int Property QuestStageToSetWhenLurkerSpawned auto
{REFERENCE PROPERTY - Optional: stage to set when the Lurker spawns in – ie he should get the objective to kill it}

int Property QuestStageToSetWhenLurkerDies auto
{REFERENCE PROPERTY - Optional: stage to set after the Lurker dies}

ObjectReference[] Property RefsToEnableAndActivateArray auto
{REFERENCE PROPERTY - Optional: things to enable and activate when player shouts at pillar}

bool DoOnce

DLC2PillarMonsterScript myMonster

bool monsterAppeared
bool monsterDied

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	myMonster = GetLinkedRef(DLC2LinkPillarMonster) as DLC2PillarMonsterScript ;putting this here because linkedRef was failing if the player fast traveled away before we called MonsterAppears()

	if DoOnce == false
		if akSource == DLC2VoiceBendToWill1 || akSource == DLC2VoiceBendToWill2 || akSource == DLC2VoiceBendToWill3
			DoOnce = true

			ObjectReference myLinkedToggle = GetLinkedRef(DLC2LinkPillarToggle)
			
			DLC2StandingStoneScript myLinkedStone = GetLinkedRef(DLC2LinkPillarStandingStone) as DLC2StandingStoneScript
			; can't activate stone during this sequence
			myLinkedStone.SetDestroyed(true)

			myLinkedToggle.disable()

			GatherSpectators()

			StoneExplodes()

			myLinkedStone.Freed = true
			; allow activation again
			myLinkedStone.SetDestroyed(false)

			MonsterAppears()

			(DLC2PillarDestroyed as DLC2PillarDestroyedSpectatorsScript).EVPAliases()

			EnableAndActivate()
		endif

	endif

EndEvent

Function StoneExplodes()
; 	Debug.Trace(self + "StoneExplodes()")

	StoneExplodesSFX()
	StoneExplodesDisableRefs()


	if QuestToSetStagesIn && QuestStageToSetWhenPillarIsDestroyed
		if QuestStageToSetWhenPillarIsDestroyed == QuestStageToSetWhenLurkerSpawned
; 			Debug.Trace(self + "NOT YET SETTING STAGE BECAUSE QuestStageToSetWhenPillarIsDestroyed ==  QuestStageToSetWhenLurkerSpawned: " + QuestStageToSetWhenLurkerSpawned)
		else 
; 			Debug.Trace(self + "setting Quest Stage " + QuestToSetStagesIn + ", stage " + QuestStageToSetWhenPillarIsDestroyed)
			QuestToSetStagesIn.SetStage(QuestStageToSetWhenPillarIsDestroyed)
		endif	
	endif

EndFunction

Function StoneExplodesSFX()
; 	Debug.Trace(self + "StoneExplodesSFX()")
	(getLinkedRef(DLC2LinkPillarStandingStone) as DLC2StandingStoneFX).StandingStoneExplode()

EndFunction

Function StoneExplodesDisableRefs()
; 	Debug.Trace(self + "StoneExplodesDisableRefs()")

	int index = 0
	int maxSize = RefsToDisableArray.Length
	while (index < maxSize)
		ObjectReference CurrentRef = RefsToDisableArray[index]
; 		Debug.Trace(self + "OnHit() Disabling ref:" + CurrentRef)
		CurrentRef.Disable()
		index += 1
	endwhile
EndFunction


Function GatherSpectators()
	;these variables are needed to prevent a crash if the player leaves and unloads things before the story manager gets a chance to try starting the quest and filling aliases
	ObjectReference PersistSelf = self
	ObjectReference PersistMonster = GetLinkedRef(DLC2LinkPillarMonster)

	DLC2PillarDestroyed.Stop() ;in case there's another one still running somewhere

	int waitingFor
	while (DLC2PillarDestroyed.IsStopped() == false)
; 		Debug.Trace(self + "OnHit() DLC2PillarDestroyed isn't done shutting down. WaitingFor: " + waitingFor)
		utility.wait(1)
		waitingFor += 1
	endwhile

	DLC2PillarDestroyedStart.sendStoryEventAndWait(akRef1 = PersistSelf, akRef2 = PersistMonster)

	PersistSelf = None
	PersistMonster = None

EndFunction

Function MonsterAppears()
; 	Debug.Trace(self + "MonsterAppears()")

;	myMonster = SpawnRef.placeActorAtMe(DLC2PillarMonster) as DLC2PillarMonsterScript
	myMonster.RegisterPillarShoutTrigger(self)
	myMonster.Enable()
	myMonster.Activate(self) ;should trigger them to come out of their ambush position when that functionality is in

	;THIS ASSUMES THE QUEST IS RUNNING BEFORE WE SET STAGES
	if QuestMonsterAlias
		QuestMonsterAlias.ForceRefTo(myMonster)

		int waitingFor = 0
		while QuestMonsterAlias.GetReference() != myMonster || waitingFor < 5 ;this makes sure the alias is filled (not sure I need that) and gives a few seconds for the lurker to come out, so as not to spoil the reveal
			utility.wait(1)
			waitingFor += 1
; 			debug.trace(self + "waiting for myMonster to fully appear before setting queststage. WaitingFor: " + waitingFor)
		endwhile

	endif	

	if QuestToSetStagesIn && QuestStageToSetWhenLurkerSpawned
; 		Debug.Trace(self + "setting Quest Stage " + QuestToSetStagesIn + ", stage " + QuestStageToSetWhenLurkerSpawned)
		QuestToSetStagesIn.SetStage(QuestStageToSetWhenLurkerSpawned)
	endif

	monsterAppeared = true

EndFunction

Function EnableAndActivate()
	int index = 0
	int maxSize = RefsToEnableAndActivateArray.Length
	while (index < maxSize)
		ObjectReference CurrentRef = RefsToEnableAndActivateArray[index]
; 		Debug.Trace(self + "EnableAndActivate() enabling ref:" + CurrentRef)
		CurrentRef.enable()
		CurrentRef.activate(self)
		index += 1
	endwhile
	
EndFunction

Function RegisterMonsterDeath(DLC2PillarMonsterScript DeadMonster)  ;called by DLC2PillarMonsterScript on myMonster
; 	Debug.Trace(self + "RegisterMonsterDeath()" + DeadMonster)

;	(getLinkedRef(DLC2LinkPillarStandingStone) as DLC2StandingStoneFX).WaterSwap()

	if QuestToSetStagesIn && QuestStageToSetWhenLurkerDies
; 		Debug.Trace(self + "setting Quest Stage " + QuestToSetStagesIn + ", stage " + QuestStageToSetWhenLurkerDies)
		QuestToSetStagesIn.SetStage(QuestStageToSetWhenLurkerDies)
	endif

	(DLC2PillarDestroyed as DLC2PillarDestroyedSpectatorsScript).EVPAliases(AndStopCombat = true)

	monsterDied = true

EndFunction

bool Function ShouldMonsterDisableOnLoad()
; 	Debug.Trace(self + "ShouldMonsterDisableOnLoad() :" + monsterDied)
	return monsterDied

EndFunction