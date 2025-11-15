object VerifySubstitutionsDM: TVerifySubstitutionsDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 220
  Width = 324
  object StepsQ: TIBOQuery
    IB_Connection = HauptF.LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Sentence, Step, Arg,Col, SCol'
      '  from Steps'
      '  where Rule = 6'
      '  order by Sentence, Step'
      ';')
    Left = 32
    Top = 32
    object StepsQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Required = True
    end
    object StepsQSTEP: TIntegerField
      DisplayLabel = 'Step'
      FieldName = 'STEP'
      Required = True
    end
    object StepsQARG: TIntegerField
      DisplayLabel = 'Arg'
      FieldName = 'ARG'
    end
    object StepsQCOL: TIntegerField
      DisplayLabel = 'Col'
      FieldName = 'COL'
    end
    object StepsQSCOL: TIntegerField
      DisplayLabel = 'SCol'
      FieldName = 'SCOL'
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'All files|*.*|csv-File|*.csv|Text file|*.txt'
    Title = 'Save proof'
    Left = 32
    Top = 84
  end
end
