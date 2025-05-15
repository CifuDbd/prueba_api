unit src_apitxt;

interface

uses
  Vcl.Controls, Vcl.Grids, Vcl.Dialogs, System.SysUtils, System.Classes,
  System.JSON, REST.Client;

procedure apitxt(AOpenDialog: TOpenDialog; AStringGrid: TStringGrid;
  ARESTClient: TRESTClient; ARESTRequest: TRESTRequest;
  ARESTResponse: TRESTResponse);

implementation

procedure apitxt(AOpenDialog: TOpenDialog; AStringGrid: TStringGrid;
  ARESTClient: TRESTClient; ARESTRequest: TRESTRequest;
  ARESTResponse: TRESTResponse);
var
  TextFile: TStringList;
  I: Integer;
  StartT, EndT, EXT: TDateTime;
  JSONValue: TJSONValue;
  JSONObject: TJSONObject;
  JSONString: String;
begin
  TextFile := TStringList.Create;
  try
    AOpenDialog.InitialDir := 'C:\';
    AOpenDialog.Filter := 'Archivos de texto (*.txt)|*.txt';
    AOpenDialog.Title := 'Seleccionar archivo de texto';
    AStringGrid.RowCount := 0; // Limpiar el StringGrid
    if AOpenDialog.Execute then
    begin
      TextFile.LoadFromFile(AOpenDialog.FileName);
      AStringGrid.RowCount := TextFile.Count + 1; // Ajustar para encabezados
      AStringGrid.Cells[0, 0] := 'Index';
      AStringGrid.Cells[1, 0] := 'URL';
      AStringGrid.Cells[2, 0] := 'Respuesta';
      AStringGrid.Cells[3, 0] := 'Status Code';
      AStringGrid.Cells[4, 0] := 'Tiempo de ejecución';

      for I := 0 to TextFile.Count - 1 do
      begin
        try
          StartT := Now; // hora de inicio
          ARESTClient.BaseURL := TextFile[I];
          AStringGrid.Cells[0, I + 1] := IntToStr(I);
          AStringGrid.Cells[1, I + 1] := TextFile[I];
          ARESTRequest.Execute; // Ejecuta REST
          JSONValue := TJSONObject.ParseJSONValue(ARESTResponse.Content);
          try
            JSONObject := JSONValue as TJSONObject;
            JSONString := JSONObject.ToJSON; // str
            EndT := Now; // hora de fin
            EXT := EndT - StartT; // tiempo de ejecución
            AStringGrid.Cells[2, I + 1] := JSONString;
          finally
            AStringGrid.Cells[3, I + 1] := IntToStr(ARESTResponse.StatusCode);
            AStringGrid.Cells[4, I + 1] := FormatDateTime('hh:nn:ss.zzz', EXT);
          end;
        except
          on E: Exception do
            ShowMessage('Error: ' + E.Message + ' URL: ' + IntToStr(I + 1) +
              ' es incorrecta.');
        end;
      end;
    end;
  finally
    TextFile.Free;
  end;
end;

end.

  end.
