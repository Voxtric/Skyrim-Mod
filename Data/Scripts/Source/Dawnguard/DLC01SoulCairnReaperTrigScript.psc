Scriptname DLC01SoulCairnReaperTrigScript extends ObjectReference  

import utility

MiscObject Property DLC01SoulCairnReaperFragment01 auto
MiscObject Property DLC01SoulCairnReaperFragment02 auto
MiscObject Property DLC01SoulCairnReaperFragment03 auto

objectReference property shardStatic01 auto
objectReference property shardStatic02 auto
objectReference property shardStatic03 auto
objectReference property FXbeamREF auto

objectReference property xMarker01 auto
objectReference property xMarker02 auto
objectReference property xMarker03 auto

objectReference property ReaperREF auto

spell property DLC01SC_SkyLightningBolt01 auto

message property defaultLackTheItemMSG auto

bool bPlaced01
bool bPlaced02
bool bPlaced03

EVENT onActivate(objectReference actronaut)
	if actronaut == game.getPlayer()
		if actronaut.getItemCount(DLC01SoulCairnReaperFragment01) < 1 && actronaut.getItemCount(DLC01SoulCairnReaperFragment02) < 1  && actronaut.getItemCount(DLC01SoulCairnReaperFragment03) < 1
			; Don't have anything, so show the negatory feedback
			defaultLackTheItemMSG.show()
		else
			debug.trace("Reaper Altar - Player has at least one fragment, place it/them")
			; Okay, I have at least one fragment.  Remove any applicable ones.
			if actronaut.getItemCount(DLC01SoulCairnReaperFragment01) >= 1
				actronaut.removeItem(DLC01SoulCairnReaperFragment01, actronaut.getItemCount(DLC01SoulCairnReaperFragment01))
				shardStatic01.enable()
				bPlaced01 = TRUE
			endif
			if actronaut.getItemCount(DLC01SoulCairnReaperFragment02) >= 1
				actronaut.removeItem(DLC01SoulCairnReaperFragment02, actronaut.getItemCount(DLC01SoulCairnReaperFragment02))
				shardStatic02.enable()
				bPlaced02 = TRUE
			endif
			if actronaut.getItemCount(DLC01SoulCairnReaperFragment03) >= 1
				actronaut.removeItem(DLC01SoulCairnReaperFragment03, actronaut.getItemCount(DLC01SoulCairnReaperFragment03))
				shardStatic03.enable()
				bPlaced03 = TRUE
			endif
			; and turn on the FX beam if it isn't already.
			if !FXbeamREF.isEnabled()
				FXbeamREF.enable()
			endif
		endif
		
		if bPlaced01 && bPlaced02 && bPlaced03
			blockActivation()
			reaperRef.activate(actronaut)
			(reaperRef as actor).startCombat(actronaut as actor)
			DLC01SC_SkyLightningBolt01.cast(xMarker01,ReaperRef)
			wait(0.25)
			DLC01SC_SkyLightningBolt01.cast(xMarker02,ReaperRef)
			wait(0.2)
			DLC01SC_SkyLightningBolt01.cast(xMarker03,ReaperRef)
			wait(0.18)
			DLC01SC_SkyLightningBolt01.cast(xMarker01,ReaperRef)
			wait(0.1)
			DLC01SC_SkyLightningBolt01.cast(xMarker02,ReaperRef)
			wait(0.1)
			DLC01SC_SkyLightningBolt01.cast(xMarker01,ReaperRef)
			DLC01SC_SkyLightningBolt01.cast(xMarker03,ReaperRef)
			FXbeamRef.disable()
			disable()		
		endif
	endif
endEVENT
