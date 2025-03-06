unit CharacterController;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, EventController,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TBodyPart = record
    Local: TPoint;
    IsHead: Boolean;
    IsFoot: Boolean;
    Linked: array of TBodyPart; // указатель + кол частей
  end;

  TChrKeyFrameInf = record
    Body: TBodyPart;
    Len: Integer;
    Time: Cardinal;
  end;

  TChrKeyFrameAdr = ^TChrKeyFrame;

  TChrKeyFrame = record
    Inf: TChrKeyFrameInf;
    Adr: TChrKeyFrameAdr;
  end;

  TBodyPRow = array [1 .. 14, 1 .. 2] of Integer;

  TCharacter = class(TDrawObject)
  public
    KeyFrames: TChrKeyFrameAdr;
    EndFrame: TChrKeyFrameAdr;
    constructor Create();
    procedure Paint(const CurrentTime: Cardinal; Canvas: TCanvas); override;

    procedure AddKeyFrame(const Parts: TBodyPRow; const Len: Integer;
      const Time: Cardinal);
    procedure AddLoopFrame(Parts: array of TBodyPRow;
      const Lens: array of Integer; const delTimes: array of Cardinal;
       StartTime: Cardinal;const Count: Integer);
    destructor Destroy(); override;
  private
    procedure FreeFrame(FrameForFree: TChrKeyFrameAdr);
    procedure Draw(const left, right: TBodyPart;
      const LeftT, RightT, CurT: Cardinal; const CurAbs: TPoint;
      const LLen, RLen: Integer; Canvas: TCanvas);
    function CalculateEndPoint(Length: Integer; const Target: TPoint): TPoint;
  end;

implementation

constructor TCharacter.Create();
begin
  New(self.KeyFrames);
  self.KeyFrames^.Adr := nil;
  self.EndFrame := self.KeyFrames;
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

procedure TCharacter.AddLoopFrame(Parts: array of TBodyPRow;
  const Lens: array of Integer; const delTimes: array of Cardinal;
  StartTime: Cardinal;const Count: Integer);
var
  i, j: Integer;
  del: TPoint;
begin
  del := Point(Parts[High(Parts)][1][1] - Parts[Low(Parts)][1][1], Parts[High(Parts)][1][2] - Parts[Low(Parts)][1][2]);
  for i := 1 to Count do
  begin
     j := Low(Parts);
     While j <= High(Parts) do
     begin
      self.AddKeyFrame(Parts[j],Lens[j],delTimes[j]+StartTime);
      Inc(Parts[j][1][1],del.X);
      Inc(Parts[j][1][2],del.Y);
      Inc(j);
     end;
     Dec(j);
     StartTime := StartTime + delTimes[j];
  end;
end;

procedure TCharacter.AddKeyFrame(const Parts: TBodyPRow; const Len: Integer;
  const Time: Cardinal);
begin
  New(self.EndFrame^.Adr);
  self.EndFrame := self.EndFrame.Adr;
  self.EndFrame^.Adr := nil;
  with self.EndFrame^ do
  begin;
    Inf.Time := Time;
    Inf.Len := Len;
    Inf.Body.Local := Point(Parts[1, 1], Parts[1, 2]);
    SetLength(Inf.Body.Linked, 3);
    with Inf.Body do
    begin
      with Linked[0] do
      begin
        Local := CalculateEndPoint(Len, Point(Parts[2, 1], Parts[2, 2]));
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

      Linked[1].Local := CalculateEndPoint(Len,
        Point(Parts[9, 1], Parts[9, 2]));
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
end;

procedure TCharacter.Paint(const CurrentTime: Cardinal; Canvas: TCanvas);
var
  left, right, mid: TChrKeyFrameAdr;
  Steps: Integer;
begin
  Canvas.Pen.Width := 5;
  Canvas.Pen.Color := clBlack;
  Canvas.Brush.Color := clWhite;
  left := KeyFrames;
  right := nil;
  mid := left;
  Steps := 0;
  while mid <> right do
  begin
    mid := mid^.Adr;
    Inc(Steps);
  end;
  while (left^.Adr <> right) do
  begin
    mid := left;
    for Steps := 1 to Steps div 2 do
      mid := mid^.Adr;
    if mid^.Inf.Time <= CurrentTime then
      left := mid
    else
      right := mid;
  end;
  if right <> nil then
    Draw(left.Inf.Body, right.Inf.Body, left.Inf.Time, right.Inf.Time,
      CurrentTime, Lerp(left.Inf.Body.Local, right.Inf.Body.Local,
      left.Inf.Time, CurrentTime, right.Inf.Time), left.Inf.Len,
      right.Inf.Len, Canvas);
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

procedure TCharacter.Draw(const left, right: TBodyPart;
  const LeftT, RightT, CurT: Cardinal; const CurAbs: TPoint;
  const LLen, RLen: Integer; Canvas: TCanvas);
var
  i, R, Len: Integer;
  NextAbsolute, BodyPart: TPoint;
begin
  Len := Round(LLen + (RLen - LLen) * (CurT - LeftT) / (RightT - LeftT + 1));
  for i := 0 to High(left.Linked) do
  begin
    BodyPart := self.CalculateEndPoint(Len, Lerp(left.Linked[i].Local,
      right.Linked[i].Local, LeftT, CurT, RightT));
    if left.Linked[i].IsHead then
    begin
      R := Round(Sqrt(Sqr(BodyPart.X) + Sqr(BodyPart.Y))) * 3 div 4;
      Canvas.Ellipse(CurAbs.X + BodyPart.X * 3 div 4 - R,
        CurAbs.Y + BodyPart.Y * 3 div 4 + R, CurAbs.X + BodyPart.X * 3 div 4 +
        R, CurAbs.Y + BodyPart.Y * 3 div 4 - R);
    end
    else
    begin
      Canvas.MoveTo(CurAbs.X, CurAbs.Y);
      if left.Linked[i].IsFoot then
        Canvas.LineTo(CurAbs.X + BodyPart.X div 2, CurAbs.Y + BodyPart.Y div 2)
      else
        Canvas.LineTo(CurAbs.X + BodyPart.X, CurAbs.Y + BodyPart.Y);
    end;
    NextAbsolute := Point(CurAbs.X + BodyPart.X, CurAbs.Y + BodyPart.Y);
    Draw(left.Linked[i], right.Linked[i], LeftT, RightT, CurT, NextAbsolute,
      LLen, RLen, Canvas);
  end;
end;

procedure TCharacter.FreeFrame(FrameForFree: TChrKeyFrameAdr);
begin
  if FrameForFree^.Adr <> nil then
    FreeFrame(FrameForFree^.Adr);
  Dispose(FrameForFree);
end;

destructor TCharacter.Destroy();
begin
  FreeFrame(KeyFrames);
end;

end.
