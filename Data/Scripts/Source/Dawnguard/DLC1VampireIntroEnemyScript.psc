Scriptname DLC1VampireIntroEnemyScript extends ReferenceAlias  

Quest Property DLC1VampireBaseIntro  Auto  



Event OnDeath(Actor Killer)

DLC1VampireBaseIntroQuestScript QuestScript = DLC1VampireBaseIntro as DLC1VampireBaseIntroQuestScript


	if DLC1VampireBaseIntro.GetStage() >= 30
		QuestScript.EnemiesKilled += 1
		if QuestScript.EnemiesKilled == 2
			DLC1VampireBaseIntro.SetStage(50)
		endif	
	endif


EndEvent




Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if DLC1VampireBaseIntro.GetStage() == 50
			DLC1VampireBaseIntro.SetStage(60)
		endif
	endif

EndEvent