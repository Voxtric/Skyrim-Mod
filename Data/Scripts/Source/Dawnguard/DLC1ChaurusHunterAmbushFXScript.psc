ScriptName DLC1ChaurusHunterAmbushFXScript extends Actor
{Script for the Chaurus Hunter ambush. Plays the goo vfx when the ambush triggers.}

Spell property DLC1crChaurusHunterAmbushFX Auto
Activator property ChaurusCocoon Auto
bool HasActivated

Auto State Ready
	Event OnLoad()
		SetSubGraphFloatVariable("ftoggleBlend", 1.0)
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		SetSubGraphFloatVariable("ftoggleBlend", 0)
		if (!hasActivated && akActivator.GetBaseObject() == ChaurusCocoon)
			hasActivated = True
			DLC1crChaurusHunterAmbushFX.Cast(Self, Self)
		EndIf
		GoToState("Done")
	EndEvent
EndState

State Done
	Event OnLoad()
		;Do nothing.
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState


;Maintain compatibility with old saves.
Event OnLoad()
	GoToState("Ready")
	OnLoad()
EndEvent

Event OnActivate(ObjectReference akActivator)
	GoToState("Ready")
	OnActivate(akActivator)
EndEvent
