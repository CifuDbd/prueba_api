program Project1;

uses
  Vcl.Forms,
  ProyectoApi in 'ProyectoApi.pas' {Proyecto_Api},
  src_apiedit in 'src_apiedit.pas',
  src_apitxt in 'src_apitxt.pas',
  src_stacsv in 'src_stacsv.pas',
  src_acgrid in 'src_acgrid.pas',
  src_StrGrid_Selec in 'src_StrGrid_Selec.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TProyecto_Api, Proyecto_Api);
  Application.Run;
end.
