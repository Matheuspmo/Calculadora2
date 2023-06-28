program Calculadora;

uses
  Vcl.Forms,
  UCalc in 'UCalc.pas' {FrmCalc},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCalc, FrmCalc);
  Application.Run;
end.
