Scriptname testPhilDwarvenForgeInputBoxSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY controllerScript AUTO
testPhilDwarvenForgeMasterSCRIPT mainScript


; ////////////////////////////////////////
; //EVENT: onLoad
; ////////////////////////////////////////
EVENT onLoad()
	; //setting the master script to be the one with the stored vars
	mainScript = controllerScript AS testPhilDwarvenForgeMasterSCRIPT

; 	debug.trace("forge loaded")

ENDEVENT

; ////////////////////////////////////////
; //EVENT: onITEMADDED
; ////////////////////////////////////////
EVENT onITEMADDED(FORM akBaseItem, int aiItemCount, OBJECTREFERENCE akItemReference, OBJECTREFERENCE akSourceContainer)

; 	debug.trace(akBaseItem + "added")

	; //check for steel
	mainScript.ironCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialIron, mainScript.pWeapMaterialIron, mainScript.ironCount)
	mainScript.steelCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialSteel, mainScript.pWeapMaterialSteel, mainScript.steelCount)
	mainScript.draugrCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialDraugr, mainScript.pWeapMaterialDraugr, mainScript.draugrCount)
	mainScript.dwarvenCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialDwarven, mainScript.pWeapMaterialDwarven, mainScript.dwarvenCount)
	mainScript.orcishCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialOrcish, mainScript.pWeapMaterialOrcish, mainScript.orcishCount)
	mainScript.elvenCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialElven, mainScript.pWeapMaterialElven, mainScript.elvenCount)
	mainScript.falmerCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialFalmer, mainScript.pWeapMaterialFalmer, mainScript.falmerCount)
	mainScript.glassCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialGlass, mainScript.pWeapMaterialGlass, mainScript.glassCount)
	mainScript.ebonyCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialEbony, mainScript.pWeapMaterialEbony, mainScript.ebonyCount)
	mainScript.daedricCount = weapArmorCounter(TRUE, akBaseItem, mainScript.pArmorMaterialDaedric, mainScript.pWeapMaterialDaedric, mainScript.daedricCount)

ENDEVENT 

; ////////////////////////////////////////
; //EVENT: onITEMREMOVED
; ////////////////////////////////////////
EVENT onITEMREMOVED(FORM akBaseItem, int aiItemCount, OBJECTREFERENCE akItemReference, OBJECTREFERENCE akSourceContainer)

; 	debug.trace(akBaseItem + "removed")

	; //check for steel
	mainScript.ironCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialIron, mainScript.pWeapMaterialIron, mainScript.ironCount)
	mainScript.steelCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialSteel, mainScript.pWeapMaterialSteel, mainScript.steelCount)
	mainScript.draugrCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialDraugr, mainScript.pWeapMaterialDraugr, mainScript.draugrCount)
	mainScript.dwarvenCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialDwarven, mainScript.pWeapMaterialDwarven, mainScript.dwarvenCount)
	mainScript.orcishCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialOrcish, mainScript.pWeapMaterialOrcish, mainScript.orcishCount)
	mainScript.elvenCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialElven, mainScript.pWeapMaterialElven, mainScript.elvenCount)
	mainScript.falmerCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialFalmer, mainScript.pWeapMaterialFalmer, mainScript.falmerCount)
	mainScript.glassCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialGlass, mainScript.pWeapMaterialGlass, mainScript.glassCount)
	mainScript.ebonyCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialEbony, mainScript.pWeapMaterialEbony, mainScript.ebonyCount)
	mainScript.daedricCount = weapArmorCounter(FALSE, akBaseItem, mainScript.pArmorMaterialDaedric, mainScript.pWeapMaterialDaedric, mainScript.daedricCount)

ENDEVENT 

; ////////////////////////////////////////
; //FUNCTION: itemCounter
; //
; //PURPOSE: take the keywords for the material type and
; // then based on the first bool add or subtract the
; // correct amount of ingots to the counter
; ////////////////////////////////////////
int FUNCTION weapArmorCounter(BOOL addIngots, FORM item, KEYWORD armorKword, KEYWORD weapKword, int counter)

; 	debug.trace("running FUNCTION on" + item)

	; //do we have any items of this material?
	if(item.hasKeyword(armorKword) || item.hasKeyword(weapKword))

; 		debug.trace("we've got Iron!")

		; //if we're a cuirass add 2, otherwise add 1 to the count
		if(item.hasKeyword(mainScript.pArmorCuirass) || item.hasKeyword(mainScript.pWeapTypeWarhammer) || item.hasKeyword(mainScript.pWeapTypeBattleaxe) || item.hasKeyword(mainScript.pWeapTypeGreatsword))
			
			; //are we adding or removing ingots?
			if(addIngots)
				counter += 3

				; //if its daedric give back some hearts too
				if(armorKword == mainScript.pArmorMaterialDaedric || weapKword == mainScript.pWeapMaterialDaedric)
					mainScript.heartsCount += 1

				endif

; 				debug.trace("we've got a cuirass!, 2 ingots")

			else
				counter -= 3

				; //if its daedric lower heart counter
				if(armorKword == mainScript.pArmorMaterialDaedric || weapKword == mainScript.pWeapMaterialDaedric)
					mainScript.heartsCount -= 1

				endif

; 				debug.trace("cuirass removed, ingots - 2")
			endif

		else
			
			; //are we adding or removing ingots?
			if(addIngots)
				counter += 1
				
				; //if its daedric give back some hearts too
				if(armorKword == mainScript.pArmorMaterialDaedric || weapKword == mainScript.pWeapMaterialDaedric)
					mainScript.heartsCount += 1

				endif

; 				debug.trace("one ingot for ye")

			else
				counter -= 1

				; //if its daedric give back some hearts too
				if(armorKword == mainScript.pArmorMaterialDaedric || weapKword == mainScript.pWeapMaterialDaedric)
					mainScript.heartsCount -= 1

				endif

; 				debug.trace("remove one ingot")

			endif

		endif


	endif

	return counter

ENDFUNCTION