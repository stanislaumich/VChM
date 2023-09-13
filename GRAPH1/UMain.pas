unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFMain = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

Type TFunc = function (x: real): real;
procedure DrawGraph (f: TFunc; a: real; b: real; C: TCanvas);
var x, y, h: real;
max, min: real;
sx, sy: real;
xmid, ymid: integer;
begin
sx := (c.ClipRect.Right)/(b-a);
h := 1/sx;
xmid := c.ClipRect.Right div 2;
ymid := c.ClipRect.Bottom div 2;
x := a;
max := f( x);
min := max;
while x<=b do
begin
y := f( x);
if y<min then min := y;
if y>max then max := y;
x := x + h;
end;
sy := c.ClipRect.Bottom/ (max-min);
c.Brush.Color := clBlack;
c.FillRect(Rect(0, 0, c.ClipRect.Right, c.ClipRect.Bottom));
c.Pen.Color := clYellow;
c.MoveTo(0, ymid);
c.LineTo(c.ClipRect.Right, ymid);
c.MoveTo(xmid, 0);
c.LineTo(xmid, c.ClipRect.Bottom);
x := a;
y := f(x);
c.Pen.Color := clWhite;
c.MoveTo(xmid+round(sx*x), ymid-round(sy*y));
while x<=b do
begin
y := f(x);
c.LineTo(xmid+round(sx*x), ymid-round(sy*y));
x := x + h;
end;
end;

Function f(x: real): real;
Begin
Result := sin(x)*cos(x);
End;



procedure TFMain.Button1Click(Sender: TObject);
begin
DrawGraph (f, -10, 10, Image1.Canvas);
end;

end.
