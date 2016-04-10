Scriptname testPhilDwarvenForgeLeverSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY controllerScript AUTO
testPhilDwarvenForgeMasterSCRIPT mainScript

EVENT onLoad()
	; //setting the master script to be the one with the stored vars
	mainScript = controllerScript AS testPhilDwarvenForgeMasterSCRIPT

ENDEVENT

EVENT onACTIVATE(OBJECTREFERENCE triggerRef)
	
	; //add all the iron ingots we got
	mainScript.outputBoxRef.addItem(mainScript.pIngotIron, mainScript.ironCount)

	; //add all the steel ingots we got
	mainScript.outputBoxRef.addItem(mainScript.pIngotSteel, mainScript.steelCount)
	mainScript.outputBoxRef.addItem(mainScript.pIngotDraugr, mainScript.draugrCount)

	; //add all the dwarven ingots we got
	mainScript.outputBoxRef.addItem(mainScript.pIngotDwarven, mainScript.dwarvenCount)

	; //add all the Orcish(orichalcum) ingots we got
	mainScript.outputBoxRef.addItem(mainScript.pIngotOrcish, mainScript.orcishCount)

	; //add all the Elven(moonstone) we got
	mainScript.outputBoxRef.addItem(mainScript.pIngotElven, mainScript.elvenCount)

	; //add all the Falmer(chitin) we got
	mainScript.outputBoxRef.addItem(mainScript.pIngotFalmer, mainScript.falmerCount)

	; //add all the Glass(malachite) we got
	mainScript.outputBoxRef.addItem(mainScript.pIngotGlass, mainScript.glassCount)

	; //add all the Ebony we got
	mainScript.outputBoxRef.addItem(mainScript.pIngotEbony, mainScript.ebonyCount)	

	; //add all the Daedric(ebony) we got and hearts
	mainScript.outputBoxRef.addItem(mainScript.pIngotDaedric, mainScript.daedricCount)
	mainScript.outputBoxRef.addItem(mainScript.pDaedraHeart, mainScript.heartsCount)	


	mainScript.inputBoxRef.removeAllItems()

ENDEVENT
