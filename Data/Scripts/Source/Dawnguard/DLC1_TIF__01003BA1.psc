;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC1_TIF__01003BA1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC1VQ02HarkonGreet.SetValue(1)
debug.trace("Accept Gift End Fragment, calling start() on scene.")
DLC1VampireTurnHarkonHack.start()
debug.trace("Accept Gift End Fragment after calling Start()")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1VampireTurnScript property DLC1VampireTurn auto

GlobalVariable Property DLC1HarkonNoActivation  Auto  

Scene Property DLC1VampireTurnHarkonHack  Auto  

GlobalVariable Property DLC1VQ02HarkonGreet  Auto  
