object dmCliente: TdmCliente
  OldCreateOrder = False
  Height = 150
  Width = 215
  object zqrVerificaCPF: TZQuery
    Connection = dmConexao.zConn
    SQL.Strings = (
      'SELECT'
      '    C_ID,'
      '    C_CPF'
      'FROM'
      '   C_CLIENTE'
      'WHERE'
      '  C_CPF=:pCPF')
    Params = <
      item
        DataType = ftString
        Name = 'pCPF'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'pCPF'
        ParamType = ptUnknown
      end>
  end
  object ztbCliente: TZTable
    Connection = dmConexao.zConn
    SortedFields = 'C_ID'
    TableName = 'C_CLIENTE'
    IndexFieldNames = 'C_ID Asc'
    Left = 40
    Top = 24
    object ztbClienteC_ID: TFloatField
      Alignment = taCenter
      DisplayLabel = 'ID'
      FieldName = 'C_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ztbClienteC_SITUACAO: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'C_SITUACAO'
      Size = 50
    end
    object ztbClienteC_CPF: TWideStringField
      DisplayLabel = 'CPF'
      FieldName = 'C_CPF'
      Required = True
      EditMask = '000.000.000-00;1;_'
    end
    object ztbClienteC_NOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'C_NOME'
      Size = 200
    end
    object ztbClienteC_SEXO: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Sexo'
      FieldName = 'C_SEXO'
      Size = 1
    end
    object ztbClienteC_EMAIL: TWideStringField
      DisplayLabel = 'E-mail'
      FieldName = 'C_EMAIL'
      Size = 100
    end
    object ztbClienteC_TEL: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'C_TEL'
      EditMask = '!\(99\)0000-0000;1;_'
    end
    object ztbClienteC_CEL: TWideStringField
      DisplayLabel = 'Celular'
      FieldName = 'C_CEL'
      EditMask = '!\(99\)00000-0000;1;_'
    end
    object ztbClienteC_OPERADORA: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Operadora'
      FieldName = 'C_OPERADORA'
      Size = 10
    end
    object ztbClienteC_DATANASCI: TDateTimeField
      DisplayLabel = 'Nascimento'
      FieldName = 'C_DATANASCI'
      EditMask = '00/00/0000;1;_'
    end
    object ztbClienteC_DATA_CADASTRO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Cadastro'
      FieldName = 'C_DATA_CADASTRO'
      DisplayFormat = 'dd/mm/yyyy - hh:mm:ss'
    end
    object ztbClienteC_DATA_INATIVO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Inativo'
      FieldName = 'C_DATA_INATIVO'
      DisplayFormat = 'dd/mm/yyyy - hh:mm:ss'
    end
  end
end
