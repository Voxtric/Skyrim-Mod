Scriptname DLC1FadingGhostScript extends Actor 
{A script to allow certain ghosts to fade in and out cleanly. NOT compatible with defaultGhostScript or its abilities. Does NOT handle ghost death in any way.}

Spell property GhostResistsAbility Auto
{Standard ghost resistances.}
Spell property DLC1LD_GhostAbility Auto
{A modified version of the ghost vfx that only adds the shader (wispy glow). Alpha management is left to this script.}
bool isFadingIn
;Whether the ghost is in the process of fading in or out.


;On load, apply the ghost abilities and fade the ghost to the correct alpha if necessary.
Event onLoad()
	Self.AddSpell(DLC1LD_GhostAbility)
	Self.AddSpell(GhostResistsAbility)
	if (!Self.IsDisabled() && !isFadingIn)
		FadeIn()
	EndIf
EndEvent

;On attach, fade the ghost to the correct alpha if necessary.
Event OnAttach()
	if (!Self.IsDisabled() && !isFadingIn)
		FadeIn()
	EndIf
EndEvent

;Call this instead of Enable() to enable the ghost and get it to fade in. Latent function.
Function FadeIn()
	Self.Enable(False)
	Utility.Wait(0.01)
	Self.SetAlpha(0)
	Utility.Wait(2)
	Self.SetAlpha(0.25, True)
EndFunction

;Call this instead of Disable() to disable the ghost and get it to fade out. Latent function.
Function FadeOut()
	Self.SetAlpha(0, True)
	Utility.Wait(2.5)
	Self.Disable()
EndFunction

;Non-latent version of FadeIn()
Function FadeInNoWait()
	isFadingIn = True
	RegisterForSingleUpdate(0.1)
EndFunction

;Non-latent version of FadeOut()
Function FadeOutNoWait()
	isFadingIn = False
	RegisterForSingleUpdate(0.1)
EndFunction

;Helper for FadeInNoWait()/FadeOutNoWait()
Function OnUpdate()
	if (isFadingIn)
		FadeIn()
	Else
		FadeOut()
	EndIf
EndFunction