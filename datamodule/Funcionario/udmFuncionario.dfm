object dmFuncionario: TdmFuncionario
  OldCreateOrder = False
  Height = 195
  Width = 287
  object ztbFuncionario: TZTable
    Connection = dmConexao.zConn
    SortedFields = 'F_ID'
    TableName = 'F_FUNCIONARIO'
    IndexFieldNames = 'F_ID Asc'
    Left = 72
    Top = 24
    object ztbFuncionarioF_ID: TFloatField
      DisplayLabel = 'ID'
      FieldName = 'F_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ztbFuncionarioF_SITUACAO: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'F_SITUACAO'
      Size = 50
    end
    object ztbFuncionarioF_FUNCAO: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'F_FUNCAO'
      Size = 50
    end
    object ztbFuncionarioF_NOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'F_NOME'
      Required = True
      Size = 80
    end
    object ztbFuncionarioF_SEXO: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Sexo'
      FieldName = 'F_SEXO'
      Size = 1
    end
    object ztbFuncionarioF_USUARIO: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'F_USUARIO'
      Required = True
      Size = 50
    end
    object ztbFuncionarioF_SENHA: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'F_SENHA'
      Required = True
      Size = 6
    end
    object ztbFuncionarioF_DATA_CADASTRO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Cadastro'
      FieldName = 'F_DATA_CADASTRO'
      DisplayFormat = 'dd/mm/yyyy - hh:mm:ss'
    end
    object ztbFuncionarioF_DATA_INATIVO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Inativo'
      FieldName = 'F_DATA_INATIVO'
      DisplayFormat = 'dd/mm/yyyy - hh:mm:ss'
    end
  end
  object zqrVerificaSituacao: TZQuery
    Connection = dmConexao.zConn
    SQL.Strings = (
      
        'SELECT F_NOME, F_SITUACAO,F_USUARIO, F_FUNCAO FROM F_FUNCIONARIO' +
        ' WHERE F_SITUACAO = '#39'INATIVO'#39' AND F_USUARIO=:pUser AND F_FUNCAO=' +
        ':pFunc')
    Params = <
      item
        DataType = ftString
        Name = 'pUser'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFunc'
        ParamType = ptUnknown
      end>
    Left = 128
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'pUser'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFunc'
        ParamType = ptUnknown
      end>
  end
end
