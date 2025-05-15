object Proyecto_Api: TProyecto_Api
  Left = 0
  Top = 0
  Caption = 'Proyecto Api'
  ClientHeight = 456
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 515
    Top = 0
    Width = 203
    Height = 456
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 195
      Height = 85
      Align = alTop
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 62
        Width = 193
        Height = 22
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object Btn_Api: TButton
          Left = 104
          Top = 1
          Width = 88
          Height = 20
          Align = alRight
          Caption = 'Enviar api'
          TabOrder = 0
          OnClick = Btn_ApiClick
        end
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 193
        Height = 56
        Align = alTop
        Caption = 'Panel3'
        TabOrder = 1
        object Edit1: TEdit
          Left = 1
          Top = 1
          Width = 191
          Height = 54
          Align = alClient
          TabOrder = 0
          Text = 'URL'
          ExplicitHeight = 23
        end
      end
    end
    object mm1: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 95
      Width = 195
      Height = 357
      Align = alClient
      DoubleBuffered = False
      ParentDoubleBuffered = False
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 515
    Height = 456
    Align = alClient
    Caption = 'Panel5'
    TabOrder = 1
    object StringGrid1: TStringGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 507
      Height = 448
      Align = alClient
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      OnSelectCell = StringGrid1SelectCell
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://rickandmortyapi.com/api/character/2'
    Params = <>
    SynchronizedEvents = False
    Left = 32
    Top = 112
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 128
    Top = 152
  end
  object RESTResponse1: TRESTResponse
    Left = 208
    Top = 128
  end
  object OpenDialog1: TOpenDialog
    Left = 64
    Top = 240
  end
  object SaveDialog1: TSaveDialog
    Left = 168
    Top = 248
  end
  object MainMenu1: TMainMenu
    Left = 352
    Top = 232
    object Archivos1: TMenuItem
      Caption = '&Archivos'
      object Archivos2: TMenuItem
        Caption = 'Leer archivo Txt'
        ShortCut = 16460
        OnClick = btn_ApitxtClick
      end
      object GuardarcomoCSV1: TMenuItem
        Caption = 'Guardar como CSV'
        ShortCut = 16455
        OnClick = Button1Click
      end
      object GuardarcomoCSV2: TMenuItem
        Caption = 'Limpiar datos'
        OnClick = GuardarcomoCSV2Click
      end
    end
    object Ayuda1: TMenuItem
      Caption = 'Ayuda'
    end
  end
end
