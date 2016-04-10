scriptName DLC1VQ03MothPriestBleedoutScript extends referenceAlias
{This script is on the mothpriest to watch for when he enters bleedout to communicate with the fight script}

DLC1VQ03MothpriestFightScript property FightController auto

Event OnEnterBleedout()
	FightController.MothpriestEnteredBleedout()

endEvent
