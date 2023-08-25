program Document;

uses
  Vcl.Forms,
  UMAIN in 'UMAIN.pas' {Form1},
  USett in 'USett.pas' {FSett},
  UArc in 'UArc.pas' {FArc},
  Ustr in 'Ustr.pas',
  UNomer in 'UNomer.pas' {FNomer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFSett, FSett);
  Application.CreateForm(TFArc, FArc);
  Application.CreateForm(TFNomer, FNomer);
  Application.Run;

end.
