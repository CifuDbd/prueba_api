unit ProyectoApi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, Vcl.ExtCtrls,
  src_apiedit, Vcl.Grids, src_apitxt, src_stacsv, src_acgrid, src_StrGrid_Selec,
  Vcl.Menus;

type
  TProyecto_Api = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Btn_Api: TButton;
    Edit1: TEdit;
    Panel5: TPanel;
    StringGrid1: TStringGrid;
    mm1: TMemo;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    Archivos1: TMenuItem;
    Archivos2: TMenuItem;
    GuardarcomoCSV1: TMenuItem;
    GuardarcomoCSV2: TMenuItem;
    Ayuda1: TMenuItem;
    procedure Btn_ApiClick(Sender: TObject);
    procedure btn_ApitxtClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GuardarcomoCSV2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Proyecto_Api: TProyecto_Api;

implementation

{$R *.dfm}

procedure TProyecto_Api.FormCreate(Sender: TObject);
begin
  StringGrid1.RowCount := 0;
  StringGrid1.Cells[0, 0] := 'Index';
  StringGrid1.Cells[1, 0] := 'URL';
  StringGrid1.Cells[2, 0] := 'Respuesta';
  StringGrid1.Cells[3, 0] := 'Status Code';
  StringGrid1.Cells[4, 0] := 'Tiempo de ejecución';
  acgrid(StringGrid1, SaveDialog1);

end;

procedure TProyecto_Api.Btn_ApiClick(Sender: TObject);
begin
  EjecutarApi(RESTClient1, RESTRequest1, RESTResponse1, Edit1, mm1);
end;

procedure TProyecto_Api.btn_ApitxtClick(Sender: TObject);

begin
  apitxt(OpenDialog1, StringGrid1, RESTClient1, RESTRequest1, RESTResponse1);

  acgrid(StringGrid1, SaveDialog1);
end;

procedure TProyecto_Api.Button1Click(Sender: TObject);
begin
  stacsv(StringGrid1, SaveDialog1)
end;

procedure TProyecto_Api.GuardarcomoCSV2Click(Sender: TObject);
begin
  mm1.Clear;
  StringGrid1.RowCount := 0;
  StringGrid1.Cells[0, 0] := 'Index';
  StringGrid1.Cells[1, 0] := 'URL';
  StringGrid1.Cells[2, 0] := 'Respuesta';
  StringGrid1.Cells[3, 0] := 'Status Code';
  StringGrid1.Cells[4, 0] := 'Tiempo de ejecución';
  acgrid(StringGrid1, SaveDialog1);

end;

procedure TProyecto_Api.StringGrid1SelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  StrGrid_Selec(StringGrid1, mm1, ARow)
end;

end.
