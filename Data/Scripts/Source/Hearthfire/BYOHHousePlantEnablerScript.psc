Scriptname BYOHHousePlantEnablerScript extends ObjectReference  
{enable me when connected soil has something growing in it
 can use either linked ref, and/or myPlanters array
}

event OnCellAttach()
	; get linked ref - this is soil
	ObjectReference mySoil = GetLinkedRef()
	; get the soil's linked ref - this is the container which holds all the data for the soil
	if mySoil
		BYOHPlanterContainerScript myContainer = ( mySoil.GetLinkedRef() as BYOHPlanterContainerScript)
		if myContainer.plantedFloraRef
			enable()
		endif
	else
		int iPlanter = 0
		while iPlanter < myPlanters.Length
			BYOHPlanterContainerScript myContainer = ( myPlanters[iPlanter].GetLinkedRef() as BYOHPlanterContainerScript)
			if myContainer.plantedFloraRef
				enable()
			endif
			iPlanter += 1
		endwhile
	endif
endEvent

BYOHPlanterSoilScript[] Property myPlanters  Auto  
{if any of these planters have plants in them, enable me}

