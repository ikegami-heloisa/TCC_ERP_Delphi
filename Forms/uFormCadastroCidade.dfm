inherited FormCadastroCidade: TFormCadastroCidade
  Caption = 'Cadastro de Cidades'
  ClientHeight = 229
  ClientWidth = 522
  Position = poScreenCenter
  ExplicitWidth = 534
  ExplicitHeight = 267
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 14
    Top = 56
    Width = 57
    Height = 15
    Caption = 'ID_CIDADE'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 14
    Top = 104
    Width = 81
    Height = 15
    Caption = 'NOME_CIDADE'
    FocusControl = DBEdit2
  end
  inherited pnCabecalho: TPanel
    Width = 522
    ExplicitWidth = 516
    inherited btnSair: TBitBtn
      Left = 434
      ExplicitLeft = 434
    end
  end
  object DBEdit1: TDBEdit [3]
    Left = 14
    Top = 72
    Width = 154
    Height = 23
    DataField = 'ID_CIDADE'
    DataSource = dsCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [4]
    Left = 14
    Top = 120
    Width = 400
    Height = 23
    DataField = 'NOME_CIDADE'
    DataSource = dsCadastro
    TabOrder = 2
  end
  inherited fdQryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CIDADE_ID'
    UpdateOptions.AutoIncFields = 'ID_CIDADE'
    SQL.Strings = (
      'SELECT * FROM CIDADE')
    Left = 32
    Top = 160
    object fdQryCadastroID_CIDADE: TFDAutoIncField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object fdQryCadastroNOME_CIDADE: TWideStringField
      FieldName = 'NOME_CIDADE'
      Origin = 'NOME_CIDADE'
      Size = 60
    end
  end
  inherited fdUpdCadastro: TFDUpdateSQL
    Left = 136
    Top = 160
  end
  inherited fdTransaction: TFDTransaction
    Left = 232
    Top = 160
  end
  inherited dsCadastro: TDataSource
    Left = 320
    Top = 160
  end
end
