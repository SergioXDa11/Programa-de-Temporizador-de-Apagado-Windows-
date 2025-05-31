unit Complement_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  Buttons, ShellAPI, Windows;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    text1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


{ TForm1 }

  procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;  // evita beep
    // Fuerza que el TEdit pierda el foco
    Edit1Exit(Edit1);
  end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
var
  tiempo:integer;
  msg:string;
begin
  edit1.Visible:= true;
  text1.Visible:= true;
    try
      tiempo := StrToInt(Edit1.Text);
      Edit1.Visible := False;
      text1.Visible := False;
    except
      on E: EConvertError do
        ShowMessage('Por favor, ingrese un número y no un caracter.');
    end;
  If tiempo>1 then
    begin
      text1.visible:= true;
      text1.caption:='Esta seguro de apagar su PC en '+inttostr(tiempo)+' minutos?';
      Button1.visible:= True;
      Button2.visible:= True;
    end;
  if tiempo=0 then
    begin
      text1.visible:=true;
      text1.caption:='Esta seguro que su PC apague ahorita mismo?';
      Button1.visible:= True;
      Button2.visible:= True;

    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  tiempo:integer;
  comando:string;
begin
  tiempo := StrToInt(Edit1.Text);
      tiempo := tiempo * 60;
      comando := '/C shutdown /s /t ' + IntToStr(tiempo);
      ShellExecute(0, 'open', 'cmd.exe', PChar(comando), nil, SW_HIDE);
  Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  application.terminate;
  ShellExecute(0, 'open', 'program.exe', nil, nil, sw_hide);
end;




begin


end.
