program Example;

uses
  Forms,
  TNPDFEX in 'TNPDFEX.PAS' {Form1},
  tnpdf in 'TNPDF.PAS';

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
