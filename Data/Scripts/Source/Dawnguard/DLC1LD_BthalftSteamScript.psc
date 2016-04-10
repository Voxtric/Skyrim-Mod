Scriptname DLC1LD_BthalftSteamScript extends ObjectReference  
{Script for the steam VFX in Bthalft.}

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto
Keyword property LinkCustom04 Auto
bool initialized = False

Event OnLoad()
	if (!initialized && (GetState() == "Enabled"))
		SetAnimationVariableFloat("ftoggleblend", 1.0)
	EndIf
EndEvent

Auto State Enabled
	Function DisableSteam()
		GoToState("Disabled")
		SetAnimationVariableFloat("ftoggleblend", 0.0)
		RegisterForSingleUpdate(1)
	EndFunction
EndState

State Disabled
	Function EnableSteam()
		GoToState("Enabled")
		SetAnimationVariableFloat("ftoggleblend", 1.0)
		RegisterForSingleUpdate(1)
	EndFunction
EndState

Event OnUpdate()
	if (GetState() == "Disabled")
		if (GetLinkedRef() != None)
			GetLinkedRef().Disable()
		EndIf
		if (GetLinkedRef(LinkCustom01) != None)
			GetLinkedRef(LinkCustom01).Disable()
		EndIf
		if (GetLinkedRef(LinkCustom02) != None)
			GetLinkedRef(LinkCustom02).Disable()
		EndIf
		if (GetLinkedRef(LinkCustom03) != None)
			GetLinkedRef(LinkCustom03).Disable()
		EndIf
		if (GetLinkedRef(LinkCustom04) != None)
			GetLinkedRef(LinkCustom04).Disable()
		EndIf
	Else
		if (GetLinkedRef() != None)
			GetLinkedRef().Enable()
		EndIf
		if (GetLinkedRef(LinkCustom01) != None)
			GetLinkedRef(LinkCustom01).Enable()
		EndIf
		if (GetLinkedRef(LinkCustom02) != None)
			GetLinkedRef(LinkCustom02).Enable()
		EndIf
		if (GetLinkedRef(LinkCustom03) != None)
			GetLinkedRef(LinkCustom03).Enable()
		EndIf
		if (GetLinkedRef(LinkCustom04) != None)
			GetLinkedRef(LinkCustom04).Enable()
		EndIf
	EndIf
EndEvent

Function EnableSteam()
	;Do nothing.
EndFunction

Function DisableSteam()
	;Do nothing.
EndFunction

