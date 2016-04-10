scriptName DLC1LD_ForgeTransferActivatorScript extends ObjectReference
{This script lives on a trigger around the Forge, and primarily handles the failure messages.}

Quest property DLC1LD_Bthalft Auto
ObjectReference property DLC1LD_FXSteamForge01 Auto
Message property DLC1LD_BthalftForgeFailMessage01 Auto
Message property DLC1LD_BthalftForgeFailMessage02 Auto

Event onActivate(objectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (!DLC1LD_FXSteamForge01.IsDisabled())
			;If Steam is on, show that error message.
			DLC1LD_BthalftForgeFailMessage01.Show()
		ElseIf (DLC1LD_Bthalft.GetStage() < 75)
			;If Stage < 75, combat is ongoing, so show that error message.
			DLC1LD_BthalftForgeFailMessage02.Show()
		Else
			Self.GetLinkedRef().Activate(akActivator)
		EndIf
	EndIf
EndEvent