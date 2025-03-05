unit KeyFrameControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CharacterController, Vcl.ExtCtrls;
type
  TKeyFrame = record
    Body: TBodyPart;
    Time: Cardinal;
  end;

implementation
var Start:Cardinal;

function Lerp(StartPoint, EndPoint: TPoint;Start, Time, Ending: Cardinal): TPoint;
var
  delTime: Double;
begin
  delTime := (Time - Start) / (Ending - Start);
  Result.X := Round(StartPoint.X + (EndPoint.X - StartPoint.X) * delTime);
  Result.Y := Round(StartPoint.Y + (EndPoint.Y - StartPoint.Y) * delTime);
end;
end.
