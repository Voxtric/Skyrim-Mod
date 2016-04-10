Scriptname DLC1_BF_IceChunkSCRIPT extends ObjectReference Hidden 

Float Property TimeBeforeDisable = 3.0 Auto
{Time, in seconds, before the ice chunks get disabled after breaking}

Int Property MonsterType = 0 Auto
{
Only for statues in temple:
0 = Falmer (DEFAULT)
1 = Chaurus
2 = Falmer Shaman
}

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)

  	utility.Wait(TimeBeforeDisable)

  	self.Disable(TRUE)

EndEvent