unit UMain;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
    FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
    FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
    FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons;

type
    TFMain = class(TForm)
        Image1: TImage;
        Button1: TButton;
        Button2: TButton;
        Button3: TButton;
        Button4: TButton;
        Edit1: TEdit;
        FDC: TFDConnection;
        Query1: TFDQuery;
    Button5: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
        procedure Button1Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);
        procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    FMain: TFMain;

implementation

{$R *.dfm}

uses UGraph;
 var
 NA: array[1..20] of TFGraph;
 fn,i:integer;
{
  https://skachivaem.ru/articles/50-delphi/217--delphi.html
  procedure DrawGraph (f: TFunc; a: real; b: real; C: TCanvas);
  ��������� �������. ���������: f � �������, ������, ������� ����� ������.
  a � ��������� �������� ���������� �x�. b � �������� �������� ���������� �x�.
  C � �����, �� ������� ����� ��������.
  ����� �������������� - 1 ������ � ������� 8 ����� ��� 1 �������� 3 ������� - 1400000
  3 ������� ����������� ��� ������
  � ������ ����� ������� �� ����� ������ 2-3-4 ������� ������ ����� ���� ������

}
Type
    TFunc = function(x: real): real;

function getsecs: longint;
Var
    SystemTime: TSystemTime;
begin
    GetLocalTime(SystemTime);
    getsecs := SystemTime.wSecond + SystemTime.wMinute * 60 + SystemTime.wHour
      * 60 * 60;
end;

Procedure DrawGraphAllQ(Q: TFDQuery; F: string; C: TCanvas);
var
    x, y, cx, cy, px, py: integer;
    y0, x0, stepx, stepy: integer;
    v: real;
begin
    Q.First;

    stepx:=10;
    stepy:=round(C.ClipRect.Bottom/100);

    x0:=0;
    y0:=C.ClipRect.Bottom;

    px:=0;
    py:=y0;

    C.Brush.Color := clBlack;
    C.FillRect(Rect(0, 0, C.ClipRect.Right, C.ClipRect.Bottom));
    C.Pen.Color := clYellow;
    C.MoveTo(px, py);

    while not Q.Eof do
    begin

        cx:= (Q.FieldByName('sec').Asinteger-28800)*stepx;
        v := Q.FieldByName(F).AsFloat;
        cy := round(v*stepy);


        C.LineTo(cx, y0-cy);


        //px:=cx;
        //py:=cy;
        Q.Next;
    end;

end;

procedure DrawGraph(F: TFunc; a: real; b: real; C: TCanvas);
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
    max := F(x);
    min := max;
    while x <= b do
    begin
        y := F(x);
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
    y := F(x);
    C.Pen.Color := clWhite;
    C.MoveTo(xmid + round(sx * x), ymid - round(sy * y));
    while x <= b do
    begin
        y := F(x);
        C.LineTo(xmid + round(sx * x), ymid - round(sy * y));
        x := x + h;
    end;
end;

Function F(x: real): real;
Begin
    Result := sin(x);
End;

procedure TFMain.BitBtn1Click(Sender: TObject);

 begin
  fn:=5;
  for I := 1 to 5 do
   begin
    NA[i] := TFGraph.Create(FGraph);
    NA[i].Parent := nil;
    NA[i].Left:=i*50;
    NA[i].sname:='GR '+Inttostr(i);
    NA[i].Caption:='GRAPH '+Inttostr(i);
    NA[i].Show;
   end;

 //FGraph.Show;
end;

procedure TFMain.BitBtn2Click(Sender: TObject);
begin
  fn:=5;
  for I := 1 to 5 do
   begin
    if (NA[i]<>nil) then NA[i].Free;
   end;
end;

procedure TFMain.Button1Click(Sender: TObject);
begin
    DrawGraph(F, -10, 10, Image1.Canvas);
end;

procedure TFMain.Button2Click(Sender: TObject);
begin
    Edit1.Text := inttostr(getsecs);
end;

function mfunc(t: longint): real;
begin
    mfunc := random * 100;
end;

procedure TFMain.Button3Click(Sender: TObject);
var
    i: longint;
begin
    Randomize;
    {
      Query1.SQL.Clear;
      Query1.SQL.add('PRAGMA journal_mode = OFF');
      Query1.ExecSQL; }
    Query1.SQL.Clear;
    Query1.SQL.add('delete from tim where 1=1');
    Query1.ExecSQL;
    Query1.SQL.Clear;
    Query1.SQL.add('VACUUM;');
    Query1.ExecSQL;
    Query1.SQL.Clear;
    Query1.SQL.add('PRAGMA synchronous = OFF');
    Query1.ExecSQL;
    Query1.SQL.Clear;
    Query1.SQL.add('PRAGMA temp_store = MEMORY');
    Query1.ExecSQL;
    Query1.SQL.Clear;
    Query1.SQL.add('INSERT INTO tim ( sec, val, val2, val3 )');
    Query1.SQL.add(' VALUES ( :sec,:val, :val2, :val3)');

    for i := 28800 to 57600 do
    begin
        Query1.ParamByName('sec').AsInteger := i; // getsecs;
        Query1.ParamByName('val').AsFloat := mfunc(0);
        Query1.ParamByName('val2').AsFloat := mfunc(0);
        Query1.ParamByName('val3').AsFloat := mfunc(0);
        Query1.ExecSQL;
        Edit1.Text := inttostr(i);
        Application.ProcessMessages;
    end;
    Query1.SQL.Clear;
    Query1.SQL.add('PRAGMA journal_mode = WAL');
    Query1.ExecSQL;
    ShowMessage('Done');
end;

procedure TFMain.Button4Click(Sender: TObject);
begin
    Query1.SQL.Clear;
    Query1.SQL.add('select * from tim where 1=1 limit 10');
    Query1.Open;

DrawGraphAllQ(Query1, 'val', Image1.Canvas);

end;

procedure TFMain.Button5Click(Sender: TObject);
begin
FMain.RePaint;

image1.Picture.Graphic.Width:=FMain.Width-8;
//  image1.Picture.Graphic.Height:=300;
Image1.Repaint;
Button4.Click;
Image1.Repaint;
end;

procedure TFMain.FormResize(Sender: TObject);
begin
image1.Picture.Graphic.Width:=FMain.Width-8;
image1.Picture.Graphic.Height:=FMain.Height-300;
Button4.Click;
Image1.Repaint;
end;

end.
