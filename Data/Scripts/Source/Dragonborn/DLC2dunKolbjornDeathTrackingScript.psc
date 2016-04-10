Scriptname DLC2dunKolbjornDeathTrackingScript extends Quest

Quest property DLC2dunKolbjornQST Auto
int property DLC2dunKolbjornQSTStageToSetOnObjectives Auto
int property DLC2dunKolbjornQSTStageToSetOnComplete Auto

ReferenceAlias property KolbjornEnemy1 Auto
ReferenceAlias property KolbjornEnemy2 Auto
ReferenceAlias property KolbjornEnemy3 Auto
ReferenceAlias property KolbjornEnemy4 Auto
ReferenceAlias property KolbjornEnemy5 Auto
ReferenceAlias property KolbjornEnemy6 Auto
ReferenceAlias property KolbjornEnemy7 Auto
ReferenceAlias property KolbjornEnemy8 Auto
ReferenceAlias property KolbjornEnemy9 Auto
ReferenceAlias property KolbjornEnemy10 Auto
ReferenceAlias property KolbjornEnemy11 Auto
ReferenceAlias property KolbjornEnemy12 Auto
ReferenceAlias property KolbjornEnemy13 Auto
ReferenceAlias property KolbjornEnemy14 Auto
ReferenceAlias property KolbjornEnemy15 Auto
ReferenceAlias property KolbjornEnemy16 Auto
ReferenceAlias property KolbjornEnemy17 Auto

ReferenceAlias property QT_DraugrLeftToKill01 Auto
ReferenceAlias property QT_DraugrLeftToKill02 Auto
ReferenceAlias property QT_DraugrLeftToKill03 Auto
ReferenceAlias property QT_DraugrLeftToKill04 Auto
ReferenceAlias property QT_DraugrLeftToKill05 Auto

Actor LivingEnemy1
Actor LivingEnemy2
Actor LivingEnemy3
Actor LivingEnemy4
Actor LivingEnemy5

bool alreadyPolling = False
int found = 0

Function ReportDeath()
	;Cycle through the Aliases to see how many enemies are left alive, and if so, who's left alive.
	found = 0
	Actor a = KolbjornEnemy1.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy2.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy3.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy4.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy5.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf	
	a = KolbjornEnemy6.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy7.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf		
	a = KolbjornEnemy8.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy9.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf		
	a = KolbjornEnemy10.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf		
	a = KolbjornEnemy11.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy12.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy13.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy14.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	a = KolbjornEnemy15.GetActorRef()
	if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
		StoreFoundEnemy(a)
		if (found > 5)
			Return
		EndIf
	EndIf
	if (KolbjornEnemy16 != None)
		a = KolbjornEnemy16.GetActorRef()
		if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
			StoreFoundEnemy(a)
			if (found > 5)
				Return
			EndIf
		EndIf
		a = KolbjornEnemy17.GetActorRef()
		if (a != None && (!a.IsDead() && !a.IsCommandedActor() && !a.IsDisabled()))
			StoreFoundEnemy(a)
			if (found > 5)
				Return
			EndIf
		EndIf
	EndIf
	
; 	Debug.Trace("We found: " + found)
	if (found == 0)
		DLC2dunKolbjornQST.SetStage(DLC2dunKolbjornQSTStageToSetOnComplete)
		Self.SetStage(200)
	ElseIf (Self.GetStage() == 0 && found < 6)
; 		;Debug.Trace("DEATH COUNT-------------------")
; 		;Debug.Trace(LivingEnemy1 + ", " + LivingEnemy2 + ", " + LivingEnemy3 + ", " + LivingEnemy4 + ", " + LivingEnemy5)
; 		;Debug.Trace(QT_DraugrLeftToKill01 + ", " + QT_DraugrLeftToKill02 + ", " + QT_DraugrLeftToKill03 + ", " + QT_DraugrLeftToKill04 + ", " + QT_DraugrLeftToKill05)
; 		;Debug.Trace("------------------------------")
		;Force the remaining Draugr into aliases.
		if (LivingEnemy1 != None)
			QT_DraugrLeftToKill01.ForceRefTo(LivingEnemy1)
		EndIf
		if (LivingEnemy2 != None)
			QT_DraugrLeftToKill02.ForceRefTo(LivingEnemy2)
		EndIf
		if (LivingEnemy3 != None)
			QT_DraugrLeftToKill03.ForceRefTo(LivingEnemy3)
		EndIf
		if (LivingEnemy4 != None)
			QT_DraugrLeftToKill04.ForceRefTo(LivingEnemy4)
		EndIf
		if (LivingEnemy5 != None)
			QT_DraugrLeftToKill05.ForceRefTo(LivingEnemy5)
		EndIf
		
		;Release Hold Position on the last three.
		if (found < 4)
			LivingEnemy1.SetAV("Variable06", 1)
			LivingEnemy2.SetAV("Variable06", 1)
			LivingEnemy3.SetAV("Variable06", 1)
		EndIf

		DLC2dunKolbjornQST.SetStage(DLC2dunKolbjornQSTStageToSetOnObjectives)
		Self.SetStage(100)
	EndIf
EndFunction

Function StoreFoundEnemy(Actor a)
	found = found + 1
; 	Debug.Trace("We found: " + a + " alive. Count=" + found)
	if (found == 1)
		LivingEnemy1 = a
	ElseIf (found == 2)
		LivingEnemy2 = a
	ElseIf (found == 3)
		LivingEnemy3 = a
	ElseIf (found == 4)
		LivingEnemy4 = a
	ElseIf (found == 5)
		LivingEnemy5 = a
	EndIf
EndFunction
