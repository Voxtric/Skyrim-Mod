Scriptname DLC1HunterIntroBearScript extends ReferenceAlias  Conditional

Quest Property DLC1HunterBaseIntro  Auto  


Event OnDeath (Actor Killer)

	(DLC1HunterBaseIntro as DLC1HunterBaseIntroQuestScript).BearDead=1
	if DLC1HunterBaseIntro.IsObjectiveDisplayed(45)
		DLC1HunterBaseIntro.SetObjectiveCompleted(45)
		DLC1HunterBaseIntro.SetObjectiveDisplayed(47)
	endif

EndEvent