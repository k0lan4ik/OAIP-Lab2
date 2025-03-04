unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CharacterController, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    procedure OnPaint(Sender: TObject);
    procedure OnCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
<<<<<<< Updated upstream

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
=======
const
  First:TBodyPRow = ((200,200),(0,-1),(0,-1),(0,-1),(-1,1),(0,1),(1,1),(0,1),(-1,1),(0,1),(-1,0),(1,1),(0,1),(1,0));
  Second:TBodyPRow = ((300,200),(0,-1),(0,-1),(0,-1),(-1,1),(0,1),(1,-1),(1,-1),(-1,1),(0,1),(-1,0),(1,1),(0,1),(1,0));
  Tri:TBodyPRow = ((300,200),(0,1),(0,-1),(0,0),(-1,0),(0,1),(0,-1),(-1,0),(1,0),(0,-1),(0,1),(0,1),(1,0),(-1,0));


var
  Characer: TCharacter;
  Timer, Start: Cardinal;
  Scale :Real;

procedure TForm2.OnCreate(Sender: TObject);
begin

  Start := GetTickCount;
  Characer := TCharacter.Create(Form2.Canvas);
  Characer.AddKeyFrame(First, 50, 0);
  Characer.AddKeyFrame(Second, 50, 2500);
  Characer.AddKeyFrame(Second, 50, 3000);
  Characer.AddKeyFrame(Tri, 50, 5000);
  Scale := 1;
>>>>>>> Stashed changes
end;

procedure TForm2.OnPaint(Sender: TObject);
begin
<<<<<<< Updated upstream
  Character.Paint(Character.Body, Point(0, 0));
end;

procedure TForm2.OnTimer(Sender: TObject);
begin
  Canvas.Rectangle(0,0,1000,1000);
  Character.Paint(Character.Body, Point(Test, 0));        //Тут должна быть нормальная смена кадров
  Inc(Test,10);
=======

     Characer.Paint(GetTickCount - Start);
     if GetTickCount - Start < 5000 then
      Form2.Invalidate;
>>>>>>> Stashed changes
end;
end.
