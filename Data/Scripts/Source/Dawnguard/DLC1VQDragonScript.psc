Scriptname DLC1VQDragonScript extends Quest  Conditional

Int Property iSummonCount  Auto  Conditional
{tracks how many times player has summoned the dragon}

ReferenceAlias Property dragon  Auto  

bool Property bDragonSummoned Auto Conditional
{ true if dragon is currently summoned - used to conditionalize spell to prevent overlapping summoning 
	DEPRECATED - nothing cares about this variable any more
}

function InitializeSummon(ObjectReference newDragon)
	debug.trace(self + " InitializeSummon")
	bDragonSummoned = true
	; always hold him on the ground to start
	(newDragon as Actor).SetAllowFlying( false )
	; put dragon in alias
	Dragon.ForceRefTo(newDragon)
	; start scene
	DLC1VQDragonScene1.Start()
	; increment summon count - put this after starting the scene to make sure it doesn't increment before scene starts
	iSummonCount += 1
	debug.trace(self + " InitializeSummon: iSummonCount=" + iSummonCount)
endFunction

function TeachWordToPlayer()
	debug.trace(self + " TeachWordToPlayer: iSummonCount="  + iSummonCount)

	; use >= for safety, in case player summons him quickly multiple times in a row
	if iSummonCount >= 1 && GetStageDone(40) == false
		debug.trace(self + " TeachWordToPlayer: teachword "  + SoulTearingWords[0])
		Game.TeachWord(SoulTearingWords[0])
		SetStage(40)
	endif

	if iSummonCount >=2 && GetStageDone(50) == false
		debug.trace(self + " TeachWordToPlayer: teachword "  + SoulTearingWords[1])
		Game.TeachWord(SoulTearingWords[1])
		SetStage(50)
	endif

	if iSummonCount >= 3 && GetStageDone(60) == false
		debug.trace(self + " TeachWordToPlayer: teachword "  + SoulTearingWords[2])
		Game.TeachWord(SoulTearingWords[2])
		SetStage(60)
	endif
endFunction

; call this when initial summoning scene is ended or player tries to ride him
function EndSummonWait()
	debug.trace(self + " EndSummonWait")
	Actor dragonActor = dragon.GetActorRef()
	; let him fly if allowed
	if DLC1DurnehviirDisallowFlying.GetValue() == 0
		dragonActor.SetAllowFlying( dragonActor.CanFlyHere() )
	endif
	; set "done waiting" variable
	dragonActor.SetActorValue("variable01", 1)
	dragonActor.EvaluatePackage()
	; register for summon duration
	RegisterForSingleUpdateGameTime(fSummonTime)
endFunction

; call this when timer runs out or dragon enters bleedout
function DispelDragon()
	debug.trace(self + " DispelDragon")
	; set actor value to indicate he wants to be dispelled when possible
	Actor dragonActor = dragon.GetActorRef()
	dragonActor.SetActorValue("variable01", 99)
	; force him to land
	dragonActor.SetAllowFlyingEx(false, false, true)
	; try to dispel now or later
	TryToDispelDragon(dragonActor)
endFunction

event OnUpdateGameTime()
	debug.trace(self + " OnUpdate")
	; is dragon waiting to be dispelled?
	Actor dragonActor = dragon.GetActorRef()
	if dragonActor.GetActorValue("variable01") == 99
		TryToDispelDragon(dragonActor)
	else
		; time to dispel
		DispelDragon()
	endif
endEvent

function TryToDispelDragon(actor dragonActor)
	debug.trace(self + " TryToDispelDragon")
	; needs to be landed
	; needs player not to be riding
	if dragonActor.GetFlyingState() == 0
		dragonActor.KillEssential()
	else
		RegisterForSingleUpdateGameTime(0.1)
	endif
endFunction

function DragonDead()
	; called by OnDeath block on dragon
	; stop pending updates if any
	UnregisterForUpdateGameTime()
	; clear dragon variable
	bDragonSummoned = false
endFunction

Scene Property DLC1VQDragonScene1  Auto  

WordOfPower[] Property SoulTearingWords  Auto  

Float Property fSummonTime = 1.0  Auto  Conditional
{duration of summon in game hours}

GlobalVariable Property DLC1DurnehviirDisallowFlying  Auto  
