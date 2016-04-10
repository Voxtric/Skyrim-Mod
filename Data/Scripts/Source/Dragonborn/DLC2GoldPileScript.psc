Scriptname DLC2GoldPileScript extends ObjectReference  

GlobalVariable property ImperialLuck Auto
MiscObject property Gold001 Auto
int property minValue = 75 Auto
{Minimum value of the gold. Defaults to 85.}
int property maxValue = 100 Auto
{Minimum value of the gold. Defaults to 115.}

Event OnLoad()
	SetNoFavorAllowed()
EndEvent

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GoToState("Done")
		int value = Utility.RandomInt(minValue, maxValue)
		if (ImperialLuck.GetValue() < 100)
			value = value + Utility.RandomInt(5, 20)
		EndIf
		akActivator.AddItem(Gold001, value)
		Self.Disable()
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState