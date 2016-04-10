Scriptname DLC1WerewolfFeedPointsScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DLC1WerewolfFeedPoints.Value += 1
	If DLC1WerewolfTotalPerksEarned.Value < DLC1WerewolfMaxPerks.Value
		DLC1FeedPointsMsg.Show()
		Debug.Trace("WEREWOLF: Feeding " + DLC1WerewolfFeedPoints.value)
		if DLC1WerewolfFeedPoints.Value >= DLC1WerewolfNextPerk.Value
			DLC1WerewolfFeedPoints.Value -= DLC1WerewolfNextPerk.Value
			DLC1WerewolfPerkPoints.Value += 1
			DLC1WerewolfTotalPerksEarned.Value += 1
			DLC1WerewolfNextPerk.Value = DLC1WerewolfNextPerk.Value + 2
			DLC1WerewolfPerkEarned.Show()
			Debug.Trace("WEREWOLF: New perk (Feed points " + DLC1WerewolfFeedPoints.Value +", Next perk " + DLC1WerewolfNextPerk.Value + ", Perk pionts " + DLC1WerewolfPerkPoints.value + ")")
		endif
	endif
	Game.GetPlayer().SetActorValue("WerewolfPerks", DLC1WerewolfFeedPoints.Value / DLC1WerewolfNextPerk.Value * 100)				
	Debug.Trace("WEREWOLF: Actor value " + Game.GetPlayer().GetActorValue("WerewolfPerks") + ")")
EndEvent

GlobalVariable Property DLC1WerewolfFeedPoints  Auto  
GlobalVariable Property DLC1WerewolfNextPerk  Auto  
GlobalVariable Property DLC1WerewolfPerkPoints  Auto  

Message Property DLC1FeedPointsMsg  Auto  

Message Property DLC1WerewolfPerkEarned  Auto  

GlobalVariable Property DLC1WerewolfMaxPerks  Auto  

GlobalVariable Property DLC1WerewolfTotalPerksEarned  Auto  
