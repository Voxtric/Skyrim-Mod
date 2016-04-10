Scriptname DLC1VQ04RNPCQuestScript extends Quest conditional

GlobalVariable Property VampireLine auto
DLC1_NPCMentalModelScript Property MM Auto
bool Property LonelyWeirdDecision auto conditional
bool Property EncounteredGargoyle auto conditional
bool Property GavePitchAboutSecret auto conditional


Function LockSeranaIn()
	MM.LockIn()
	if (VampireLine.GetValueInt() != 0)
		MM.SetHomeMarker(2)
	else
		MM.SetHomeMarker(1)
	endif
EndFunction
