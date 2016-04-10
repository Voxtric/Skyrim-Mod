Scriptname DLC1ShellBugSounds extends ObjectReference  
{Plays the sounds}

objectReference Property mySoundLooper Auto
Sound Property NPCShellBugDeath   Auto

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
  Debug.Trace("Out destruction stage changed from " + aiOldStage + " to " + aiCurrentStage)
  NPCShellBugDeath .play(self) 
  mySoundLooper.disable()
EndEvent
