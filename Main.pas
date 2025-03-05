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
const
  First:TBodyPRow = ((200,200),(0,-1),(0,-1),(0,-1),(-1,1),(0,1),(1,1),(0,1),(-1,1),(0,1),(-1,0),(1,1),(0,1),(1,0));
  Second:TBodyPRow = ((300,200),(0,-1),(0,-1),(0,-1),(-1,1),(0,1),(1,-1),(0,-1),(-1,1),(0,1),(-1,0),(1,1),(0,1),(1,0));
  Secon:TBodyPRow = ((300,200),(0,-1),(0,-1),(0,-1),(-1,1),(0,1),(1,0),(1,0),(-1,1),(0,1),(-1,0),(1,1),(0,1),(1,0));
  Tri:TBodyPRow = ((300,200),(0,-1),(0,-1),(0,-1),(-1,1),(0,1),(1,1),(0,1),(-1,1),(0,1),(-1,0),(1,1),(0,1),(1,0));


var
  Characer: TCharacter;
  Timer, Start: Cardinal;
  Scale :Real;

procedure TForm2.OnCreate(Sender: TObject);
begin

  Start := GetTickCount;
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
begin

  Characer.Paint(GetTickCount - Start);
  if GetTickCount - Start < 9000 then
    Form2.Invalidate;
end;

end.
