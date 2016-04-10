Scriptname DLC1_BF_WaveControllerSCRIPT extends ObjectReference Hidden 
{
	Master Script over all the actors it's linked to that have the DLC1_BF_FalmerStatueSCRIPT

	This script links to up to 8 references and tells them, when activated, to spawn.
	By adjusting the properties from the editor you can adjust various aspects of each actor in this wave.
}
import debug
import utility

; Keywords for all the baddies in the wave
Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto
Keyword Property LinkCustom06 Auto
Keyword Property LinkCustom07 Auto
Keyword Property LinkCustom08 Auto

ObjectReference Property Prince Auto
{Link to the prince so we can make him animate}
Idle Property PrinceCast Auto
{Idle animation of the prince casting a spell from his throne}


Quest Property myQuest Auto
{Quest to set the myQuestStage on when the necessary number of actors in wave are dead}
Int Property myQuestStage Auto
{Quest stage to set in myQuest when the necessary number of actors in wave are dead}


Int Property AdditionalDeathsRequired = 0 Auto
{Add the number of extra actors, beyond the frozen ones this script handles, that need to be dead in order for this wave to be complete}
Int Property MinusDeathsRequired = 0 Auto
{The number of actors that should be ignored before setting this wave to "complete"}


Faction Property PlayerFaction Auto
{Player faction to put statues in until they spawn}
Faction Property FactionToAddTo Auto
{Faction these actors should be added to}
Bool Property RemoveFromFactionOnSpawn = FALSE Auto
{Should we remove the "factionToAddTo" once spawned? DEFAULT = FALSE}



Float Property SpawnTimeMin = 0.3 Auto
{The minimum random spawn time between actors in wave being activated}
Float Property SpawnTimeMax = 1.0 Auto
{The maximum random spawn time between actors in wave being activated}


Int Property CurrentDead Auto Hidden
{The current amount of dead actors in this wave}
Int Property MaxDead Auto Hidden
{The maximum amount of dead actors in this wave}
Float Property DelayBeforeSettingStage = 1.0 Auto
{Delay, in seconds, before setting the stage once the wave is completed. (DEFAULT = 1.0)}
Float Property DelayBeforeSpawningNextWave = 0.0 Auto
{Delay, in seconds, before spawning the next wave, AFTER waiting for the DelayBeforeSettingStage time. (DEFAULT = 0.0)}


Bool Property NextWaveInstant = FALSE Auto
{Whether the next wave should spawn instantly or not. DEFAULT = FALSE}


Bool Property ShouldStartCombatWithPlayer = TRUE Auto
{Should start combat with player on spawn? DEFAULT = TRUE}


	; Called at the start of the quest to attempt to enable all actors
Function TryToEnableActors()
	If GetLinkedRef(LinkCustom01)
		EnablingActor(GetLinkedRef(LinkCustom01))
	endif
	If GetLinkedRef(LinkCustom02)
		EnablingActor(GetLinkedRef(LinkCustom02))
	endif
	If GetLinkedRef(LinkCustom03)
		EnablingActor(GetLinkedRef(LinkCustom03))
	endif
	If GetLinkedRef(LinkCustom04)
		EnablingActor(GetLinkedRef(LinkCustom04))
	endif
	If GetLinkedRef(LinkCustom05)
		EnablingActor(GetLinkedRef(LinkCustom05))
	endif
	If GetLinkedRef(LinkCustom06)
		EnablingActor(GetLinkedRef(LinkCustom06))
	endif
	If GetLinkedRef(LinkCustom07)
		EnablingActor(GetLinkedRef(LinkCustom07))
	endif
	If GetLinkedRef(LinkCustom08)
		EnablingActor(GetLinkedRef(LinkCustom08))
	endif

	TryToSetupActors()
EndFunction

	; If an actor is linked to it gets enabled here
Function EnablingActor(ObjectReference akLink)
	akLink.Enable(0)
EndFunction


	; Count all the actors this ref is linked to and tell them who I am so they can ping me OnDeath(), also set their aggression to 0
Function TryToSetupActors()
	If GetLinkedRef(LinkCustom01)
		SetupActors(GetLinkedRef(LinkCustom01))
	endif
	If GetLinkedRef(LinkCustom02)
		SetupActors(GetLinkedRef(LinkCustom02))
	endif
	If GetLinkedRef(LinkCustom03)
		SetupActors(GetLinkedRef(LinkCustom03))
	endif
	If GetLinkedRef(LinkCustom04)
		SetupActors(GetLinkedRef(LinkCustom04))
	endif
	If GetLinkedRef(LinkCustom05)
		SetupActors(GetLinkedRef(LinkCustom05))
	endif
	If GetLinkedRef(LinkCustom06)
		SetupActors(GetLinkedRef(LinkCustom06))
	endif
	If GetLinkedRef(LinkCustom07)
		SetupActors(GetLinkedRef(LinkCustom07))
	endif
	If GetLinkedRef(LinkCustom08)
		SetupActors(GetLinkedRef(LinkCustom08))
	endif
EndFunction

	; Function which runs from OnCellAttach() to set up all the actors in the wave
Function SetupActors(ObjectReference akLink)
	if (FactionToAddTo)
		(akLink as Actor).AddToFaction(FactionToAddTo)
	endif
	;(akLink as Actor).AddtoFaction(PlayerFaction)
	(akLink as DLC1_BF_FalmerStatueSCRIPT).AssignWaveController(Self)
	akLink.MoveTo(HiddenMarker)
	akLink.EnableNoWait()
	(akLink as Actor).EnableAI(False)
	(akLink as Actor).SetGhost(TRUE)
	(akLink as Actor).SetAlpha(0)
	(akLink as Actor).SetActorValue("Aggression", 0)
	MaxDead = MaxDead + 1
EndFunction


	; Once activated then activate all mobs in order with a random time in between activations, and set their aggression to 2
Event OnActivate(ObjectReference akActionRef)
	if GetLinkedRef(LinkCustom01)
		ActivateActors(GetLinkedRef(LinkCustom01))
		Wait(RandomFloat(SpawnTimeMin, SpawnTimeMax))
	endif
	if GetLinkedRef(LinkCustom02)
		ActivateActors(GetLinkedRef(LinkCustom02))
		Wait(RandomFloat(SpawnTimeMin, SpawnTimeMax))
	endif
	if GetLinkedRef(LinkCustom03)
		ActivateActors(GetLinkedRef(LinkCustom03))
		Wait(RandomFloat(SpawnTimeMin, SpawnTimeMax))
	endif
	if GetLinkedRef(LinkCustom04)
		ActivateActors(GetLinkedRef(LinkCustom04))
		Wait(RandomFloat(SpawnTimeMin, SpawnTimeMax))
	endif
	if GetLinkedRef(LinkCustom05)
		ActivateActors(GetLinkedRef(LinkCustom05))
		Wait(RandomFloat(SpawnTimeMin, SpawnTimeMax))
	endif
	if GetLinkedRef(LinkCustom06)
		ActivateActors(GetLinkedRef(LinkCustom06))
		Wait(RandomFloat(SpawnTimeMin, SpawnTimeMax))
	endif
	if GetLinkedRef(LinkCustom07)
		ActivateActors(GetLinkedRef(LinkCustom07))
		Wait(RandomFloat(SpawnTimeMin, SpawnTimeMax))
	endif
	if GetLinkedRef(LinkCustom08)
		ActivateActors(GetLinkedRef(LinkCustom08))
		Wait(RandomFloat(SpawnTimeMin, SpawnTimeMax))
	endif
EndEvent


	; Function that runs from the OnActivate() even and tells the actor to ambush out of the ice
Function ActivateActors(ObjectReference akLink)
	if (FactionToAddTo) && (RemoveFromFactionOnSpawn)
		(akLink as Actor).RemoveFromFaction(FactionToAddTo)
	endif
	if (ShouldStartCombatWithPlayer)
		(akLink as Actor).StartCombat(Game.GetPlayer())
	endif
	if NextWaveInstant
		if (GetLinkedRef())
			GetLinkedRef().Activate(self)
		endif
		NextWaveInstant = FALSE
	endif
	(akLink as Actor).SetAV("Aggression", 2)
	;(Prince as Actor).PlayIdle(PrinceCast)
	(akLink as Actor).RemoveFromFaction(PlayerFaction)
	akLink.Activate(self)
EndFunction


Function CountDead()

	; Count how many have died and if enough have died then set the specific quest stage, and/or activate the next wave
	CurrentDead = CurrentDead + 1
	if (CurrentDead < (MaxDead + AdditionalDeathsRequired - MinusDeathsRequired))
		; Do Nothing
	else
		Wait(DelayBeforeSettingStage)
		if myquest
			myQuest.SetStage(myQuestStage)
		endif
		if (GetLinkedRef())
			Wait(DelayBeforeSpawningNextWave)
			GetLinkedRef().Activate(self)
		endif	
	endif
	debug.Trace(self + " " + CurrentDead + "/" + MaxDead + " dead.")
EndFunction


ObjectReference Property HiddenMarker  Auto  
