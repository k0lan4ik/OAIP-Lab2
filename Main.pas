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
    PaintArea: TPaintBox;
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

const
  First: TBodyPRow = ((200, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Second: TBodyPRow = ((320, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (3, -1), (0, -1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Secon: TBodyPRow = ((320, 400), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
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

begin
  Driver := TDrawer.Create(GetTickCount, 12000);
  bg := TBackGround.Create();
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
    200, clBlack, clLime)], 14000);
  Characer := TCharacter.Create();
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
  Characer.AddKeyFrame(Tri, 50, 10000);
  Characer.AddKeyFrame(chetiri, 100, 12001);
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
