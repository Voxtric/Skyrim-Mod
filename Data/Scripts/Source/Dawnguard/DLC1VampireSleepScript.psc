Scriptname DLC1VampireSleepScript extends Quest  
{Script attached to DLC1VampireSleep quest}

bool Property IsBedCoffin auto hidden
message Property DLC1VampireSleepMsg auto
spell Property DLC1VampireSleepRested auto
perk Property DLC1VampireSleepPerk auto

;this is called from perk entry point script
Function PlayerActivateBed(bool IsCoffin = false)
	if IsCoffin
		IsBedCoffin = true
	else
		IsBedCoffin = false
	endif
	Debug.Trace(self + "PlayerActivateBed() IsCoffin =" + IsCoffin)
EndFunction

Event OnSleepStop(bool abInterrupted)
	
	Actor PlayerRef = Game.GetPlayer()

	if IsBedCoffin
		Debug.Trace(self + "OnSleepStop() IsBedCoffin == True")
		PlayerRef.RemoveSpell(DLC1VampireSleepRested)
		DLC1VampireSleepMsg.Show()
		PlayerRef.AddSpell(DLC1VampireSleepRested, abVerbose = false)

	else
		Debug.Trace(self + "OnSleepStop() IsBedCoffin == False")
		PlayerRef.RemoveSpell(DLC1VampireSleepRested)

	endif

	IsBedCoffin = False
EndEvent