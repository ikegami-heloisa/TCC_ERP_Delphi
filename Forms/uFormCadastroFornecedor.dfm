inherited FormCadastroFornecedor: TFormCadastroFornecedor
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 244
  ClientWidth = 883
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitHeight = 282
  TextHeight = 15
  object lblRazaoSocial: TLabel [0]
    Left = 100
    Top = 56
    Width = 82
    Height = 15
    Caption = 'RAZAO SOCIAL'
    FocusControl = edtRazaoSocial
  end
  object lblNomeFantasia: TLabel [1]
    Left = 560
    Top = 56
    Width = 90
    Height = 15
    Caption = 'NOME FANTASIA'
    FocusControl = edtNomeFantasia
  end
  object lblEndereco: TLabel [2]
    Left = 455
    Top = 101
    Width = 59
    Height = 15
    Caption = 'ENDERE'#199'O'
    FocusControl = edtEndereco
  end
  object lblBairro: TLabel [3]
    Left = 14
    Top = 144
    Width = 41
    Height = 15
    Caption = 'BAIRRO'
    FocusControl = edtBairro
  end
  object lblCidade: TLabel [4]
    Left = 296
    Top = 144
    Width = 41
    Height = 15
    Caption = 'CIDADE'
  end
  object lblEstado: TLabel [5]
    Left = 220
    Top = 144
    Width = 42
    Height = 15
    Caption = 'ESTADO'
  end
  object lblCnpj: TLabel [6]
    Left = 14
    Top = 102
    Width = 27
    Height = 15
    Caption = 'CNPJ'
  end
  object lblEmail: TLabel [7]
    Left = 220
    Top = 101
    Width = 39
    Height = 15
    Caption = 'E-MAIL'
    FocusControl = edtEmail
  end
  object lblIdFornecedor: TLabel [8]
    Left = 14
    Top = 56
    Width = 11
    Height = 15
    Caption = 'ID'
  end
  inherited pnCabecalho: TPanel
    Width = 883
    inherited btnSair: TBitBtn
      Left = 796
      ExplicitLeft = 796
    end
  end
  object edtRazaoSocial: TDBEdit [10]
    Left = 100
    Top = 72
    Width = 454
    Height = 23
    DataField = 'RAZAO_SOCIAL'
    DataSource = dsCadastro
    TabOrder = 1
  end
  object edtNomeFantasia: TDBEdit [11]
    Left = 560
    Top = 72
    Width = 306
    Height = 23
    DataField = 'NOME_FANTASIA'
    DataSource = dsCadastro
    TabOrder = 2
  end
  object edtEndereco: TDBEdit [12]
    Left = 455
    Top = 115
    Width = 406
    Height = 23
    DataField = 'ENDERECO'
    DataSource = dsCadastro
    TabOrder = 3
  end
  object edtBairro: TDBEdit [13]
    Left = 14
    Top = 160
    Width = 200
    Height = 23
    DataField = 'BAIRRO'
    DataSource = dsCadastro
    TabOrder = 4
  end
  object edtCnpj: TDBEdit [14]
    Left = 14
    Top = 115
    Width = 200
    Height = 23
    DataField = 'CNPJ'
    DataSource = dsCadastro
    TabOrder = 5
  end
  object edtEmail: TDBEdit [15]
    Left = 220
    Top = 115
    Width = 229
    Height = 23
    DataField = 'EMAIL'
    DataSource = dsCadastro
    TabOrder = 6
  end
  object DBLookupComboBox1: TDBLookupComboBox [16]
    Left = 295
    Top = 160
    Width = 145
    Height = 23
    DataField = 'ID_CIDADE'
    DataSource = dsCadastro
    KeyField = 'ID_CIDADE'
    ListField = 'NOME_CIDADE'
    ListSource = Lookup.dsCidades
    TabOrder = 7
  end
  object DBLookupComboBox2: TDBLookupComboBox [17]
    Left = 220
    Top = 160
    Width = 69
    Height = 23
    DataField = 'ID_ESTADO'
    DataSource = dsCadastro
    KeyField = 'ID_ESTADO'
    ListField = 'SIGLA'
    ListSource = Lookup.dsEstados
    TabOrder = 8
  end
  object edtIdFornecedor: TDBEdit [18]
    Left = 14
    Top = 73
    Width = 80
    Height = 23
    Enabled = False
    TabOrder = 9
  end
  inherited fdQryCadastro: TFDQuery
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_FORNECEDOR_ID'
    UpdateOptions.AutoIncFields = 'ID_FORNECEDOR'
    SQL.Strings = (
      'SELECT * FROM FORNECEDOR')
    Top = 216
    object fdQryCadastroRAZAO_SOCIAL: TWideStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 80
    end
    object fdQryCadastroNOME_FANTASIA: TWideStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 80
    end
    object fdQryCadastroCNPJ: TWideStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object fdQryCadastroENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object fdQryCadastroBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 50
    end
    object fdQryCadastroID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
    end
    object fdQryCadastroID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
    end
    object fdQryCadastroEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 255
    end
    object fdQryCadastroID_FORNECEDOR: TFDAutoIncField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
  end
  inherited fdUpdCadastro: TFDUpdateSQL
    Left = 128
    Top = 216
  end
  inherited fdTransaction: TFDTransaction
    Left = 264
    Top = 216
  end
  inherited dsCadastro: TDataSource
    Left = 208
    Top = 216
  end
end
