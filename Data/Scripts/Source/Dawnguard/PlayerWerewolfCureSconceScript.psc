Scriptname PlayerWerewolfCureSconceScript extends ReferenceAlias  

MiscObject Property WitchHead auto
ReferenceAlias Property WolfSpirit auto
Message Property CureMessage auto

Quest Property CR13 auto
Quest Property C06 auto
CompanionsHousekeepingScript Property C00 auto

auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		if (CR13.IsRunning() || C06.IsRunning())
			return
		endif

		if (Game.GetPlayer() == akActivator)
			if (C00.PlayerHasBeastBlood && Game.GetPlayer().GetItemCount(WitchHead) > 0)
				int choice = -1 
				choice = CureMessage.Show()
				if (choice == 0)
					GoToState("Done")
					Game.GetPlayer().RemoveItem(WitchHead, 1)
					WolfSpirit.GetReference().Enable()
				endif
			endif
		endif
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
	EndEvent
EndState

; to allow existing saves to work before the Waiting/Done states were added
Event OnActivate(ObjectReference akActivator)
	GoToState("Waiting")
	GetReference().Activate(akActivator)
EndEvent
