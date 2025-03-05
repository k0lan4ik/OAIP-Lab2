unit EventController;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TDrawObject = class
    // procedure (); virtual; abstract;
  public
    procedure Paint(const CurrentTime: Cardinal); virtual; abstract;
    procedure AddKeyFrame(); virtual; abstract;
  end;

  TDrawer = class
  public
    DrawObjects: array of TDrawObject;
    StartTime: Cardinal;
    constructor Create(Time: Cardinal);
    procedure DrawFrame();
  end;

implementation

uses CharacterController;

const
  First: TBodyPRow = ((200, 200), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Second: TBodyPRow = ((300, 200), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, -1), (0, -1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Secon: TBodyPRow = ((300, 200), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 0), (1, 0), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));
  Tri: TBodyPRow = ((300, 200), (0, -1), (0, -1), (0, -1), (-1, 1), (0, 1),
    (1, 1), (0, 1), (-1, 1), (0, 1), (-1, 0), (1, 1), (0, 1), (1, 0));

constructor TDrawer.Create(Time: Cardinal);
begin
  self.StartTime := Time;

end;



procedure TDrawer.DrawFrame();
begin

end;

end.
