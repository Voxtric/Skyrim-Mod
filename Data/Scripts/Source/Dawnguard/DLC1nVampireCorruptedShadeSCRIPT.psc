Scriptname DLC1nVampireCorruptedShadeSCRIPT extends Actor

float property fDelay = 0.75 auto
{time to wait before Spawning Ash Pile}
float property fDelayEnd = 1.65 auto
{time to wait before Removing Base Actor}
float property ShaderDuration = 0.00 auto
{Duration of Effect Shader.}
Activator property pDefaultAshPileGhost auto
{The object we use as a pile.}
Bool property bSetAlphaZero = True auto
{The Effect Shader we want.}
FormList Property pDisintegrationMainImmunityList auto
{If the target is in this list, they will not be disintegrated.}
EFFECTSHADER PROPERTY pGhostDeathFXShader AUTO
{the shader to play while dying}

race VictimRace
ACTOR victim
bool TargetIsImmune = True
OBJECTREFERENCE necroHolder

BOOL deathVar=TRUE

EVENT onLoad()
	
	victim = SELF
	
	
	IF(!SELF.isDead() || deathVar == FALSE)
		utility.wait(10)
		createAshPile()
	
		utility.wait(1)
		disable()
	ENDIF

endEVENT

EVENT onDying(ACTOR akKiller)
	deathVar = FALSE

	createAshPile()

	utility.wait(1)
	disable()

endEVENT

FUNCTION createAshPile()

	; //check to see if the target is in the immunity list
	IF(pDisintegrationMainImmunityList == none)
		TargetIsImmune = False
	ELSE
		ActorBase VictimBase = victim.GetBaseObject() as ActorBase
		VictimRace = VictimBase.GetRace()
		
		IF(pDisintegrationMainImmunityList.hasform(VictimRace) || pDisintegrationMainImmunityList.hasform(VictimBase))
			TargetIsImmune = True
		ELSE
			TargetIsImmune = False
		ENDIF
	ENDIF

	; //if the target is not immune, disintegrate them
	IF(TargetIsImmune == False)
		
		victim.kill(game.getPlayer())
		victim.SetCriticalStage(victim.CritStage_DisintegrateStart)

		IF(pGhostDeathFXShader != none)
			pGhostDeathFXShader.play(victim,ShaderDuration)
		ENDIF
		
		victim.SetAlpha (0.0,True)
		
		; //attach the ash pile
		victim.AttachAshPile(pDefaultAshPileGhost)
		
		utility.wait(fDelayEnd)
		IF(pGhostDeathFXShader != none)
			pGhostDeathFXShader.stop(victim)
		ENDIF
		IF(bSetAlphaZero == True)
			victim.SetAlpha (0.0,True)
		ENDIF
		victim.SetCriticalStage(victim.CritStage_DisintegrateEnd)
	ENDIF
	
endFUNCTION

