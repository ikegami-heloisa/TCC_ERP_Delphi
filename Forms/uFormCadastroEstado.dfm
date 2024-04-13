inherited FormCadastroEstado: TFormCadastroEstado
  Caption = 'Cadastro de Estados'
  ClientHeight = 167
  ClientWidth = 520
  Position = poScreenCenter
  ExplicitWidth = 532
  ExplicitHeight = 205
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 14
    Top = 56
    Width = 58
    Height = 15
    Caption = 'ID_ESTADO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 14
    Top = 104
    Width = 82
    Height = 15
    Caption = 'NOME_ESTADO'
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 220
    Top = 104
    Width = 31
    Height = 15
    Caption = 'SIGLA'
    FocusControl = DBEdit3
  end
  inherited pnCabecalho: TPanel
    Width = 520
    ExplicitWidth = 514
    inherited btnSair: TBitBtn
      Left = 434
      ExplicitLeft = 434
    end
  end
  object DBEdit1: TDBEdit [4]
    Left = 14
    Top = 72
    Width = 154
    Height = 23
    DataField = 'ID_ESTADO'
    DataSource = dsCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [5]
    Left = 14
    Top = 120
    Width = 200
    Height = 23
    DataField = 'NOME_ESTADO'
    DataSource = dsCadastro
    TabOrder = 2
  end
  object DBEdit3: TDBEdit [6]
    Left = 220
    Top = 120
    Width = 45
    Height = 23
    DataField = 'SIGLA'
    DataSource = dsCadastro
    TabOrder = 3
  end
  inherited fdQryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_ESTADO_ID'
    UpdateOptions.AutoIncFields = 'ID_ESTADO'
    SQL.Strings = (
      'SELECT * FROM ESTADO')
    Left = 48
    Top = 152
    object fdQryCadastroID_ESTADO: TFDAutoIncField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object fdQryCadastroNOME_ESTADO: TWideStringField
      FieldName = 'NOME_ESTADO'
      Origin = 'NOME_ESTADO'
      Size = 60
    end
    object fdQryCadastroSIGLA: TWideStringField
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      Size = 2
    end
  end
  inherited fdUpdCadastro: TFDUpdateSQL
    Left = 152
    Top = 152
  end
  inherited fdTransaction: TFDTransaction
    Left = 248
    Top = 152
  end
  inherited dsCadastro: TDataSource
    Left = 336
    Top = 152
  end
end
