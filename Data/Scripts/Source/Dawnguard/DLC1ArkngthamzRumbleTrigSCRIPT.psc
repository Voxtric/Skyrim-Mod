Scriptname DLC1ArkngthamzRumbleTrigSCRIPT extends ObjectReference Hidden 
{Used to give Arkngthamz the effect that it's unstable.}

import utility
import game

Sound Property AMBRumbleShake Auto
{Sound played when the rumble happens}

Explosion Property FallingDustExplosion01 Auto
{Debris that falls from linked xMarkers when rumble occures}

Float Property WaitForRumbleMax = 60.0 Auto
{Max time between rumbles. DEFAULT = 60}
Float Property WaitForRumbleMin = 45.0 Auto
{Min time between rumbles. DEFAULT = 45}

Bool Property CheckDistance = FALSE Auto
{If true then the players distance will be checked by DistanceFromTrigger before playing the rumble effects (DEFAULT = FALSE)}
Float Property DistanceFromTrigger = 6000.0 Auto
{(Ignored if CheckDistance is FALSE)Distance the player must be within, from this trigger, before the rumble can play, (DEFAULT = 6000)}

GlobalVariable Property DLC1ArkgnthamzRumbleGlobal Auto
{Global that tracks whether or not the rumble should occur}

Int MaxDustExplosions
Int ExplosionsPlaced

ObjectReference CurrentDustExplosion


	; Rumble only happens while this is true
Bool ShouldRumble = FALSE


Event OnCellAttach()

	MaxDustExplosions = GetLinkedRef().CountLinkedRefChain()
		; Once the player is in the cell LETS GET READY TO RUMBLE!!!
	ShouldRumble = TRUE

	if DLC1ArkgnthamzRumbleGlobal.GetValue() == 1
		HandleRumble()
	endif

EndEvent



Event OnActivate(ObjectReference akActionRef)

	ShouldRumble = FALSE

	ForceRumbleAndResetTimer()

EndEvent


Function ForceRumbleAndResetTimer()

	int instanceID = AMBRumbleShake.play(self)
	Sound.SetInstanceVolume(instanceID, 0.7)
	ShakeCamera(GetPlayer(), 0.5, 1.5)
	Game.ShakeController(0.5, 0.5, 1.5)
	GetPlayer().KnockAreaEffect(0.3, 16)
	PlaceDustExplosions()
	Wait(1.0)
	ShakeCamera(GetPlayer(), 0.3, 3)
	Game.ShakeController(0.3, 0.3, 3)
	Wait(WaitForRumbleMax)
	ShouldRumble = TRUE
	HandleRumble()

EndFunction


Function HandleRumble()
		; Rumble as long as ShouldRumble is TRUE
	While(ShouldRumble == TRUE)

		Wait(RandomFloat(WaitForRumbleMin, WaitForRumbleMax))

		if DLC1ArkgnthamzRumbleGlobal.GetValue() == 0
			ShouldRumble = FALSE
		endif

		if (CheckDistance == FALSE)
			if((self.Is3DLoaded()) && (ShouldRumble == TRUE))
				int instanceID = AMBRumbleShake.play(self)
				Sound.SetInstanceVolume(instanceID, 0.5)
				ShakeCamera(GetPlayer(), 0.3, 1.5)
				Game.ShakeController(0.3, 0.3, 1.5)
				GetPlayer().KnockAreaEffect(0.1, 16)
				PlaceDustExplosions()
				Wait(1.0)
				ShakeCamera(GetPlayer(), 0.1, 3)
				Game.ShakeController(0.1, 0.1, 3)
			endif
		elseif ((CheckDistance == TRUE) && (Game.GetPlayer().GetDistance(self) < DistanceFromTrigger))
			if((self.Is3DLoaded()) && (ShouldRumble == TRUE))
				int instanceID = AMBRumbleShake.play(self)
				Sound.SetInstanceVolume(instanceID, 0.3)
				ShakeCamera(GetPlayer(), 0.2, 1.5)
				Game.ShakeController(0.2, 0.2, 1.5)
				GetPlayer().KnockAreaEffect(0.1, 16)
				PlaceDustExplosions()
				Wait(1.0)
				ShakeCamera(GetPlayer(), 0.1, 3)
				Game.ShakeController(0.1, 0.1, 3)
			endif
		endif
	EndWhile

EndFunction


Function PlaceDustExplosions()

	While(ExplosionsPlaced < MaxDustExplosions)
		ExplosionsPlaced += 1
		if Game.GetPlayer().GetDistance(GetNthLinkedRef(ExplosionsPlaced)) < 2000
			CurrentDustExplosion = GetNthLinkedRef(ExplosionsPlaced).PlaceAtMe(FallingDustExplosion01, 1)
		endif
	EndWhile
		; Reset ExplosionsPlaced back to 0 so we can use it again.
	ExplosionsPlaced = 0

EndFunction


Event OnCellDetach()
		; When this reference unloads we'll stop the rumble
	ShouldRumble = FALSE
EndEvent