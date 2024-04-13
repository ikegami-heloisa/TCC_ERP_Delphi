inherited FormFiltroFornecedor: TFormFiltroFornecedor
  Caption = 'Filtrar Fornecedores'
  ClientHeight = 442
  ClientWidth = 1086
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 1098
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 1086
    ExplicitWidth = 1080
    inherited lblNomeCliente: TLabel
      Left = 92
      Width = 65
      Caption = 'Razao Social'
      ExplicitLeft = 92
      ExplicitWidth = 65
    end
    object lblNomeFantasia: TLabel [1]
      Left = 388
      Top = 16
      Width = 100
      Height = 15
      Caption = 'Nome Fantasia (PJ)'
    end
    object lblCnpj: TLabel [2]
      Left = 16
      Top = 62
      Width = 27
      Height = 15
      Caption = 'CNPJ'
    end
    object lblIdFornecedor: TLabel [3]
      Left = 16
      Top = 16
      Width = 11
      Height = 15
      Caption = 'ID'
    end
    inherited edtNome: TEdit
      Left = 92
      Width = 290
      ExplicitLeft = 92
      ExplicitWidth = 290
    end
    inherited btnFiltrar: TButton
      Left = 594
      Caption = 'Filtrar'
      OnClick = btnFiltrarClick
      ExplicitLeft = 594
    end
    inherited Panel2: TPanel
      Left = 960
      Width = 125
      ExplicitLeft = 954
      ExplicitWidth = 125
      inherited btnSair: TButton
        Left = 6
        ExplicitLeft = 6
      end
    end
    object edtNomeFantasia: TEdit
      Left = 388
      Top = 29
      Width = 200
      Height = 23
      TabOrder = 3
    end
    object edtCnpj: TEdit
      Left = 16
      Top = 77
      Width = 200
      Height = 23
      TabOrder = 4
    end
    object btnNovo: TButton
      Left = 675
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 5
      OnClick = btnNovoClick
    end
    object btnVisualizar: TButton
      Left = 756
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 6
      OnClick = btnVisualizarClick
    end
    object edtIdFornecedor: TEdit
      Left = 16
      Top = 29
      Width = 70
      Height = 23
      TabOrder = 7
      Text = 'edtIdFornecedor'
    end
  end
  object DBGrid1: TDBGrid [1]
    Left = 0
    Top = 113
    Width = 1086
    Height = 329
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  inherited fdQryFiltro: TFDQuery
    ResourceOptions.AssignedValues = [rvDefaultParamType]
    SQL.Strings = (
      'SELECT * FROM FORNECEDOR')
    Left = 608
    Top = 80
    object fdQryFiltroID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryFiltroRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 80
    end
    object fdQryFiltroNOME_FANTASIA: TWideStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 80
    end
    object fdQryFiltroCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object fdQryFiltroENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object fdQryFiltroBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 50
    end
    object fdQryFiltroID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
    end
    object fdQryFiltroID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
    end
    object fdQryFiltroEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 255
    end
  end
  inherited dsFiltro: TDataSource
    Left = 672
    Top = 80
  end
  inherited fdTransaction: TFDTransaction
    Left = 752
    Top = 80
  end
end