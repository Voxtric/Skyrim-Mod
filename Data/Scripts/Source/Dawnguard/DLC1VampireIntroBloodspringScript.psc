Scriptname DLC1VampireIntroBloodspringScript extends ReferenceAlias  

Quest Property DLC1VampireBaseIntro  Auto  

int DoOnce

Event OnActivate (ObjectReference ActionRef)


	if ActionRef == Game.GetPlayer()
		if DLC1VampireBaseIntro.GetStage() == 30
			if DoOnce == 0
				Game.GetPlayer().RemoveItem(DLC1VampireBaseIntroChaliceAlias.GetReference(), 1, true)
				Game.GetPlayer().AddItem(FilledChaliceAlias.GetReference(), 1, true)
				DLC1VampireBaseIntro.SetObjectiveCompleted(30,1)
				DLC1VampireBaseIntro.SetObjectiveDisplayed(35,1)
				RedwaterDenDoor02.GetReference().SetLockLevel(255)
				RedwaterDenDoor02.GetReference().Lock()
				BloodspringScene.Start()
				DoOnce = 1
			endif
		endif
	endif


EndEvent
Scene Property BloodspringScene  Auto  

ReferenceAlias Property DLC1VampireBaseIntroChaliceAlias  Auto  

ReferenceAlias Property FilledChaliceAlias  Auto  

ReferenceAlias Property RedwaterDenDoor02  Auto  
