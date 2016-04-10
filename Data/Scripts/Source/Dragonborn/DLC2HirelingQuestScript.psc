Scriptname DLC2HirelingQuestScript extends Quest  

MiscObject Property Gold001 Auto 
GlobalVariable Property HirelingGold Auto
GlobalVariable Property CanRehire Auto
Faction Property CurrentHireling Auto  
GlobalVariable Property PlayerFollowerCount Auto  
Quest Property DialogueFollower Auto
ReferenceAlias Property FollowerAlias Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property HirelingCommentNextAllowed auto
int Property RehireWindow  Auto
GlobalVariable Property DLC2CanRehireTeldryn  Auto

float DaysUntilNextAllowed = 0.04  ;about 1 "game hour" expressed in GameDaysPassed

function PayHireling(ObjectReference HirelingRef)

	actor HirelingActor = HirelingRef as Actor	
	game.getplayer().RemoveItem(Gold001, hirelinggold.value as int)
	PlayerFollowerCount.Value=1
	HirelingActor.AddToFaction(CurrentHireling)
	(DialogueFollower as DialogueFollowerScript).SetFollower(HirelingActor)

EndFunction

function ReHire(ObjectReference HirelingRef)

	actor HirelingActor = HirelingRef as Actor
	PlayerFollowerCount.Value=1
	HirelingActor.AddToFaction(CurrentHireling)
	(DialogueFollower as DialogueFollowerScript).SetFollower(HirelingActor)
	CanRehire.Value=1

EndFunction

;Primarily used to handle functionality of setting globals that are used by individual WIComment quests to control how often comments about the player are heard

Function Commented()

	float NextAllowed = GameDaysPassed.GetValue() + DaysUntilNextAllowed
	HirelingCommentNextAllowed.SetValue(NextAllowed)

EndFunction

Function DismissNewFollower()

	DLC2CanRehireTeldryn.SetValue(GameDaysPassed.value+1)	
	
EndFunction