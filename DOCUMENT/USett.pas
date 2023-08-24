unit USett;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFSett = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSett: TFSett;

implementation

{$R *.dfm}

uses umain;

procedure TFSett.BitBtn1Click(Sender: TObject);
begin

  FSett.Close;
end;

procedure TFSett.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  umain.uselogin := CheckBox1.Checked;
  umain.infolder := Edit1.Text;
  umain.arcfolder := Edit2.Text;
  umain.scaner := Edit3.Text;

end;

end.
