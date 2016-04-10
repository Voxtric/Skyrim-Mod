Scriptname DLC2SV02MapScript extends ReferenceAlias  
{Sets stage 30 on the quest when the player acquires the map.}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer() && DLC2SV02.GetStageDone(20)
    DLC2SV02.SetStage(30)
  endIf
endEvent

Event OnRead()
   DLC2StalhrimSourceMapMarkerREF.enable()
      if DLC2StalhrimSourceMapMarkerREF.IsMapMarkerVisible() == false
         DLC2StalhrimSourceMapMarkerREF.AddToMap()
      endif
endEvent

Quest Property DLC2SV02  Auto 
ObjectReference Property DLC2StalhrimSourceMapMarkerREF Auto 
