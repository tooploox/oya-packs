#include "environment.iss"

#define MyAppId "<%= appId %>"
#define MyAppVersion "<%= appVer %>"
#define MyAppName "<%= appName %>"
#define MyAppPublisher "<%= appPublisher %>"
#define MyAppURL "<%= appUrl %>"

#define MyAppOutputDir "<%= outputPath %>"
#define MyAppOutputFile "<%= outputFile %>"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={#MyAppId}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir={#MyAppOutputDir}
OutputBaseFilename={#MyAppOutputFile}
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ChangesEnvironment=true

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
<%= for (val) in appBin64 { %>
Source: "<%= winePath + "/" + val %>"; DestDir: "{app}"; Flags: ignoreversion; Check: IsWin64;<% } %>

<%= for (val) in appBin32 { %>
Source: "<%= winePath + "/" + val %>"; DestDir: "{app}"; Flags: ignoreversion; Check: "not IsWin64";<% } %>

[Tasks]
Name: envPath; Description: "Add to PATH"

[Code]

procedure CurStepChanged(CurStep: TSetupStep);
begin
    if (CurStep = ssPostInstall) and WizardIsTaskSelected('envPath') 
    then EnvAddPath(ExpandConstant('{app}'));
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
    if CurUninstallStep = usPostUninstall
    then EnvRemovePath(ExpandConstant('{app}'));
end;

