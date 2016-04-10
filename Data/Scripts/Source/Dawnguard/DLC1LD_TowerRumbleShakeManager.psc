scriptname DLC1LD_TowerRumbleShakeManager extends ObjectReference
{Handles rumble and camera shake for the Bthalft tower rising sequence.}

Sound property AmbRumbleShakeGreybeards Auto
Sound property AmbRumbleShake Auto

bool runRumbleLoop = False
bool breakRumbleLoop = False
int rumbleState

Event OnActivate(ObjectReference obj)
	if (rumbleState == 0)
		rumbleState = 1
		RumbleLightQuick()
	ElseIf (rumbleState == 1)
		rumbleState = 2
		RumbleSteady()
	ElseIf (rumbleState == 2)
		rumbleState = 3
		RumbleStrong()
	EndIf
EndEvent


Function RumbleLightQuick()
	Debug.Trace("Rumble Quick")
	AmbRumbleShakeGreybeards.Play(Self)
	Game.ShakeCamera(Self, 0.25, 1)
	Game.GetPlayer().RampRumble(0.25, 1, 1600)
EndFunction

Function RumbleSteady()
	Debug.Trace("Rumble Steady")
	runRumbleLoop = True
	RunRumbleLoop()
EndFunction

Function RumbleStrong()
	Debug.Trace("Rumble Strong")
	runRumbleLoop = False
	AmbRumbleShake.Play(Self)
	Game.GetPlayer().RampRumble(1, 7, 1600)
	Game.ShakeCamera(Self, 1, 7)
EndFunction


Function RunRumbleLoop()
	While (runRumbleLoop && !breakRumbleLoop)
		if (Game.GetPlayer().GetDistance(Self) < 2048)
			Debug.Trace("Rumble Loop")
			AmbRumbleShakeGreybeards.Play(Self)
			Game.GetPlayer().RampRumble(0.75, 5, 1600)
			Game.ShakeCamera(Self, 0.75, 5)
			Utility.Wait(5)
		Else
			Utility.Wait(2)
		EndIf
	EndWhile
EndFunction

Event OnLoad()
	if (rumbleState == 2)
		breakRumbleLoop = False
		RunRumbleLoop()
	EndIf
EndEvent

Event OnUnload()
	if (rumbleState == 2)
		breakRumbleLoop = True
	EndIf
EndEvent