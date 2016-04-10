Scriptname DLC1ReflexesManagerScript extends ReferenceAlias  

Event OnInit()
	DLC1ReflexesCount.Value = 0
EndEvent

Event OnSpellCast(Form akSpellCast)
	Debug.Trace("VAMPIRE REFLEXES: Spell detected")
	If akSpellCast == DLC1SupernaturalReflexes
		If DLC1ReflexesCount.Value == 0
			Debug.Trace("VAMPIRE REFLEXES: Registering single update " + ReflexesCooldown)
			RegisterForSingleUpdateGameTime(ReflexesCoolDown)
		endIf
		DLC1ReflexesCount.Value += 1
		Debug.Trace("VAMPIRE REFLEXES: Supernatural Reflexes count = " + DLC1ReflexesCount.Value)
		if DLC1ReflexesCount.Value >= ReflexesMaxUses
			; DLC1MistformWaitMessage.Show()
			Debug.Trace("VAMPIRE REFLEXES: removing spell " + DLC1SupernaturalReflexes)
			GetActorRef().RemoveSpell(DLC1SupernaturalReflexes)
		endIf
	endIf
EndEvent

Event OnUpdateGameTime()
	UnRegisterforUpdateGameTime()
	Debug.Trace("VAMPIRE REFLEXES: supernatural reflexes available again")
	if  DLC1ReflexesCount.Value >= ReflexesMaxUses
		DLC1ReflexesReadyMessage.Show()
		GetActorRef().AddSpell(DLC1SupernaturalReflexes, false)
		if GetActorRef().GetEquippedSpell(2) == none
			Debug.Trace("VAMPIRE REFLEXES: Nothing else equipped, equip supernatural reflexes")
			GetActorRef().EquipSpell(DLC1SupernaturalReflexes, 2)
		endIf
	endIf
	DLC1ReflexesCount.Value = 0
EndEvent

GlobalVariable Property DLC1ReflexesCount  Auto  

Race Property VampireLordRace auto

SPELL Property DLC1SupernaturalReflexes  Auto  

Message Property DLC1ReflexesWaitMessage  Auto  
Message Property DLC1ReflexesReadyMessage  Auto  

FLoat Property ReflexesCooldown  Auto  

SPELL Property CurrentEquippedPower  Auto  

Int Property ReflexesMaxUses  Auto  