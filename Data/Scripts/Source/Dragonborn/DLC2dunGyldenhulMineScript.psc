ScriptName DLC2dunGyldenhulMineScript extends objectReference
{Script for activatable trigger on fake wall in Gyldenhul Barrow.}

formlist property mineOreToolsList auto
{Optional: Player must have at least one item from this formlist to interact}

Message Property FailureMessage Auto  
{Message to say why you can't use this without RequiredWeapon}

Event OnCellAttach()
	blockActivation()
	SetNoFavorAllowed()
EndEvent

Event OnActivate(objectReference akActivator)
	if (akActivator as Actor)
		if (akActivator == (Game.getPlayer()))
			If (Game.GetPlayer().GetItemCount(mineOreToolsList) == 0)
				FailureMessage.Show()
			Else
				If (GetLinkedRef() != None)
					(getLinkedRef() as DLC2dunGyldenhulFurnitureScript).lastActivateRef = akActivator
					getLinkedRef().activate(akActivator)
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent