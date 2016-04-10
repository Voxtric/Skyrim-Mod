Scriptname DLC2RR02MirriTilisuScript extends ReferenceAlias  

Quest Property pDLC2RR02 Auto
GlobalVariable Property pDLC2RR02DeathCount Auto Conditional
int Property pDead Auto

Event OnDying(Actor akKiller)

	if pDead == 0
		pDLC2RR02DeathCount.SetValue(pDLC2RR02DeathCount.GetValue() + 1)
		pDead = 1
	endif

	if pDLC2RR02DeathCount.GetValue() >= 3
		pDLC2RR02.SetStage(90)
	endif

endEvent