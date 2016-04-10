Scriptname DLC2KagrumezGemAliasScript extends ObjectReference  
;Puts this gem object into its appropriate alias when added to the player's inventory

import quest

quest property DLC2KagrumezQST auto 
ReferenceAlias property GemAlias03 auto
ReferenceAlias property GemAlias04 auto

bool property Gem03 auto
bool property Gem04 auto

auto State Waiting
	Event onCellAttach()
		;object was loaded
		if DLC2KagrumezQST.isRunning() == 0 
			DLC2KagrumezQST.setstage(0)
		endif
		if DLC2KagrumezQST.isCompleted() == 0
			if Gem03 == true
				gotoState("Done")
				GemAlias03.ForceRefTo(self)	
			elseif Gem04 == true
				gotoState("Done")
				GemAlias04.ForceRefTo(self)	
			endif
		endif
		gotoState("Done")	
	endEvent
endState

State Done
;do nothing
EndState