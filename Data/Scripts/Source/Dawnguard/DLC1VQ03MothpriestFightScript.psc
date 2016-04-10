scriptName DLC1VQ03MothpriestFightScript extends Quest
{This script is to unify the scripting for the mothpriest fight to one place}

bool property isHunterSide auto
int property bleedOutStage = 67 auto
{stage to set when the mothpriest enters bleedout}

ReferenceAlias property Dexion auto
ReferenceAlias property CurrentFollower auto
ReferenceAlias property CurrentAnimalFollower auto

Faction property dunPrisonerFaction auto
Faction property DLC1VQ03FightFaction auto
Faction property PlayerFaction auto

Spell property DLC1AbMothpriestThrallFX1 auto
Spell property DLC1AbMothpriestThrallFX2 auto

GlobalVariable property VQ03FightOverrideVariable auto
bool property bfightLoop auto hidden
int property fightMarker auto hidden
float property FightTimer = 5.0 auto
bool property fightStarted = False auto hidden
bool property fightEnded = False auto hidden
Scene Property fightStartScene auto

Function StartUp()
	Dexion.getActorReference().AddSpell(DLC1AbMothpriestThrallFX1)
endFunction

function StartMothPriestFight()
	if !fightStarted
		fightStarted = True
		debug.Trace(self + ": has called Fight Start")
		DLC1VQ03FightFaction.setEnemy(PlayerFaction)
		Dexion.getActorReference().RemoveSpell(DLC1AbMothpriestThrallFX1)
		Dexion.getActorReference().AddSpell(DLC1AbMothpriestThrallFX2)
		Dexion.getActorReference().RemoveFromFaction(dunPrisonerFaction)
		Dexion.getActorReference().AddToFaction(DLC1VQ03FightFaction)
		Dexion.getActorReference().setAV("Aggression", 2)
		Dexion.getActorReference().EvaluatePackage()
		Dexion.getActorReference().StartCombat(game.getPlayer())
		Dexion.getActorReference().SetNoBleedoutRecovery(True)
		FightLoop()
	endif
endFunction


Function EndMothPriestFight()
	;abMovement, abFighting, abCamSwitch, abLooking, abSneaking, abMenu, abActivate, abJournalTab, aiDisablePOVType
	
	;Force the players weapons away for a moment.
	game.DisablePlayerControls(false, true, false, false, false, false, false, false)
	debug.Trace(self + ": has called Fight End")
	;Dexion.getActorReference().AddToFaction(dunPrisonerFaction)
	Dexion.getActorReference().RemoveFromFaction(DLC1VQ03FightFaction)
	Dexion.getActorReference().RemoveSpell(DLC1AbMothpriestThrallFX2)
	Dexion.getActorReference().setAV("Aggression", 0)
	Dexion.getActorReference().EvaluatePackage()
	Dexion.getActorReference().StopCombat()
	CurrentFollower.getActorReference().StopCombat()
	CurrentAnimalFollower.getActorReference().StopCombat()
	;Allow weapons again!
	game.EnablePlayerControls(false, true, false, false, false, false, false, false)
endFunction


Function MothpriestEnteredBleedout()
	if !fightEnded
		fightEnded = True
		fightStartScene.stop()
		bfightLoop = False
		debug.Trace(self + ": has called Mothpriest Entered Bleedout")
		setStage(bleedOutStage)
		EndMothPriestFight()
	endif
endFunction


Function FightLoop()
	bfightLoop = True
	while bfightLoop
		fightMarker = utility.randomInt(1, 5)
		VQ03FightOverrideVariable.setValue(fightMarker)
		Dexion.getActorReference().EvaluatePackage()
		if bFightLoop
			utility.wait(FightTimer)
		endif
	endWhile
	VQ03FightOverrideVariable.setValue(0)
endFunction

Function ClearNoRecovery()
	Dexion.getActorReference().SetNoBleedoutRecovery(False)
endFunction


