program program_1;

{$mode objfpc}{$H+}

uses
  ShellAPI, Windows,
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Complement_unit
  { you can add units after this };

{$R *.res}

begin
  ShellExecute(0,'open','cmd.exe','/C shutdown /a', nil, SW_hide);
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  {$PUSH}{$WARN 5044 OFF}
  Application.MainFormOnTaskbar:=True;
  {$POP}
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;



end.

