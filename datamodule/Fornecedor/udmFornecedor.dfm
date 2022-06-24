object dmFornecedor: TdmFornecedor
  OldCreateOrder = False
  Height = 150
  Width = 215
  object ztbFornecedor: TZTable
    Connection = dmConexao.zConn
    SortedFields = 'FO_ID'
    TableName = 'FO_FORNECEDOR'
    IndexFieldNames = 'FO_ID Asc'
    Left = 72
    Top = 32
    object ztbFornecedorFO_ID: TFloatField
      Alignment = taCenter
      DisplayLabel = 'ID'
      FieldName = 'FO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ztbFornecedorFO_SITUACAO: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'FO_SITUACAO'
      Size = 50
    end
    object ztbFornecedorFO_CNPJ: TWideStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'FO_CNPJ'
      EditMask = '00.000.000/0000-00;1;_'
    end
    object ztbFornecedorFO_RAZAO_SOCIAL: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'FO_RAZAO_SOCIAL'
      Size = 150
    end
    object ztbFornecedorFO_NOME_FANTASIA: TWideStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FO_NOME_FANTASIA'
      Size = 150
    end
    object ztbFornecedorFO_TELEFONE: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'FO_TELEFONE'
      EditMask = '!\(99\)0000-0000;1;_'
    end
    object ztbFornecedorFO_EMAIL: TWideStringField
      DisplayLabel = 'E-mail'
      FieldName = 'FO_EMAIL'
      Size = 150
    end
    object ztbFornecedorFO_DATA_CADASTRO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Cadastro'
      FieldName = 'FO_DATA_CADASTRO'
      DisplayFormat = 'dd/mm/yyyy - hh:mm:ss'
    end
    object ztbFornecedorFO_DATA_INATIVO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Inativo'
      FieldName = 'FO_DATA_INATIVO'
      DisplayFormat = 'dd/mm/yyyy - hh:mm:ss'
    end
  end
end
