Scriptname DLC2TGFormulaScript extends ObjectReference  
{set flag when read}

event OnRead()
	DLC2ImprovedBonemold.SetValue(1.0)
endEvent

GlobalVariable Property DLC2ImprovedBonemold  Auto  
