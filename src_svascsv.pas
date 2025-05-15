unit src_svascsv;

interface

uses
  System.JSON, Vcl.StdCtrls, REST.Client, Vcl.Dialogs, System.SysUtils,
  Vcl.Grids;

procedure stacsv(StringGrid1: TStringGrid; SaveDialog1: TSaveDialog);

implementation

procedure stacsv(StringGrid1: TStringGrid; SaveDialog1: TSaveDialog);
var
  CSVFile: TextFile;
  Row, Col: Integer;
  LineText: string;
  CellText: string;
  FillName: string;
begin
  try
    SaveDialog1.Title := 'Guardar CSV';
    SaveDialog1.InitialDir := 'C:\';
    SaveDialog1.Filter := 'Archivos CSV (*.csv)|*.csv';
    FillName := SaveDialog1.FileName + '.csv';
    if SaveDialog1.Execute then
    begin
      AssignFile(CSVFile, FillName);
      Rewrite(CSVFile);
      try
        for Row := 0 to StringGrid1.RowCount - 1 do
        begin
          LineText := '';
          for Col := 0 to StringGrid1.ColCount - 1 do
          begin
            CellText := StringGrid1.Cells[Col, Row];

            // Envolver el texto en comillas dobles si contiene un punto y coma
            if Pos(';', CellText) > 0 then
              CellText := '"' + CellText + '"';

            LineText := LineText + CellText;

            if Col < StringGrid1.ColCount - 1 then
              LineText := LineText + ';'; // Separador de columnas
          end;
          Writeln(CSVFile, LineText);
        end;
      finally
        CloseFile(CSVFile);
      end;

    end;

  finally

  end;

end;

end.
