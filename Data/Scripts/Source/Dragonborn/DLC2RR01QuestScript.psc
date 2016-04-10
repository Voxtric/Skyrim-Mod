Scriptname DLC2RR01QuestScript extends Quest  Conditional

int Property pDLC2RR01GhoulsKilled Auto
GlobalVariable Property pDLC2RR01InvToggled Auto
ReferenceAlias Property pDLC2RR01StartGhoul01Ref Auto
ReferenceAlias Property pDLC2RR01StartGhoul02Ref Auto
ReferenceAlias Property pDLC2RR01StartGhoul03Ref Auto

;As the Ghouls are slain, do a count - when count reaches 3, pop the stage
Function GhoulsDie()

	pDLC2RR01GhoulsKilled = (pDLC2RR01GhoulsKilled + 1)

	if pDLC2RR01GhoulsKilled >= 3
		if GetStage() == 30
			SetStage(40)
		endif
	endif

endFunction

;When the Player strikes the target, toggle their invulnerability off
Function ToggleInvulnerable()
	
; 	debug.tracestack("ToggleInvulnerable")

	if pDLC2RR01InvToggled.GetValue() == 0
		pDLC2RR01StartGhoul01Ref.GetActorRef().GetLeveledActorBase().SetInvulnerable(false)
		pDLC2RR01StartGhoul02Ref.GetActorRef().GetLeveledActorBase().SetInvulnerable(false)
		pDLC2RR01StartGhoul03Ref.GetActorRef().GetLeveledActorBase().SetInvulnerable(false)
		pDLC2RR01InvToggled.SetValue(1)
	endif

	if GetStageDone(30) == 0
		if GetStageDone(100) == 0
			SetStage(30)
		endif
	endif

endFunction