scriptName  DLC2StandingStoneFX extends ObjectReference

import Debug

Keyword Property DLC2StandingStoneFXLink Auto

ObjectReference property RingTop Auto

EffectShader Property DLC2StandingStoneCorruptedFXS Auto
EffectShader Property DLC2StandingStoneCracksFXS Auto

Sound Property OBJSTandingStoneExplode auto ; create a sound property we'll point to in the editor
Sound Property OBJSTandingStoneExplode2D auto ; create a sound property we'll point to in the editor

Bool Cleansed

Event onCellAttach()
	If(!Cleansed)
		DLC2StandingStoneCorruptedFXS.Play(self)
	Endif
endEvent

Event onCellDetach()
	If(Cleansed)
		DisableLinkChain(DLC2StandingStoneFXLink)
		playanimation("CLEAR")
	Endif
endEvent


State Done
	function StandingStoneExplode()
	endFunction
endState


function StandingStoneExplode()
	If Cleansed == False
		GotoState ("Done")
		Cleansed = True
		DLC2StandingStoneCorruptedFXS.Stop(self)
		RingTop.DamageObject(10.0)
		utility.wait(1)
		OBJSTandingStoneExplode.play(self) 
		OBJSTandingStoneExplode2D.play(self) 
		Game.ShakeCamera(afStrength = 0.25, afDuration = 7)
		RingTop.playanimation("Stage1")
		playanimation("Stage1")
   	     	OBjectReference Link = self.getlinkedref(DLC2StandingStoneFXLink)
				While Link != None
					DLC2StandingStoneCracksFXS.Play(Link)
					Link = Link.getlinkedref(DLC2StandingStoneFXLink)
				endWhile
				Utility.wait(5)
				Game.ShakeCamera(afStrength = 0.75, afDuration = 0.125)
				RingTop.playanimation("Stage2")
				Link = self.getlinkedref(DLC2StandingStoneFXLink)
				While Link != None
					Link.DamageObject(100.0)
					Link = Link.getlinkedref(DLC2StandingStoneFXLink)
				endWhile
				RingTop.playanimation("Stage3")
				playanimation("Stage2")
	endIf
endFunction



	
	
 