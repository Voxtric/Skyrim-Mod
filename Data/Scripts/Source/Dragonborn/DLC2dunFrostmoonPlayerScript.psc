Scriptname DLC2dunFrostmoonPlayerScript extends ReferenceAlias
{Script on the Frostmoon Crag Player alias. Handles the effects for the Frostmoon Ring set.}

GlobalVariable property DLC2dunFrostmoonCurrentRing Auto		;Ring the player currently has equipped. 0=None, 1=Bloodlust, 2=Moon, 3=Instinct, 4=Hunt
int recordedRingEffect	;Ring effect applied to the player when they entered Beast Form.
Quest property DLC2dunFrostmoonQST Auto

Spell property WerewolfChange Auto					;Werewolf change spells to watch for.
Spell property WerewolfChangeRingOfHircine Auto

Armor property DLC2dunFrostmoonRingBloodlust Auto
Armor property DLC2dunFrostmoonRingMoon Auto
Armor property DLC2dunFrostmoonRingInstinct Auto
Armor property DLC2dunFrostmoonRingHunt Auto

Perk property DLC2dunFrostmoonRingBloodlustBloodlust Auto ;Bloodlust: Do 50% more damage, take 50% more damage.
Perk property DLC2dunFrostmoonRingMoonMagnifyHowls Auto	;Moon: Increases howl Magnitude and Duration by 25%.
Spell property DLC2dunFrostmoonRingInstinctSlowTime Auto	;Instinct: Slow time effect. Cast once when Beast Form starts.
Spell property DLC2dunFrostmoonRingHuntRegen Auto			;Hunt: Allows player health to regen.

Actor player
Race property WerewolfBeastRace Auto
bool hasEnteredWerewolfForm

Event OnSpellCast(Form akSpell)
	if ((akSpell == WerewolfChange) || (akSpell == WerewolfChangeRingOfHircine))
; 		;Debug.Trace("Werewolf Transformation with Global: " + DLC2dunFrostmoonCurrentRing.GetValueInt())
		if (DLC2dunFrostmoonCurrentRing.GetValueInt() > 0)
			RemoveRingEffectIfNecessary()
			recordedRingEffect = DLC2dunFrostmoonCurrentRing.GetValueInt()
			RegisterForSingleUpdate(1)
		Else
			RemoveRingEffectIfNecessary()
			UnregisterForUpdate()
		EndIf
	EndIf
EndEvent

Event OnUpdate()
; 	;Debug.Trace("Update-----")
	
	;Initialize player variable.
	if (player == None)
		player = Game.GetPlayer()
	EndIf
	
	;If the player is not yet in Beast Form, just re-register.
	if ((player.GetRace() != WerewolfBeastRace) && !hasEnteredWerewolfForm)
; 		;Debug.Trace("A")
		RegisterForSingleUpdate(1)
		
	;If the player has just entered Beast Form, apply the ring effect, then re-register.
	ElseIf ((player.GetRace() == WerewolfBeastRace) && !hasEnteredWerewolfForm)
; 		;Debug.Trace("B")
		hasEnteredWerewolfForm = True
		ApplyRingEffect()
		RegisterForSingleUpdate(1)
	
	;While the player remains in Beast Form, re-register.
	ElseIf ((player.GetRace() == WerewolfBeastRace) && hasEnteredWerewolfForm)
; 		;Debug.Trace("C")
		RegisterForSingleUpdate(1)
	
	;When the player leaves Beast Form, remove the ring effect.
	Else ;((player.GetRace() != WerewolfBeastRace) && hasEnteredWerewolfForm)
; 		;Debug.Trace("D")
		hasEnteredWerewolfForm = False
		RemoveRingEffect()
		;Don't reregister in this case.
	EndIf
EndEvent

Function ApplyRingEffect()
; 	;Debug.Trace("Applying Ring Effect!")
	if (recordedRingEffect == 1)	;Bloodlust
		player.AddPerk(DLC2dunFrostmoonRingBloodlustBloodlust)
; 		;Debug.Trace("Bloodlust Applied")
	ElseIf (recordedRingEffect == 2)	;Moon
; 		;Debug.Trace("Adding " + DLC2dunFrostmoonRingMoonMagnifyHowls + " to " + player)
		player.AddPerk(DLC2dunFrostmoonRingMoonMagnifyHowls)
; 		;Debug.Trace("Moon Applied")
	ElseIf (recordedRingEffect == 3)	;Instinct
		player.DoCombatSpellApply(DLC2dunFrostmoonRingInstinctSlowTime, player)
; 		;Debug.Trace("Instinct Applied")
	ElseIf (recordedRingEffect == 4) ;Hunt
		player.AddSpell(DLC2dunFrostmoonRingHuntRegen)
; 		;Debug.Trace("Hunt Applied")
	EndIf
EndFunction

Function RemoveRingEffectIfNecessary()
	if (recordedRingEffect > 0)
		RemoveRingEffect()
	EndIf
EndFunction

Function RemoveRingEffect()
; 	;Debug.Trace("Removing Ring Effect!")
	if (recordedRingEffect == 1)	;Bloodlust
		player.RemovePerk(DLC2dunFrostmoonRingBloodlustBloodlust)
; 		;Debug.Trace("Bloodlust Removed")
	ElseIf (recordedRingEffect == 2)	;Moon
		player.RemovePerk(DLC2dunFrostmoonRingMoonMagnifyHowls)
; 		;Debug.Trace("Moon Removed")
	ElseIf (recordedRingEffect == 3)	;Instinct
		player.DispelSpell(DLC2dunFrostmoonRingInstinctSlowTime)
; 		;Debug.Trace("Instinct Removed")
	ElseIf (recordedRingEffect == 4) ;Hunt
		player.RemoveSpell(DLC2dunFrostmoonRingHuntRegen)
; 		;Debug.Trace("Hunt Removed")
	EndIf
	recordedRingEffect = 0
EndFunction

Event OnObjectEquipped(Form base, ObjectReference ref)
	if (base == DLC2dunFrostmoonRingBloodlust)
		(DLC2dunFrostmoonQST as DLC2dunFrostmoonQSTRingScript).FrostmoonRingEquipped(1)
	ElseIf (base == DLC2dunFrostmoonRingMoon)
		(DLC2dunFrostmoonQST as DLC2dunFrostmoonQSTRingScript).FrostmoonRingEquipped(2)
	ElseIf (base == DLC2dunFrostmoonRingInstinct)
		(DLC2dunFrostmoonQST as DLC2dunFrostmoonQSTRingScript).FrostmoonRingEquipped(3)
	ElseIf (base == DLC2dunFrostmoonRingHunt)
		(DLC2dunFrostmoonQST as DLC2dunFrostmoonQSTRingScript).FrostmoonRingEquipped(4)
	EndIf
EndEvent

Event OnObjectUnequipped(Form base, ObjectReference ref)
	if (base == DLC2dunFrostmoonRingBloodlust)
		(DLC2dunFrostmoonQST as DLC2dunFrostmoonQSTRingScript).FrostmoonRingUnequipped(1)
	ElseIf (base == DLC2dunFrostmoonRingMoon)
		(DLC2dunFrostmoonQST as DLC2dunFrostmoonQSTRingScript).FrostmoonRingUnequipped(2)
	ElseIf (base == DLC2dunFrostmoonRingInstinct)
		(DLC2dunFrostmoonQST as DLC2dunFrostmoonQSTRingScript).FrostmoonRingUnequipped(3)
	ElseIf (base == DLC2dunFrostmoonRingHunt)
		(DLC2dunFrostmoonQST as DLC2dunFrostmoonQSTRingScript).FrostmoonRingUnequipped(4)
	EndIf
EndEvent