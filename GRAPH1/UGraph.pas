unit UGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, inifiles, Vcl.StdCtrls;

type
  TFGraph = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    procedure FormHide(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    sname:string;
    num:integer;
  end;

var
  FGraph: TFGraph;

implementation

{$R *.dfm}

procedure TFGraph.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini:tinifile;
  l,t, w, h:integer;
begin
 ini:=tinifile.Create(Extractfilepath(Application.ExeName)+'GRAPHS.INI');
 l:= Left;
 ini.WriteInteger('FORM'+Inttostr(num),'LEFT', l);
 t:= Top;
 ini.WriteInteger('FORM'+Inttostr(num),'TOP', t);
 w:= Width;
 ini.WriteInteger('FORM'+Inttostr(num),'WIDTH', w);
 h:= Height;
 ini.WriteInteger('FORM'+Inttostr(num),'HEIGHT', h);
 ini.Free;
end;

procedure TFGraph.FormHide(Sender: TObject);
var
  ini:tinifile;
  l,t, w, h:integer;
begin
 ini:=tinifile.Create(Extractfilepath(Application.ExeName)+'GRAPHS.INI');
 l:= Left;
 ini.WriteInteger('FORM'+Inttostr(num),'LEFT', l);
 t:= Top;
 ini.WriteInteger('FORM'+Inttostr(num),'TOP', t);
 w:= Width;
 ini.WriteInteger('FORM'+Inttostr(num),'WIDTH', w);
 h:= Height;
 ini.WriteInteger('FORM'+Inttostr(num),'HEIGHT', h);
 ini.Free;
end;

procedure TFGraph.FormShow(Sender: TObject);
begin
 Edit1.Text:=inttostr(num);
end;

end.
