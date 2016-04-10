Scriptname DLC1VampireTurnRedEyesScript  extends ReferenceAlias 
{Attached to GiveMeRedEyesX aliases in DLC1VampireTurn quest. OnLoad gives them red eyes.}

Event OnLoad()
	(GetOwningQuest() as DLC1VampireTurnScript).MakeMyEyesRed(self)
EndEvent

