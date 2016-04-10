Scriptname DLC1HunterBaseIntroDoorAliasScript extends ReferenceAlias  Conditional

Quest Property DLC1HunterBaseIntro  Auto  

ReferenceAlias Property ArielleAlias  Auto  

ReferenceAlias Property GunmarAlias  Auto  

ReferenceAlias Property IsranAlias  Auto  

ReferenceAlias Property FlorentiusAlias  Auto  

ObjectReference Property IsranMarker  Auto  

ObjectReference Property GunmarMarker  Auto  

ObjectReference Property ArielleMarker  Auto  

ObjectReference Property FlorentiusMarker  Auto  

int DoOnce



Event OnActivate (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if DLC1HunterBaseIntro.GetStage() == 70
			if DoOnce == 0
				ArielleAlias.GetReference().MoveTo(ArielleMarker)
				GunmarAlias.GetReference().MoveTo(GunmarMarker)
				Serana.GetReference().MoveTo(DLC1VQ03HunterSeranaStart)
				IsranAlias.GetReference().MoveTo(IsranMarker)
				DLC1HunterBaseIntroEndScene.Start()
				DoOnce = 1
			endif
		endif
	endif


EndEvent
Scene Property DLC1HunterBaseIntroEndScene  Auto  

ReferenceAlias Property Serana  Auto  

ObjectReference Property DLC1VQ03HunterSeranaStart  Auto  
