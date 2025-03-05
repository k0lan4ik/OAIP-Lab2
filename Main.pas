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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

const
  First: TBodyPRow = ((200, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Second: TBodyPRow = ((300, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, -1), (0, -1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Secon: TBodyPRow = ((300, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 0), (1, 0), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Tri: TBodyPRow = ((300, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));

var
  Characer: TCharacter;
  bg: TBackGround;
  Start: Cardinal;

procedure TForm2.OnCreate(Sender: TObject);

begin
  Start := GetTickCount;

  bg := TBackGround.Create(Form2.Canvas);
  bg.AddKeyFrame([TRectangle.Create(0, 200, 500, 490, clBlack, clLime),
    TRectangle.Create(70, 230, 200, 490, clBlack, clMaroon),
    TRectangle.Create(300, 250, 450, 400, clBlack, clAqua)], [],
    [TLine.Create(0, 200, 250, 50, clBlack, clLime), TLine.Create(250, 50, 500,
    200, clBlack, clLime)], 0);
  bg.AddKeyFrame([TRectangle.Create(0, 200, 500, 490, clBlack, clRed),
    TRectangle.Create(70, 230, 200, 490, clBlack, clMaroon),
    TRectangle.Create(300, 250, 450, 400, clBlack, clAqua)], [],
    [TLine.Create(0, 200, 250, 50, clBlack, clLime), TLine.Create(250, 50, 500,
    200, clBlack, clLime)], 3000);
  bg.AddKeyFrame([TRectangle.Create(0, 200, 500, 490, clBlack, clTeal),
    TRectangle.Create(70, 230, 200, 490, clBlack, clMaroon),
    TRectangle.Create(300, 250, 450, 400, clBlack, clAqua)], [],
    [TLine.Create(0, 200, 250, 50, clBlack, clLime), TLine.Create(250, 50, 500,
    200, clBlack, clLime)], 5000);
  Characer := TCharacter.Create(Form2.Canvas);
  Characer.AddKeyFrame(First, 50, 0);
  Characer.AddKeyFrame(Secon, 50, 1000);
  Characer.AddKeyFrame(Second, 50, 2000);
  Characer.AddKeyFrame(Secon, 50, 3000);
  Characer.AddKeyFrame(Second, 50, 4000);
  Characer.AddKeyFrame(Secon, 50, 5000);
  Characer.AddKeyFrame(Second, 50, 6000);
  Characer.AddKeyFrame(Secon, 50, 7000);
  Characer.AddKeyFrame(Second, 50, 8000);
  Characer.AddKeyFrame(Secon, 50, 9000);
end;

procedure TForm2.OnPaint(Sender: TObject);
var
  CurTime: Cardinal;
begin
  CurTime := GetTickCount - Start;
  bg.Paint(CurTime);
  Characer.Paint(CurTime);
  if CurTime < 9000 then
    Form2.Invalidate;
end;

end.
