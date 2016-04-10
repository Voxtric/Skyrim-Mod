Scriptname DLC1VQ07AurielsBowAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ07 Auto
AchievementsScript Property AchievementsQuest  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		AchievementsQuest.IncDaedricArtifacts()
		if pDLC1VQ07.GetStage() == 150
			pDLC1VQ07.SetStage(200)
		endif
	endif

endEvent