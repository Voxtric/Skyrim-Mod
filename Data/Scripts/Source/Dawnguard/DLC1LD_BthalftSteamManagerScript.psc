Scriptname DLC1LD_BthalftSteamManagerScript extends ObjectReference  
{Script for the steam manager markers in Bthalft.}

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto
Keyword property LinkCustom04 Auto
Keyword property LinkCustom10 Auto
bool steamDisabled = False

bool Function IsSteamDisabled()
	return steamDisabled
EndFunction

Function EnableSteam()
	steamDisabled = False
	if (GetLinkedRef() != None)
		(GetLinkedRef() as DLC1LD_BthalftSteamScript).EnableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom01) != None)
		(GetLinkedRef(LinkCustom01) as DLC1LD_BthalftSteamScript).EnableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom02) != None)
		(GetLinkedRef(LinkCustom02) as DLC1LD_BthalftSteamScript).EnableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom03) != None)
		(GetLinkedRef(LinkCustom03) as DLC1LD_BthalftSteamScript).EnableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom04) != None)
		(GetLinkedRef(LinkCustom04) as DLC1LD_BthalftSteamScript).EnableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom10) != None)
		GetLinkedRef(LinkCustom10).Enable(True)
	EndIf
EndFunction

Function DisableSteam()
	steamDisabled = True
	if (GetLinkedRef() != None)
		(GetLinkedRef() as DLC1LD_BthalftSteamScript).DisableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom01) != None)
		(GetLinkedRef(LinkCustom01) as DLC1LD_BthalftSteamScript).DisableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom02) != None)
		(GetLinkedRef(LinkCustom02) as DLC1LD_BthalftSteamScript).DisableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom03) != None)
		(GetLinkedRef(LinkCustom03) as DLC1LD_BthalftSteamScript).DisableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom04) != None)
		(GetLinkedRef(LinkCustom04) as DLC1LD_BthalftSteamScript).DisableSteam()
	EndIf
	if (GetLinkedRef(LinkCustom10) != None)
		GetLinkedRef(LinkCustom10).Disable(True)
	EndIf
EndFunction
