object dmLogin: TdmLogin
  OldCreateOrder = False
  Height = 150
  Width = 215
  object zqrLogin: TZReadOnlyQuery
    Connection = dmConexao.zConn
    SQL.Strings = (
      'SELECT'
      '    f_nome,'
      '    f_usuario,'
      '    f_senha,'
      '    f_funcao'
      'FROM'
      '    f_funcionario'
      'WHERE'
      '    f_usuario=:pUser'
      'AND'
      '    f_senha=:pSenha'
      'AND'
      '    f_funcao=:pFuncao')
    Params = <
      item
        DataType = ftString
        Name = 'pUser'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSenha'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFuncao'
        ParamType = ptUnknown
      end>
    Left = 88
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'pUser'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSenha'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pFuncao'
        ParamType = ptUnknown
      end>
  end
end
