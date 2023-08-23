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
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Action1Execute(Sender: TObject);
begin
 BitBtn1.Click;
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
 BitBtn2.Click;
end;

end.
