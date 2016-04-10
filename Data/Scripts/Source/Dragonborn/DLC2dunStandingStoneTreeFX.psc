scriptName DLC2dunStandingStoneTreeFX extends ObjectReference

import Debug

EffectShader Property DLC2StandingStoneCorruptedFXS Auto
ObjectReference Property DLC2TreeStoneEnableMarker Auto

Event onCellAttach()
	If(!DLC2TreeStoneEnableMarker.isEnabled())
		GotoState("Done")
		;the tree stone has been freed, remove FX
		DLC2StandingStoneCorruptedFXS.Stop(self)
	Endif
endEvent

State Done
	;do nothing
endState