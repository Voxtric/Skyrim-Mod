Scriptname DLC2RRF01BarrelScript extends ReferenceAlias  

Quest Property pDLC2RRFavor01 Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC2RRFavor01.GetStage() == 20
 			pDLC2RRFavor01.SetStage(30)
		endif
	endif

EndEvent