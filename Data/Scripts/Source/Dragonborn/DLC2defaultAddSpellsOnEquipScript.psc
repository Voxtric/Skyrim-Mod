Scriptname DLC2defaultAddSpellsOnEquipScript extends ObjectReference
{Generic script for adding spells to an actor when an item is equipped.}

Spell property SpellToAdd01 Auto
Spell property SpellToAdd02 Auto
Spell property SpellToAdd03 Auto

Event OnEquipped(Actor akActor)
	if (SpellToAdd01 != None)
		akActor.AddSpell(SpellToAdd01)
	EndIf
	if (SpellToAdd02 != None)
		akActor.AddSpell(SpellToAdd02)
	EndIf
	if (SpellToAdd03 != None)
		akActor.AddSpell(SpellToAdd03)
	EndIf
EndEvent

Event OnUnequipped(Actor akActor)
	Spell left = akActor.GetEquippedSpell(0)
	Spell right = akActor.GetEquippedSpell(1)
	if (SpellToAdd01 != None)
		if (left == SpellToAdd01)
			akActor.UnequipSpell(SpellToAdd01, 0)
		EndIf
		if (right == SpellToAdd01)
			akActor.UnequipSpell(SpellToAdd01, 1)
		EndIf
		akActor.RemoveSpell(SpellToAdd01)
	EndIf
	if (SpellToAdd02 != None)
		if (left == SpellToAdd02)
			akActor.UnequipSpell(SpellToAdd02, 0)
		EndIf
		if (right == SpellToAdd02)
			akActor.UnequipSpell(SpellToAdd02, 1)
		EndIf
		akActor.RemoveSpell(SpellToAdd02)
	EndIf
	if (SpellToAdd03 != None)
		if (left == SpellToAdd03)
			akActor.UnequipSpell(SpellToAdd03, 0)
		EndIf
		if (right == SpellToAdd03)
			akActor.UnequipSpell(SpellToAdd03, 1)
		EndIf
		akActor.RemoveSpell(SpellToAdd03)
	EndIf
EndEvent