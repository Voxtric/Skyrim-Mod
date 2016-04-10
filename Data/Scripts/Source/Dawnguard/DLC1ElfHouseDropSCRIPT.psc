Scriptname DLC1ElfHouseDropSCRIPT extends ObjectReference  
{Swaps dropping art to havok}

EVENT onInit()  
  ;Debug.Trace("This object is loaded, playing animations should work now")
 ; self.SetMotionType(self.Motion_Keyframed)
endEvent

Event OnActivate(ObjectReference akActionRef)

  ;Debug.Trace("Activated by " + akActionRef)
 PlayAnimation("stage2")
 utility.wait(6.7)
 SetMotionType(self.Motion_Dynamic, true)
EndEvent

