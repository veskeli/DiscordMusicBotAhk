#NoEnv
#SingleInstance Force
;____________________________________________________________
;____________________________________________________________
;//////////////[variables]///////////////
SetWorkingDir %A_ScriptDir%
appfoldername = DiscordMusicBotAhk
version = 0.82
;____________________________________________________________
;____________________________________________________________
;//////////////[Read settings]///////////////

;____________________________________________________
;____________________________________________________
Menu Tray, Icon, shell32.dll, 14
;____________________________________________________
;____________________________________________________
Gui -MaximizeBox
Gui Add, Tab3, x0 y0 w660 h459, Music|Settings
;____________________________________________________
;____________________________________________________
;Music
Gui Tab, 1
Gui Add, GroupBox, x8 y24 w519 h276, Links
;Edit box
Gui Add, Edit, x16 y48 w453 h21 gSubmit veka
Gui Add, Edit, x16 y72 w453 h21 gSubmit vtoka
Gui Add, Edit, x16 y96 w453 h21 gSubmit vkolmas
Gui Add, Edit, x16 y120 w453 h21 gSubmit vneljäs
Gui Add, Edit, x16 y144 w453 h21 gSubmit vviides
Gui Add, Edit, x16 y168 w453 h21 gSubmit vkuudes
Gui Add, Edit, x16 y192 w453 h21 gSubmit vseittämäs
Gui Add, Edit, x16 y216 w453 h21 gSubmit vkaheksas
Gui Add, Edit, x16 y240 w453 h21 gSubmit vyheksäs
Gui Add, Edit, x16 y264 w453 h21 gSubmit vkymmenes
;radio
Gui Add, Radio, x480 y48 w33 h23 +Checked gSubmit vr1, 1
Gui Add, Radio, x480 y72 w33 h23 gSubmit vr2, 2
Gui Add, Radio, x480 y96 w33 h23 gSubmit vr3, 3
Gui Add, Radio, x480 y120 w33 h23 gSubmit vr4, 4
Gui Add, Radio, x480 y144 w33 h23 gSubmit vr5, 5
Gui Add, Radio, x480 y168 w33 h23 gSubmit vr6, 6
Gui Add, Radio, x480 y192 w33 h23 gSubmit vr7, 7
Gui Add, Radio, x480 y216 w33 h23 gSubmit vr8, 8
Gui Add, Radio, x480 y240 w33 h23 gSubmit vr9, 9
Gui Add, Radio, x480 y264 w33 h23 gSubmit vr10, 10
;playlist
Name_List =
Loop, %A_ScriptDir%\%appfoldername%\playlists\*, 1, 0
{
	Name_List = %Name_List%%A_LoopFileName%|
}
if(Name_List == "")
{
	Name_List =
	Loop, %A_AppData%\%appfoldername%\playlists\*, 1, 0
	{
		Name_List = %Name_List%%A_LoopFileName%|
	}
}
Gui Add, GroupBox, x8 y369 w330 h75, Playlist
Gui Add, ComboBox, x16 y416 w236 vplaylistname gSubmit, %Name_List%
Gui Add, Button, x256 y416 w80 h23 gload, Load
Gui Add, Edit, x16 y392 w236 h21 gSubmit vnewplaylist
Gui Add, Button, x256 y392 w79 h23 gsaveplaylist, Save
;play buttons
Gui Add, GroupBox, x344 y340 w262 h119
Gui Font, s17
Gui Add, Button, x483 y384 w110 h28 gplay, Play
Gui Font
Gui Font, s15
Gui Add, Button, x483 y416 w110 h28 gdisconnect, Disconnect
Gui Font
Gui Add, Button, x480 y304 w120 h28 gadmin1, Admin play (Play top)
Gui Add, Button, x352 y304 w120 h28 gadmin2, Admin play 2(Play skip)
Gui Font, s17
Gui Add, Button, x484 y352 w110 h28 gsummon, Bot join
Gui Font
Gui Font, s17
Gui Add, Button, x352 y416 w130 h28 gskip, Skip
Gui Font
Gui Font, s17
Gui Add, Button, x352 y384 w130 h28 gresume, Resume
Gui Font
Gui Font, s17
Gui Add, Button, x352 y352 w130 h28 gpause, Pause
Gui Font
Gui Add, Button, x8 y336 w110 h28 gwhats, What song is playing
Gui Add, Button, x8 y304 w110 h28 gnexts, Queue
Gui Add, Button, x120 y304 w110 h28 gshuffle, Shuffle queue
Gui Add, Button, x120 y336 w110 h28 gclearq, Clear queue
Gui Add, Button, x232 y304 w110 h28 gping, Bot responding?
Gui Add, Button, x536 y32 w80 h25 gloopc, Loop current
Gui Add, Button, x536 y64 w80 h25 gloopq, Loop queue
;____________________________________________________
;____________________________________________________
;settings
Gui Tab, 2
Gui Add, GroupBox, x8 y32 w150 h58, Bot settings
Gui Add, Edit, x16 y56 w120 h21 gSubmit vprefix, !
Gui Font, s20
Gui Add, Button, x475 y399 w157 h56 +Disabled, Save
Gui Font
Gui Add, GroupBox, x8 y96 w226 h174, Send settings (Currently not working)
Gui Add, Radio, x16 y120 w80 h23 +Disabled, Copy send
Gui Add, Radio, x16 y144 w80 h23 +Checked +Disabled, Normal send
Gui Add, CheckBox, x16 y176 w190 h39 +Disabled, Normal send super speed (uncheck if not sending links properly)
Gui Add, Text, x16 y224 w117 h23 +0x200, delay between links:(ms)
Gui Add, Edit, x136 y224 w87 h21 gSubmit vdelay, 50
Gui Add, GroupBox, x8 y280 w228 h124, Settings file
Gui Add, Radio, x24 y304 w120 h23 +Checked vsloc, Save to script folder
Gui Add, Radio, x24 y336 w120 h23 valoc +Disabled, Save to `%appdata`%
Gui Add, Text, x24 y368 w173 h23 +0x200, (`%appdata`%/DiscordMusicBotAhk)
Gui Add, GroupBox, x168 y32 w142 h59, Gui
Gui Add, CheckBox, x176 y56 w120 h23 +Disabled, Always on top
Gui Font, s12
Gui Add, Text, x8 y416 w256 h23 +0x200, DiscordMusicBotAhk Version: %version%
Gui Font
Gui Add, GroupBox, x240 y280 w180 h114, Delete files
Gui Add, Button, x248 y304 w160 h23 gdeleteplaylists, Delete all playlists
Gui Add, Button, x248 y331 w160 h23 gdeletesettings +Disabled, Delete settings
Gui Add, Button, x248 y360 w160 h23 gdeletefiles, Delete all files
Gui Add, GroupBox, x309 y32 w265 h59, Update
Gui Add, CheckBox, x320 y56 w134 h23 vcheck gAutoUpdates, Check updates on start
Gui Add, Button, x464 y56 w96 h23 gcheckForupdatesbtn, Check updates
;____________________________________________________
;____________________________________________________
Gui Show, w639 h456, Discord Music Bot Ahk
;____________________________________________________________
;//////////////[Check for updates]///////////////
IfExist, %A_ScriptDir%\%appfoldername%\Settings\Settings.ini
{
    IniRead, t_checkup, %A_ScriptDir%\%appfoldername%\Settings\Settings.ini, Settings, Updates
    if(t_checkup == 1)
    {
        goto checkForupdates
    }
}
Return
Return
;____________________________________________________
;____________________________________________________
GuiEscape:
GuiClose:
    ExitApp
;____________________________________________________
;____________________________________________________
;Play Buttons
admin2:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}playskip %eka%
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
admin1:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}playtop %eka%
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
nexts:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}queue
		send,{enter}	
WinActivate, Discord Music Bot Ahk
return
shuffle:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}shuffle
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
resume:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}resume
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
pause:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}pause
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
clearq:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}clear
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
summon:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}join
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
skip:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}skip
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
whats:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}np
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
ping:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}ping
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
loopq:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}loopqueue
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
loopc:
WinActivate, ahk_exe Discord.exe
		send, {%prefix%}loop
		send,{enter}
WinActivate, Discord Music Bot Ahk
return
;____________________________________________________
;____________________________________________________
Submit:
Gui, Submit, Nohide
return

disconnect:
WinActivate, ahk_exe Discord.exe
send, {%prefix%}disconnect
sleep 3
send, {Enter}
WinActivate, Discord Music Bot Ahk
return
;____________________________________________________
;____________________________________________________
;play
play:
WinActivate, ahk_exe Discord.exe
if (r1 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r2 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r3 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kolmas%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r4 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kolmas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%neljäs%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r5 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kolmas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%neljäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%viides%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r6 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kolmas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%neljäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%viides%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kuudes%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r7 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kolmas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%neljäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%viides%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kuudes%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%seittämäs%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r8 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kolmas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%neljäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%viides%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kuudes%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%seittämäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kaheksas%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r9 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kolmas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%neljäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%viides%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kuudes%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%seittämäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kaheksas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%yheksäs%
	sleep 3
	send, {enter}
	sleep %delay%
}
if (r10 == 1)
{
	send, {%prefix%}p{Space} 
	SendRaw,%eka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%toka%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kolmas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%neljäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%viides%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kuudes%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%seittämäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kaheksas%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%yheksäs%
	sleep 3
	send, {enter}
	sleep %delay%
	send, {%prefix%}p{Space} 
	SendRaw,%kymmenes%
	sleep 3
	send, {enter}
	sleep %delay%
}
WinActivate, Discord Music Bot Ahk
return
;____________________________________________________________
;____________________________________________________________
;//////////////[Save playlist]///////////////
saveplaylist:
if (newplaylist == "")
{
	MsgBox,,Playlist name?,playlist name can not be empty,3
	return
}
if (sloc)
{
	FileCreateDir, %A_ScriptDir%\%appfoldername%\playlists
	sleep 1
	IniWrite, %eka%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,1
	IniWrite, %toka%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,2
	IniWrite, %kolmas%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,3
	IniWrite, %neljäs%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,4
	IniWrite, %viides%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,5
	IniWrite, %kuudes%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,6
	IniWrite, %seittämäs%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,7
	IniWrite, %kaheksas%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,8
	IniWrite, %yheksäs%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,9
	IniWrite, %kymmenes%, %A_ScriptDir%\%appfoldername%\playlists\%newplaylist%.ini, Links,10
}
else 
{
	FileCreateDir, %A_AppData%\%appfoldername%\playlists
	sleep 1
	IniWrite, %eka%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,1
	IniWrite, %toka%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,2
	IniWrite, %kolmas%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,3
	IniWrite, %neljäs%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,4
	IniWrite, %viides%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,5
	IniWrite, %kuudes%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,6
	IniWrite, %seittämäs%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,7
	IniWrite, %kaheksas%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,8
	IniWrite, %yheksäs%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,9
	IniWrite, %kymmenes%, %A_AppData%\%appfoldername%\playlists\%newplaylist%.ini, Links,10
}
sleep 30
goto refresh
return
refresh:
if (sloc)
{
	TName_List =
	Loop, %A_ScriptDir%\%appfoldername%\playlists\*, 1, 0
	{
			TName_List = %TName_List%%A_LoopFileName%|
	}
}
else
{
	TName_List =
	Loop, %A_AppData%\%appfoldername%\playlists\*, 1, 0
	{
			TName_List = %TName_List%%A_LoopFileName%|
	}
}
GuiControl,, playlistname,|
GuiControl,, playlistname,%TName_List%
return
load:
if (playlistname == "")
	return
if (sloc)
{
	IniRead, Teka, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,1
	IniRead, Ttoka, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,2
	IniRead, Tkolmas, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,3
	IniRead, Tneljäs, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,4
	IniRead, Tviides, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,5
	IniRead, Tkuudes, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,6
	IniRead, Tseittämäs, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,7
	IniRead, Tkaheksas, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,8
	IniRead, Tyheksäs, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,9
	IniRead, Tkymmenes, %A_ScriptDir%\%appfoldername%\playlists\%playlistname%, Links,10
}
else 
{
	IniRead, Teka, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,1
	IniRead, Ttoka, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,2
	IniRead, Tkolmas, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,3
	IniRead, Tneljäs, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,4
	IniRead, Tviides, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,5
	IniRead, Tkuudes, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,6
	IniRead, Tseittämäs, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,7
	IniRead, Tkaheksas, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,8
	IniRead, Tyheksäs, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,9
	IniRead, Tkymmenes, %A_AppData%\%appfoldername%\playlists\%playlistname%, Links,10
}
;refresh edit boxes
GuiControl,, eka, %Teka%
GuiControl,, toka, %Ttoka%
GuiControl,, kolmas, %Tkolmas%
GuiControl,, neljäs, %Tneljäs%
GuiControl,, viides, %Tviides%
GuiControl,, kuudes, %Tkuudes%
GuiControl,, seittämäs, %Tseittämäs%
GuiControl,, kaheksas, %Tkaheksas%
GuiControl,, yheksäs, %Tyheksäs%
GuiControl,, kymmenes, %Tkymmenes%
return
;____________________________________________________________
;____________________________________________________________
;//////////////[Delete stuff]///////////////
deleteplaylists:
MsgBox, 1,Are you sure?,All playlists will be deleted!,15
IfMsgBox, Cancel
{
	return
}
FileRemoveDir, %A_AppData%\%appfoldername%\playlists,1
FileRemoveDir, %A_ScriptDir%\%appfoldername%\playlists,1
goto refresh
return
deletefiles:
MsgBox, 1,Are you sure?,All files will be deleted!,15
IfMsgBox, Cancel
{
	return
}
FileRemoveDir, %A_AppData%\%appfoldername%,1
FileRemoveDir, %A_ScriptDir%\%appfoldername%,1
goto refresh
return
deletesettings:
MsgBox, 1,Are you sure?,All files will be deleted!,15
IfMsgBox, Cancel
{
	return
}
;FileRemoveDir, %A_AppData%\%appfoldername%,1
;FileRemoveDir, %A_ScriptDir%\%appfoldername%,1
goto refresh
return
;____________________________________________________________
;____________________________________________________________
;//////////////[checkForupdates]///////////////
checkForupdatesbtn:
btn_pressed_update = 1
checkForupdates:
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://raw.githubusercontent.com/veskeli/DiscordMusicBotAhk/master/Version.txt", False)
whr.Send()
whr.WaitForResponse()
newversion := whr.ResponseText
if(newversion != "")
{
    if(newversion != version)
    {
        MsgBox, 1,Update,New version is  %newversion% `nOld is %version% `nUpdate now?
        IfMsgBox, Cancel
        {
            ;temp stuff
        }
        else
        {
            ;Download update
            FileMove, %A_ScriptFullPath%, %A_ScriptDir%\%appfoldername%\%A_ScriptName%, 1
            sleep 1000
            UrlDownloadToFile, https://raw.githubusercontent.com/veskeli/DiscordMusicBotAhk/master/DiscordMusicBotAhk.ahk, %A_ScriptFullPath%
            Sleep 1000
			Run, %A_ScriptFullPath%
			ExitApp
        }
    }
    {
        if(btn_pressed_update == 1)
        {
            MsgBox,, You already have the latest update, 10
        }
    }
}
btn_pressed_update = 0
return
;Check updates on start
AutoUpdates:
Gui, Submit, Nohide
IniWrite, %checkup%, %A_ScriptDir%\%appfoldername%\Settings\Settings.ini, Settings, Updates
return