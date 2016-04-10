Scriptname DLC01SoulCairnLightningRodScript extends ObjectReference  

message property promptMSG auto
message property defaultLackTheItemMSG auto
formlist property DLC01SoulcairnLRodGemList auto
SoulGem Property SoulGemBlack  Auto  
Spell Property LightningSpell Auto
objectReference property strikeMarker auto
objectReference property lightningRod auto
objectreference Property ambusher01 auto
objectreference Property ambusher02 auto
objectreference Property ambusher03 auto
activator property xMarkerActivator auto
Sound Property PreStrikeSound Auto

int i


auto State Waiting
EVENT onActivate(objectReference actronaut)

	if actronaut.getItemCount(DLC01SoulcairnLRodGemList) >= 1

		i = promptMSG.show()
		
		if i == 1
			; player chose to do nothing.
		else
			; player said yes.
			; remove the least valuable soul gem
			;Go to 'done' to prevent reactivation
			gotoState("Done")
			bool bLooping = TRUE
			while i == 0 && bLooping == TRUE
				if actronaut.getItemCount(DLC01SoulcairnLRodGemList.getAt(i))
					bLooping = FALSE
				else
					i += 1
				endif
			endWhile

			; now put it on the lightning rod.
			actronaut.removeItem(DLC01SoulcairnLRodGemList.getAt(i))
			objectReference gemToSacrifice = placeatme(DLC01SoulcairnLRodGemList.getAt(i))
			gemToSacrifice.blockActivation()
			self.blockActivation()
			gemToSacrifice.	setMotionType(Motion_Keyframed, TRUE)
			
			;pause a moment.
			utility.wait(1.5)
			
			; cause lightning strike
			objectReference strikeSource = placeatme(xMarkerActivator)
			strikeSource.setPosition(strikeSource.x, strikeSource.y, strikeSource.z + 5000)
			PreStrikeSound.play(strikeSource)
			
			utility.wait(1.0)
			lightningSpell.cast(strikeSource, strikeMarker)
			utility.wait(1.0)
			
			; convert to black soul gem
			gemToSacrifice.disable()
			gemToSacrifice.placeatMe(SoulGemBlack)
			
			; raise enemies
			lightningRod.activate(self)
			ambusher01.activate(self)
			LightningSpell.Cast(strikeMarker, ambusher01)
			utility.wait(1.0)
			ambusher02.activate(self)
			LightningSpell.Cast(strikeMarker, ambusher02)
			utility.wait(1.25)
			ambusher03.activate(self)
			LightningSpell.Cast(strikeMarker, ambusher03)
			
			disable()
			delete()
		endif
	else
		defaultLackTheItemMSG.show()
	endif
endEVENT
endState


State Done
;do nothing
EndState
