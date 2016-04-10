Scriptname DLC01TeleportScript extends ObjectReference  

import game

objectReference property teleportGoalMarker auto
objectReference property castPoint01 auto
objectReference property castPoint02 auto
objectReference property castPoint03 auto
Spell Property LightningSpell Auto
effectShader property TransitionFX auto

EVENT onTriggerEnter(objectReference actronaut)
	if (actronaut == game.getPlayer() && (actronaut as Actor).isOnMount() == FALSE)
		(actronaut as actor).setAlpha(0.0,true)
		transitionFX.play(actronaut)
		disablePlayerControls()
		LightningSpell.Cast(castPoint01, teleportGoalMarker)
		utility.wait(0.05)
		LightningSpell.Cast(castPoint02, teleportGoalMarker)
		utility.wait(0.1)
		LightningSpell.Cast(castPoint03, teleportGoalMarker)
		utility.wait(2.0)
		actronaut.moveTo(teleportGoalMarker)
		LightningSpell.Cast(castPoint01, teleportGoalMarker)
		utility.wait(0.1)
		LightningSpell.Cast(castPoint02, teleportGoalMarker)
		utility.wait(0.05)
		LightningSpell.Cast(castPoint03, teleportGoalMarker)
		transitionFX.stop(actronaut)
		(actronaut as actor).setAlpha(1)
		enablePlayerControls()
	endif
endEVENT
