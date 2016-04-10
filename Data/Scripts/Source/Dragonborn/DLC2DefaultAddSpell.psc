Scriptname DLC2DefaultAddSpell extends Actor
{Adds the selected spell OnCellAttach()}

Spell Property mySpell Auto
{Spell that will get added to this actor OnCellAttached()}

Event OnCellAttach()
	utility.Wait(3)
; 	debug.Trace("Adding Spell to " + self)
	self.AddSpell(mySpell)
EndEvent