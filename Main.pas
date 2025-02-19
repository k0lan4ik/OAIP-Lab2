unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CharacterController;

type
  TForm2 = class(TForm)
    procedure OnPaint(Sender: TObject);
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

procedure TForm2.OnPaint(Sender: TObject);
begin
  Characer := TCharacter.Create(100,100,Form2.Canvas);
end;

end.
