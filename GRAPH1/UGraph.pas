unit UGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, inifiles, Vcl.StdCtrls;

type
  TFGraph = class(TForm)
    Button1: TButton;
    procedure FormHide(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    sname: string;
    eid: string;
    num: integer;
  end;

var
  FGraph: TFGraph;

implementation

{$R *.dfm}

procedure TFGraph.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini: tinifile;
  l, t, w, h: integer;
begin
  ini := tinifile.Create(Extractfilepath(Application.ExeName) + 'GRAPHS.INI');
  l := Left;
  ini.WriteInteger('FORM' + Inttostr(num), 'LEFT', l);
  t := Top;
  ini.WriteInteger('FORM' + Inttostr(num), 'TOP', t);
  w := Width;
  ini.WriteInteger('FORM' + Inttostr(num), 'WIDTH', w);
  h := Height;
  ini.WriteInteger('FORM' + Inttostr(num), 'HEIGHT', h);
  ini.WriteString('FORM' + Inttostr(num), 'NAME', sname);
  ini.WriteString('FORM' + Inttostr(num), 'EId', eid);

  ini.Free;
end;

procedure TFGraph.FormHide(Sender: TObject);
var
  ini: tinifile;
  l, t, w, h: integer;
begin
  ini := tinifile.Create(Extractfilepath(Application.ExeName) + 'GRAPHS.INI');
  l := Left;
  ini.WriteInteger('FORM' + Inttostr(num), 'LEFT', l);
  t := Top;
  ini.WriteInteger('FORM' + Inttostr(num), 'TOP', t);
  w := Width;
  ini.WriteInteger('FORM' + Inttostr(num), 'WIDTH', w);
  h := Height;
  ini.WriteInteger('FORM' + Inttostr(num), 'HEIGHT', h);
  ini.WriteString('FORM' + Inttostr(num), 'NAME', sname);
  ini.WriteString('FORM' + Inttostr(num), 'EId', eid);
  ini.Free;
end;

procedure TFGraph.FormPaint(Sender: TObject);
begin
  // ��� ���� ���������� ����������� �����������
  {
    ������ �������������� ������ Draw ����� ����� ��� ����� �����������
    CopyRect: procedure CopyRect(Dest: TRect; Canvas: TCanvas; Source: TRect);
    ����� �������� ��������� ���������� Source ������� ����������� � �����
    ��������� ����������� Canvas � ��������� ���������� Dest ������� ������ �����.
    ��� TRect, ��������������� ������������� ������� Source � Dest,
    ��� ���������� � ������� 3.2. ��������, ��������
    Canvas.CopyRect(MyRect2, Bitmap.Canvas, MyRect1);
    �������� �� ����� ����� � ������� MyRect2 ����������� �� ������� MyRect1 ����� ���������� Bitmap.

    ��������: http://beluch.ru/progr/100comp/4_2.htm
  }
end;

end.
