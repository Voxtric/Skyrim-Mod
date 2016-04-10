Scriptname DLC1VQSoulTriggerScript extends ObjectReference  Conditional

Spell Property pDLC1VQSoulDamage Auto
GlobalVariable Property pDLC1VQ04SoulTrapped Auto
GlobalVariable Property pDLC1VQSoulDamageTog Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDLC1VQ04SoulTrapped.GetValue() == 1
		if pDLC1VQSoulDamageTog.GetValue() == 1
			Game.GetPlayer().RemoveSpell(pDLC1VQSoulDamage)
			pDLC1VQSoulDamageTog.SetValue(0)
		endif
	endif

endEvent