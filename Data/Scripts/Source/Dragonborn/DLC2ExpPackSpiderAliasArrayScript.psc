Scriptname DLC2ExpPackSpiderAliasArrayScript extends DLC2ReferenceAliasArrayScript Hidden 

bool Function ForceRefInto(objectReference RefToAdd)
	If RefArray[RefArray.length - 1]  ;if the last slot is filled
	
		objectReference LastRef

		LastRef = RefArray[RefArray.length - 1]
	
		;DO SOMETHING HERE LIKE
		;MyObjectWithMyScript.myFunction(LastRef)
; 		;debug.Trace("Attempting to run ClearActor() on " + LastRef)
		(LastRef as Actor).Kill()
		;(LastRef as DLC2ExpSpiderGlowingScript).ClearActor()

	endif


	return ForceRefToAndReturnAlias(RefToAdd) as bool

EndFunction