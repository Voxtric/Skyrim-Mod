Scriptname DLC2AshSpawnAttackScript extends Quest  

ReferenceAlias[] Property AshSpawnAliasArray auto
ReferenceAlias[] Property GuardAliasArray auto

globalvariable Property DLC2AshSpawnAttackChance auto
{Initialy is 0, set to 100 in DLC2Init stage 100, set to 25 in Stage 0 of DLC2AshSpawnAttack}

Function ResetAndActivateAshSpawn()
	int i = 0
	actor curActor
	while (i < AshSpawnAliasArray.length)
		curActor = AshSpawnAliasArray[i].GetActorReference()
		curActor.Reset()
		curActor.Disable() ;not sure why, but if I don't do this, they are invisible on subsequent quest starts if they die
		curActor.Enable()
		curActor.Activate(curActor)
		i += 1
	endwhile
EndFunction



bool Function CheckIfSideIsDead(ReferenceAlias[] ArrayToCheck)
; 	debug.trace(self + "CheckIfOneSideIsDeadAndStopQuest() " + ArrayToCheck)

	int i = 0
	actor curActor

	bool SomeoneIsAlive = false

	while (SomeoneIsAlive == false && i < ArrayToCheck.length)
		curActor = ArrayToCheck[i].GetActorReference()

		SomeoneIsAlive = !curActor.IsDead()  ;get the inverse

; 		debug.trace(self + "CheckIfOneSideIsDeadAndStopQuest() actor: " + curActor + " is alive?: " + SomeoneIsAlive)
		
		i += 1
	endwhile

; 	debug.trace(self + "CheckIfOneSideIsDeadAndStopQuest() returning " + !SomeoneIsAlive)

	return !SomeoneIsAlive
EndFunction

Function CheckIfOneSideIsDeadAndStopQuest()
; 	debug.trace(self + "CheckIfOneSideIsDeadAndStopQuest()")

	bool OneSideIsDead = CheckIfSideIsDead(AshSpawnAliasArray) || CheckIfSideIsDead(GuardAliasArray)

	if OneSideIsDead
; 		debug.trace(self + "CheckIfOneSideIsDeadAndStopQuest() OneSideIsDead == true, stopping quest")
		Stop()

	else
; 		debug.trace(self + "CheckIfOneSideIsDeadAndStopQuest() OneSideIsDead == false, stopping quest")

	endif	
	
EndFunction