Scriptname DLC2DoOnce extends Form  



bool __done = false

bool Function DoOnce()
	if (__done)
		return false
	else
		__done = true
		return true
	endif
EndFunction
