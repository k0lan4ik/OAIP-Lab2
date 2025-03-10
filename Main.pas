unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CharacterController, EventController,
  BackGroundController,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    procedure OnPaint(Sender: TObject);
    procedure OnCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  Wheel1: TBodyPRow = ((250, 700), (0, -1), (1, -1), (0, 1), (3, 1), (1, 3),
    (10, 1), (1, 5), (1, 1), (1, 0), (1, -1), (2, 1), (1, -1), (0, -1));
    Wheel2: TBodyPRow = ((300, 750), (-1, 0), (-1, -1), (1, 0), (1, -3), (3, -1),
    (1, -10), (5, -1), (1, -1), (0, -1), (-1, -1), (1, -2), (-1, -1), (-1, 0));
    Wheel3: TBodyPRow = ((350, 700), (0, 1), (-1, 1), (0, -1), (-3, -1), (-1, -3),
    (-10, -1), (-1, -5), (-1, -1), (-1, 0), (-1, 1), (-2, -1), (-1, 1), (0, 1));
    Wheel4: TBodyPRow = ((300, 650), (1, 0), (1, 1), (-1, 0), (-1, 3), (-3, 1),
    (-1, 10), (-5, 1), (-1, 1), (0, 1), (1, 1), (-1, 2), (1, 1), (1, 0));
  First: TBodyPRow = ((200, 600), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Second: TBodyPRow = ((320, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (3, -1), (0, -1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Secon: TBodyPRow = ((210, 550), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 0), (1, 0), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Tri: TBodyPRow = ((320, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  chetiri: TBodyPRow = ((600, 600), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));

var
  Characer: TCharacter;
  bg: TBackGround;
  Driver: TDrawer;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  Characer.Destroy;
  bg.Destroy;
end;

procedure TForm2.OnCreate(Sender: TObject);
var Period: integer;
Movement: integer;
Start: integer;
begin
  Driver := TDrawer.Create(GetTickCount, 15000);
  bg := TBackGround.Create();
 bg.AddKeyFrame([], [], [TLine.Create(0, 900, 700, 700, clBlack, clLime),
    TLine.Create(700, 0, 700, 700, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(200, 555, 200, 840, clBlack, clWhite),
    TLine.Create(400, 500, 200, 555, clBlack, clWhite),
    TLine.Create(200, 840, 400, 785, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(200, 555, 200, 840, clBlack, clWhite),
    TLine.Create(400, 500, 200, 555, clBlack, clWhite),
    TLine.Create(200, 840, 400, 785, clBlack, clWhite)], 0);

  bg.AddKeyFrame([], [], [TLine.Create(0, 900, 700, 700, clBlack, clLime),
    TLine.Create(700, 0, 700, 700, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(200, 555, 200, 840, clBlack, clWhite),
    TLine.Create(400, 500, 200, 555, clBlack, clWhite),
    TLine.Create(200, 840, 400, 785, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(200, 555, 200, 840, clBlack, clWhite),
    TLine.Create(400, 500, 200, 555, clBlack, clWhite),
    TLine.Create(200, 840, 400, 785, clBlack, clWhite)], 5000);

    bg.AddKeyFrame([], [], [TLine.Create(0, 900, 700, 700, clBlack, clLime),
    TLine.Create(700, 0, 700, 700, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(200, 555, 200, 840, clBlack, clWhite),
    TLine.Create(400, 500, 200, 555, clBlack, clWhite),
    TLine.Create(200, 840, 400, 785, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(450, 650, 450, 935, clBlack, clWhite),
    TLine.Create(400, 500, 450, 650, clBlack, clWhite),
    TLine.Create(450, 935, 400, 785, clBlack, clWhite)], 5050);

    bg.AddKeyFrame([], [], [TLine.Create(0, 900, 700, 700, clBlack, clLime),
    TLine.Create(700, 0, 700, 700, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(200, 555, 200, 840, clBlack, clWhite),
    TLine.Create(400, 500, 200, 555, clBlack, clWhite),
    TLine.Create(200, 840, 400, 785, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(600, 445, 600, 730, clBlack, clWhite),
    TLine.Create(400, 500, 600, 445, clBlack, clWhite),
    TLine.Create(600, 730, 400, 785, clBlack, clWhite)], 5100);

    bg.AddKeyFrame([], [], [TLine.Create(0, 900, 700, 700, clBlack, clLime),
    TLine.Create(700, 0, 700, 700, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(200, 555, 200, 840, clBlack, clWhite),
    TLine.Create(400, 500, 200, 555, clBlack, clWhite),
    TLine.Create(200, 840, 400, 785, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(600, 445, 600, 730, clBlack, clWhite),
    TLine.Create(400, 500, 600, 445, clBlack, clWhite),
    TLine.Create(600, 730, 400, 785, clBlack, clWhite)], 10000);

    bg.AddKeyFrame([], [], [TLine.Create(0, 900, 700, 700, clBlack, clLime),
    TLine.Create(700, 0, 700, 700, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(200, 555, 200, 840, clBlack, clWhite),
    TLine.Create(400, 500, 200, 555, clBlack, clWhite),
    TLine.Create(200, 840, 400, 785, clBlack, clWhite),
    TLine.Create(400, 500, 400, 785, clBlack, clWhite),
    TLine.Create(600, 445, 600, 730, clBlack, clWhite),
    TLine.Create(400, 500, 600, 445, clBlack, clWhite),
    TLine.Create(600, 730, 400, 785, clBlack, clWhite)], 100000);
  Characer := TCharacter.Create();
  {Characer.AddLoopFrame([First, Secon], [50, 50], [100, 200], 4000, 20);
  Characer.AddLoopFrame([Secon, Second], [50, 50], [1000, 2000], 8000, 4);}
  //Characer.AddLoopFrame([Wheel1, Wheel2, Wheel3, Wheel4], [50, 50, 50, 50], [100, 100, 100, 100], 5000, 20);
  Period:=400;
  Movement:=50;
  Start:=5000;
  Wheel3[1,1]:=(Wheel3[1,1]+Movement);
  Wheel2[1,1]:=(Wheel2[1,1]+2*Movement);
  Wheel1[1,1]:=(Wheel1[1,1]+3*Movement);
  for var I := 0 to 50 do
  begin
  Characer.AddKeyFrame(Wheel4, 50, Start+ 0 + Period*i);
  Characer.AddKeyFrame(Wheel3, 50, Start+ 100 + Period*i);
  Characer.AddKeyFrame(Wheel2, 50, Start+ 200 + Period*i);
  Characer.AddKeyFrame(Wheel1, 50, Start+ 300 + Period*i);
  Wheel1[1,1]:=(Wheel1[1,1]+4*Movement);
  Wheel2[1,1]:=(Wheel2[1,1]+4*Movement);
  Wheel3[1,1]:=(Wheel3[1,1]+4*Movement);
  Wheel4[1,1]:=(Wheel4[1,1]+4*Movement);
  end;
  Characer.AddKeyFrame(Tri, 50, 14000);
  Characer.AddKeyFrame(chetiri, 100, 15001);
  Driver.AddDrawObj(bg);
  Driver.AddDrawObj(Characer);
end;

procedure TForm2.OnPaint(Sender: TObject);
var
  CurTime: Cardinal;
begin
  Driver.DrawFrame(Form2, Form2.Canvas);
end;

end.
