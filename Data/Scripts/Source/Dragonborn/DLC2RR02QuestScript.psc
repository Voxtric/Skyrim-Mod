Scriptname DLC2RR02QuestScript extends Quest  Conditional

ActorBase Property pDLC2RRMirriSeverin Auto
ActorBase Property pDLC2RRTilisuSeverin Auto
ReferenceAlias Property pMirriAlias Auto
ReferenceAlias Property pTilisuAlias Auto
ObjectReference Property pDLC2RR02MirriEndMarker Auto
ObjectReference Property pDLC2RR02TilisuEndMarker Auto
Outfit Property pDLC2MoragTongOutfit Auto
Cell Property pDLC2RRUlenTomb Auto
GlobalVariable Property pDLC2RRTilisuGo Auto
ObjectReference Property pDLC2RR02TombMoveMarker Auto
int Property pTilisuDone Auto
int Property pTilisuRecog Auto
int Property pDoneMoveCheck Auto

Function SeverinMove()

	if pDoneMoveCheck == 0

		if pDLC2RRTilisuSeverin.GetDeadCount() == 0
			pTilisuAlias.GetActorRef().MoveTo(pDLC2RR02TilisuEndMarker)
			pTilisuAlias.GetActorRef().EvaluatePackage()
			pTilisuAlias.GetActorRef().SetOutfit(pDLC2MoragTongOutfit)
		endif

		if pDLC2RRMirriSeverin.GetDeadCount() == 0
			pMirriAlias.GetActorRef().MoveTo(pDLC2RR02MirriEndMarker)
			pMirriAlias.GetActorRef().EvaluatePackage()
			pMirriAlias.GetActorRef().SetOutfit(pDLC2MoragTongOutfit)
		endif

		pDoneMoveCheck = 1

	endif

endFunction

Function TilisuCountdown()
	
	if pTilisuDone == 0
		utility.waitgametime(0.5)
		if pTilisuAlias.GetActorRef().Is3DLoaded() == 0
			pTilisuAlias.GetActorRef().MoveTo(pDLC2RR02TombMoveMarker)
			pTilisuAlias.GetActorRef().EvaluatePackage()
		endif
		SetObjectiveCompleted(20,1)
		SetObjectiveDisplayed(30,1)
		pTilisuDone = 1
	endif

endFunction

event OnUpdate()

; 	debug.trace("running")

	if pTilisuRecog == 0 && GetStage() == 40 && Game.GetPlayer().GetParentCell() == pDLC2RRUlenTomb && Game.GetPlayer().GetDistance(pTilisuAlias.GetActorRef()) < 200 && Game.GetPlayer().HasLOS(pTilisuAlias.GetActorRef())
		SetStage(50)
		pTilisuRecog = 1
	else
		RegisterForSingleUpdate(1)
	endif

endEvent