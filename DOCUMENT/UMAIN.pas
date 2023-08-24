unit UMAIN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Label2: TLabel;
    Memo1: TMemo;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Action3: TAction;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses USett, UArc;

procedure TForm1.Action1Execute(Sender: TObject);
begin
 BitBtn1.Click;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
 BitBtn2.Click;
end;

procedure TForm1.Action3Execute(Sender: TObject);
begin
 BitBtn3.Click;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
 FSett.ShowModal;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin


FArc.ShowModal;
end;

end.
