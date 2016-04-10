Scriptname DLC2StartSVQuests extends ObjectReference  
{When the player leaves Skaal Village after Stage 200 of MQ03 is set, start the two Skaal Village quests}

;Scriptname SolitudeOpeningOnCellDetach extends ReferenceAlias  

;When the player changes cells away from this proimitive, start the Skaal Village quests
Event OnCellDetach ()
       if (Game.GetPlayer().IsInLocation(DLC2SkaalVillageLocation)) == False && (DLC2MQ03.GetStageDone(200)) && (DLC2MQ05.GetStage() < 340 || DLC2MQ05.GetStage() > 1000)
		DLC2SV02Misc.Start()
		DLC2SkaalVillageFreeform1.Start()
		DLC2SkaalVillageFreeform2.Start()
	EndIf
EndEvent

Event OnLoad()
	if DLC2SV01.GetStageDone(200)
		DLC2SV01Post.SetStage(20)
	endif
endEvent

Quest Property DLC2MQ03  Auto  
Quest Property DLC2MQ05  Auto
Quest Property DLC2SV02Misc  Auto  
Quest Property DLC2SV01  Auto
Quest Property DLC2SV01Post  Auto
Quest Property DLC2SkaalVillageFreeform1  Auto 
Quest Property DLC2SkaalVillageFreeform2  Auto  
Location Property DLC2SkaalVillageLocation  Auto
