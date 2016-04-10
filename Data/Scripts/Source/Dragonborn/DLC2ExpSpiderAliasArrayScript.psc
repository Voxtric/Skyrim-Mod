Scriptname DLC2ExpSpiderAliasArrayScript extends DLC2ReferenceAliasArrayScript  

Function DoIfFull()
	objectReference LastRef

	LastRef = RefArray[RefArray.length - 1]
	
	(LastRef as DLC2EncExpSpiderGenericControlSCRIPT).SpiderCrumble()

EndFunction

