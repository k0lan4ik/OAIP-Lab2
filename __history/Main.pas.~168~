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
    Laying: TBodyPRow = ((1700, 810), (-1, 0), (-1, 0), (-1, 0), (10, -1), (1, 0),
    (10, 1), (1, 0), (10, -1), (1, 0), (10, -1), (10, 1), (1, 0), (10, 1));
    GetUp: TBodyPRow = ((1700, 810), (-1, 0), (-1, 0), (-1, 0), (1, -5), (0, 1),
    (1, -3), (0, 1), (10, -1), (1, 0), (10, -1), (10, 1), (1, 0), (10, 1));
  First: TBodyPRow = ((1630, 720), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Centered: TBodyPRow = ((950, 720), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
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
  Driver.Destroy;
  Characer.Destroy;
  bg.Destroy;
end;

procedure TForm2.OnCreate(Sender: TObject);
var Period, MovementX, MovementY, Start, Offset: integer;
begin
  Driver := TDrawer.Create(GetTickCount, 150000);
  bg := TBackGround.Create();

  Offset:= 0;

 bg.AddKeyFrame([TRectangle.Create(910,700,990,550,clBlack,ClWhite),TRectangle.Create(1410,700,1490,550,clBlack,ClWhite),TRectangle.Create(1910,700,1990,550,clBlack,ClWhite)],
 [TEllipse.Create(800,600, 1100,200, clBlack, clWhite),TEllipse.Create(1300,600, 1600,200, clBlack, clWhite),TEllipse.Create(1800,600, 2100,200, clBlack, clWhite)],
 [TLine.Create(400, 785, 10000, 785, clBlack, clBlack), TLine.Create(200, 840, 10000, 840, clBlack, clBlack)],
    [TPolyGon.Create([Point(700,-10),Point(700,700),Point(-10,900),Point(-10,-10)],clBlack,clWhite),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(200,840),Point(200,555)],clBlack,clBlack),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(200,840),Point(200,555)],clBlack,clWhite)], 0);

  bg.AddKeyFrame([TRectangle.Create(910,700,990,550,clBlack,ClWhite),TRectangle.Create(1410,700,1490,550,clBlack,ClWhite),TRectangle.Create(1910,700,1990,550,clBlack,ClWhite)],
 [TEllipse.Create(800,600, 1100,200, clBlack, clWhite),TEllipse.Create(1300,600, 1600,200, clBlack, clWhite),TEllipse.Create(1800,600, 2100,200, clBlack, clWhite)],
  [TLine.Create(400, 785, 10000, 785, clBlack, clBlack), TLine.Create(200, 840, 10000, 840, clBlack, clBlack)],
    [TPolyGon.Create([Point(700,-10),Point(700,700),Point(-10,900),Point(-10,-10)],clBlack,clWhite),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(200,840),Point(200,555)],clBlack,clBlack),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(200,840),Point(200,555)],clBlack,clWhite)], 5000);

    bg.AddKeyFrame([TRectangle.Create(910,700,990,550,clBlack,ClWhite),TRectangle.Create(1410,700,1490,550,clBlack,ClWhite),TRectangle.Create(1910,700,1990,550,clBlack,ClWhite)],
 [TEllipse.Create(800,600, 1100,200, clBlack, clWhite),TEllipse.Create(1300,600, 1600,200, clBlack, clWhite),TEllipse.Create(1800,600, 2100,200, clBlack, clWhite)],
    [TLine.Create(400, 785, 10000, 785, clBlack, clBlack), TLine.Create(200, 840, 10000, 840, clBlack, clBlack)],
    [TPolyGon.Create([Point(700,-10),Point(700,700),Point(-10,900),Point(-10,-10)],clBlack,clWhite),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(200,840),Point(200,555)],clBlack,clBlack),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(450,935),Point(450,650)],clBlack,clWhite)], 5050);

     bg.AddKeyFrame([TRectangle.Create(910,700,990,550,clBlack,ClWhite),TRectangle.Create(1410,700,1490,550,clBlack,ClWhite),TRectangle.Create(1910,700,1990,550,clBlack,ClWhite)],
     [TEllipse.Create(800,600, 1100,200, clBlack, clWhite),TEllipse.Create(1300,600, 1600,200, clBlack, clWhite),TEllipse.Create(1800,600, 2100,200, clBlack, clWhite)],
     [TLine.Create(400, 785, 10000, 785, clBlack, clBlack), TLine.Create(200, 840, 10000, 840, clBlack, clBlack)],
    [TPolyGon.Create([Point(700,-10),Point(700,700),Point(-10,900),Point(-10,-10)],clBlack,clWhite),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(200,840),Point(200,555)],clBlack,clBlack),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(600,730),Point(600,445)],clBlack,clWhite)], 5100);

    bg.AddKeyFrame([TRectangle.Create(910,700,990,550,clBlack,ClWhite),TRectangle.Create(1410,700,1490,550,clBlack,ClWhite),TRectangle.Create(1910,700,1990,550,clBlack,ClWhite),TRectangle.Create(2410-Offset,700,2490-Offset,550,clBlack,ClWhite)],
     [TEllipse.Create(800,600, 1100,200, clBlack, clWhite),TEllipse.Create(1300,600, 1600,200, clBlack, clWhite),TEllipse.Create(1800,600, 2100,200, clBlack, clWhite),TEllipse.Create(2300-Offset,600, 2600-Offset,200, clBlack, clWhite)],
     [TLine.Create(400, 785, 10000, 785, clBlack, clBlack), TLine.Create(200, 840, 10000, 840, clBlack, clBlack)],
    [TPolyGon.Create([Point(700,-10),Point(700,700),Point(-10,900),Point(-10,-10)],clBlack,clWhite),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(200,840),Point(200,555)],clBlack,clBlack),
    TPolyGon.Create([Point(400,500),Point(400,785),Point(600,730),Point(600,445)],clBlack,clWhite)], 8000);

    Offset:=680;

    bg.AddKeyFrame([TRectangle.Create(910-Offset,700,990-Offset,550,clBlack,ClWhite),TRectangle.Create(1410-Offset,700,1490-Offset,550,clBlack,ClWhite),TRectangle.Create(1910-Offset,700,1990-Offset,550,clBlack,ClWhite),TRectangle.Create(2410-Offset,700,2490-Offset,550,clBlack,ClWhite)],
     [TEllipse.Create(800-Offset,600, 1100-Offset,200, clBlack, clWhite),TEllipse.Create(1300-Offset,600, 1600-Offset,200, clBlack, clWhite),TEllipse.Create(1800-Offset,600, 2100-Offset,200, clBlack, clWhite),TEllipse.Create(2300-Offset,600, 2600-Offset,200, clBlack, clWhite)],
     [TLine.Create(400-Offset, 785, 10000-Offset, 785, clBlack, clBlack), TLine.Create(200-Offset, 840, 10000-Offset, 840, clBlack, clBlack)],
    [TPolyGon.Create([Point(700-Offset,-10),Point(700-Offset,700),Point(-10-Offset,900),Point(-10-Offset,-10)],clBlack,clWhite),
    TPolyGon.Create([Point(400-Offset,500),Point(400-Offset,785),Point(200-Offset,840),Point(200-Offset,555)],clBlack,clBlack),
    TPolyGon.Create([Point(400-Offset,500),Point(400-Offset,785),Point(600-Offset,730),Point(600-Offset,445)],clBlack,clWhite)], 9000);

  Characer := TCharacter.Create();
  Period:=400;
  MovementX:=100;
  Start:=5000;
  Wheel4[1,1]:=(Wheel3[1,1]-4*MovementX);
  Wheel3[1,1]:=(Wheel3[1,1]-3*MovementX);
  Wheel2[1,1]:=(Wheel2[1,1]-2*MovementX);
  Wheel1[1,1]:=(Wheel1[1,1]-1*MovementX);
  for var I := 0 to 3 do
  begin
  Wheel1[1,1]:=(Wheel1[1,1]+4*MovementX);
  Wheel2[1,1]:=(Wheel2[1,1]+4*MovementX);
  Wheel3[1,1]:=(Wheel3[1,1]+4*MovementX);
  Wheel4[1,1]:=(Wheel4[1,1]+4*MovementX);
  Wheel1[1,2]:=(Wheel1[1,2]+15);
  Wheel2[1,2]:=(Wheel2[1,2]+15);
  Wheel3[1,2]:=(Wheel3[1,2]+15);
  Wheel4[1,2]:=(Wheel4[1,2]+15);
  Characer.AddKeyFrame(Wheel4, 50, Start + 0 + Period*i);
  Characer.AddKeyFrame(Wheel3, 50, Start + 100 + Period*i);
  Characer.AddKeyFrame(Wheel2, 50, Start + 200 + Period*i);
  if i <> 3 then
  Characer.AddKeyFrame(Wheel1, 50, Start + 300 + Period*i);
  end;
  Characer.AddKeyFrame(Laying, 50, 7000);
  Characer.AddKeyFrame(GetUp, 50, 8000);
  Characer.AddKeyFrame(Centered, 50, 9000);
  Characer.AddKeyFrame(Centered, 50, 10000);
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
