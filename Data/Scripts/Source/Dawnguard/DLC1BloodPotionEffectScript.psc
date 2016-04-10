Scriptname DLC1BloodPotionEffectScript extends ActiveMagicEffect  

PlayerVampireQuestScript Property PlayerVampireQuest  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	PlayerVampireQuest.VampireFeed()
EndEvent
