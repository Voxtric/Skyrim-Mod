Scriptname testPhilSlotMachineLeverSCRIPT extends ObjectReference  

; //slot
; 0 = Horker
; 1 = Bear
; 2 = Goat
; 3 = Wolf

; //FAR LEFT SLOT
int slotA=0
OBJECTREFERENCE PROPERTY bearA AUTO
OBJECTREFERENCE PROPERTY goatA AUTO
OBJECTREFERENCE PROPERTY horkerA AUTO
OBJECTREFERENCE PROPERTY wolfA AUTO

; //MIDDLE SLOT
int slotB=0
OBJECTREFERENCE PROPERTY bearB AUTO
OBJECTREFERENCE PROPERTY goatB AUTO
OBJECTREFERENCE PROPERTY horkerB AUTO
OBJECTREFERENCE PROPERTY wolfB AUTO

; //FAR RIGHT SLOT
int slotC=0
OBJECTREFERENCE PROPERTY bearC AUTO
OBJECTREFERENCE PROPERTY goatC AUTO
OBJECTREFERENCE PROPERTY horkerC AUTO
OBJECTREFERENCE PROPERTY wolfC AUTO

OBJECTREFERENCE PROPERTY moneySlot AUTO

MESSAGE PROPERTY addGold AUTO

; //goooooooooooooooooold
MISCOBJECT PROPERTY pGold001 AUTO
OBJECTREFERENCE PROPERTY moneyShooter AUTO

INT PROPERTY deposit AUTO HIDDEN

; //how long to wait before swapping
int counter=1
int counterTimer=1

; //what we're displaying
int displayA=0
int displayB=0
int displayC=0

; //catch the previous to prevent 2 in a row
int oldA=0
int oldB=0
int oldC=0

EVENT onACTIVATE(OBJECTREFERENCE triggerRef)

	if(deposit == 0)
		addGold.show()

	else
		spin(15, 10, 5)

		payout()

		deposit = 0

	endif
	
ENDEVENT

FUNCTION spin(int slotASecs, int slotBSecs, int slotCSecs)

	while(slotASecs > 0)

		; //every x loops swap the head
		if(counter > 0)

			if(slotCSecs == 0)
				displayC = theOdds()
				showHead(2, displayC)

			elseif(slotCSecs > 0)
				displayC = utility.randomInt(0,3)
				
				if(displayC == oldC)
					displayC = utility.randomInt(0,3)	
				endif

				showHead(2, displayC)
				oldC = displayC

			endif

			if(slotBSecs == 0)
				displayB = theOdds()
				showHead(1, displayB)

			elseif(slotBSecs > 0)
				displayB = utility.randomInt(0,3)

				if(displayB == oldB)
					displayB = utility.randomInt(0,3)	
				endif

				showHead(1, displayB)
				oldB = displayB

			endif

			if(slotASecs == 0)
				displayA = theOdds()
				showHead(0, displayA)

			elseif(slotASecs > 0)
				displayA = utility.randomInt(0,3)
				
				if(displayA == oldA)
					displayA = utility.randomInt(0,3)	
				endif

				showHead(0, displayA)
				oldA = displayA

			endif

			counter = counterTimer

		endif

		utility.wait(0.5)

		slotCSecs -= 1
		slotBSecs -= 1
		slotASecs -= 1

	endWhile

ENDFUNCTION

; ////////////////
; //CALCULATE THE ODDS FOR THE MACHINE
; ////////////////
int FUNCTION theOdds()
	int head
	int randNum

	; 0 = Horker
	; 1 = Bear
	; 2 = Goat
	; 3 = Wolf

	randNum = utility.randomInt(0,100)

	; //horker head!
	if(randNum >= 90)
		head = 0

	; //bear head!
	elseif(randNum >= 70 && randNum < 90)
		head = 1

	; //Wolf head!
	elseif(randNum >= 40 && randNum < 70)
		head = 3

	; //Goat head!
	elseif(randNum > 0 && randNum < 40)
		head = 2

	endif

	return head

ENDFUNCTION

; ////////////////
; // SHOW THE HEAD FOR THE SLOT WE'VE PASSED IN
; ////////////////
FUNCTION showHead(int slot, int head)
	
	; //Slot A
	if(slot == 0)

		; //clear the heads out
		clearHeadSlot(0)

		; //enable the proper heads
		if(head == 0)
			horkerA.enable()
			slotA = 0
		elseif(head == 1)
			bearA.enable()
			slotA = 1
		elseif(head == 2)
			goatA.enable()
			slotA = 2
		elseif(head == 3)
			wolfA.enable()
			slotA = 3
		endif

	; //Slot B
	elseif(slot == 1)

		; //clear the heads out
		clearHeadSlot(1)

		; //enable the proper heads
		if(head == 0)
			horkerB.enable()
			slotB = 0
		elseif(head == 1)
			bearB.enable()
			slotB = 1
		elseif(head == 2)
			goatB.enable()
			slotB = 2
		elseif(head == 3)
			wolfB.enable()
			slotB = 3
		endif

	; //Slot C
	elseif(slot == 2)

		; //clear the heads out
		clearHeadSlot(2)

		; //enable the proper heads
		if(head == 0)
			horkerC.enable()
			slotC = 0
		elseif(head == 1)
			bearC.enable()
			slotC = 1
		elseif(head == 2)
			goatC.enable()
			slotC = 2
		elseif(head == 3)
			wolfC.enable()
			slotC = 3
		endif
	endif

ENDFUNCTION

; ////////////////
; //CLEAR OUT THE HEAD SLOT OF WHICHEVER SLOT WE PASS IN
; ////////////////
FUNCTION clearHeadSlot(int slot)

	if(slot == 0)
		horkerA.disable()
		bearA.disable()
		goatA.disable()
		wolfA.disable()

	elseif(slot == 1)
		horkerB.disable()
		bearB.disable()
		goatB.disable()
		wolfB.disable()
	
	elseif(slot == 2)
		horkerC.disable()
		bearC.disable()
		goatC.disable()
		wolfC.disable()

	endif

ENDFUNCTION

; ////////////////
; //the heads have stopped spinning, now it's time for the payout $$$
; ////////////////
FUNCTION payout()

	; 0 = Horker
	; 1 = Bear
	; 2 = Goat
	; 3 = Wolf

	; //3 of a kind

	; //HORKER HORKER HORKER
	if(slotA == 0 && slotB == 0 && slotC == 0)
		moneySlot.additem(pGold001, 10000)

	; //BEAR BEAR BEAR
	elseif(slotA == 1 && slotB == 1 && slotC == 1)
		moneySlot.additem(pGold001, 5000)

	; //WOLF WOLF WOLF
	elseif(slotA == 3 && slotB == 3 && slotC == 3)
		moneySlot.additem(pGold001, 2500)

	; //GOAT GOAT GOAT
	elseif(slotA == 2 && slotB == 2 && slotC == 2)
		moneySlot.additem(pGold001, 1000)

	; //BEARS and HORKER
	elseif(slotA == 1 && slotB == 1 && slotC == 0)
		moneySlot.additem(pGold001, 2500)		

	elseif(slotA == 0 && slotB == 1 && slotC == 1)
		moneySlot.additem(pGold001, 2500)

	elseif(slotA == 1 && slotB == 0 && slotC == 1)
		moneySlot.additem(pGold001, 2500)

	; //WOLF and HORKER
	elseif(slotA == 3 && slotB == 3 && slotC == 0)
		moneySlot.additem(pGold001, 1250)

	elseif(slotA == 0 && slotB == 3 && slotC == 3)
		moneySlot.additem(pGold001, 1250)

	elseif(slotA == 3 && slotB == 0 && slotC == 3)
		moneySlot.additem(pGold001, 1250)

	; //GOAT and HORKER
	elseif(slotA == 2 && slotB == 2 && slotC == 0)
		moneySlot.additem(pGold001, 500)

	elseif(slotA == 0 && slotB == 2 && slotC == 2)
		moneySlot.additem(pGold001, 500)

	elseif(slotA == 2 && slotB == 0 && slotC == 2)
		moneySlot.additem(pGold001, 500)

	endif

	int moneyShot = 5
	OBJECTREFERENCE moneyShot0
	OBJECTREFERENCE moneyShot1
	OBJECTREFERENCE moneyShot2
	OBJECTREFERENCE moneyShot3
	OBJECTREFERENCE moneyShot4
	
	while(moneyShot)

		moneyShot0 = moneyShooter.placeAtMe(pGold001, 1)
		moneyShot0.applyHavokImpulse(2, 1, 0, 1)

		moneyShot1 = moneyShooter.placeAtMe(pGold001, 1)
		moneyShot1.applyHavokImpulse(-2, 1, 0, 1)

		moneyShot2 = moneyShooter.placeAtMe(pGold001, 1)
		moneyShot2.applyHavokImpulse(5, 1, 0, 1)

		moneyShot3 = moneyShooter.placeAtMe(pGold001, 1)
		moneyShot3.applyHavokImpulse(-5, 1, 0, 1)

		moneyShot4 = moneyShooter.placeAtMe(pGold001, 1)
		moneyShot4.applyHavokImpulse(0, 1, 0, 1)

		utility.wait(0.03)

		moneyShot -= 1

	endWhile

	

ENDFUNCTION