Scriptname DLC1VQ04QuestScript extends Quest  

ObjectReference Property pDLC1VQ04PortalAreaEffectTriggerRef Auto
ObjectReference Property pDLC1VQ04VampireToggle Auto
GlobalVariable Property pDLC1VQ04BecameVamp Auto
GlobalVariable Property pDLC1VQ04SafeToEnter Auto
DLC1_NPCMentalModelScript Property MM Auto
GlobalVariable Property pDLC1VQ04Ingredient Auto
GlobalVariable Property pDLC1VQ04SoulTrapped Auto
ReferenceAlias Property pDLC1VQ04RNPCAlias Auto
DLC1VampireTurnScript Property pDLC1VampireTurn  Auto
Spell Property pDLC1VQSoulDamage Auto
Quest Property pDLC1VQ05SoulGemHandler Auto
GlobalVariable Property pDLC1VQ04VampireSolution Auto
Keyword Property Vampire Auto

Event OnUpdate()

	if GetStage() == 100
		if Game.GetPlayer().HasKeyword(Vampire) == 1
			pDLC1VQ04VampireSolution.SetValue(1)
			SetStage(111)
		endif
	else
		RegisterForSingleUpdate(15)
	endif

endEvent

Function CheckIngreds()

	if GetStage() == 60
		if GetStageDone(70) == 0
			if pDLC1VQ04Ingredient.GetValue() >= 3
				SetStage(70)
			endif
		endif
	endif

endFunction

Function VampireEarly()

	pDLC1VQ04SafeToEnter.SetValue(1)
	pDLC1VQ04VampireToggle.Disable()

endFunction

Function SeranaBite()

	pDLC1VampireTurn.ReceiveSeranasGift(pDLC1VQ04RNPCAlias.GetActorRef())
	pDLC1VQ04BecameVamp.SetValue(1)
	pDLC1VQ04SafeToEnter.SetValue(1)
	pDLC1VQ04VampireToggle.Disable()
	pDLC1VQ04PortalAreaEffectTriggerRef.Disable()
	MM.IsWillingToWait = false
	MM.EngageFollowBehavior()
	pDLC1VQ04RNPCAlias.GetActorRef().EvaluatePackage()
	Game.EnablePlayerControls()
	SetObjectiveCompleted(100,1)
	SetObjectiveDisplayed(120,1)

endFunction

Function TurnedByOther()

	pDLC1VQ04SafeToEnter.SetValue(1)
	pDLC1VQ04PortalAreaEffectTriggerRef.Disable()
	pDLC1VQ04VampireToggle.Disable()
	pDLC1VQ04BecameVamp.SetValue(1)
	MM.IsWillingToWait = false
	MM.EngageFollowBehavior()
	pDLC1VQ04RNPCAlias.GetActorRef().EvaluatePackage()
	SetObjectiveCompleted(100,1)
	SetObjectiveDisplayed(120,1)		

endFunction

Function SoulTrapped()

	pDLC1VQ04SafeToEnter.SetValue(1)
	pDLC1VQ04VampireToggle.Disable()
	pDLC1VQ04PortalAreaEffectTriggerRef.Disable()
	MM.IsWillingToWait = false
	MM.EngageFollowBehavior()
	pDLC1VQ04RNPCAlias.GetActorRef().EvaluatePackage()
	pDLC1VQ04SoulTrapped.SetValue(1)
	Game.GetPlayer().AddSpell(pDLC1VQSoulDamage)
	pDLC1VQ05SoulGemHandler.SetStage(10)
	Game.EnablePlayerControls()
	SetObjectiveCompleted(110,1)
	SetObjectiveDisplayed(120,1)

endFunction

Function NoLongerAVamp()

	pDLC1VQ04SafeToEnter.SetValue(0)
	pDLC1VQ04PortalAreaEffectTriggerRef.Enable()
	pDLC1VQ04VampireToggle.Enable()
	pDLC1VQ04RNPCAlias.GetActorRef().EvaluatePackage()

endFunction

Function IAmVampAgain()

	pDLC1VQ04SafeToEnter.SetValue(1)
	pDLC1VQ04PortalAreaEffectTriggerRef.Disable()
	pDLC1VQ04VampireToggle.Disable()
	pDLC1VQ04RNPCAlias.GetActorRef().EvaluatePackage()

endFunction