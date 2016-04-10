Scriptname DLC1VQ05QuestScript extends Quest  Conditional

GlobalVariable Property pDLC1VQ05KeysFound  Auto  
GlobalVariable Property pDLC1VQ05KeysTotal  Auto  Conditional
Quest Property pDLC1VQ05 Auto
int Property pKeysDone Auto
int Property pDLC1VQ05Speech01 Auto Conditional
int Property pDLC1VQ05SC Auto Conditional
int Property pDLC1VQ05ValericaFG01 Auto Conditional
int Property pDLC1VQ05RNPCFG01 Auto Conditional
GlobalVariable Property pDLC1VQ05KeepersAllDeadFirst Auto Conditional
ObjectReference Property pDLC1VQ05BarrierEnableMarker Auto Conditional

Function GotAKey()

	if pKeysDone == 0
		if pDLC1VQ05.ModObjectiveGlobal(1, pDLC1VQ05KeysFound, 30, pDLC1VQ05KeysTotal.value)
			SetStage(40)
			pKeysDone = 1
		endif
	endif

endFunction

Function AltKeepersDie()

	if pDLC1VQ05KeepersAllDeadFirst.GetValue() == 0
		pDLC1VQ05BarrierEnableMarker.Disable()
		pDLC1VQ05KeepersAllDeadFirst.SetValue(1)
	endif

endFunction

	