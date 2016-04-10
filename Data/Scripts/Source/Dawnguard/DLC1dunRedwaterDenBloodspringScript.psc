ScriptName DLC1dunRedwaterDenBloodspringScript extends objectReference
{This script manages drinking from the pool and filling the chalice for the vampire radiant quest}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Properties block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Spell Property DLC1VampireChalicePower auto
Spell Property DLC1dunRedwaterDenPower auto


GlobalVariable Property DLC1dunRedwaterDenPowerStopDay auto
GlobalVariable Property GameDaysPassed auto
GlobalVariable Property PlayerIsVampire auto

;Disease the player may be infected with
Spell Property TrapDiseaseAtaxia auto
Spell Property TrapDiseaseBoneBreakFever auto
Spell Property TrapDiseaseBrainRot auto
Spell Property TrapDiseaseRattles auto
Spell Property TrapDiseaseRockjoint auto
Spell Property TrapDiseaseWitbane auto
Spell Property TrapDiseaseSanguinareVampiris auto

Message Property DLC1dunRedwaterDenTaintedBloodMessage auto
Message Property DLC1dunRedwaterDenVHQBloodMessage auto

float property diseaseChance = 100.0 auto
float property vampChance = 100.0 auto

Quest property DLC1VampireBaseIntro auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       Event Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Register for update is used to for clearing power/withdrawal
Event OnUpdateGameTime()
		
		;Play time with power is up, time to give withdrawals
	debug.Trace(self + ": UpdateGameTime has fired")
	if (Game.GetPlayer() as Actor).HasSpell(DLC1dunRedwaterDenPower)
		debug.Trace(self + ": Player has power, now remove it")
		Game.GetPlayer().RemoveSpell(DLC1dunRedwaterDenPower)
		;here is where we register for the update to remove the withdrawals and add the withdrawals
	endif

EndEvent

;On activate by the player check if the player already has the power or the chalice version
Event OnActivate(ObjectReference ActivateRef)
	if DLC1VampireBaseIntro.getStage() == 30
		;the quest is running so you are filling the chalice, the script for this is assigned through an alias on the quest

	;If we are not at the stage in the quest to fill the chalice, do the rest of the stuff
	elseif ActivateRef == game.getPlayer()
		;Silly vampire you already have the version with no withdrawals, you don't want this
		if game.getPlayer().hasSpell(DLC1VampireChalicePower)
			DLC1dunRedwaterDenVHQBloodMessage.Show()
		;You already have the power, go away
		elseif Game.GetPlayer().HasSpell(DLC1dunRedwaterDenPower)
			DLC1dunRedwaterDenTaintedBloodMessage.Show()
		;if neither of the above are true, then drink from the spring
		else
			DrinkFromPool()
		endif
	endif
endEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Function block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function DrinkFromPool()
	;if the player is a vampire give them the Tainted Blood of the Ancients
	if PlayerIsVampire.getValue() == 1
		float today = GameDaysPassed.GetValue()
		float PowerStopDay = today + 1
		;If you have withdrawals currently we can get rid of those
		
		DLC1dunRedwaterDenPowerStopDay.SetValue(PowerStopDay)
		RegisterForSingleUpdateGameTime(24 * 1)
		Game.GetPlayer().AddSpell(DLC1dunRedwaterDenPower)
	;If the player is NOT a vampire, infect them with diseases. Really what did you expect.
	else
		ProcessInfection(game.GetPlayer())
	endif
EndFunction


Function ProcessInfection (actor myTarget)
		if utility.randomFloat(0.0, 100.0) <= diseaseChance
			int diseasePick		
			diseasePick = utility.randomInt(1,6)
			;infect with a random disease
			if diseasePick == 1
				myTarget.DoCombatSpellApply(TrapDiseaseAtaxia, myTarget)
			elseif diseasePick == 2
				myTarget.DoCombatSpellApply(TrapDiseaseBoneBreakFever, myTarget)
			elseif diseasePick == 3
				myTarget.DoCombatSpellApply(TrapDiseaseBrainRot, myTarget)
			elseif diseasePick == 4
				myTarget.DoCombatSpellApply(TrapDiseaseRattles, myTarget)
			elseif diseasePick == 5
				myTarget.DoCombatSpellApply(TrapDiseaseRockjoint, myTarget)
			elseif diseasePick == 6
				myTarget.DoCombatSpellApply(TrapDiseaseWitbane, myTarget)
			endif
		endif
		
		;Separate chance of infection with vampirism
		if utility.randomFloat(0.0, 100.0) <= vampChance
			myTarget.DoCombatSpellApply(TrapDiseaseSanguinareVampiris, myTarget)
		endif
endFunction

;/
;Containment for stuff that needs to be added to the chalice

Spell Property DLC1dunRedwaterDenPower auto
Spell Property DLC1dunRedwaterDenWithdrawl auto
GlobalVariable Property DLC1dunRedwaterDenPowerStopDay auto
GlobalVariable Property DLC1dunRedwaterDenWithdrawalStopDay auto

	if Game.GetPlayer().HasSpell(DLC1dunRedwaterDenPower)
		Game.GetPlayer().RemoveSpell(DLC1dunRedwaterDenPower)
		DLC1dunRedwaterDenPowerStopDay.SetValue(today - 1)
	endif
	if Game.GetPlayer().HasSpell(DLC1dunRedwaterDenWithdrawl)
		Game.GetPlayer().RemoveSpell(DLC1dunRedwaterDenWithdrawl)
		DLC1dunRedwaterDenWithdrawalStopDay.SetValue(today - 1)
	endif
/;	
		
		
		
		
		
		
