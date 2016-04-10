Scriptname DLC2KagrumezFollowerResetScript extends ObjectReference  

referencealias property spiderFriend auto
referencealias property sphereFriend auto


Event onTriggerEnter(objectReference Actronaut)
Actor sphere = sphereFriend.getReference() as Actor
Actor spider = spiderFriend.getReference() as Actor
	if sphere.isDead() == 1
		sphereFriend.trytoReset()
	endif
	if spider.isDead() == 1
		spiderFriend.trytoReset()
	endif
EndEvent