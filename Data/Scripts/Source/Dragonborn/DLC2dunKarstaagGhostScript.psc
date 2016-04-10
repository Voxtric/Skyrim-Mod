Scriptname DLC2dunKarstaagGhostScript extends Actor  
{A modified version of the default ghost script for Karstaag, since we want him to pop on command.}

EffectShader property pGhostFXShader auto
Container property pDefaultGhostCorpse auto
Explosion property pdefaultGhostDeathExplosion auto
LeveledItem property pdefaultGhostLeveledList auto

Spell property pGhostAbilityNew auto
Spell property pGhostResistsAbility auto

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
FormList property pDisintegrationMainImmunityList auto
{If the target is in this list, they will not be disintegrated.}
EFFECTSHADER property pGhostDeathFXShader auto
{the shader to play while dying}

Event OnLoad()
	Self.AddSpell(pGhostAbilityNew)
	Self.AddSpell(pGhostResistsAbility)
	Self.BlockActivation(True)
	Self.SetNoFavorAllowed(True)
EndEvent

Function DissolveKarstaag()
	Self.SetCriticalStage(Self.CritStage_DisintegrateStart)
	pGhostDeathFXShader.play(Self,ShaderDuration)
	Self.SetAlpha (0.0,True)
	Self.AttachAshPile(pDefaultAshPileGhost)
	Self.BlockActivation(False)
	Self.SetNoFavorAllowed(False)
	Utility.wait(fDelayEnd)
	pGhostDeathFXShader.stop(Self)
	Self.SetAlpha(0.0,True)
	Self.SetCriticalStage(Self.CritStage_DisintegrateEnd)
EndFunction 


