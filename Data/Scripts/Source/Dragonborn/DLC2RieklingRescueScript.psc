Scriptname DLC2RieklingRescueScript extends Quest  
{Script attached to DLC2RieklingRescue quest}

GlobalVariable Property DLC2RieklingRescueChance auto
GlobalVariable Property DLC2RieklingNextAllowedDay auto
GlobalVariable Property GameDaysPassed auto

referenceAlias[] Property RieklingAliasArray auto

worldSpace Property DLC2SolstheimWorld auto

quest Property DLC2MH02 auto



Function RollForRieklings(bool WasProjectile = false)
; 	debug.trace(self + "RollForRieklings()")

	float chance = DLC2RieklingRescueChance.GetValue()

	if WasProjectile && chance < 25
		chance *= 2
	endif	

	float roll = Utility.RandomInt(0, 100)



	if DLC2MH02.GetStageDone(200) \
				&& GameDaysPassed.GetValue() >= DLC2RieklingNextAllowedDay.GetValue() \
				&& Game.GetPlayer().GetWorldSpace() == DLC2SolstheimWorld \
				&& Roll <= chance
		RieklingsAppear()
	endif

; 	debug.trace(self + "RollForRieklings() chance: " + chance + ", roll: " + roll)	

EndFunction

Function RieklingsAppear()
	int i = 0
	actor curActor
	actor playerRef = Game.GetPlayer()
	while (i < RieklingAliasArray.length)
		curActor = RieklingAliasArray[i].getActorReference()

		curActor.Reset()
		MoveToBehindPlayer(curActor)

		i += 1
	endwhile

	DLC2RieklingRescueChance.setValue(5)
	DLC2RieklingNextAllowedDay.setValue(GameDaysPassed.GetValue() + 0.5)

EndFunction

Function MoveToBehindPlayer(ObjectReference ThingToMove, int unitsBehind = 1000, bool waitForPlayerWeaponsDrawn = true)

	Actor playerRef = Game.GetPlayer()

	if waitForPlayerWeaponsDrawn	;*this is because the player can't be looking behind him if his weapons are out
		int waitingFor = 0
		int maxWait = 30
		while playerRef.IsWeaponDrawn() == false 
; 			debug.trace(self + "MoveToBehindPlayer() waiting for playerRef.IsWeaponDrawn() waitingFor:" + waitingFor)
			waitingFor += 1
			Utility.wait(1)

			if waitingFor >= maxWait
; 				debug.trace(self + "MoveToBehindPlayer() waited too long for playerRef.IsWeaponDrawn() bailing out and not moving ThingToMove")
				RETURN

			endif
		endwhile
	endif

	float angle = playerRef.GetAngleZ()
	float xoffset = -(unitsBehind * math.sin(angle))
	float yoffset = -(unitsBehind * math.cos(angle))

;	Debug.Trace("DLC2RieklingRescueScript Angle " + angle)
;	Debug.Trace("DLC2RieklingRescueScript player X" + playerRef.x)
;	Debug.Trace("DLC2RieklingRescueScript player Y" + playerRef.y)
;	Debug.Trace("DLC2RieklingRescueScript x offset " + xoffset)
;	Debug.Trace("DLC2RieklingRescueScript y offset" + yoffset)

	ThingToMove.MoveTo(playerRef, xoffset, yoffset, abMatchRotation = true)
EndFunction