Scriptname DLC2dunNchardakWaterStageEffectScript extends ObjectReference
{Script on some objects in Nchardak that respond to the water level. For legacy reasons, waterfalls use a different (though similar) script.}

int property DisableIfBelowThisStage = -1 Auto
{If >=0, disable this object if the water falls below this stage. When it rises above it, enable it.}

int property DisableIfAboveThisStage = -1 Auto
{If >=0, disable this object if the water rises above this stage. When it falls below it, enable it.}

int property ActivateAtThisStage = -1 Auto
{If >=0, activate linkedref when the water is at this stage.}

bool hasActivated

Event OnActivate(ObjectReference akActivator)
; 	;Debug.Trace("WaterStageFX: " + Self + ": activated by " + akActivator + " at stage " + (akActivator as DLC2dunNchardakWaterPlane).myWaterStage)
	if (ActivateAtThisStage >= 0 && ActivateAtThisStage == (akActivator as DLC2dunNchardakWaterPlane).myWaterStage)
		if (!hasActivated)
			hasActivated = True
			Self.GetLinkedRef().Activate(Self)
		EndIf
	EndIf
	if (DisableIfBelowThisStage >= 0 && DisableIfAboveThisStage < 0)
		DLC2dunNchardakWaterPlane waterPlane = (akActivator as DLC2dunNchardakWaterPlane)
; 		;Debug.Trace("Condition A Passed")
		if (waterPlane.myWaterStage < DisableIfBelowThisStage)
			Self.Disable(True)
; 			;Debug.Trace("Disabling")
		Else
; 			;Debug.Trace("Enabling")
			Self.Enable(True)
		EndIf
	ElseIf (DisableIfBelowThisStage < 0 && DisableIfAboveThisStage >= 0)
		DLC2dunNchardakWaterPlane waterPlane = (akActivator as DLC2dunNchardakWaterPlane)
; 		;Debug.Trace("Condition B Passed")
; 		;Debug.Trace(waterPlane.myWaterStage +"vs."+ DisableIfAboveThisStage)
		if (waterPlane.myWaterStage > DisableIfAboveThisStage)
; 			;Debug.Trace("Disabling")
			Self.Disable(True)
		Else
; 			;Debug.Trace("Enabling")
			Self.Enable(True)
		EndIf
	ElseIf (DisableIfBelowThisStage > 0 && DisableIfAboveThisStage >= 0)
		DLC2dunNchardakWaterPlane waterPlane = (akActivator as DLC2dunNchardakWaterPlane)
; 		;Debug.Trace("Condition C Passed")
		if (waterPlane.myWaterStage > DisableIfBelowThisStage && waterPlane.myWaterStage < DisableIfAboveThisStage)
; 			;Debug.Trace("Enabling")
			Self.Enable(True)
		Else
; 			;Debug.Trace("Disabling")
			Self.Disable(True)
		EndIf
	EndIf
EndEvent