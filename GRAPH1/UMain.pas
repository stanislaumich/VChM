unit UMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
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

{
  https://skachivaem.ru/articles/50-delphi/217--delphi.html
  procedure DrawGraph (f: TFunc; a: real; b: real; C: TCanvas);
  ��������� �������. ���������: f � �������, ������, ������� ����� ������.
  a � ��������� �������� ���������� �x�. b � �������� �������� ���������� �x�.
  C � �����, �� ������� ����� ��������.


}
Type
    TFunc = function(x: real): real;

procedure DrawGraph(f: TFunc; a: real; b: real; C: TCanvas);
var
    x, y, h: real;
    max, min: real;
    sx, sy: real;
    xmid, ymid: integer;
begin
    sx := (C.ClipRect.Right) / (b - a);
    h := 1 / sx;
    xmid := C.ClipRect.Right div 2;
    ymid := C.ClipRect.Bottom div 2;
    x := a;
    max := f(x);
    min := max;
    while x <= b do
    begin
        y := f(x);
        if y < min then
            min := y;
        if y > max then
            max := y;
        x := x + h;
    end;
    sy := C.ClipRect.Bottom / (max - min);
    C.Brush.Color := clBlack;
    C.FillRect(Rect(0, 0, C.ClipRect.Right, C.ClipRect.Bottom));
    C.Pen.Color := clYellow;
    C.MoveTo(0, ymid);
    C.LineTo(C.ClipRect.Right, ymid);
    C.MoveTo(xmid, 0);
    C.LineTo(xmid, C.ClipRect.Bottom);
    x := a;
    y := f(x);
    C.Pen.Color := clWhite;
    C.MoveTo(xmid + round(sx * x), ymid - round(sy * y));
    while x <= b do
    begin
        y := f(x);
        C.LineTo(xmid + round(sx * x), ymid - round(sy * y));
        x := x + h;
    end;
end;

Function f(x: real): real;
Begin
    Result := sin(x) * cos(x);
End;

procedure TFMain.Button1Click(Sender: TObject);
begin
    DrawGraph(f, -10, 10, Image1.Canvas);
end;

end.
