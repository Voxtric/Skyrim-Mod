Scriptname DLC1VQ05ArrivalTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ04  Auto  
int Property pTriggered Auto
Spell Property pDLC1VQSoulDamage Auto
GlobalVariable Property pDLC1VQ04SoulTrapped Auto
GlobalVariable Property pDLC1VQSoulDamageTog Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDLC1VQ04.IsRunning() == 1
		if pTriggered == 0
			if akActionRef == Game.GetPlayer()
				pDLC1VQ04.SetStage(200)
				pTriggered = 1
			endif
		endif
	endif

;	if pDLC1VQ04SoulTrapped.GetValue() == 1
;		if pDLC1VQSoulDamageTog.GetValue() == 0
;			Game.GetPlayer().AddSpell(pDLC1VQSoulDamage)
;			pDLC1VQSoulDamageTog.SetValue(1)
;		endif
;	endif

endEvent