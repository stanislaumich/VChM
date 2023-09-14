program Graph1;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FMain},
  UGraph in 'UGraph.pas' {FGraph};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFGraph, FGraph);
  Application.Run;

end.
