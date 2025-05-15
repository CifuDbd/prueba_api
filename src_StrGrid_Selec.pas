unit src_StrGrid_Selec;

interface

uses
  System.JSON, Vcl.StdCtrls, REST.Client, Vcl.Dialogs, System.SysUtils,
  Vcl.Grids;

procedure StrGrid_Selec(StringGrid1: TStringGrid; mm1: TMemo; ARow: Integer);

implementation

procedure StrGrid_Selec(StringGrid1: TStringGrid; mm1: TMemo; ARow: Integer);
var
  RowText: string;
  I: Integer;

begin
  mm1.Clear;
  RowText := '';
  for I := 0 to StringGrid1.ColCount - 1 do
  begin
    RowText := StringGrid1.Cells[I, 0] + ': ' + StringGrid1.Cells[I, ARow];
    mm1.Lines.Add(RowText);
    RowText := '';

  end;

end;

end.
