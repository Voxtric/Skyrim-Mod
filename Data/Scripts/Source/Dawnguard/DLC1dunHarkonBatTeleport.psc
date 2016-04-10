ScriptName DLC1dunHarkonBatTeleport extends ReferenceAlias
{Script for Harkon's bat-based teleporting.}

;References for swapping between Harkon's Melee and Magic forms (which are actually different actors!).
ReferenceAlias property HarkonBattleMainForm Auto
ReferenceAlias property HarkonBattleMagicForm Auto
ReferenceAlias property HarkonBattleMeleeForm Auto
Actor property SelfActor Auto Hidden
Actor property OldActor Auto Hidden
Actor property HarkonBattleRealHarkonActor Auto Hidden
Actor property HarkonBattleMeleeFormActor Auto Hidden
Actor property HarkonBattleMagicFormActor Auto Hidden

bool initialized

ObjectReference property VQ08HarkonSwapMarker Auto
ObjectReference property VQ08HarkonWarpMarker1 Auto
ObjectReference property VQ08HarkonWarpMarker2 Auto

ObjectReference property teleportObject auto hidden	;The location we're teleporting to.
Spell property DLC1VQ08Bats auto							;Bat spell that handles the actual teleport.
Spell property DLC1VQ08SwapBats auto							;Bat spell that handles the actual teleport.
bool property swappingHarkons auto hidden				;Are we swapping Harkons on this teleport?
ObjectReference property newHarkon auto Hidden			;If so, who are we swapping to?


Function Initialize()
	SelfActor = Self.GetActorRef()
	HarkonBattleMeleeFormActor = HarkonBattleMeleeForm.GetActorRef()
	HarkonBattleMagicFormActor = HarkonBattleMagicForm.GetActorRef()
EndFunction

Function BatTeleportTo(ObjectReference obj)
	if (!initialized)
		initialized = True
		Initialize()
	EndIf
	teleportObject = obj
	swappingHarkons = False
	;;Debug.Trace("Begin Harkon Teleport to " + teleportObject)
	;;SelfActor.GetActorBase().SetInvulnerable(True)
	SelfActor.SetAV("Variable06", 1)
	SelfActor.EvaluatePackage()
	SelfActor.DispelAllSpells()
	;;Debug.Trace("Attempting teleport.")
	SelfActor.DoCombatSpellApply(DLC1VQ08Bats, Self.GetActorRef())
EndFunction

Function BatTeleportAndSwapTo(ObjectReference obj)
	if (!initialized)
		initialized = True
		Initialize()
	EndIf
	teleportObject = obj
	swappingHarkons = True
	if (SelfActor == HarkonBattleMagicFormActor)
		newHarkon = HarkonBattleMeleeFormActor
	Else
		newHarkon = HarkonBattleMagicFormActor
	EndIf
	;;Debug.Trace("Begin Harkon Swap Teleport to " + teleportObject)
	;;SelfActor.GetActorBase().SetInvulnerable(True)
	HarkonBattleMagicFormActor.SetAV("Variable06", 1)
	HarkonBattleMagicFormActor.EvaluatePackage()
	HarkonBattleMagicFormActor.DispelAllSpells()
	;HarkonBattleMagicFormActor.SetSubGraphFloatVariable("fdampRate", 0.20)	;Animation fadeout.
	;HarkonBattleMagicFormActor.SetSubGraphFloatVariable("ftoggleBlend", 1.3)
	HarkonBattleMeleeFormActor.SetAV("Variable06", 1)
	HarkonBattleMeleeFormActor.EvaluatePackage()
	HarkonBattleMeleeFormActor.DispelAllSpells()
	;HarkonBattleMeleeFormActor.SetSubGraphFloatVariable("fdampRate", 0.20)	;Animation fadeout.
	;HarkonBattleMeleeFormActor.SetSubGraphFloatVariable("ftoggleBlend", 1.3)
	SelfActor.DoCombatSpellApply(DLC1VQ08SwapBats, newHarkon)
EndFunction

Function BatTeleportToEndMagic(ObjectReference obj)
	if (!initialized)
		initialized = True
		Initialize()
	EndIf
	if (SelfActor == HarkonBattleMagicFormActor)
		BatTeleportTo(obj)
	Else
		BatTeleportAndSwapTo(obj)
	EndIf
EndFunction

Function BatTeleportToEndMelee(ObjectReference obj)
	if (!initialized)
		initialized = True
		Initialize()
	EndIf
	if (SelfActor == HarkonBattleMeleeFormActor)
		BatTeleportTo(obj)
	Else
		BatTeleportAndSwapTo(obj)
	EndIf
EndFunction

Function SwapHarkons()
	;;Debug.Trace("Swapping Harkons!")
	if (!initialized)
		initialized = True
		Initialize()
	EndIf
	HarkonBattleMagicFormActor.StopTranslation()
	HarkonBattleMeleeFormActor.StopTranslation()
	VQ08HarkonSwapMarker.MoveTo(SelfActor)
	if (SelfActor == HarkonBattleMagicFormActor)
		HarkonBattleMagicFormActor.MoveTo(VQ08HarkonWarpMarker1)
		HarkonBattleMeleeFormActor.MoveTo(VQ08HarkonSwapMarker)
		TransferAVs(HarkonBattleMagicFormActor, HarkonBattleMeleeFormActor)
		Self.ForceRefTo(HarkonBattleMeleeFormActor)
		OldActor = HarkonBattleMagicFormActor
		SelfActor = HarkonBattleMeleeFormActor
		((Self as ReferenceAlias) as DLC1dunHarkonBossBattle).SelfActor = HarkonBattleMeleeFormActor
		;;Debug.Trace("Melee Form, Go!")
	Else
		HarkonBattleMeleeFormActor.MoveTo(VQ08HarkonWarpMarker2)
		HarkonBattleMagicFormActor.MoveTo(VQ08HarkonSwapMarker)
		TransferAVs(HarkonBattleMeleeFormActor, HarkonBattleMagicFormActor)
		Self.ForceRefTo(HarkonBattleMagicFormActor)
		OldActor = HarkonBattleMeleeFormActor
		SelfActor = HarkonBattleMagicFormActor
		((Self as ReferenceAlias) as DLC1dunHarkonBossBattle).SelfActor = HarkonBattleMagicFormActor		
		;;Debug.Trace("Magic Form, Go!")
	EndIf
	OldActor.StopCombat()
	SelfActor.SetSubGraphFloatVariable("fdampRate", 0.02)	;Fade in the new Harkon.
	SelfActor.SetSubGraphFloatVariable("ftoggleBlend", 0.0)
	;;Debug.Trace("Swap complete. Self=" + Self.GetActorRef())
	SelfActor.EvaluatePackage()
EndFunction

Function TransferAVs(Actor source, Actor destination)
	;Debug.Trace("IN:")
	;Debug.Trace("Source: " + source + ": " + source.GetAV("Health") + ", " + source.GetAV("Magicka") + ", " + source.GetAV("Stamina") + ", " + source.GetAV("Variable06"))
	;Debug.Trace("Destination: " + destination + ": " + destination.GetAV("Health") + ", " + destination.GetAV("Magicka") + ", " + destination.GetAV("Stamina") + ", " + destination.GetAV("Variable06"))
	
	if (destination.GetAV("Health") > source.GetAV("Health"))
		destination.DamageAV("Health", (-1 * (source.GetAV("Health") - destination.GetAV("Health"))))
	Else
		destination.RestoreAV("Health", (-1 * (source.GetAV("Health") - destination.GetAV("Health"))))
	EndIf
	;Debug.Trace("Outgoing Health: " + source.GetAV("Health") + " == " + destination.GetAV("Health"))
	if (destination.GetAV("Magicka") > source.GetAV("Magicka"))
		destination.DamageAV("Magicka", (-1 * (source.GetAV("Magicka") - destination.GetAV("Magicka"))))
	Else
		destination.RestoreAV("Magicka", (-1 * (source.GetAV("Magicka") - destination.GetAV("Magicka"))))
	EndIf
	if (destination.GetAV("Stamina") > source.GetAV("Stamina"))
		destination.DamageAV("Stamina", (-1 * (source.GetAV("Stamina") - destination.GetAV("Stamina"))))
	Else
		destination.RestoreAV("Stamina", (-1 * (source.GetAV("Stamina") - destination.GetAV("Stamina"))))
	EndIf
	
	;Debug.Trace("OUT:")
	;Debug.Trace("Source: " + source + ": " + source.GetAV("Health") + ", " + source.GetAV("Magicka") + ", " + source.GetAV("Stamina") + ", " + source.GetAV("Variable06"))
	;Debug.Trace("Destination: " + destination + ": " + destination.GetAV("Health") + ", " + destination.GetAV("Magicka") + ", " + destination.GetAV("Stamina") + ", " + destination.GetAV("Variable06"))
	
	destination.SetAV("Variable06", 1) ;*Always* 1 at this point, since we're in the middle of a teleport.
	destination.SetAV("Variable07", source.GetAV("Variable07"))	
	destination.SetAV("Variable10", source.GetAV("Variable10"))
EndFunction

Function BatsAllDone()
	if (swappingHarkons)
		SwapHarkons()
	EndIf
	if (SelfActor == HarkonBattleMagicFormActor)
		(SelfActor as DLC1HarkonCombatMagicLevelingScript).ReequipDrainSpell()
	EndIf
	SelfActor.SetAV("Variable06", 1)
	((Self as ReferenceAlias) as DLC1dunHarkonBossBattle).HarkonReforms()
EndFunction