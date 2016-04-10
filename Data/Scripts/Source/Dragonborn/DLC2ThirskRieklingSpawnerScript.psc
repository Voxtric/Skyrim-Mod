Scriptname DLC2ThirskRieklingSpawnerScript extends Quest  

ReferenceAlias[] Property RieklingAliases  Auto  



Function ProcessRieklings()
; 	Debug.Trace("MH02: Rieklings getting processed...")
	; Just using the normal respawn processes for now, and maybe forever.
	;/ int count = 0
	while (count < RieklingAliases.Length)
		Actor riekling = RieklingAliases[count].GetActorReference()
		if (riekling.IsDead())
			riekling.Reset()
		endif
		count += 1
	endwhile /;
	Stop()
EndFunction

