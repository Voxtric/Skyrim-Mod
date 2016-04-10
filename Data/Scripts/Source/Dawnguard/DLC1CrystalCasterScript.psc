Scriptname DLC1CrystalCasterScript extends Actor  

import utility

spell property CrystalDrain auto

EVENT OnCellAttach()
	wait(0.25)
	self.setAlpha(0)
	
	self.EnableAI(TRUE)
	self.MoveTo(GetLinkedRef())

	self.EnableAI(FALSE)
	self.addspell(CrystalDrain)
EndEVENT