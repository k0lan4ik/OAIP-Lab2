unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CharacterController, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    procedure OnPaint(Sender: TObject);
    procedure OnCreate(Sender: TObject);
    procedure OnTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
var
  Characer: TCharacter;
  Buff: TBitMap;
  Timer, Start: Cardinal;
  Scale :Real;

procedure TForm2.OnCreate(Sender: TObject);
begin
  Start := GetTickCount;
  Buff := TBitMap.Create;
  Characer := TCharacter.Create(200,200,Form2.Canvas);
  Scale := 1;
end;

procedure TForm2.OnPaint(Sender: TObject);
begin
     Characer.Paint(Characer.Body,Point(0,0));
end;
procedure TForm2.OnTimer(Sender: TObject);
begin

  //InValidateRect(form2.handle,NIL,True);
  if GetTickCount - Start > 2000 then
    Timer1.Enabled := false
end;

end.
