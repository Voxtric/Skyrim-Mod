Scriptname DLC1MistformManagerScript extends ReferenceAlias  

Event OnInit()
	DLC1MistformCount.Value = 0
EndEvent

Event OnSpellCast(Form akSpellCast)
	Debug.Trace("VAMPIRE MISTFORM: Spell detected")
	If akSpellCast == DLC1Mistform
		If DLC1MistformCount.Value == 0
			Debug.Trace("VAMPIRE MISTFORM: Registering single update " + MistformCooldown)
			RegisterForSingleUpdateGameTime(MistformCoolDown)
		endIf
		DLC1MistformCount.Value += 1
		Debug.Trace("VAMPIRE MISTFORM: Mistform count = " + DLC1MistformCount.Value)
		if DLC1MistformCount.Value >= MistformMaxUses
			; DLC1MistformWaitMessage.Show()
			GetActorRef().RemoveSpell(DLC1Mistform)
		endIf
	endIf
EndEvent

Event OnUpdateGameTime()
	UnRegisterforUpdateGameTime()
	Debug.Trace("VAMPIRE MISTFORM: mistform available again")
	if  DLC1MistformCount.Value >= MistformMaxUses
		DLC1MistformReadyMessage.Show()
		GetActorRef().AddSpell(DLC1Mistform, false)
		if GetActorRef().GetEquippedSpell(2) == none
			Debug.Trace("VAMPIRE MISTFORM: Nothing else equipped, equip mistform")
			GetActorRef().EquipSpell(DLC1Mistform, 2)
		endIf
	endIf
	DLC1MistformCount.Value = 0
EndEvent

GlobalVariable Property DLC1MistformCount  Auto  

Race Property VampireLordRace auto

SPELL Property DLC1Mistform  Auto  

Message Property DLC1MistformWaitMessage  Auto  
Message Property DLC1MistformReadyMessage  Auto  

Float Property MistformCooldown  Auto  

SPELL Property CurrentEquippedPower  Auto  

Int Property MistformMaxUses  Auto  
