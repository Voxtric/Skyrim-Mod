Scriptname DLC1LD_ForgemasterBossBattle extends ReferenceAlias Conditional
{Boss battle script for the DLC1LD Forgemaster Centurion.}

ObjectReference property DLC1LD_ForgemasterSpawn1 Auto
ObjectReference property DLC1LD_ForgemasterSpawn2 Auto

Spell property DLC1LD_ForgemasterFireBreath01 Auto
Spell property DLC1LD_ForgemasterFireBreath02 Auto
Spell property DLC1LD_ForgemasterFireBreath03 Auto
Spell property DLC1LD_ForgemasterFireball01 Auto
Spell property DLC1LD_ForgemasterFireball02 Auto
Spell property DLC1LD_ForgemasterFireball03 Auto
Shout property DLC1LD_ForgemasterFireBreathShout01 Auto
Shout property DLC1LD_ForgemasterFireBreathShout02 Auto
Shout property DLC1LD_ForgemasterFireBreathShout03 Auto
Shout property DLC1LD_ForgemasterFireballShout01 Auto
Shout property DLC1LD_ForgemasterFireballShout02 Auto
Shout property DLC1LD_ForgemasterFireballShout03 Auto
int ForgemasterBattleState = 0


Quest property DLC1LD_Bthalft Auto
bool hasRunUpdateLoop = False

Function StartForgemaster()
	Debug.Trace("Starting Forgemaster")
	if (Game.GetPlayer().GetDistance(DLC1LD_ForgemasterSpawn1) > Game.GetPlayer().GetDistance(DLC1LD_ForgemasterSpawn2))
		Self.GetActorRef().MoveTo(DLC1LD_ForgemasterSpawn1)
	Else
		Self.GetActorRef().MoveTo(DLC1LD_ForgemasterSpawn2)
	EndIf
	Self.GetActorRef().Enable()
	Self.GetActorRef().Activate(Self.GetActorRef())
EndFunction
 
Event OnActivate(ObjectReference obj)
	if (obj == Self.GetActorRef() && !hasRunUpdateLoop)
		hasRunUpdateLoop = True
		RunUpdateLoop()
	EndIf
EndEvent

Function RunUpdateLoop()
	While (DLC1LD_Bthalft.GetStage() < 75)
		Debug.Trace("In update loop.")
		if (DLC1LD_Bthalft.GetStage() >= 65 && !Self.GetActorRef().IsInCombat())
			Self.GetActorRef().StartCombat(Game.GetPlayer())
		EndIf
		Self.GetActorRef().EvaluatePackage()
		Utility.Wait(1)
	EndWhile
EndFunction

Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (ForgemasterBattleState != -1)
		if (Self.GetActorRef().GetAVPercentage("Health") < 0.5)
			Debug.Trace("Releasing Forgemaster restraints.")
			ForgemasterBattleState = -1
			Self.GetActorRef().SetAV("Variable06", 1)
			Self.GetActorRef().EvaluatePackage()
			AddFireBreathShout()
			AddFireballShout()
		EndIf
	EndIf
EndEvent

Event OnSpellCast(Form akSpell)
	Spell mySpell = akSpell as Spell
	
	int spellID = 0
	if (mySpell == DLC1LD_ForgemasterFireBreath01 || mySpell == DLC1LD_ForgemasterFireBreath02 || mySpell == DLC1LD_ForgemasterFireBreath03)
		spellID = 1
	ElseIf (mySpell == DLC1LD_ForgemasterFireball01 || mySpell == DLC1LD_ForgemasterFireball02 || mySpell == DLC1LD_ForgemasterFireball03)
		spellID = 2
	EndIf
	Debug.Trace("Forgemaster Spell " + akSpell + " as " + spellID + " Intercepted.")
	
	if (ForgemasterBattleState >= 0)
		if (ForgemasterBattleState == 0 && spellID == 1)
			Debug.Trace("Remove Fire Breath, Add Fireball.")
			RemoveFireBreathShout()
			AddFireballShout()
			ForgemasterBattleState = ForgemasterBattleState + 1
		ElseIf (ForgemasterBattleState == 1 && spellID == 2)
			Debug.Trace("Fireball " + ForgemasterBattleState + " passes.")
			ForgemasterBattleState = ForgemasterBattleState + 1
		ElseIf (ForgemasterBattleState >= 2 && spellID == 2)
			Debug.Trace("Remove Fireball, Add Fire Breath.")
			RemoveFireballShout()
			AddFireBreathShout()
			ForgemasterBattleState = 0
		Else
			Debug.Trace("Doing nothing.")
		EndIf
	EndIf	
EndEvent

Function AddFireBreathShout()
	Self.GetActorRef().AddShout(PickShout(DLC1LD_ForgemasterFireBreathShout01, DLC1LD_ForgemasterFireBreathShout02, DLC1LD_ForgemasterFireBreathShout03))
EndFunction

Function AddFireballShout()
	Self.GetActorRef().AddShout(PickShout(DLC1LD_ForgemasterFireballShout01, DLC1LD_ForgemasterFireballShout02, DLC1LD_ForgemasterFireballShout03))
EndFunction

Function RemoveFireBreathShout()
	Self.GetActorRef().RemoveShout(PickShout(DLC1LD_ForgemasterFireBreathShout01, DLC1LD_ForgemasterFireBreathShout02, DLC1LD_ForgemasterFireBreathShout03))
EndFunction

Function RemoveFireballShout()
	Self.GetActorRef().RemoveShout(PickShout(DLC1LD_ForgemasterFireballShout01, DLC1LD_ForgemasterFireballShout02, DLC1LD_ForgemasterFireballShout03))
EndFunction

Shout Function PickShout(Shout s1, Shout s2, Shout s3)
	Shout s
	Debug.Trace("BASE IS: " + Self.GetActorRef().GetActorBase() + " & Level: " + Self.GetActorRef().GetLevel())
	if (Self.GetActorRef().GetLevel() < 30)
		s = s1
	ElseIf (Self.GetActorRef().GetLevel() == 30)
		s = s2
	ElseIf (Self.GetActorRef().GetLevel() > 30)
		s = s3
	EndIf
	Debug.Trace("PickShout returns " + s)
	return s
EndFunction