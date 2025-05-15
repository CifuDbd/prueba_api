unit src_apiedit;

interface

uses
  System.JSON, Vcl.StdCtrls, REST.Client, Vcl.Dialogs, System.SysUtils;


  procedure EjecutarApi(RESTClient1: TRESTClient; RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse; Edit1: TEdit; mm1: TMemo);

implementation





procedure EjecutarApi(RESTClient1: TRESTClient; RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse; Edit1: TEdit; mm1: TMemo);
var
  JSONValue: TJSONValue;
  JSONObject: TJSONObject;
  JSONString: string;
  results: TJSONArray;
  result: TJSONObject;
  I: Integer;
  StartT, EndT, EXT: TDateTime;
begin
  mm1.Clear;
  StartT := Now; // hora de inicio

  try
    RESTClient1.BaseURL := Edit1.Text; // URL
    RESTRequest1.Execute; // Ejecuta REST
    JSONValue := TJSONObject.ParseJSONValue(RESTResponse1.Content); // parsea
    try
      if JSONValue is TJSONObject then
      begin
        JSONObject := JSONValue as TJSONObject;
        if JSONObject.GetValue('results') is TJSONArray then
        begin
          results := (JSONObject).GetValue<TJSONArray>('results');
          for I := 0 to results.Count - 1 do
          begin
            result := results.Items[I] as TJSONObject;
            JSONString := result.ToJSON;
            mm1.Lines.Add('result, N°' + IntToStr(I) + ':' + JSONString);
          end;
        end
        else
        begin
          mm1.Lines.Add('No se ha encontrado, results como un arreglo');
          JSONString := JSONObject.ToJSON; // str
          mm1.Lines.Add('Respuesta: ' + JSONString);
        end;
      end;
    finally
      mm1.Lines.Add('Status Code:' + '' + IntToStr(RESTResponse1.StatusCode));
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);

  end;

  EndT := Now; // hora de fin
  EXT := EndT - StartT; // tiempo de ejecución
  mm1.Lines.Add('Tiempo de ejecución: ' + FormatDateTime('hh:nn:ss.zzz', EXT));
end;

end.
