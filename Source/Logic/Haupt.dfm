object HauptF: THauptF
  Left = 190
  Top = 105
  Caption = 'Logic'
  ClientHeight = 729
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    1362
    729)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 711
    Top = 29
    Width = 2
    Height = 683
    Align = alRight
    ExplicitLeft = 715
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1362
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 0
    object Navigator: TAZNavigator
      Left = 0
      Top = 0
      Width = 1358
      Height = 25
      StatusPanel = StatusPanel
      MessagePanel = MessagePanel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 712
    Width = 1362
    Height = 17
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object StatusPanel: TPanel
      Left = 0
      Top = 0
      Width = 217
      Height = 17
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object MessagePanel: TPanel
      Left = 217
      Top = 0
      Width = 1145
      Height = 17
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 1
    end
  end
  object EditProofPC: TPageControl
    Left = 0
    Top = 29
    Width = 711
    Height = 683
    ActivePage = EditTS
    Align = alClient
    TabOrder = 2
    OnChanging = EditProofPCChanging
    object EditTS: TTabSheet
      Caption = 'Edit'
      object Splitter2: TSplitter
        Left = 0
        Top = 393
        Width = 703
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 57
      end
      object EditGrid: TStringGrid
        Left = 0
        Top = 38
        Width = 703
        Height = 355
        Align = alTop
        ColCount = 32
        Constraints.MinHeight = 355
        DefaultColWidth = 21
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 16
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = EditGridKeyDown
        OnKeyPress = EditGridKeyPress
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 703
        Height = 38
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        DesignSize = (
          703
          38)
        object uniB: TSpeedButton
          Left = 8
          Top = 8
          Width = 22
          Height = 22
          Hint = 'universal quantifier'
          Caption = 'A'
          ParentShowHint = False
          ShowHint = True
        end
        object exiB: TSpeedButton
          Left = 32
          Top = 8
          Width = 22
          Height = 22
          Hint = 'existential quantifier'
          Caption = 'E'
          ParentShowHint = False
          ShowHint = True
        end
        object apaB: TSpeedButton
          Left = 296
          Top = 8
          Width = 22
          Height = 22
          Hint = 'The first class belongs to the second.'
          Caption = '@'
          ParentShowHint = False
          ShowHint = True
        end
        object orxB: TSpeedButton
          Left = 104
          Top = 8
          Width = 22
          Height = 22
          Hint = 'disjunction'
          Caption = 'V'
          ParentShowHint = False
          ShowHint = True
        end
        object eqaB: TSpeedButton
          Left = 320
          Top = 8
          Width = 22
          Height = 22
          Hint = 'equality'
          Caption = '='
          ParentShowHint = False
          ShowHint = True
        end
        object douB: TSpeedButton
          Left = 152
          Top = 8
          Width = 22
          Height = 22
          Hint = 'double implication'
          Caption = 'D'
          ParentShowHint = False
          ShowHint = True
        end
        object impB: TSpeedButton
          Left = 176
          Top = 8
          Width = 22
          Height = 22
          Hint = 'implication'
          Caption = 'C'
          ParentShowHint = False
          ShowHint = True
        end
        object notB: TSpeedButton
          Left = 224
          Top = 8
          Width = 22
          Height = 22
          Hint = 'negation'
          Caption = 'N'
          ParentShowHint = False
          ShowHint = True
        end
        object andB: TSpeedButton
          Left = 80
          Top = 8
          Width = 22
          Height = 22
          Hint = 'conjunction'
          Caption = 'X'
          ParentShowHint = False
          ShowHint = True
        end
        object truB: TSpeedButton
          Left = 248
          Top = 8
          Width = 22
          Height = 22
          Hint = 'true'
          Caption = 'T'
        end
        object DefineB: TSpeedButton
          Left = 607
          Top = 8
          Width = 44
          Height = 22
          Hint = 'Define a relation or a function Ctrl+Shift+D'
          Anchors = [akTop, akRight]
          Caption = 'Define'
          ParentShowHint = False
          ShowHint = True
          ExplicitLeft = 611
        end
        object genB: TSpeedButton
          Left = 392
          Top = 8
          Width = 22
          Height = 22
          Hint = 'class generator'
          Caption = 'K'
          ParentShowHint = False
          ShowHint = True
        end
        object SaveB: TSpeedButton
          Left = 653
          Top = 8
          Width = 44
          Height = 22
          Hint = 'Save the sentence Ctrl+Shift+S'
          Anchors = [akTop, akRight]
          Caption = 'Save'
          ParentShowHint = False
          ShowHint = True
          ExplicitLeft = 657
        end
        object DeleteB: TSpeedButton
          Left = 440
          Top = 8
          Width = 44
          Height = 22
          Hint = 'Delete. Del, BkSp'
          Caption = 'Delete'
          ParentShowHint = False
          ShowHint = True
        end
        object setB: TSpeedButton
          Left = 344
          Top = 8
          Width = 22
          Height = 22
          Hint = 'set operator'
          Caption = 'S'
          ParentShowHint = False
          ShowHint = True
        end
        object SearchB: TSpeedButton
          Left = 561
          Top = 8
          Width = 44
          Height = 22
          Hint = 'Define a relation or a function Ctrl+Shift+D'
          Anchors = [akTop, akRight]
          Caption = 'Search'
          ParentShowHint = False
          ShowHint = True
        end
      end
      object OperationsG: TDBGrid
        Left = 0
        Top = 396
        Width = 703
        Height = 239
        Align = alClient
        DataSource = OperationsDS
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = OperationsGKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'OPERATION'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITLE'
            Width = 251
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMBER'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STITLE'
            Width = 251
            Visible = True
          end>
      end
      object Panel16: TPanel
        Left = 0
        Top = 635
        Width = 703
        Height = 20
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object Label2: TLabel
          Left = 17
          Top = 4
          Width = 28
          Height = 13
          Caption = 'Filter:'
        end
        object OperationsB: TButton
          Left = 118
          Top = 0
          Width = 97
          Height = 21
          Caption = 'Empty filter'
          TabOrder = 0
          OnClick = OperationsBClick
          OnKeyDown = OperationsBKeyDown
        end
        object OperationsE: TEdit
          Left = 51
          Top = 1
          Width = 64
          Height = 21
          TabOrder = 1
          OnChange = OperationsEChange
          OnKeyDown = OperationsEKeyDown
        end
      end
    end
    object ProofTS: TTabSheet
      Caption = 'Proofs'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 703
        Height = 272
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 703
          Height = 93
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object USentencesG: TDBGrid
            Left = 0
            Top = 0
            Width = 403
            Height = 93
            Align = alLeft
            DataSource = USentencesDS
            PopupMenu = ProofPM
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = USentencesGDrawColumnCell
            OnDblClick = USentencesGDblClick
            OnExit = SentencesGExit
            OnKeyDown = USentencesGKyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'SENTENCE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITLE'
                Width = 320
                Visible = True
              end>
          end
          object DBMemo2: TDBMemo
            Left = 403
            Top = 0
            Width = 300
            Height = 93
            Align = alClient
            DataField = 'DESCRIPTION'
            DataSource = USentencesDS
            TabOrder = 1
          end
        end
        object ProoGrid: TStringGrid
          Left = 0
          Top = 93
          Width = 703
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
          PopupMenu = StepsPM
          TabOrder = 1
          OnKeyDown = ProoGridKeyDown
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 272
        Width = 703
        Height = 383
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object StepsG: TDBGrid
          Left = 0
          Top = 0
          Width = 703
          Height = 204
          Align = alClient
          DataSource = StepsDS
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          PopupMenu = StepsPM
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = StepsGDblClick
          OnKeyDown = StepsGKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'STEP'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARG'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SARG'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITLE'
              Width = 324
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMULA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Consolas'
              Font.Style = []
              Width = 143
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINK'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COL'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SCOL'
              Width = 32
              Visible = True
            end>
        end
        object StepGrid: TStringGrid
          Left = 0
          Top = 204
          Width = 703
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
          ParentShowHint = False
          PopupMenu = StepsPM
          ShowHint = False
          TabOrder = 1
          OnKeyDown = StepGridKeyDown
        end
      end
    end
    object DefinitionsTS: TTabSheet
      Caption = 'Definitions'
      ImageIndex = 2
      object Splitter9: TSplitter
        Left = 0
        Top = 473
        Width = 703
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 329
        ExplicitWidth = 147
      end
      object Splitter10: TSplitter
        Left = 0
        Top = 183
        Width = 703
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 185
        ExplicitWidth = 144
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 703
        Height = 183
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object DefinitionsG: TDBGrid
          Left = 0
          Top = 0
          Width = 449
          Height = 183
          Align = alLeft
          DataSource = DefinitionsDS
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = DefinitionsGDrawColumnCell
          OnKeyDown = DefinitionsGKeyDown
          OnKeyPress = DefinitionsGKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'OPERATION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMBER'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SENTENCE'
              Visible = True
            end
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
        object DBMemo4: TDBMemo
          Left = 449
          Top = 0
          Width = 254
          Height = 183
          Align = alClient
          DataField = 'DESCRIPTION'
          DataSource = DefinitionsDS
          TabOrder = 1
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 186
        Width = 703
        Height = 287
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object OSentencesG: TDBGrid
          Left = 0
          Top = 0
          Width = 449
          Height = 287
          Align = alLeft
          DataSource = OSentencesDS
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = OSentencesGDrawColumnCell
          OnDblClick = OSentencesGDblClick
          OnKeyDown = OSentencesGKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'SENTENCE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITLE'
              Width = 341
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KIND'
              Visible = True
            end>
        end
        object DBMemo5: TDBMemo
          Left = 449
          Top = 0
          Width = 254
          Height = 287
          Align = alClient
          DataField = 'DESCRIPTION'
          DataSource = OSentencesDS
          TabOrder = 1
        end
      end
      object DefiGrid: TStringGrid
        Left = 0
        Top = 476
        Width = 703
        Height = 179
        Align = alBottom
        ColCount = 32
        Constraints.MinHeight = 93
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
        ParentShowHint = False
        PopupMenu = StepsPM
        ShowHint = False
        TabOrder = 2
        OnKeyDown = DefiGridKeyDown
      end
    end
    object CategoriesTS: TTabSheet
      Caption = 'Categories'
      ImageIndex = 3
      object Splitter3: TSplitter
        Left = 0
        Top = 183
        Width = 703
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 707
      end
      object Splitter4: TSplitter
        Left = 0
        Top = 473
        Width = 703
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 315
        ExplicitWidth = 340
      end
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 703
        Height = 183
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object CategoriesG: TDBGrid
          Left = 0
          Top = 0
          Width = 229
          Height = 183
          Align = alLeft
          DataSource = CategoriesDS
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = CategoriesGDblClick
          OnExit = CategoriesGExit
          OnKeyDown = CategoriesGKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'TITLE'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clMaroon
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Visible = True
            end>
        end
        object Memo1: TMemo
          Left = 245
          Top = 16
          Width = 220
          Height = 97
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Lines.Strings = (
            'To insert a sentence into a category, '
            'double-click the sentence in the table '
            '"Sentences".'
            ''
            'To insert a category into a sentence, '
            'double-click the category in the table '
            '"Categories".')
          ParentFont = False
          TabOrder = 1
        end
      end
      object VCatSenG: TDBGrid
        Left = 0
        Top = 186
        Width = 703
        Height = 287
        Align = alClient
        DataSource = VCatSenDS
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = VCatSenGDrawColumnCell
        OnDblClick = VCatSenGDblClick
        OnExit = VCatSenGExit
        OnKeyDown = VCatSenGKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SENTENCE'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITLE'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 332
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KIND'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPTION'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 260
            Visible = True
          end>
      end
      object CateGrid: TStringGrid
        Left = 0
        Top = 476
        Width = 703
        Height = 179
        Align = alBottom
        ColCount = 32
        Constraints.MinHeight = 93
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
        ParentShowHint = False
        PopupMenu = StepsPM
        ShowHint = False
        TabOrder = 2
        OnKeyDown = CateGridKeyDown
      end
    end
  end
  object SentencesRulesPC: TPageControl
    Left = 713
    Top = 29
    Width = 649
    Height = 683
    ActivePage = SentencesTS
    Align = alRight
    Constraints.MinWidth = 372
    TabOrder = 3
    OnChanging = SentencesRulesPCChanging
    object SentencesTS: TTabSheet
      Caption = 'Sentences'
      object Splitter7: TSplitter
        Left = 0
        Top = 316
        Width = 641
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 193
        ExplicitWidth = 170
      end
      object SentencesG: TDBGrid
        Left = 0
        Top = 21
        Width = 641
        Height = 295
        Align = alClient
        DataSource = SentencesDS
        PopupMenu = SentencesPM
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = SentencesGDrawColumnCell
        OnDblClick = SentencesGDblClick
        OnExit = SentencesGExit
        OnKeyDown = SentencesGKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SENTENCE'
            ReadOnly = True
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITLE'
            Width = 332
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KIND'
            PickList.Strings = (
              'A'
              'U')
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPTION'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clGray
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 194
            Visible = True
          end>
      end
      object Panel8: TPanel
        Left = 0
        Top = 319
        Width = 641
        Height = 336
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter6: TSplitter
          Left = 0
          Top = 58
          Width = 641
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 110
          ExplicitWidth = 167
        end
        object DBMemo1: TDBMemo
          Left = 0
          Top = 0
          Width = 641
          Height = 58
          Align = alTop
          Constraints.MinHeight = 32
          DataField = 'DESCRIPTION'
          DataSource = SentencesDS
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          OnExit = DBMemo1Exit
          OnKeyDown = DBMemo1KeyDown
        end
        object MatrixTextPC: TPageControl
          Left = 0
          Top = 61
          Width = 641
          Height = 275
          ActivePage = MatrixTS
          Align = alClient
          TabOrder = 1
          OnChange = MatrixTextPCChange
          object MatrixTS: TTabSheet
            Caption = 'Matrix'
            object SentGrid: TStringGrid
              Left = 7
              Top = 0
              Width = 619
              Height = 245
              Align = alClient
              ColCount = 28
              Constraints.MinHeight = 93
              DefaultColWidth = 21
              DefaultRowHeight = 21
              FixedCols = 0
              RowCount = 11
              FixedRows = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = SentGridKeyDown
            end
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 7
              Height = 245
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
            end
            object Panel14: TPanel
              Left = 626
              Top = 0
              Width = 7
              Height = 245
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 2
            end
            object Panel12: TPanel
              Left = 0
              Top = 245
              Width = 633
              Height = 2
              Align = alBottom
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 3
            end
          end
          object TextTS: TTabSheet
            Caption = 'Text'
            ImageIndex = 1
            object SentencesM: TMemo
              Left = 0
              Top = 0
              Width = 569
              Height = 247
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Consolas'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 0
              WordWrap = False
              OnKeyDown = SentencesMKeyDown
            end
            object QuantifiersG: TDBGrid
              Left = 569
              Top = 0
              Width = 64
              Height = 247
              Align = alRight
              DataSource = QuantifiersDS
              TabOrder = 1
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnExit = QuantifiersGExit
              OnKeyDown = QuantifiersGKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'QNAME'
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clMaroon
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = True
                end>
            end
          end
          object UsedTS: TTabSheet
            Caption = 'Used'
            ImageIndex = 2
            object UsedG: TDBGrid
              Left = 0
              Top = 0
              Width = 633
              Height = 247
              Align = alClient
              DataSource = UsedDS
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnDrawColumnCell = UsedGDrawColumnCell
              OnDblClick = UsedGDblClick
              OnKeyDown = UsedGKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SENTENCE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITLE'
                  Width = 324
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KIND'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPTION'
                  Width = 188
                  Visible = True
                end>
            end
          end
          object UsingTS: TTabSheet
            Caption = 'Using'
            ImageIndex = 3
            object UsingG: TDBGrid
              Left = 0
              Top = 0
              Width = 633
              Height = 247
              Align = alClient
              DataSource = UsingDS
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnDrawColumnCell = UsingGDrawColumnCell
              OnDblClick = UsingGDblClick
              OnKeyDown = UsingGKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SENTENCE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITLE'
                  Width = 324
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KIND'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPTION'
                  Width = 188
                  Visible = True
                end>
            end
          end
          object CategoryTS: TTabSheet
            Caption = 'Category'
            ImageIndex = 4
            object VSenCatG: TDBGrid
              Left = 0
              Top = 0
              Width = 633
              Height = 247
              Align = alClient
              BorderStyle = bsNone
              DataSource = VSenCatDS
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnExit = VSenCatGExit
              OnKeyDown = VSenCatGKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TITLE'
                  ReadOnly = True
                  Title.Font.Charset = ANSI_CHARSET
                  Title.Font.Color = clGray
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 604
                  Visible = True
                end>
            end
          end
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 641
        Height = 21
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 2
        object AxiomCB: TCheckBox
          Left = 2
          Top = 0
          Width = 45
          Height = 17
          Caption = 'Axiom'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = AxiomCBClick
        end
        object TheoremCB: TCheckBox
          Left = 54
          Top = 0
          Width = 58
          Height = 17
          Caption = 'Theorem'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = TheoremCBClick
        end
        object RelationCB: TCheckBox
          Left = 119
          Top = 0
          Width = 58
          Height = 17
          Caption = 'Relation'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = RelationCBClick
        end
        object FunctionCB: TCheckBox
          Left = 181
          Top = 0
          Width = 58
          Height = 17
          Caption = 'Function'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = FunctionCBClick
        end
        object UnprovedCB: TCheckBox
          Left = 245
          Top = 0
          Width = 64
          Height = 17
          Caption = 'Unproved'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = UnprovedCBClick
        end
        object AuxCB: TCheckBox
          Left = 314
          Top = 0
          Width = 40
          Height = 17
          Caption = 'Aux'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = AuxCBClick
        end
      end
    end
    object InferencesTS: TTabSheet
      Caption = 'Inferences'
      ImageIndex = 1
      object Splitter8: TSplitter
        Left = 0
        Top = 543
        Width = 641
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 457
        ExplicitWidth = 88
      end
      object RulesG: TDBGrid
        Left = 0
        Top = 0
        Width = 641
        Height = 543
        Align = alClient
        DataSource = RulesDS
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = RulesGDblClick
        OnExit = RulesGExit
        OnKeyDown = RulesGKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'TITLE'
            Width = 608
            Visible = True
          end>
      end
      object DBMemo3: TDBMemo
        Left = 0
        Top = 546
        Width = 641
        Height = 109
        Align = alBottom
        Constraints.MinHeight = 32
        DataField = 'DESCRIPTION'
        DataSource = RulesDS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        OnExit = DBMemo1Exit
        OnKeyDown = DBMemo3KeyDown
      end
    end
    object FormulasTS: TTabSheet
      Caption = 'Formulas'
      ImageIndex = 2
      object FormulasG: TDBGrid
        Left = 0
        Top = 0
        Width = 641
        Height = 599
        Align = alClient
        DataSource = FormulasDS
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = FormulasGDblClick
        OnExit = FormulasGExit
        OnKeyDown = FormulasGKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'RULE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITLE'
            Width = 348
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORMULA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Consolas'
            Font.Style = []
            Width = 230
            Visible = True
          end>
      end
      object FormulasM: TDBMemo
        Left = 0
        Top = 628
        Width = 641
        Height = 27
        Align = alBottom
        DataField = 'DESCRIPTION'
        DataSource = FormulasDS
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnExit = DBMemo1Exit
      end
      object Panel6: TPanel
        Left = 0
        Top = 599
        Width = 641
        Height = 29
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          641
          29)
        object Label1: TLabel
          Left = 8
          Top = 7
          Width = 99
          Height = 13
          Caption = 'Filter for arguments:'
        end
        object FilterE: TEdit
          Left = 113
          Top = 3
          Width = 62
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          MaxLength = 32
          ParentFont = False
          TabOrder = 0
          OnChange = FilterEChange
          OnKeyDown = FilterEKeyDown
          OnKeyPress = FilterEKeyPress
        end
        object FormulaB: TButton
          Left = 545
          Top = 2
          Width = 97
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Insert formula'
          TabOrder = 2
          OnClick = FormulaBClick
          OnKeyDown = FormulaBKeyDown
        end
        object EmptyFilterB: TButton
          Left = 178
          Top = 2
          Width = 88
          Height = 25
          Caption = 'Empty filter'
          TabOrder = 1
          OnClick = EmptyFilterBClick
          OnKeyDown = EmptyFilterBKeyDown
        end
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 1317
    Top = 29
    Width = 22
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'I'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 1343
    Top = 29
    Width = 22
    Height = 22
    Anchors = [akTop, akRight]
    Caption = #7
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object GeneralB: TBitBtn
    Left = 1291
    Top = 29
    Width = 22
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'G'
    PopupMenu = GeneralPM
    TabOrder = 6
    Visible = False
  end
  object Activator: TAZActivator
    Left = 24
    Top = 168
  end
  object LogicDB: TIBODatabase
    CacheStatementHandles = False
    SQLDialect = 3
    DatabaseName = 'LogicTemp'
    Params.Strings = (
      'USER NAME=AZ'
      'CHARACTER SET=ISO8859_1'
      'PROTOCOL=TCP/IP'
      'SERVER=W64'
      'PATH=Logic')
    Isolation = tiCommitted
    DriverName = ''
    SessionName = 'Default'
    Left = 24
    Top = 120
    SavedPassword = '.JuMbLe.01.5D2F073B173F'
  end
  object OperationQ: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'Operation'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select IPut, OPut, Number'
      '  from Operations'
      '  where Operation = :Operation'
      ';')
    Left = 24
    Top = 312
    object OperationQIPUT: TStringField
      DisplayLabel = 'Input'
      FieldName = 'IPUT'
      Origin = 'OPERATIONS.IPUT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object OperationQOPUT: TStringField
      DisplayLabel = 'Output'
      FieldName = 'OPUT'
      Origin = 'OPERATIONS.OPUT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object OperationQNUMBER: TIntegerField
      DisplayLabel = 'Number'
      FieldName = 'NUMBER'
      Origin = 'OPERATIONS.NUMBER'
      Required = True
    end
  end
  object OperationsIQ: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'Operation'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Title'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'IPut'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'OPut'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Number'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'insert into'
      '  Operations(Operation, Title, IPut, OPut, Number)'
      '  Values(:Operation, :Title, :IPut, :OPut, :Number)'
      ';')
    Left = 88
    Top = 312
  end
  object SentencesIQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Title'
        ParamType = ptInput
      end
      item
        DataType = ftMemo
        Name = 'Description'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'Kind'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Operation'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'insert into'
      '  Sentences(Sentence, Title, Description, Kind, Operation)'
      '  Values(:Sentence, :Title, :Description, :Kind, :Operation)'
      ';')
    Left = 152
    Top = 312
  end
  object DetailsIQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Detail'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Operation'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Link'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'insert into'
      '  Details(Sentence, Detail, Operation, Link)'
      '  Values(:Sentence, :Detail, :Operation, :Link)'
      ';')
    Left = 216
    Top = 312
  end
  object SentenceSP: TIBOStoredProc
    Params = <
      item
        DataType = ftInteger
        Name = 'SENTENCE'
        ParamType = ptOutput
      end>
    StoredProcHasDML = True
    StoredProcName = 'SENTENCEPROC'
    Left = 440
    Top = 264
  end
  object DetailsQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Operation, Link, OPut, Number'
      '  from VDetails'
      '  where Sentence = :Sentence'
      '  order by Detail'
      ';')
    Left = 423
    Top = 310
    object DetailsQOPERATION: TStringField
      DisplayLabel = 'Operation'
      FieldName = 'OPERATION'
      Size = 16
    end
    object DetailsQLINK: TIntegerField
      DisplayLabel = 'Link'
      FieldName = 'LINK'
    end
    object DetailsQOPUT: TStringField
      DisplayLabel = 'OPut'
      FieldName = 'OPUT'
      FixedChar = True
      Size = 1
    end
    object DetailsQNUMBER: TIntegerField
      DisplayLabel = 'Number'
      FieldName = 'NUMBER'
    end
  end
  object StepsIQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Step'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Arg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SArg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Rule'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Link'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Col'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SCol'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'insert into'
      '  Steps(Sentence, Step, Arg, SArg, Rule, Link, Col, SCol)'
      
        '  Values(:Sentence, :Step, :Arg, :SArg, :Rule, :Link, :Col, :SCo' +
        'l)'
      ';')
    Left = 280
    Top = 312
  end
  object StepSP: TIBOStoredProc
    Params = <
      item
        DataType = ftInteger
        Name = 'SENTENCE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STEP'
        ParamType = ptOutput
      end>
    StoredProcHasDML = True
    StoredProcName = 'STEPPROC'
    Left = 512
    Top = 264
  end
  object SentencesT: TIBOTable
    KeyLinks.Strings = (
      'SENTENCES.SENTENCE')
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    AfterDelete = SentencesTAfterDelete
    BeforeInsert = SentencesTBeforeInsert
    AfterScroll = SentencesTAfterScroll
    AfterPost = SentencesTAfterPost
    OnPostError = SentencesTPostError
    OnDeleteError = SentencesTDeleteError
    AfterRefresh = SentencesTAfterRefresh
    IndexFieldNames = 'Sentence'
    TableName = 'SENTENCES'
    Left = 296
    Top = 168
    object SentencesTSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      DisplayWidth = 6
      FieldName = 'SENTENCE'
      Origin = 'SENTENCES.SENTENCE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SentencesTTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 64
      FieldName = 'TITLE'
      Origin = 'SENTENCES.TITLE'
      Size = 64
    end
    object SentencesTDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'SENTENCES.DESCRIPTION'
      OnGetText = SentencesTDESCRIPTIONGetText
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
    object SentencesTAUX: TStringField
      DisplayLabel = 'Aux'
      FieldName = 'AUX'
      Origin = 'SENTENCES.AUX'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object SentencesDS: TDataSource
    AutoEdit = False
    DataSet = SentencesT
    Left = 368
    Top = 168
  end
  object Extender: TAZExtender
    AZNavigator = Navigator
    IndexList.Strings = (
      '[SentencesT]'
      'Sentence=Sentence/F'
      'Title=Title;Sentence/F'
      '[USentencesT]'
      'Sentence=Sentence/F'
      'Title=Title;Sentence/F'
      '[RulesT]'
      'Rule=Rule/F'
      'Title=Title;Rule/F'
      '[FormulasT]'
      'Rule=Rule/F'
      'Title=Title;Rule/F'
      'Formula=Formula;Rule/F'
      '[CategoriesT]'
      '<Default>=Category/F'
      'Category=Categories_Title_Category/I')
    Left = 24
    Top = 215
  end
  object USentencesT: TIBOTable
    Filtered = True
    Filter = '(Kind = '#39'U'#39') or (Kind = '#39'T'#39')'
    KeyLinks.Strings = (
      'SENTENCES.SENTENCE')
    PreparedEdits = True
    PreparedInserts = True
    ReadOnly = True
    RecordCountAccurate = True
    AfterScroll = USentencesTAfterScroll
    AfterRefresh = USentencesTAfterRefresh
    IndexFieldNames = 'Sentence'
    TableName = 'SENTENCES'
    Left = 296
    Top = 216
    object USentencesTSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      DisplayWidth = 6
      FieldName = 'SENTENCE'
      Origin = 'SENTENCES.SENTENCE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object USentencesTTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'SENTENCES.TITLE'
      Size = 64
    end
    object USentencesTDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'SENTENCES.DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object USentencesTKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Origin = 'SENTENCES.KIND'
      Required = True
      FixedChar = True
      Size = 1
    end
    object USentencesTOPERATION: TStringField
      DisplayLabel = 'Operation'
      FieldName = 'OPERATION'
      Origin = 'SENTENCES.OPERATION'
      Size = 16
    end
    object USentencesTAUX: TStringField
      DisplayLabel = 'Aux'
      FieldName = 'AUX'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object USentencesDS: TDataSource
    DataSet = USentencesT
    Left = 368
    Top = 216
  end
  object StepsDS: TDataSource
    DataSet = StepsQ
    Left = 512
    Top = 216
  end
  object RulesT: TIBOTable
    ColumnAttributes.Strings = (
      'RULES.FORMULA=REQUIRED'
      'RULES.FUNC=REQUIRED')
    Filtered = True
    Filter = '(Rule > 0) and (Formula is Null)'
    KeyLinks.Strings = (
      'RULES.RULE')
    PreparedEdits = True
    PreparedInserts = True
    ReadOnly = True
    RecordCountAccurate = True
    OnPostError = RulesTPostError
    OnDeleteError = RulesTDeleteError
    IndexFieldNames = 'Title;Rule'
    TableName = 'RULES'
    Left = 368
    Top = 120
    object RulesTRULE: TIntegerField
      DisplayLabel = 'Rule'
      FieldName = 'RULE'
      Origin = 'RULES.RULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RulesTTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'RULES.TITLE'
      Size = 64
    end
    object RulesTDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'RULES.DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object RulesTFUNC: TStringField
      DisplayLabel = 'Function'
      FieldName = 'FUNC'
      Origin = 'RULES.FUNC'
      Required = True
      Size = 32
    end
    object RulesTNUMBER: TIntegerField
      DisplayLabel = 'Number'
      FieldName = 'NUMBER'
      Origin = 'RULES.NUMBER'
      Required = True
    end
  end
  object RulesDS: TDataSource
    DataSet = RulesT
    Left = 440
    Top = 120
  end
  object ChangeKindQ: TIBOQuery
    Params = <
      item
        DataType = ftFixedChar
        Name = 'Kind'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'update Sentences'
      '  set'
      '    Kind = :Kind,'
      '    Ctrl = -Ctrl + 1'
      '  where Sentence = :Sentence'
      ';')
    Left = 352
    Top = 360
  end
  object ChangeKindOpUQ: TIBOQuery
    Params = <
      item
        DataType = ftFixedChar
        Name = 'Kind'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Operation'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'update Sentences'
      '  set'
      '    Kind = :Kind,'
      '    Operation = :Operation,'
      '    Ctrl = -Ctrl + 1'
      '  where Sentence = :Sentence'
      ';')
    Left = 352
    Top = 312
  end
  object SentencesDQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'delete from Details'
      '  where Sentence = :Sentence'
      ';')
    Left = 584
    Top = 264
  end
  object OperationsDS: TDataSource
    DataSet = FormsQ
    Left = 296
    Top = 120
  end
  object FormsQ: TIBOQuery
    ColumnAttributes.Strings = (
      'RELATIONS.OPERATION=REQUIRED'
      'RELATIONS.OPUT=REQUIRED'
      'RELATIONS.NUMBER=REQUIRED'
      'RELATIONS.SENTENCE=REQUIRED')
    Filter = ' '
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Operation, Title, OPut, Number, Sentence, STitle'
      '  from Relations'
      ';')
    Left = 232
    Top = 120
    object FormsQOPERATION: TStringField
      DisplayLabel = 'Operation'
      FieldName = 'OPERATION'
      Origin = 'RELATIONS.OPERATION'
      Required = True
      Size = 16
    end
    object FormsQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'RELATIONS.TITLE'
      Size = 32
    end
    object FormsQOPUT: TStringField
      DisplayLabel = 'OPut'
      FieldName = 'OPUT'
      Origin = 'RELATIONS.OPUT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FormsQNUMBER: TIntegerField
      DisplayLabel = 'Number'
      FieldName = 'NUMBER'
      Origin = 'RELATIONS.NUMBER'
      Required = True
    end
    object FormsQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Origin = 'RELATIONS.SENTENCE'
      Required = True
    end
    object FormsQSTITLE: TStringField
      DisplayLabel = 'Sentence'
      FieldName = 'STITLE'
      Origin = 'RELATIONS.STITLE'
      Size = 32
    end
  end
  object StepsQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    DeleteSQL.Strings = (
      'delete from Steps'
      '  where'
      '    (Sentence = :Sentence)'
      '    and (Step = :Step)'
      ';')
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    AfterScroll = StepsQAfterScroll
    OnPostError = StepsQPostError
    OnDeleteError = StepsQDeleteError
    DataSource = USentencesDS
    SQL.Strings = (
      'select'
      
        '    S.Sentence, S.Step, S.Arg, S.SArg, S.Rule, S.Link, S.Col, S.' +
        'SCol,'
      '    R.Formula,'
      '    IIF(S.Link is Null, R.Title, Sent.Title) as Title'
      '  from'
      '    Steps S'
      '    join Rules R on S.Rule = R.Rule'
      '    left outer join Sentences Sent on S.Link = Sent.Sentence'
      '  where'
      '    S.Sentence = :Sentence'
      '  order by S.Step'
      ';')
    Left = 440
    Top = 216
    object StepsQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Origin = 'STEPS.SENTENCE'
      Required = True
    end
    object StepsQSTEP: TIntegerField
      DisplayLabel = 'Step'
      FieldName = 'STEP'
      Origin = 'STEPS.STEP'
      Required = True
    end
    object StepsQARG: TIntegerField
      DisplayLabel = 'Arg'
      FieldName = 'ARG'
      Origin = 'STEPS.ARG'
    end
    object StepsQSARG: TIntegerField
      DisplayLabel = 'SArg'
      FieldName = 'SARG'
      Origin = 'STEPS.SARG'
    end
    object StepsQRULE: TIntegerField
      DisplayLabel = 'Rule'
      FieldName = 'RULE'
      Origin = 'STEPS.RULE'
    end
    object StepsQFORMULA: TStringField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
      Origin = 'RULES.FORMULA'
      Size = 64
    end
    object StepsQLINK: TIntegerField
      DisplayLabel = 'Sent'
      DisplayWidth = 6
      FieldName = 'LINK'
      Origin = 'STEPS.LINK'
    end
    object StepsQCOL: TIntegerField
      DisplayLabel = 'Col'
      FieldName = 'COL'
      Origin = 'STEPS.COL'
    end
    object StepsQSCOL: TIntegerField
      DisplayLabel = 'SCol'
      FieldName = 'SCOL'
      Origin = 'STEPS.SCOL'
    end
    object StepsQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      ReadOnly = True
      Size = 64
    end
  end
  object FormulasT: TIBOTable
    Filtered = True
    Filter = '(Rule > 0) and (Func is Null)'
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    BeforeInsert = FormulasTBeforeInsert
    OnPostError = FormulasTPostError
    OnDeleteError = FormulasTDeleteError
    IndexFieldNames = 'Title;Rule'
    TableName = 'RULES'
    Left = 512
    Top = 120
    object FormulasTRULE: TIntegerField
      DisplayLabel = 'Rule'
      DisplayWidth = 4
      FieldName = 'RULE'
      Origin = 'RULES.RULE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FormulasTTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'RULES.TITLE'
      Size = 64
    end
    object FormulasTDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'RULES.DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object FormulasTFORMULA: TStringField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
      Origin = 'RULES.FORMULA'
      ReadOnly = True
      Size = 64
    end
  end
  object FormulasDS: TDataSource
    AutoEdit = False
    DataSet = FormulasT
    Left = 584
    Top = 117
  end
  object ReductioQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Step'
      '  from Steps'
      '  where'
      '    (Sentence = :Sentence)'
      '    and (Rule = 15)'
      ';')
    Left = 280
    Top = 360
    object ReductioQSTEP: TIntegerField
      DisplayLabel = 'Step'
      FieldName = 'STEP'
      Required = True
    end
  end
  object RulesTC: TIBOTable
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    TableName = 'RULES'
    Left = 88
    Top = 360
    object RulesTCRULE: TIntegerField
      DisplayLabel = 'Rule'
      FieldName = 'RULE'
      Required = True
    end
    object RulesTCTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Size = 64
    end
    object RulesTCDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object RulesTCFORMULA: TStringField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
      Size = 64
    end
    object RulesTCARG1: TStringField
      DisplayLabel = 'Arg1'
      FieldName = 'ARG1'
      Size = 32
    end
    object RulesTCARG2: TStringField
      DisplayLabel = 'Arg2'
      FieldName = 'ARG2'
      Size = 32
    end
    object RulesTCFUNC: TStringField
      DisplayLabel = 'Func'
      FieldName = 'FUNC'
      Size = 32
    end
    object RulesTCNUMBER: TIntegerField
      DisplayLabel = 'Number'
      FieldName = 'NUMBER'
      Required = True
    end
  end
  object StepsPM: TPopupMenu
    Left = 168
    Top = 216
    object Gotosentences1: TMenuItem
      Caption = 'Go to sentences'
      ShortCut = 24659
      OnClick = Gotosentences1Click
    end
    object Gotofunctions1: TMenuItem
      Caption = 'Go to inferences'
      ShortCut = 24649
      OnClick = Gotofunctions1Click
    end
    object Gotoformulas1: TMenuItem
      Caption = 'Go to formulas'
      ShortCut = 24646
      OnClick = Gotoformulas1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'All files|*.*|csv-files|*.csv|Text files|*.txt'
    Title = 'Save proof'
    Left = 168
    Top = 120
  end
  object TermsQ: TIBOQuery
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Operation, Title, OPut, Number, Sentence, STitle'
      '  from Functions'
      ';'
      '')
    Left = 232
    Top = 168
    object TermsQOPERATION: TStringField
      DisplayLabel = 'Operation'
      FieldName = 'OPERATION'
      Required = True
      Size = 16
    end
    object TermsQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Size = 32
    end
    object TermsQOPUT: TStringField
      DisplayLabel = 'OPut'
      FieldName = 'OPUT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object TermsQNUMBER: TIntegerField
      DisplayLabel = 'Number'
      FieldName = 'NUMBER'
      Required = True
    end
    object TermsQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Required = True
    end
    object TermsQSTITLE: TStringField
      DisplayLabel = 'Sentence'
      FieldName = 'STITLE'
      Size = 64
    end
  end
  object NixQ: TIBOQuery
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select O.Operation, O.Title, O.Oput, O.Number, S.Sentence, S.Tit' +
        'le as STitle'
      '  from'
      '    Operations O'
      '    join Sentences S on'
      '      O.Operation = S.Operation'
      '  where O.OPut = '#39'X'#39
      '  order by O.OPut, O.Operation'
      ';'
      '')
    Left = 232
    Top = 216
    object NixQOPERATION: TStringField
      DisplayLabel = 'Operation'
      FieldName = 'OPERATION'
      Required = True
      Size = 16
    end
    object NixQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Size = 32
    end
    object NixQOPUT: TStringField
      DisplayLabel = 'OPut'
      FieldName = 'OPUT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object NixQNUMBER: TIntegerField
      DisplayLabel = 'Number'
      FieldName = 'NUMBER'
      Required = True
    end
    object NixQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Required = True
    end
    object NixQSTITLE: TStringField
      DisplayLabel = 'Sentence'
      FieldName = 'STITLE'
      Size = 64
    end
  end
  object DeleteProofSP: TIBOStoredProc
    Params = <
      item
        DataType = ftInteger
        Name = 'SENTENCE'
        ParamType = ptInput
      end>
    StoredProcHasDML = True
    StoredProcName = 'DELETEPROOF'
    Left = 648
    Top = 264
  end
  object SentencesPM: TPopupMenu
    Left = 96
    Top = 168
    object CopySentence1: TMenuItem
      Caption = 'Copy sentence'
      ShortCut = 24643
      OnClick = CopySentence1Click
    end
    object Copysentencetoclipboard1: TMenuItem
      Caption = 'Copy sentence to clipboard'
      ShortCut = 24664
      OnClick = Copysentencetoclipboard1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object SwitchAux1: TMenuItem
      Caption = 'Switch Aux'
      ShortCut = 24641
      OnClick = SwitchAux1Click
    end
  end
  object ProofPM: TPopupMenu
    Left = 168
    Top = 168
    object Saveproof2: TMenuItem
      Caption = 'Save proof'
      ShortCut = 24659
      OnClick = Saveproof2Click
    end
    object Savethesentencesoftheproof1: TMenuItem
      Caption = 'Save the sentences of the proof'
      OnClick = Savethesentencesoftheproof1Click
    end
    object Savethestepsoftheproof1: TMenuItem
      Caption = 'Save the steps of the proof'
      OnClick = Savethestepsoftheproof1Click
    end
    object Deleteproof2: TMenuItem
      Caption = 'Delete proof'
      ShortCut = 24622
      OnClick = Deleteproof2Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Loadproof1: TMenuItem
      Caption = 'Load proof'
      ShortCut = 24652
      OnClick = Loadproof1Click
    end
  end
  object View1: TView
    Title = 'Position'
    Left = 96
    Top = 216
  end
  object StepsTQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select'
      '    S.Step, S.Arg, S.SArg, S.Rule, S.Link, S.Col, S.SCol,'
      '    R.Formula,'
      '    IIF(S.Link is Null, R.Title, Sent.Title) as Title'
      '  from'
      '    Steps S'
      '    join Rules R on S.Rule = R.Rule'
      '    left outer join Sentences Sent on S.Link = Sent.Sentence'
      '  where'
      '    S.Sentence = :Sentence'
      '  order by S.Step'
      ';')
    Left = 152
    Top = 360
    object StepsTQSTEP: TIntegerField
      DisplayLabel = 'Step'
      FieldName = 'STEP'
      Required = True
    end
    object StepsTQARG: TIntegerField
      DisplayLabel = 'Arg'
      FieldName = 'ARG'
    end
    object StepsTQSARG: TIntegerField
      DisplayLabel = 'SArg'
      FieldName = 'SARG'
    end
    object StepsTQRULE: TIntegerField
      DisplayLabel = 'Rule'
      FieldName = 'RULE'
    end
    object StepsTQLINK: TIntegerField
      DisplayLabel = 'Link'
      FieldName = 'LINK'
    end
    object StepsTQCOL: TIntegerField
      DisplayLabel = 'Col'
      FieldName = 'COL'
    end
    object StepsTQSCOL: TIntegerField
      DisplayLabel = 'SCol'
      FieldName = 'SCOL'
    end
    object StepsTQFORMULA: TStringField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
      Size = 64
    end
    object StepsTQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      ReadOnly = True
      Size = 64
    end
  end
  object DeleteQuantifierQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Step'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select S.Sentence'
      '  from'
      '    Steps T'
      '    join Sentences S on'
      '      T.Link = S.Sentence'
      '  where'
      '    (T.Sentence = :Sentence)'
      '    and (T.Rule = 0)'
      '    and (T.Step <> :Step)'
      ';')
    Left = 496
    Top = 312
    object DeleteQuantifierQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Required = True
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.csv'
    Filter = 'All files|*.*|csv-files|*.csv|Text files|*.txt'
    Title = 'Load proof'
    Left = 96
    Top = 120
  end
  object StepsVQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select'
      '    S.Step, S.Arg, S.SArg, S.Rule, S.Link, S.Col, S.SCol,'
      '    R.Formula'
      '  from'
      '    Steps S'
      '    join Rules R on S.Rule = R.Rule'
      '  where'
      '    S.Sentence = :Sentence'
      '  order by S.Step'
      ';')
    Left = 24
    Top = 360
    object StepsVQSTEP: TIntegerField
      FieldName = 'STEP'
      Required = True
    end
    object StepsVQARG: TIntegerField
      FieldName = 'ARG'
    end
    object StepsVQSARG: TIntegerField
      FieldName = 'SARG'
    end
    object StepsVQRULE: TIntegerField
      FieldName = 'RULE'
    end
    object StepsVQLINK: TIntegerField
      FieldName = 'LINK'
    end
    object StepsVQCOL: TIntegerField
      FieldName = 'COL'
    end
    object StepsVQSCOL: TIntegerField
      FieldName = 'SCOL'
    end
    object StepsVQFORMULA: TStringField
      FieldName = 'FORMULA'
      Size = 64
    end
  end
  object DefinitionsQ: TIBOQuery
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select O.Operation, O.Number, S.Sentence, S.Description, O.Title' +
        ', S.Kind'
      '  from'
      '    Operations O'
      '    join Sentences S on O.Operation = S.Operation'
      '  where Aux = '#39'0'#39
      '  order by Operation'
      ';')
    Left = 24
    Top = 264
    object DefinitionsQOPERATION: TStringField
      DisplayLabel = 'Definition'
      FieldName = 'OPERATION'
      Origin = 'OPERATIONS.OPERATION'
      Required = True
      Size = 16
    end
    object DefinitionsQNUMBER: TIntegerField
      DisplayLabel = 'Args'
      DisplayWidth = 4
      FieldName = 'NUMBER'
      Origin = 'OPERATIONS.NUMBER'
      Required = True
    end
    object DefinitionsQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Origin = 'SENTENCES.SENTENCE'
      Required = True
    end
    object DefinitionsQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'OPERATIONS.TITLE'
      Size = 32
    end
    object DefinitionsQDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'SENTENCES.DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object DefinitionsQKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Origin = 'SENTENCES.KIND'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object DefinitionsDS: TDataSource
    DataSet = DefinitionsQ
    OnDataChange = DefinitionsDSDataChange
    Left = 96
    Top = 264
  end
  object OSentencesQ: TIBOQuery
    Params = <
      item
        DataType = ftString
        Name = 'Operation'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    AfterScroll = OSentencesQAfterScroll
    AfterRefresh = OSentencesQAfterRefresh
    DataSource = DefinitionsDS
    SQL.Strings = (
      'select distinct'
      '    D.Sentence, S.Title, S.Description, S.Kind, S.Aux'
      '  from'
      '    Details D'
      '    join Sentences S on D.Sentence = S.Sentence'
      '  where'
      '    (D.Operation = :Operation)'
      '    and (S.Aux = '#39'0'#39')'
      '  order by'
      '    S.Sentence'
      ';')
    Left = 168
    Top = 264
    object OSentencesQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      DisplayWidth = 6
      FieldName = 'SENTENCE'
      Origin = 'DETAILS.SENTENCE'
      Required = True
    end
    object OSentencesQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'RENTENCES.TITLE'
      Size = 64
    end
    object OSentencesQDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'SENTENCES.DESCRIPTION'
      BlobType = ftMemo
      Size = 8
    end
    object OSentencesQKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Origin = 'SENTENCES.KIND'
      Required = True
      FixedChar = True
      Size = 1
    end
    object OSentencesQAUX: TStringField
      DisplayLabel = 'Aux'
      FieldName = 'AUX'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object OSentencesDS: TDataSource
    DataSet = OSentencesQ
    Left = 240
    Top = 264
  end
  object QuantifiersQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select QNr, QName'
      '  from Quantifiers'
      '  where Sentence = :Sentence'
      ';')
    Left = 496
    Top = 360
    object QuantifiersQQNR: TIntegerField
      DisplayLabel = 'Nr'
      FieldName = 'QNR'
      Required = True
    end
    object QuantifiersQQNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'QNAME'
      Required = True
      Size = 4
    end
  end
  object QuantifiersT: TIBOTable
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    AfterDelete = QuantifiersTAfterDelete
    BeforePost = QuantifiersTBeforePost
    AfterPost = QuantifiersTAfterPost
    OnNewRecord = QuantifiersTNewRecord
    OnPostError = QuantifiersTPostError
    OnDeleteError = QuantifiersTDeleteError
    MasterFields = 'Sentence'
    MasterSource = SentencesDS
    TableName = 'QUANTIFIERS'
    Left = 440
    Top = 168
    object QuantifiersTSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Origin = 'QUANTIFIERS.SENTENCE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QuantifiersTQNR: TIntegerField
      DisplayLabel = 'Nr'
      DisplayWidth = 2
      FieldName = 'QNR'
      Origin = 'QUANTIFIERS.QNR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QuantifiersTQNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'QNAME'
      Origin = 'QUANTIFIERS.QNAME'
      Required = True
      Size = 4
    end
  end
  object QuantifiersDS: TDataSource
    DataSet = QuantifiersT
    Left = 512
    Top = 168
  end
  object QuantifiersNumberQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select max(QNr) as Number'
      '  from Quantifiers'
      '  where Sentence = :Sentence'
      ';')
    Left = 296
    Top = 264
    object QuantifiersNumberQNUMBER: TIntegerField
      DisplayLabel = 'Number'
      FieldName = 'NUMBER'
      ReadOnly = True
      Required = True
    end
  end
  object UsedQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    DataSource = SentencesDS
    SQL.Strings = (
      'select S.Sentence, S.Title, S.Description, S.Kind, S.Aux'
      '  from'
      '    Steps P'
      '    join Sentences S on P.Link = S.Sentence'
      '  where'
      '    P.Sentence = :Sentence'
      '  order by'
      '    S.Sentence'
      ';')
    Left = 24
    Top = 408
    object UsedQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      DisplayWidth = 6
      FieldName = 'SENTENCE'
      Origin = 'SENTENCES.SENTENCE'
      Required = True
    end
    object UsedQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'SENTENCES.TITLE'
      Size = 64
    end
    object UsedQDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'SENTENCES.DESCRIPTION'
      OnGetText = UsedQDESCRIPTIONGetText
      BlobType = ftMemo
      Size = 8
    end
    object UsedQKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Origin = 'SENTENCES.KIND'
      Required = True
      FixedChar = True
      Size = 1
    end
    object UsedQAUX: TStringField
      DisplayLabel = 'Aux'
      FieldName = 'AUX'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object UsedDS: TDataSource
    DataSet = UsedQ
    Left = 88
    Top = 408
  end
  object UsingQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    DataSource = SentencesDS
    SQL.Strings = (
      'select S.Sentence, S.Title, S.Description, S.Kind, S.Aux'
      '  from'
      '    Steps P'
      '    join Sentences S on P.Sentence = S.Sentence'
      '  where'
      '    P.Link = :Sentence'
      '  order by'
      '    S.Sentence'
      ';')
    Left = 152
    Top = 408
    object UsingQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      DisplayWidth = 6
      FieldName = 'SENTENCE'
      Required = True
    end
    object UsingQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Size = 64
    end
    object UsingQDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      OnGetText = UsingQDESCRIPTIONGetText
      BlobType = ftMemo
      Size = 8
    end
    object UsingQKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Required = True
      FixedChar = True
      Size = 1
    end
    object UsingQAUX: TStringField
      DisplayLabel = 'Aux'
      FieldName = 'AUX'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object UsingDS: TDataSource
    DataSet = UsingQ
    Left = 216
    Top = 408
  end
  object CategoriesT: TIBOTable
    KeyLinks.Strings = (
      'CATEGORIES.CATEGORY')
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    AfterDelete = CategoriesTAfterDelete
    AfterInsert = CategoriesTAfterInsert
    AfterScroll = CategoriesTAfterScroll
    AfterPost = CategoriesTAfterPost
    OnNewRecord = CategoriesTNewRecord
    OnPostError = CategoriesTPostError
    OnDeleteError = CategoriesTDeleteError
    IndexFieldNames = 'Title'
    TableName = 'CATEGORIES'
    Left = 352
    Top = 408
    object CategoriesTCATEGORY: TIntegerField
      DisplayLabel = 'Category'
      FieldName = 'CATEGORY'
      Origin = 'CATEGORIES.CATEGORY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CategoriesTTITLE: TStringField
      DisplayLabel = 'Category'
      FieldName = 'TITLE'
      Origin = 'CATEGORIES.TITLE'
      Required = True
      Size = 32
    end
  end
  object CategoriesDS: TDataSource
    AutoEdit = False
    DataSet = CategoriesT
    Left = 416
    Top = 408
  end
  object CategorySP: TIBOStoredProc
    StoredProcHasDML = True
    StoredProcName = 'CATEGORYPROC'
    Left = 288
    Top = 408
  end
  object VCatSenT: TIBOTable
    KeyLinks.Strings = (
      'SENTENCE'
      'CATEGORY')
    KeyLinksAutoDefine = False
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    BeforeEdit = VCatSenTBeforeEdit
    AfterDelete = VCatSenTAfterDelete
    AfterScroll = VCatSenTAfterScroll
    AfterPost = VCatSenTAfterPost
    OnPostError = VCatSenTPostError
    OnDeleteError = VCatSenTDeleteError
    MasterFields = 'Category'
    MasterSource = CategoriesDS
    TableName = 'VCATSEN'
    Left = 480
    Top = 408
    object VCatSenTSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Origin = 'VCATSEN.SENTENCE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object VCatSenTCATEGORY: TIntegerField
      DisplayLabel = 'Category'
      FieldName = 'CATEGORY'
      Origin = 'VCATSEN.CATEGORY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object VCatSenTTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'VCATSEN.TITLE'
      ReadOnly = True
      Size = 64
    end
    object VCatSenTDESCRIPTION: TMemoField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'VCATSEN.DESCRIPTION'
      ReadOnly = True
      OnGetText = VCatSenTDESCRIPTIONGetText
      BlobType = ftMemo
      Size = 8
    end
    object VCatSenTKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Origin = 'VCATSEN.KIND'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object VCatSenTAUX: TStringField
      DisplayLabel = 'Aux'
      FieldName = 'AUX'
      FixedChar = True
      Size = 1
    end
  end
  object VCatSenDS: TDataSource
    DataSet = VCatSenT
    Left = 544
    Top = 408
  end
  object VSenCatT: TIBOTable
    KeyLinks.Strings = (
      'SENTENCE'
      'CATEGORY')
    KeyLinksAutoDefine = False
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    BeforeEdit = VSenCatTBeforeEdit
    AfterDelete = VSenCatTAfterDelete
    BeforeInsert = VSenCatTBeforeInsert
    AfterPost = VSenCatTAfterPost
    OnPostError = VSenCatTPostError
    OnDeleteError = VSenCatTDeleteError
    MasterFields = 'Sentence'
    MasterSource = SentencesDS
    TableName = 'VSENCAT'
    Left = 584
    Top = 168
    object VSenCatTSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Origin = 'VSENCAT.SENTENCE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object VSenCatTCATEGORY: TIntegerField
      DisplayLabel = 'Category'
      FieldName = 'CATEGORY'
      Origin = 'VSENCAT.CATEGORY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object VSenCatTTITLE: TStringField
      DisplayLabel = 'Category'
      FieldName = 'TITLE'
      Origin = 'VSENCAT.TITLE'
      Size = 32
    end
  end
  object VSenCatDS: TDataSource
    DataSet = VSenCatT
    Left = 648
    Top = 168
  end
  object ProofHasSentenceQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    DataSource = USentencesDS
    SQL.Strings = (
      'select count(*) as Number'
      '  from Steps'
      '  where'
      '    (Sentence = :Sentence)'
      '    and (Rule in (15, 20, 29))'
      ';')
    Left = 656
    Top = 216
  end
  object GetKindQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Kind'
      '  from Sentences'
      '  where Sentence = :Sentence'
      ';')
    Left = 664
    Top = 360
  end
  object SentView: TView
    Title = 'Sentence'
    Left = 664
    Top = 408
  end
  object GeneralPM: TPopupMenu
    Left = 644
    Top = 117
    object Verifyproof1: TMenuItem
      Caption = 'Verify proof'
      OnClick = Verifyproof1Click
    end
    object Verifyalltheproofs1: TMenuItem
      Caption = 'Verify all the proofs'
      OnClick = Verifyalltheproofs1Click
    end
    object Extractallthesentences1: TMenuItem
      Caption = 'Extract sentences from to'
      OnClick = Extractallthesentences1Click
    end
    object Extractsentencesastext1: TMenuItem
      Caption = 'Extract sentences as text'
      OnClick = Extractsentencesastext1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Sevesentenceat1: TMenuItem
      Caption = 'Seve sentence at'
      OnClick = Sevesentenceat1Click
    end
    object Loadproofat1: TMenuItem
      Caption = 'Load proof at'
      OnClick = Loadproofat1Click
    end
  end
  object SentencesTQ: TIBOQuery
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Sentence, Title, Kind'
      '  from Sentences'
      '  where Kind <> '#39'U'#39
      '  order by Sentence'
      ';')
    Left = 216
    Top = 360
    object SentencesTQSENTENCE: TIntegerField
      DisplayLabel = 'Sentence'
      FieldName = 'SENTENCE'
      Origin = 'SENTENCES.SENTENCE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SentencesTQTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'SENTENCES.TITLE'
      Size = 64
    end
    object SentencesTQKIND: TStringField
      DisplayLabel = 'Kind'
      FieldName = 'KIND'
      Origin = 'SENTENCES.KIND'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object SentenceExistsSP: TIBOStoredProc
    Params = <
      item
        DataType = ftInteger
        Name = 'CSENTENCE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DSENTENCE'
        ParamType = ptOutput
      end>
    StoredProcHasDML = True
    StoredProcName = 'SENTENCEEXISTS'
    Left = 648
    Top = 312
  end
  object StepDetailsIQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Step'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Detail'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Operation'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Link'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'insert into'
      '  StepDetails(Sentence, Step, Detail, Operation, Link)'
      '  values(:Sentence, :Step, :Detail, :Operation, :Link)'
      ';')
    Left = 424
    Top = 360
  end
  object StepDetailsQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Step'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Operation, Link, OPut, Number'
      '  from VStepDetails'
      '  where'
      '    (Sentence = :Sentence)'
      '    and (Step = :Step)'
      '  order by Detail'
      ';'
      '')
    Left = 576
    Top = 360
  end
  object SentencesQ: TIBOQuery
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'select Sentence'
      '  from Sentences'
      '  where Kind <> '#39'U'#39
      ';')
    Left = 568
    Top = 312
  end
  object FirstDifPosSP: TIBOStoredProc
    Params = <
      item
        DataType = ftInteger
        Name = 'SENTENCE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STEP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POS'
        ParamType = ptOutput
      end>
    StoredProcHasDML = True
    StoredProcName = 'FIRSTDIFPOS'
    Left = 584
    Top = 216
  end
  object FromToView1: TFromToView
    Title = 'Select sentences'
    FromText = 'From sentence'
    ToText = 'To sentence'
    Left = 608
    Top = 408
  end
  object QuantIQ: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'Sentence'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QNr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'QName'
        ParamType = ptInput
      end>
    IB_Connection = LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'insert into'
      '  Quantifiers(Sentence, QNr, QName)'
      '  Values(:Sentence, :QNr, :QName)'
      ';')
    Left = 368
    Top = 264
  end
end
