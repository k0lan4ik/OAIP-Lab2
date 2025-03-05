unit CharacterController;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TBodyPart = record
    Local: TPoint;
    IsHead: Boolean;
    IsFoot: Boolean;
    Linked: array of TBodyPart; // ��������� + ��� ������
  end;

  TChrKeyFrame = record
    Body: TBodyPart;
    Len: Integer;
    Time: Cardinal;
  end;

  TBodyPRow = array [1 .. 14, 1 .. 2] of Integer;

  TCharacter = class
  public
    KeyFrames: array of TChrKeyFrame;
    Canvas: TCanvas;
    constructor Create(const Canvas: TCanvas);
    procedure Paint(const CurrentTime: Cardinal);

    procedure AddKeyFrame(const Parts: TBodyPRow; const Len: Integer;
      const Time: Cardinal);
  private
    procedure Draw(const left, right: TBodyPart;const LeftT, RightT, CurT: Cardinal;
 const CurAbs: TPoint;const Len: Integer);
    function CalculateEndPoint(Length: Integer; const Target: TPoint): TPoint;
  end;

implementation

constructor TCharacter.Create(const Canvas: TCanvas);
begin
  self.Canvas := Canvas;
  self.Canvas.Pen.Width := 3;
  self.Canvas.Pen.Color := clBlack;
  self.Canvas.Brush.Color := clWhite;
  // SetLength(self.KeyFrames, 1);
end;

function Lerp(StartPoint, EndPoint: TPoint;
  Start, Time, Ending: Cardinal): TPoint;
var
  delTime: Double;
begin
  delTime := (Time - Start) / (Ending - Start + 1);
  Result.X := Round(StartPoint.X + (EndPoint.X - StartPoint.X) * delTime);
  Result.Y := Round(StartPoint.Y + (EndPoint.Y - StartPoint.Y) * delTime);
end;

procedure TCharacter.AddKeyFrame(const Parts: TBodyPRow; const Len: Integer;
  const Time: Cardinal);
begin
  SetLength(self.KeyFrames, Length(self.KeyFrames) + 1);
  self.KeyFrames[High(self.KeyFrames)].Time := Time;
  self.KeyFrames[High(self.KeyFrames)].Len := Len;
  self.KeyFrames[High(self.KeyFrames)].Body.Local :=
    Point(Parts[1, 1], Parts[1, 2]);
  SetLength(self.KeyFrames[High(self.KeyFrames)].Body.Linked, 3);
  with self.KeyFrames[High(self.KeyFrames)].Body do
  begin
    with Linked[0] do
    begin
      Local := CalculateEndPoint(Len,
        Point(Parts[2, 1], Parts[2, 2]));
      SetLength(Linked, 1);
      with Linked[0] do
      begin

        SetLength(Linked, 1);
        Linked[0].Local := CalculateEndPoint(Len,
          Point(Parts[3, 1], Parts[3, 2]));
        with Linked[0] do
        begin
          SetLength(Linked, 3);


          Linked[0].Local := CalculateEndPoint(Trunc(Len * 0.75),
            Point(Parts[4, 1], Parts[4, 2]));

          Linked[0].Local := CalculateEndPoint(Trunc(Len * 0.75),
            Point(Parts[4, 1], Parts[4, 2]));

          Linked[0].Local := CalculateEndPoint(Trunc(Len * 0.75),
            Point(Parts[4, 1], Parts[4, 2]));
          Linked[0].IsHead := true;

          Linked[1].Local := CalculateEndPoint(Len,
            Point(Parts[5, 1], Parts[5, 2]));
          with Linked[1] do
          begin
            SetLength(Linked, 1);
            Linked[0].Local := CalculateEndPoint(Len,
              Point(Parts[6, 1], Parts[6, 2]));
          end;

          Linked[2].Local := CalculateEndPoint(Len,
            Point(Parts[7, 1], Parts[7, 2]));
          with Linked[2] do
          begin
            SetLength(Linked, 1);
            Linked[0].Local := CalculateEndPoint(Len,
              Point(Parts[8, 1], Parts[8, 2]));
          end;
        end;
      end;
    end;

    Linked[1].Local := CalculateEndPoint(Len, Point(Parts[9, 1], Parts[9, 2]));
    with Linked[1] do
    begin
      SetLength(Linked, 1);
      Linked[0].Local := CalculateEndPoint(Len,
        Point(Parts[10, 1], Parts[10, 2]));
      with Linked[0] do
      begin
        SetLength(Linked, 1);
        Linked[0].IsFoot := true;
        Linked[0].Local := CalculateEndPoint(Trunc(Len * 0.5),
          Point(Parts[11, 1], Parts[11, 2]));
      end;
    end;

    Linked[2].Local := CalculateEndPoint(Len,
      Point(Parts[12, 1], Parts[12, 2]));
    with Linked[2] do
    begin
      SetLength(Linked, 1);
      Linked[0].Local := CalculateEndPoint(Len,
        Point(Parts[13, 1], Parts[13, 2]));
      with Linked[0] do
      begin
        SetLength(Linked, 1);
        Linked[0].IsFoot := true;
        Linked[0].Local := CalculateEndPoint(Trunc(Len * 0.5),
          Point(Parts[14, 1], Parts[14, 2]));
      end;
    end;
  end;

end;

procedure TCharacter.Paint(const CurrentTime: Cardinal);
var
  left, right, mid: Integer;
begin

  left := Low(self.KeyFrames) - 1;
  right := High(self.KeyFrames) + 1;
  while (left + 1 < right) do

  begin
    mid := (left + right) div 2;
    if self.KeyFrames[mid].Time <= CurrentTime then
      left := mid
    else
      right := mid;
  end;
  if right > High(self.KeyFrames) then
     right := left;
     
  Draw(self.KeyFrames[left].Body, self.KeyFrames[right].Body,
    self.KeyFrames[left].Time, self.KeyFrames[right].Time, CurrentTime,
    Lerp(self.KeyFrames[left].Body.Local, self.KeyFrames[right].Body.Local,
    self.KeyFrames[left].Time,CurrentTime, self.KeyFrames[right].Time), self.KeyFrames[left].Len);
end;

function TCharacter.CalculateEndPoint(Length: Integer;
  const Target: TPoint): TPoint;
var
  deltaX, deltaY, D, normX, normY: Double;
begin
  deltaX := Target.X;
  deltaY := Target.Y;

  D := Sqrt(deltaX * deltaX + deltaY * deltaY);

  if D > 0 then
  begin
    normX := deltaX / D;
    normY := deltaY / D;
  end
  else
  begin
    normX := 0;
    normY := 0;
  end;

  deltaX := Length * normX;
  deltaY := Length * normY;

  Result := Point(Round(deltaX), Round(deltaY));
end;

procedure TCharacter.Draw(const left, right: TBodyPart;const LeftT, RightT, CurT: Cardinal;
 const CurAbs: TPoint;const Len: Integer);
var
  i, R: Integer;
  NextAbsolute, BodyPart: TPoint;
begin



  for i := 0 to High(left.Linked) do
  begin
    BodyPart := self.CalculateEndPoint(Len, Lerp(left.Linked[i].Local, right.Linked[i].Local, LeftT,
      CurT, RightT));
    if left.Linked[i].IsHead then
    begin
      R := Round(Sqrt(Sqr(BodyPart.X) + Sqr(BodyPart.Y))) * 3 div 4;
      self.Canvas.Ellipse(CurAbs.X + BodyPart.X * 3 div 4  - R,
        CurAbs.Y + BodyPart.Y * 3 div 4 + R, CurAbs.X + BodyPart.X * 3 div 4  + R,
        CurAbs.Y + BodyPart.Y * 3 div 4  - R);
    end
    else
    begin
      self.Canvas.MoveTo(CurAbs.X, CurAbs.Y);
      if left.Linked[i].IsFoot then
        self.Canvas.LineTo(CurAbs.X + BodyPart.X div 2,
        CurAbs.Y  + BodyPart.Y div 2)
      else
        self.Canvas.LineTo(CurAbs.X + BodyPart.X,
        CurAbs.Y + BodyPart.Y);
    end;
      NextAbsolute := Point(CurAbs.X + BodyPart.X, CurAbs.Y + BodyPart.Y);
    Draw(left.Linked[i], right.Linked[i], LeftT, RightT, CurT, NextAbsolute, Len);
  end;
end;
end.
