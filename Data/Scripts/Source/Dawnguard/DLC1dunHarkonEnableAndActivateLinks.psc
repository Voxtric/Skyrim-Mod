ScriptName DLC1dunHarkonEnableAndActivateLinks extends ObjectReference
{Script for the TrapLinkers used in the Harkon battle. Enable and activate their respective enemies when triggered.}

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto
Keyword property LinkCustom04 Auto
Keyword property LinkCustom05 Auto
Keyword property LinkCustom06 Auto
Keyword property LinkCustom07 Auto
Keyword property LinkCustom08 Auto
Keyword property LinkCustom09 Auto
Keyword property LinkCustom10 Auto

Event OnActivate(ObjectReference obj)
	if (GetLinkedRef(None) != None && !(GetLinkedRef(None) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(None).Enable()
		GetLinkedRef(None).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom01) != None && !(GetLinkedRef(LinkCustom01) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom01).Enable()
		GetLinkedRef(LinkCustom01).Activate(obj)
	EndIf	
	if (GetLinkedRef(LinkCustom02) != None && !(GetLinkedRef(LinkCustom02) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom02).Enable()
		GetLinkedRef(LinkCustom02).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom03) != None && !(GetLinkedRef(LinkCustom03) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom03).Enable()
		GetLinkedRef(LinkCustom03).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom04) != None && !(GetLinkedRef(LinkCustom04) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom04).Enable()
		GetLinkedRef(LinkCustom04).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom05) != None && !(GetLinkedRef(LinkCustom05) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom05).Enable()
		GetLinkedRef(LinkCustom05).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom06) != None && !(GetLinkedRef(LinkCustom06) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom06).Enable()
		GetLinkedRef(LinkCustom06).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom07) != None && !(GetLinkedRef(LinkCustom07) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom07).Enable()
		GetLinkedRef(LinkCustom07).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom08) != None && !(GetLinkedRef(LinkCustom08) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom08).Enable()
		GetLinkedRef(LinkCustom08).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom09) != None && !(GetLinkedRef(LinkCustom09) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom09).Enable()
		GetLinkedRef(LinkCustom09).Activate(obj)
	EndIf
	if (GetLinkedRef(LinkCustom10) != None && !(GetLinkedRef(LinkCustom10) as Actor).IsDead())
		Utility.Wait(Utility.RandomFloat(0, 0.5))
		GetLinkedRef(LinkCustom10).Enable()
		GetLinkedRef(LinkCustom10).Activate(obj)
	EndIf
EndEvent