Scriptname DLC2SV01UnreadablePlaqueSCRIPT extends ObjectReference Hidden 


Message Property DLC2SV01UnreadablePlaqueMessage Auto

Quest Property DLC2SV01 Auto

Int Property Puzzle01RiddleStage Auto
Int Property Puzzle02RiddleStage Auto
Int Property Puzzle03RiddleStage Auto
Int Property Puzzle04RiddleStage Auto

Int Property ThisRiddleNumber Auto

Message Property DLC2SV01Puzzle01Riddle Auto
Message Property DLC2SV01Puzzle02Riddle Auto
Message Property DLC2SV01Puzzle03Riddle Auto
Message Property DLC2SV01Puzzle04Riddle Auto


Event OnActivate(ObjectReference akActionRef)

	if (DLC2SV01.GetStageDone(Puzzle01RiddleStage)) && (ThisRiddleNumber == 1)
		DLC2SV01Puzzle01Riddle.Show()
	elseif (DLC2SV01.GetStageDone(Puzzle02RiddleStage)) && (ThisRiddleNumber == 2)
		DLC2SV01Puzzle02Riddle.Show()
	elseif (DLC2SV01.GetStageDone(Puzzle03RiddleStage)) && (ThisRiddleNumber == 3)
		DLC2SV01Puzzle03Riddle.Show()
	elseif (DLC2SV01.GetStageDone(Puzzle04RiddleStage)) && (ThisRiddleNumber == 4)
		DLC2SV01Puzzle04Riddle.Show()
	else
		DLC2SV01UnreadablePlaqueMessage.Show()
	endif

EndEvent