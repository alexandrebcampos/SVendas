object dmProduto: TdmProduto
  OldCreateOrder = False
  Height = 150
  Width = 215
  object ztbProduto: TZTable
    Connection = dmConexao.zConn
    SortedFields = 'P_ID'
    TableName = 'P_PRODUTO'
    IndexFieldNames = 'P_ID Asc'
    Left = 48
    Top = 32
    object ztbProdutoP_ID: TFloatField
      Alignment = taCenter
      DisplayLabel = 'ID'
      FieldName = 'P_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ztbProdutoP_SITUACAO: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'P_SITUACAO'
      Size = 50
    end
    object ztbProdutoFO_ID: TFloatField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FO_ID'
    end
    object ztbProdutoP_VL_UNIT: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'P_VL_UNIT'
      currency = True
    end
    object ztbProdutoP_DESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'P_DESCRICAO'
      Size = 200
    end
    object ztbProdutoP_QUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'P_QUANTIDADE'
    end
    object ztbProdutoP_VL_TOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'P_VL_TOTAL'
      currency = True
    end
    object ztbProdutoP_FOTO: TBlobField
      DisplayLabel = 'Foto'
      FieldName = 'P_FOTO'
    end
    object ztbProdutoP_DATA_CADASTRO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Cadastro'
      FieldName = 'P_DATA_CADASTRO'
      DisplayFormat = 'dd/mm/yyyy - hh:mm:ss'
    end
    object ztbProdutoP_DATA_INATIVO: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Inativo'
      FieldName = 'P_DATA_INATIVO'
      DisplayFormat = 'dd/mm/yyyy - hh:mm:ss'
    end
  end
end
