Scriptname DLC1KeeperSoulSCRIPT extends ObjectReference  
{Scripted effect for Playing Visual Effects on the Soul Cairn crystal trap.}

import debug
import game

SPELL Property KeeperSoulSpell  Auto  

VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
VisualEffect property CasterVFX auto
{Visual Effect on Caster aiming at Target}

Keyword Property LinkKeyword auto

event onCellAttach()
	;KeeperSoulSpell.cast(self,getLinkedRef(LinkKeyword))
	ObjectReference Target = getLinkedRef(LinkKeyword)
	ObjectReference Caster = Self
	if TargetVFX
	;debug.trace("effect playing")
		TargetVFX.Play(Target, akfacingObject = Caster)              ; Play TargetVFX and aim them at the caster
	endif
	if CasterVFX
		CasterVFX.Play(Caster, akfacingObject = Target)
	endif

endEvent


