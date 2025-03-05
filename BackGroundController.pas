unit BackGroundController;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EventController;

type

  TFigure = class
  public
    Xpoint1: integer;
    Ypoint1: integer;
    Xpoint2: integer;
    Ypoint2: integer;
    PColor: TColor;
    BColor: TColor;
    constructor Create(x1, y1, x2, y2: integer; c1, c2: TColor);
  private
  end;

  TRectangle = class(TFigure)
  public
    procedure Draw(Canvas: TCanvas);
  private
  end;

  TEllipse = class(TFigure)
  public
    procedure Draw(Canvas: TCanvas);
  private
  end;

  TLine = class(TFigure)
  public
    procedure Draw(Canvas: TCanvas);
  private
  end;

  TMasRectangle = array of TRectangle;
  TMasLine = array of TLine;
  TMasEllipse = array of TEllipse;

  TBcgKeyFrameInf = record
    Rectangles: TMasRectangle;
    Ellipses: TMasEllipse;
    Lines: TMasLine;
    Time: Cardinal;
  end;

  TBcgKeyFrameAdr = ^TBcgKeyFrame;

  TBcgKeyFrame = record
    Inf: TBcgKeyFrameInf;
    Adr: TBcgKeyFrameAdr;
  end;

  TBackGround = class(TDrawObject)
  public
    BcgFrames: TBcgKeyFrameAdr;
    Canvas: TCanvas;
    constructor Create(Canvas: TCanvas);
    procedure Paint(const CurrentTime: Cardinal); override;
    procedure AddKeyFrame(const rec: array of TRectangle;
  ell: array of TEllipse; line: array of TLine; const Time: Cardinal);
  private
  end;

implementation

constructor TFigure.Create(x1, y1, x2, y2: integer; c1, c2: TColor);
begin
  Xpoint1 := x1;
  Ypoint1 := y1;
  Xpoint2 := x2;
  Ypoint2 := y2;
  PColor := c1;
  BColor := c2;
end;

procedure TRectangle.Draw(Canvas: TCanvas);
begin
  Canvas.Pen.Color := PColor;
  Canvas.Pen.Width := 5;
  Canvas.Brush.Color := BColor;
  Canvas.Rectangle(Xpoint1, Ypoint1, Xpoint2, Ypoint2);
end;

procedure TEllipse.Draw;
begin
  Canvas.Pen.Color := PColor;
  Canvas.Pen.Width := 5;
  Canvas.Brush.Color := BColor;
  Canvas.Ellipse(Xpoint1, Ypoint1, Xpoint2, Ypoint2);
end;

procedure TLine.Draw;
begin
  Canvas.Pen.Color := PColor;
  Canvas.Pen.Width := 5;
  Canvas.Brush.Color := BColor;
  Canvas.MoveTo(Xpoint1, Ypoint1);
  Canvas.LineTo(Xpoint2, Ypoint2);
end;

procedure TBackGround.AddKeyFrame(const rec: array of TRectangle;
  ell: array of TEllipse; line: array of TLine; const Time: Cardinal);
var
  temp: TBcgKeyFrameAdr;
  i: integer;
begin
  temp := self.BcgFrames;
  while temp^.Adr <> nil do
  begin
    temp := temp^.Adr;
  end;
  New(temp^.Adr);
  temp := temp^.Adr;
  with temp^ do
  begin
    Adr := nil;
    Inf.Time := Time;
    SetLength(Inf.Rectangles, Length(rec));
    for i := Low(rec) to High(rec) do
      Inf.Rectangles[i] := rec[i];

    SetLength(Inf.Ellipses, Length(ell));
    for i := Low(ell) to High(ell) do
      Inf.Ellipses[i] := ell[i];

    SetLength(Inf.Lines, Length(line));
    for i := Low(line) to High(line) do
      Inf.Lines[i] := line[i];
  end;
end;

constructor TBackGround.Create(Canvas: TCanvas);
begin
  self.Canvas := Canvas;
  New(self.BcgFrames);
  self.BcgFrames^.Adr := nil;
end;

procedure TBackGround.Paint(const CurrentTime: Cardinal);
var
  left, right, mid: TBcgKeyFrameAdr;
  Steps: integer;
begin

  left := self.BcgFrames;
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
  if right = nil then
    right := left;
  with left.Inf do
  begin
    for Steps := Low(Rectangles) to High(Rectangles) do
    begin
      Rectangles[Steps].Draw(self.Canvas);
    end;
    for Steps := Low(Ellipses) to High(Ellipses) do
    begin
      Ellipses[Steps].Draw(self.Canvas);
    end;
    for Steps := Low(Lines) to High(Lines) do
    begin
      Lines[Steps].Draw(self.Canvas);
    end;
  end;
end;

end.
