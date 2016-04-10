scriptname DLC1LD_AetheriumForge extends ObjectReference
{Script on the Aetherium Forge furniture. Triggers the activation animation and handles the steam fx.}

MiscObject property DLC1LD_AetheriumCrest Auto
MiscObject property IngotMalachite Auto
MiscObject property IngotDwarven Auto
MiscObject property IngotGold Auto
MiscObject property IngotEbony Auto
MiscObject property GemSapphireFlawless Auto
Sound property OBJDwemerGearForge Auto
ObjectReference property AetheriumForgeObject Auto
ObjectReference property DLC1LD_ForgeSteam Auto
Quest property AchievementsQuest Auto

Auto State Ready
	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			if ((Game.GetPlayer().GetItemCount(DLC1LD_AetheriumCrest) > 0) && \
				 ((Game.GetPlayer().GetItemCount(IngotMalachite) >= 2 && Game.GetPlayer().GetItemCount(IngotDwarven) >= 4) || \
				  (Game.GetPlayer().GetItemCount(IngotGold) >= 1 && Game.GetPlayer().GetItemCount(IngotDwarven) >= 2 && Game.GetPlayer().GetItemCount(IngotEbony) >= 2) || \
				  (Game.GetPlayer().GetItemCount(GemSapphireFlawless) >= 2 && Game.GetPlayer().GetItemCount(IngotDwarven) >= 2 && Game.GetPlayer().GetItemCount(IngotGold) >= 2)))
				  GoToState("Done")
				  if (Game.GetPlayer().IsWeaponDrawn())
				  	;Debug.Trace("Weapon was drawn. Waiting 2s.")
					Utility.Wait(2)
				  endIf
				  Game.GetPlayer().RemoveItem(DLC1LD_AetheriumCrest)
				  AetheriumForgeObject.PlayAnimation("crest01")
				  Utility.Wait(1)
				  OBJDwemerGearForge.Play(AetheriumForgeObject)
				  ;DLC1LD_ForgeSteam.Enable()
			EndIf
		EndIf
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
		;Do Nothing
	EndEvent
EndState

Function DisableSteam()
	;RegisterForUpdate(60)
EndFunction

;Event OnUpdate()
	;DLC1LD_ForgeSteam.Disable()
;EndEvent