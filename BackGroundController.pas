unit BackGroundController;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type

  TFigure = class
    public
    Xpoint1: integer;
    Ypoint1: integer;
    Xpoint2: integer;
    Ypoint2: integer;
    Canvas: TCanvas;
    PColor: TColor;
    BColor: TColor;
    constructor Create(x1, y1, x2, y2:integer; c1, c2:TColor; Canvas:Tcanvas);
    private
  end;

  TRectangle = class(TFigure)
  public
    procedure Draw;
  private
  end;

  TEllipse = class(TFigure)
  public
    procedure Draw;
  private
  end;

  TLine = class(TFigure)
  public
    procedure Draw;
  private
  end;

  TMasRectangle = array of TRectangle;
  TMasLine = array of Tline;
  TMasEllipse = array of TEllipse;

  TBackGround = class
  public
    Rectangles: TMasRectangle;
    Ellipses: TMasEllipse;
    Lines: TMasLine;
    constructor Create(rec:TMasRectangle; ell:TMasEllipse; line: TMasLine);
    procedure Draw;
  private
  end;

implementation
   constructor TFigure.Create(X1, Y1, X2, Y2:integer; c1, c2: TColor; Canvas:Tcanvas);
   begin
     Xpoint1:= X1;
     Ypoint1:= Y1;
     Xpoint2:= X2;
     Ypoint2:= Y2;
     Self.Canvas:=Canvas;
     PColor := c1;
     BColor := c2;
   end;

   procedure TRectangle.Draw;
   begin
     Canvas.Pen.Color:=PColor;
     Canvas.Pen.Width := 5;
     Canvas.Brush.Color:=BColor;
     Canvas.Rectangle(Xpoint1, Ypoint1, Xpoint2, Ypoint2);
   end;

   procedure TEllipse.Draw;
   begin
     Canvas.Pen.Color:=PColor;
     Canvas.Pen.Width := 5;
     Canvas.Brush.Color:=BColor;
     Canvas.Ellipse(Xpoint1, Ypoint1, Xpoint2, Ypoint2);
   end;

   procedure TLine.Draw;
   begin
     Canvas.Pen.Color:=PColor;
     Canvas.Pen.Width := 5;
     Canvas.Brush.Color:=BColor;
     Canvas.MoveTo(Xpoint1, Ypoint1);
     Canvas.LineTo(Xpoint2, Ypoint2);
   end;

   constructor TBackGround.Create(rec:TMasRectangle; ell:TMasEllipse; line: TMasLine);
   begin
    Rectangles:=rec;
    Ellipses:=ell;
    Lines:=line;
   end;

   procedure TBackGround.Draw;
   var
    i:integer;
   begin
    for i := Low(Rectangles) to High(Rectangles) do
      begin
        Rectangles[i].Draw;
      end;
    for i := Low(Ellipses) to High(Ellipses) do
      begin
        Ellipses[i].Draw;
      end;
    for i := Low(Lines) to High(Lines) do
      begin
        Lines[i].Draw;
      end;
   end;

end.
