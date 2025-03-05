unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CharacterController, Vcl.ExtCtrls, BackGroundController,
  Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
 {   procedure OnPaint(Sender: TObject);
    procedure OnCreate(Sender: TObject);
    procedure OnTimer(Sender: TObject);      }
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{var

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
  Character.Paint(Character.Body, Point(Test, 0));        //Тут должна быть нормальная смена кадров
  Inc(Test,10);
end;
}
var
  back1, back2:TBackGround;

procedure TForm2.Button1Click(Sender: TObject);
var
  rec1, rec2, rec3:TRectangle;
  ell1:TEllipse;
  line1:Tline;
begin
  rec1:=Trectangle.Create(100, 100, 400, 400, clblack, clgray, Form2.Canvas);
  rec2:=Trectangle.Create(220, 220, 280, 280, clblack, clblue, Form2.Canvas);
  back1:=Tbackground.Create([rec1, rec2], [], []);
  line1:=TLine.Create(600, 400, 600, 250, clOlive, clOlive, Form2.Canvas);
  rec3:=Trectangle.Create(525, 250, 675, 100, clblack, cllime, Form2.Canvas);
  ell1:=TEllipse.Create(700, 125, 750, 75, clblack, clyellow, Form2.Canvas);
  back2:=Tbackground.Create([rec3], [ell1], [line1]);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  back1.Draw;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  back2.Draw;
end;

end.
