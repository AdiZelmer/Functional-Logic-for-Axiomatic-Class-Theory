object SentencesF: TSentencesF
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sentences'
  ClientHeight = 568
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 3
    object Navigator: TAZNavigator
      Left = 0
      Top = 0
      Width = 703
      Height = 25
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 527
    Width = 707
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 624
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 29
    Width = 707
    Height = 319
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object SentencesG: TDBGrid
      Left = 0
      Top = 0
      Width = 254
      Height = 319
      Align = alLeft
      DataSource = SentencesDS
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = SentencesGDblClick
      OnKeyDown = SentencesGKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'TITLE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KIND'
          Visible = True
        end>
    end
    object DBMemo1: TDBMemo
      Left = 254
      Top = 0
      Width = 453
      Height = 319
      Align = alClient
      DataField = 'DESCRIPTION'
      DataSource = SentencesDS
      TabOrder = 1
    end
  end
  object CurrGrid: TStringGrid
    Left = 0
    Top = 348
    Width = 707
    Height = 179
    Align = alBottom
    ColCount = 32
    DefaultColWidth = 21
    DefaultRowHeight = 21
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Extender: TAZExtender
    AZNavigator = Navigator
    IndexList.Strings = (
      '[SentencesT]'
      'Sentence=Sentence/F'
      'Title=Title;Sentence/F')
    Left = 16
    Top = 216
  end
  object SentencesT: TIBOTable
    Filtered = True
    Filter = 'Kind <> '#39'U'#39
    PreparedEdits = True
    PreparedInserts = True
    ReadOnly = True
    RecordCountAccurate = True
    AfterScroll = SentencesTAfterScroll
    IndexFieldNames = 'Sentence'
    TableName = 'SENTENCES'
    Left = 16
    Top = 160
    object SentencesTSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Origin = 'SENTENCES.SENTENCE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SentencesTTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'SENTENCES.TITLE'
      Size = 32
    end
    object SentencesTDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'SENTENCES.DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object SentencesTKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Origin = 'SENTENCES.KIND'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object SentencesDS: TDataSource
    DataSet = SentencesT
    Left = 80
    Top = 160
  end
end
