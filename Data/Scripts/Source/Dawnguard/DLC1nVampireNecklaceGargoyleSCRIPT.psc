Scriptname DLC1nVampireNecklaceGargoyleSCRIPT extends OBJECTREFERENCE  

ACTORBASE PROPERTY gargoyle AUTO
GLOBALVARIABLE PROPERTY gargoyleNecklace AUTO

OBJECTREFERENCE amuletGarg
BOOL doOnce=false

EVENT onLoad()
	
	;if player has necklace, summon additional gargoyle
	if(gargoyleNecklace.getValue() == 1 && !doOnce)
		amuletGarg = self.placeAtMe(gargoyle)
		doOnce = true

		utility.wait(30)

		amuletGarg.disable()

	endif

ENDEVENT

;if the boss goes, we go
EVENT onUnload()
	amuletGarg.disable()

ENDEVENT