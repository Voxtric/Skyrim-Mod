Scriptname DLC1AurielBlessExplosionPlaceScript extends ObjectReference  
{This script decides id the blessed arrows explode.}


Explosion property ExplosionRef auto
{The name of the Explosion we will be placing.}

GlobalVariable Property DLC1AurielLastArrowFiredByPlayer  Auto
{0 = Plain Bow any arrow, 1 = Auriel's and SunArrow, 2 = Auriel's and Not SunArrow}  

Event onInit()
	;debug.Trace("This stupid thing works at all")

	if DLC1AurielLastArrowFiredByPlayer.getvalue() == 1
		ObjectReference MyExplosion = (Self.placeatme(ExplosionRef))
		while MyExplosion.Is3DLoaded() == False
			Utility.wait(0.1)
		endwhile

		MyExplosion = none
		Self.Disable()
		Self.Delete()
	endif

endEvent
;/ Event OnCellAttach()
		debug.Trace("Attached!")
	if DLC1AurielLastArrowFiredByPlayer.getvalue() == 1
		ObjectReference MyExplosion = (Self.placeatme(ExplosionRef))
		while MyExplosion.Is3DLoaded() == False
			Utility.wait(0.1)
		endwhile

		MyExplosion = none
		Self.Disable()
		Self.Delete()
	endif
	
endEvent /;