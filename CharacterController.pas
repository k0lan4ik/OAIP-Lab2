unit CharacterController;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TBodyPart = (bpGroin = 1,  bpBreast, bpNeck, bpLfArm, bpLfPalm, bpRtArm, bpRtPalm,
   bpLfHip, bpLfShin, bpLfFoot, bpRtHip, bpRtShin, bpRtFoot, bpHead);
  TCharacter = class
    public
      Body: array [TBodyPart] of TPoint;
      Scale: Real;
      Canvas: TCanvas;
      constructor Create(const X,Y :Integer; Canvas: TCanvas);
      procedure Paint(colorPen, colorFill: TColor);
    private
  end;

implementation

  constructor TCharacter.Create(const X,Y :Integer; Canvas: TCanvas);
  begin
    self.Canvas := Canvas;
    self.Scale := 1;
    self.Body[bpGroin] := TPoint.Create(X,Y);
    self.Body[bpBreast] := TPoint.Create(0,-20);
    self.Body[bpNeck] := TPoint.Create(0,-40 );
    self.Body[bpLfArm] := TPoint.Create(-20,-20);
    self.Body[bpLfPalm] := TPoint.Create(-20,0);
    self.Body[bpRtArm] := TPoint.Create(20,-20);
    self.Body[bpRtPalm] := TPoint.Create(20,0);
    self.Body[bpLfHip] := TPoint.Create(-20,20);
    self.Body[bpLfShin] := TPoint.Create(-20,40);
    self.Body[bpLfFoot] := TPoint.Create(-40,40);
    self.Body[bpRtHip] := TPoint.Create(20,20);
    self.Body[bpRtShin] := TPoint.Create(20,40);
    self.Body[bpRtFoot] := TPoint.Create(40,40);
    self.Body[bpHead] := TPoint.Create(0,-60);
    self.Canvas.Pen.Width := 3;
    self.Paint(clBlack,clWhite);
  end;

  procedure TCharacter.Paint(colorPen, colorFill: TColor);
  var
    i: TBodyPart;
    R: Integer;
    groin: TPoint;
  begin
    groin := self.Body[bpGroin];
    with self.Canvas do
    begin

      Pen.Color := colorPen;
      Brush.Color := colorFill;
      MoveTo(groin.X,groin.Y);
      for i := bpBreast to bpLfPalm do
      begin
        LineTo(Round(self.Body[i].X * self.Scale) + groin.X, Round(self.Body[i].Y * self.Scale) + groin.Y);
      end;
      MoveTo(groin.X + Round(self.Body[bpNeck].X * self.Scale),groin.Y+ Round(self.Body[bpNeck].Y * self.Scale));
      for i := bpRtArm to bpRtPalm do
      begin
        LineTo(Round(self.Body[i].X * self.Scale) + groin.X, Round(self.Body[i].Y * self.Scale) + groin.Y);
      end;
      MoveTo(groin.X,groin.Y);
      for i := bpLfHip to bpLfFoot do
      begin
        LineTo(Round(self.Body[i].X * self.Scale) + groin.X, Round(self.Body[i].Y * self.Scale) + groin.Y);
      end;
      MoveTo(groin.X,groin.Y);
      for i := bpRtHip to bpRtFoot do
      begin
        LineTo(Round(self.Body[i].X * self.Scale) + groin.X, Round(self.Body[i].Y * self.Scale) + groin.Y);
      end;

      R := Round(self.Scale * sqrt(sqr(self.Body[bpNeck].X - self.Body[bpHead].X) + sqr(self.Body[bpNeck].Y - self.Body[bpHead].Y)));
      Ellipse(groin.X + Round(self.Body[bpHead].X * self.Scale) - R, groin.Y + Round(self.Body[bpHead].Y * self.Scale) + R,groin.X + Round(self.Body[bpHead].X * self.Scale) + R,groin.Y + Round(self.Body[bpHead].Y * self.Scale) - R);
    end;
  end;

end.
