Scriptname DLC2DwePistonScript extends ObjectReference
{Script for the animating dwarven pistons.}

bool property startsActive = False Auto
{Should we start animating when we first load in?}

bool property isActive = False Auto Hidden
{Are we currently animating?}

bool property initialized = False Auto Hidden

Event OnLoad()
	if (!initialized)
		initialized = True
		if (startsActive)
			Start()
		EndIf
	EndIf
EndEvent

Event OnActivate(ObjectReference akActivator)
	if (isActive)
		Stop()
	Else
		Start()
	EndIf
EndEvent

Function Start()
	if (!isActive)
		isActive = True
		Self.PlayAnimation("Start")
	EndIf
EndFunction

Function Stop()
	if (isActive)
		isActive = False
		Self.PlayAnimation("Stop")
	EndIf
EndFunction