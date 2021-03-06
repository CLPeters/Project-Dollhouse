!include LogicLib.nsh
!include defines.nsh

Name "Project Dollhouse Client Installer"

Outfile "PDInstaller.exe"

RequestExecutionLevel admin

Page directory
Page instfiles

Var MaxisRegistry

Function .onInit
	ReadRegStr $MaxisRegistry HKLM 'SOFTWARE\Maxis\The Sims Online\' 'InstallDir'

	${If} $MaxisRegistry != ""
		StrCpy $INSTDIR  '$MaxisRegistry'
	${ElseIf} $MaxisRegistry == ""
		${If} ${FileExists} '$PROGRAMFILES\Maxis\The Sims Online'
			StrCpy $INSTDIR '$PROGRAMFILES\Maxis\The Sims Online\'
		${ElseIf} ${FileExists} '$PROGRAMFILES32\Maxis\The Sims Online\'
			StrCpy $INSTDIR '$PROGRAMFILES32\Maxis\The Sims Online\'
		${ElseIf} ${FileExists} '$PROGRAMFILES64\Maxis\The Sims Online\'
			StrCpy $INSTDIR '$PROGRAMFILES64\Maxis\The Sims Online\'
		${Else}
			MessageBox MB_OK "Couldn't find TSO installed on your system! Please locate the path!"

			Dialogs::Folder "Folder selection" "Locate The Sims Online installation folder:" $EXEDIR ${VAR_INSTDIR}
			StrCmp $INSTDIR "" Cancel Ok

			Cancel:
				DetailPrint "No folder was selected by the user"
				goto Exit

			Ok:
				DetailPrint "User selected install folder: $INSTDIR"
				goto Exit
		${EndIf}
	${EndIf}

	CreateDirectory '$TEMP\PDInstaller'

Exit:
FunctionEnd

Section "Main"
	SetOutPath '$INSTDIR\TSOClient\'

	File "pdclient\TSO.Vitaboy.dll"
	File "pdclient\TSO.Files.dll"
	File "pdclient\TSO.Common.dll"
	File "pdclient\TSO.Content.dll"
	File "pdclient\TSO.Vitaboy.Engine.dll"
	File "pdclient\TSO.Simantics.dll"
	File "pdclient\TSO.World.dll"
	File "pdclient\TSO.HIT.dll"
	File "pdclient\Project Dollhouse Client.exe"
	File "pdclient\Bass.Net.dll"
	File "pdclient\Project Dollhouse Client.exe.config"
	File "pdclient\NAudio.dll"
	File "pdclient\bass.dll"
	File "pdclient\GOLD Engine.dll"
	File "pdclient\GonzoNet.dll"
	File "pdclient\MySql.Data.dll"
	File "pdclient\TargaImage.dll"
	File "pdclient\ProtocolAbstractionLibraryD.dll"

	File "pdclient\PDPatcher.exe"
	File "pdclient\PDPatcher.exe.config"
	File "pdclient\KISS.net.dll"
	File "pdclient\Client.manifest"
	File "pdclient\Patcher.manifest"
	File "pdclient\Interop.Shell32.dll"

	SetOutPath "$INSTDIR\TSOClient\packingslips\"

	File "pdclient\packingslips\accessorytable.xml"
	File "pdclient\packingslips\alloutfits.xml"
	File "pdclient\packingslips\animtable.xml"
	File "pdclient\packingslips\appearances.xml"
	File "pdclient\packingslips\bindings.xml"
	File "pdclient\packingslips\cities.xml"
	File "pdclient\packingslips\collections.xml"
	File "pdclient\packingslips\handgroups.xml"
	File "pdclient\packingslips\meshes.xml"
	File "pdclient\packingslips\outfits.xml"
	File "pdclient\packingslips\purchasables.xml"
	File "pdclient\packingslips\textures.xml"
	File "pdclient\packingslips\thumbnails.xml"
	File "pdclient\packingslips\uigraphics.xml"

	CreateDirectory '$INSTDIR\TSOClient\Content'
	SetOutPath '$INSTDIR\TSOClient\Content\'

	File "pdclient\Content\login.xnb"
	File "pdclient\Content\ComicSans.xnb"
	File "pdclient\Content\ComicSansSmall.xnb"

	CreateDirectory '$INSTDIR\TSOClient\Content\Fonts'
	SetOutPath '$INSTDIR\TSOClient\Content\Fonts\'
	
	File "pdclient\Content\Fonts\ProjectDollhouse_10px.xnb"
	File "pdclient\Content\Fonts\ProjectDollhouse_12px.xnb"
	File "pdclient\Content\Fonts\ProjectDollhouse_14px.xnb"
	File "pdclient\Content\Fonts\ProjectDollhouse_16px.xnb"

	CreateDirectory '$INSTDIR\TSOClient\Content\Effects'
	SetOutPath '$INSTDIR\TSOClient\Content\Effects\'
	
	File "pdclient\Content\Effects\TerrainSplat.xnb"
	File "pdclient\Content\Effects\TerrainSplat2.xnb"
	File "pdclient\Content\Effects\colorpoly2D.xnb"
	File "pdclient\Content\Effects\2DWorldBatch.xnb"
	File "pdclient\Content\Effects\HouseBatch.xnb"
	File "pdclient\Content\Effects\PixShader.xnb"
	File "pdclient\Content\Effects\VerShader.xnb"

	CreateDirectory '$INSTDIR\TSOClient\Content\Textures'
	SetOutPath '$INSTDIR\TSOClient\Content\Textures\'

	File "pdclient\Content\Textures\gridTexture.xnb"

	CreateDirectory '$INSTDIR\TSOClient\libs'
	SetOutPath '$INSTDIR\TSOClient\libs\'

	File "pdclient\libs\SciLexer.dll"
	File "pdclient\libs\SciLexer64.dll"

	;create desktop shortcut
  	CreateShortCut "$DESKTOP\Project Dollhouse.lnk" "$INSTDIR\TSOClient\PDPatcher.exe" ""
SectionEnd