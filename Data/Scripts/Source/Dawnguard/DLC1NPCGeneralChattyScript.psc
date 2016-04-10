Scriptname DLC1NPCGeneralChattyScript extends Quest conditional


float Property SecondsToSpeakAgain auto

GlobalVariable Property GameDaysPassed auto
GlobalVariable Property TimeScale auto
GlobalVariable Property DLC1RNPCGeneralHelloTime auto



float Function RealTimeSecondsToGameTimeDays(float realtime)
    float scaledSeconds = realtime * TimeScale.Value
    return scaledSeconds / (60 * 60 * 24)
EndFunction



Function TimeOut()
	Debug.Trace("RNPC: Timing out general hellos.")
	DLC1RNPCGeneralHelloTime.Value = GameDaysPassed.Value + RealTimeSecondsToGameTimeDays(SecondsToSpeakAgain)
EndFunction

