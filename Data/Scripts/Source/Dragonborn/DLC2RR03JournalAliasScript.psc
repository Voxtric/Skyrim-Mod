Scriptname DLC2RR03JournalAliasScript  extends ReferenceAlias Conditional

Quest Property pDLC2RR03 Auto
GlobalVariable Property pDLC2RR03AlreadyRead Auto

Event OnRead()

	if pDLC2RR03.GetStageDone(40) == 0
		if pDLC2RR03.GetStageDone(30) == 1
			pDLC2RR03.SetStage(40)
			pDLC2RR03AlreadyRead.SetValue(1)
		elseif pDLC2RR03.GetStageDone(30) == 0
			pDLC2RR03AlreadyRead.SetValue(1)
		endif
	endif

endEvent