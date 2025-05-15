unit src_acgrid;

interface

uses
  System.JSON, Vcl.StdCtrls, REST.Client, Vcl.Dialogs, System.SysUtils,
  Vcl.Grids;
procedure acgrid(StringGrid1: TStringGrid; SaveDialog1: TSaveDialog);

implementation

procedure acgrid(StringGrid1: TStringGrid; SaveDialog1: TSaveDialog);
var
  ColWidth, GridWidth, TotalFixedWidth, NumColumns: Integer;
  I: Integer;
begin
  GridWidth := StringGrid1.ClientWidth;
  NumColumns := StringGrid1.ColCount;
  if NumColumns > 0 then
  begin
    ColWidth := (GridWidth) div NumColumns ;

    for I := 0 to StringGrid1.ColCount - 1 do
    begin
      StringGrid1.ColWidths[I] := ColWidth;
    end;

  end;

end;

end.
