Scriptname DLC1LD_GhostScript extends Actor 
{Special script to manage DLC1LD's Katria, the ghost that follows you through the quest. Allows clean fade behavior and warping.} 

Scene property DLC1LD_KatriaKilledByPlayer Auto
Spell property GhostResistsAbility Auto
Spell property DLC1LD_GhostAbility Auto
bool property KatriaTeleportingOut = False Auto Hidden

bool isFadingIn
bool isCatchingUp
ObjectReference lastAttacker
bool hasPlayedAllyDeathScene = False

Event onLoad()
	Self.AddSpell(DLC1LD_GhostAbility)
	Self.AddSpell(GhostResistsAbility)
	if (!Self.IsDisabled() && !isFadingIn)
		FadeIn()
	EndIf
EndEvent

Event OnAttach()
	if (!Self.IsDisabled() && !isFadingIn)
		FadeIn()
	EndIf
EndEvent

Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	lastAttacker = aggressor 
EndEvent

Event OnEnterBleedout()
	Self.SetNoBleedoutRecovery(True)
	FadeOut()
	Self.SetNoBleedoutRecovery(False)
	Utility.Wait(5)
	Self.MoveToPackageLocation()
	Self.RestoreAV("Health", Self.GetAV("Health") / 2)
	if (!KatriaTeleportingOut)
		FadeIn()
		if (lastAttacker == Game.GetPlayer() && !hasPlayedAllyDeathScene)
			hasPlayedAllyDeathScene = True
			DLC1LD_KatriaKilledByPlayer.Start()
		EndIf
	EndIf
EndEvent

Function KatriaFinale()
	;Katria stands still and becomes noninteractive.
	Self.BlockActivation(True)
	Self.EvaluatePackage()
	Self.SetGhost(True)
EndFunction

Function CatchUp(ObjectReference moveTarget)
	if (!isCatchingUp)
		isCatchingUp = True
		if ((Self.GetDistance(moveTarget) > 2000) && (Self.GetDistance(Game.GetPlayer()) > 2000))
			Self.FadeOut()
			Self.MoveTo(moveTarget)
			Self.FadeIn()
		EndIf
		isCatchingUp = False
	EndIf
EndFunction

Function FadeIn()
	Self.Enable(False)
	Utility.Wait(0.01)
	Self.SetAlpha(0)
	Utility.Wait(2)
	Self.SetAlpha(0.25, True)	
EndFunction

Function FadeOut()
	Self.SetAlpha(0, True)
	Utility.Wait(2.5)
	Self.Disable()
EndFunction

Function FadeInNoWait()
	isFadingIn = True
	RegisterForSingleUpdate(0.1)
EndFunction

Function FadeOutNoWait()
	isFadingIn = False
	RegisterForSingleUpdate(0.1)
EndFunction

Function OnUpdate()
	if (isFadingIn)
		FadeIn()
	Else
		FadeOut()
	EndIf
EndFunction