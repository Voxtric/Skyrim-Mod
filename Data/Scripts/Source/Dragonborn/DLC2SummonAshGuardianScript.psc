Scriptname DLC2SummonAshGuardianScript extends ActiveMagicEffect  

MiscObject Property DLC2HeartStone  Auto  

Event OnEffectStart(actor akTarget, actor akCaster)
; 	Debug.Trace("ASH GUARDIAN: about to remove heart stone")
	akCaster.RemoveItem(DLC2HeartStone, 1)
EndEvent
