unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
  Character: TCharacter;
  //Buff: TBitMap;
  //Timer, Start: Cardinal;
  Test: integer;

procedure TForm2.OnCreate(Sender: TObject);
begin
  //Start := GetTickCount;
  Character := TCharacter.Create(200, 300, Form2.Canvas);
  Test := 0;
end;

procedure TForm2.OnPaint(Sender: TObject);
begin
  Character.Paint(Character.Body, Point(0, 0));
end;

procedure TForm2.OnTimer(Sender: TObject);
begin
  Canvas.Rectangle(0,0,1000,1000);
  Character.Paint(Character.Body, Point(Test, 0));        //��� ������ ���� ���������� ����� ������
  Inc(Test,10);
end;

end.
