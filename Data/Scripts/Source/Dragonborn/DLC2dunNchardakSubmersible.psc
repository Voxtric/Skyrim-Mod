Scriptname DLC2dunNchardakSubmersible extends ObjectReference
{Parent class for objects in Nchardak that can be submerged by the water. Primarily includes door seals and pedestals.}

Quest property DLC2dunNchardakTracking Auto		;Nchardak tracking quest.
bool property isActuallySubmersible = True Auto	;Is this particular reference actually submersible (will water cover it?). If not, don't bother with anything else.

ObjectReference property myWaterPlane Auto			;Which water plane this object can be submerged by.
bool property useStagedWaterHeight = True Auto		;Should we use 'staged' water heights, instead of relying on the object's acutal height to determine if it's accessible? Much safer.
															;Sooo much safer that the 'False' option no longer even works.
bool property failsafeDontSubmerge = False Auto	;If True, don't clear this object's name when it becomes submerged. Used as a failsafe to keep cubes-in-pedestals from becoming inaccessible.
int property myWaterStage Auto						;If we are using staged heights, and the water plane is at this stage or higher, the object is considered submerged and becomes unusable.

int property myIndex = -1	 Auto Hidden			;Internal: This object's index in the Nchardak Tracking Quest's array of submersible objects.
bool property isSubmerged = False Auto Hidden	;Internal: Is this object presently submerged?
bool submersibleInitialized = False				;Internal: Has this object been initialized?
float myZPosition									;Internal: This object's z-position.


;Each time the cell attaches, check the state of this object.
Event OnCellAttach()
	if (!submersibleInitialized)
		submersibleInitialized = True
		;Prevent followers from activating this object (unless scripted to do so in a scene, etc.)
		Self.SetNoFavorAllowed(True)
		;Get this object's Z-height for future reference.
		myZPosition = Self.GetPositionZ()
		
		;Is this object actually submersible?
		if (isActuallySubmersible)
			;Request a registry index from the Nchardak Tracking Quest.
			myIndex = (DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).RegisterObject(Self)
; 			;Debug.Trace("Consumed Index: " + myIndex)
		EndIf
	EndIf
	CheckSubmerged()
EndEvent

;Determine if this object has been submerged by the water.
Function CheckSubmerged()
	if (myWaterPlane != None && isActuallySubmersible)
		if (!isSubmerged)
; 			;Debug.Trace("CheckSubmerged for " + Self + ":" + useStagedWaterHeight + ", " + (myWaterPlane as DLC2dunNchardakWaterPlane).GetWaterStage() + ", " + myWaterStage)
			if (useStagedWaterHeight && (myWaterPlane as DLC2dunNchardakWaterPlane).GetWaterStage() >= myWaterStage && !failsafeDontSubmerge)
				Submerge()
			;ElseIf (!useStagedWaterHeight && myWaterPlane.GetPositionZ() >= myZPosition + myHeight && !failsafeDontSubmerge)
			;	Submerge()
			EndIf
		Else
			if (useStagedWaterHeight && (myWaterPlane as DLC2dunNchardakWaterPlane).GetWaterStage() < myWaterStage)
				Unsubmerge()
			;ElseIf (!useStagedWaterHeight && myWaterPlane.GetPositionZ() < myZPosition + myHeight)
			;	Unsubmerge()
			ElseIf (failsafeDontSubmerge)
				Unsubmerge()
			EndIf
		EndIf
	EndIf
EndFunction

;When an object is submerged, we block activation on it and use an alias on the tracking quest to clear its name (hiding its activation prompt).
Function Submerge()
	if (!isSubmerged)
; 		;Debug.Trace("Nchardak Submersible Update: " + Self + " is now SUBMERGED.")
		Self.BlockActivation(True)
		(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).ClearName(myIndex, Self)
		if (Self as DLC2dunNchardakDoorSeal != None)
			(Self as DLC2dunNchardakDoorSeal).RestoreSeal()
		EndIf
		isSubmerged = True
		Self.RegisterForSingleUpdate(1)
	EndIf
EndFunction

;When an object is un-submerged, we unblock activation on it and clear the alias on the tracking quest.
Function Unsubmerge()
	if (isSubmerged)
; 		;Debug.Trace("Nchardak Submersible Update: " + Self + " is now ABOVE WATER.")
		Self.BlockActivation(False)
		(DLC2dunNchardakTracking as DLC2dunNchardakTrackingScript).RestoreName(myIndex)
		isSubmerged = False
		Self.RegisterForSingleUpdate(1)
	EndIf
EndFunction