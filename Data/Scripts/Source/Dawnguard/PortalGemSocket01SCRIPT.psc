Scriptname PortalGemSocket01SCRIPT extends ObjectReference Hidden 

; List of gems the player can place in the slot
Form Property PortalGemBlueKey Auto
Form Property PortalGemGreenKey Auto
Form Property PortalGemOrangeKey Auto
Form Property PortalGemPurpleKey Auto
Form Property PortalGemWhiteKey Auto

Sound Property OBJParagonAmbienceLPMSD Auto
{Sound that loops on the portals}
Int Property PortalLoopInstance Auto
{Variable containing the portal looping sound instance}

FormList Property PortalGemKeyList Auto
{Contains all the possible gems so we can easily count them on the player.}

Message Property PortalGemPlaceMessage Auto
{Message containing the options for the player to place whichever gem he wants.}
Message Property PortalGemPlaceMessageDENIED Auto
{Message telling the player he doesn't have any gems}


; Linked Refs that point to the three portal doors
Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto
Keyword Property LinkCustom05 Auto

; Point to play sound from
Keyword Property LinkCustom10 Auto

Form CurrentlyPlacedGem

Int MessageOption


auto State WaitingForPlacement
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()

			GoToState("BusyState")

				; Player has no gems, let him know
			if (Game.GetPlayer().GetItemCount(PortalGemKeyList) == 0)
				PortalGemPlaceMessageDENIED.Show()
				GoToState("WaitingForPlacement")

				; Player has only one gem, just put it in the slot
			elseif (Game.GetPlayer().GetItemCount(PortalGemKeyList) == 1)
				
				if (Game.GetPlayer().GetItemCount(PortalGemBlueKey) == 1)
					Game.GetPlayer().RemoveItem(PortalGemBlueKey, 1)
					self.PlayAnimationAndWait("PlaceBlue", "Done")
					GetLinkedRef(LinkCustom01).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemBlueKey
					GoToState("WaitingForPickup")

				elseif (Game.GetPlayer().GetItemCount(PortalGemGreenKey) == 1)
					Game.GetPlayer().RemoveItem(PortalGemGreenKey, 1)
					self.PlayAnimationAndWait("PlaceGreen", "Done")
					GetLinkedRef(LinkCustom02).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemGreenKey
					GoToState("WaitingForPickup")

				elseif (Game.GetPlayer().GetItemCount(PortalGemOrangeKey) == 1)
					Game.GetPlayer().RemoveItem(PortalGemOrangeKey, 1)
					self.PlayAnimationAndWait("PlaceOrange", "Done")
					GetLinkedRef(LinkCustom03).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemOrangeKey
					GoToState("WaitingForPickup")

				elseif (Game.GetPlayer().GetItemCount(PortalGemPurpleKey) == 1)
					Game.GetPlayer().RemoveItem(PortalGemPurpleKey, 1)
					self.PlayAnimationAndWait("PlacePurple", "Done")
					GetLinkedRef(LinkCustom04).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemPurpleKey
					GoToState("WaitingForPickup")

				elseif (Game.GetPlayer().GetItemCount(PortalGemWhiteKey) == 1)
					Game.GetPlayer().RemoveItem(PortalGemWhiteKey, 1)
					self.PlayAnimationAndWait("PlaceWhite", "Done")
					GetLinkedRef(LinkCustom05).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemWhiteKey
					GoToState("WaitingForPickup")
				endif

				; Player has more than one gem, ask him which he wants to place
			elseif (Game.GetPlayer().GetItemCount(PortalGemKeyList) > 1)
					
				MessageOption = PortalGemPlaceMessage.Show()

					; Blue Gem
				if (MessageOption == 0)
					Game.GetPlayer().RemoveItem(PortalGemBlueKey, 1)
					self.PlayAnimationAndWait("PlaceBlue", "Done")
					GetLinkedRef(LinkCustom01).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemBlueKey
					GoToState("WaitingForPickup")

					; Green Gem
				elseif (MessageOption == 1)
					Game.GetPlayer().RemoveItem(PortalGemGreenKey, 1)
					self.PlayAnimationAndWait("PlaceGreen", "Done")
					GetLinkedRef(LinkCustom02).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemGreenKey
					GoToState("WaitingForPickup")

					; Orange Gem
				elseif (MessageOption == 2)
					Game.GetPlayer().RemoveItem(PortalGemOrangeKey, 1)
					self.PlayAnimationAndWait("PlaceOrange", "Done")
					GetLinkedRef(LinkCustom03).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemOrangeKey
					GoToState("WaitingForPickup")

					; Purple Gem
				elseif (MessageOption == 3)
					Game.GetPlayer().RemoveItem(PortalGemPurpleKey, 1)
					self.PlayAnimationAndWait("PlacePurple", "Done")
					GetLinkedRef(LinkCustom04).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemPurpleKey
					GoToState("WaitingForPickup")

					; White Gem
				elseif (MessageOption == 4)
					Game.GetPlayer().RemoveItem(PortalGemWhiteKey, 1)
					self.PlayAnimationAndWait("PlaceWhite", "Done")
					GetLinkedRef(LinkCustom05).Enable()
					PortalLoopInstance = OBJParagonAmbienceLPMSD.play(GetLinkedRef(LinkCustom10))
					GetLinkedRef().Enable()
					CurrentlyPlacedGem = PortalGemWhiteKey
					GoToState("WaitingForPickup")

					; Do Nothing
				elseif (MessageOption == 5)
					GoToState("WaitingForPlacement")

				endif

			endif


		endif
	EndEvent
EndState



State WaitingForPickup
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()

			GoToState("BusyState")

			if (CurrentlyPlacedGem == PortalGemBlueKey)
				Sound.StopInstance(PortalLoopInstance)
				GetLinkedRef(LinkCustom01).DisableNoWait()
				GetLinkedRef().DisableNoWait()
				self.PlayAnimationAndWait("TakeBlue", "Done")
				Game.GetPlayer().AddItem(PortalGemBlueKey, 1)
				CurrentlyPlacedGem = NONE
				GoToState("WaitingForPlacement")

			elseif (CurrentlyPlacedGem == PortalGemGreenKey)
				Sound.StopInstance(PortalLoopInstance)
				GetLinkedRef(LinkCustom02).DisableNoWait()
				GetLinkedRef().DisableNoWait()
				self.PlayAnimationAndWait("TakeGreen", "Done")
				Game.GetPlayer().AddItem(PortalGemGreenKey, 1)
				CurrentlyPlacedGem = NONE
				GoToState("WaitingForPlacement")

			elseif (CurrentlyPlacedGem == PortalGemOrangeKey)
				Sound.StopInstance(PortalLoopInstance)
				GetLinkedRef(LinkCustom03).DisableNoWait()
				GetLinkedRef().DisableNoWait()
				self.PlayAnimationAndWait("TakeOrange", "Done")
				Game.GetPlayer().AddItem(PortalGemOrangeKey, 1)
				CurrentlyPlacedGem = NONE
				GoToState("WaitingForPlacement")

			elseif (CurrentlyPlacedGem == PortalGemPurpleKey)
				Sound.StopInstance(PortalLoopInstance)
				GetLinkedRef(LinkCustom04).DisableNoWait()
				GetLinkedRef().DisableNoWait()
				self.PlayAnimationAndWait("TakePurple", "Done")
				Game.GetPlayer().AddItem(PortalGemPurpleKey, 1)
				CurrentlyPlacedGem = NONE
				GoToState("WaitingForPlacement")
				
			elseif (CurrentlyPlacedGem == PortalGemWhiteKey)
				Sound.StopInstance(PortalLoopInstance)
				GetLinkedRef(LinkCustom05).DisableNoWait()
				GetLinkedRef().DisableNoWait()
				self.PlayAnimationAndWait("TakeWhite", "Done")
				Game.GetPlayer().AddItem(PortalGemWhiteKey, 1)
				CurrentlyPlacedGem = NONE
				GoToState("WaitingForPlacement")
			endif

		endif
	EndEvent
EndState


	; State we put ourselves in when we're busy (animationing and whatnot)
State BusyState
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			; Do Nothing
		endif
	EndEvent
EndState