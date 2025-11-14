object FormulaF: TFormulaF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Formula'
  ClientHeight = 100
  ClientWidth = 300
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
  object DescriptionM: TMemo
    Left = 0
    Top = 48
    Width = 300
    Height = 27
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    ExplicitHeight = 127
  end
  object Panel1: TPanel
    Left = 0
    Top = 75
    Width = 300
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 175
    object VerifyB: TButton
      Left = 113
      Top = 0
      Width = 74
      Height = 25
      Caption = 'Verify'
      TabOrder = 0
      OnClick = VerifyBClick
    end
    object CancelB: TButton
      Left = 225
      Top = 0
      Width = 75
      Height = 25
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object SaveB: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 25
      Align = alLeft
      Caption = 'Save'
      Default = True
      Enabled = False
      TabOrder = 2
      OnClick = SaveBClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      300
      25)
    object Label1: TLabel
      Left = 16
      Top = 5
      Width = 42
      Height = 13
      Caption = 'Formula:'
    end
    object FormulaE: TEdit
      Left = 64
      Top = 2
      Width = 234
      Height = 22
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      MaxLength = 64
      ParentFont = False
      TabOrder = 0
      OnChange = FormulaEChange
      OnKeyPress = FormulaEKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 25
    Width = 300
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      300
      23)
    object Label2: TLabel
      Left = 16
      Top = 3
      Width = 24
      Height = 13
      Caption = 'Title:'
    end
    object TitleE: TEdit
      Left = 64
      Top = 0
      Width = 234
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 64
      TabOrder = 0
    end
  end
  object FormulaIQ: TIBOQuery
    Params = <
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
        DataType = ftString
        Name = 'Formula'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Arg1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Arg2'
        ParamType = ptInput
      end>
    IB_Connection = HauptF.LogicDB
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    SQL.Strings = (
      'insert into'
      '  Rules(Rule, Title, Description, Formula, Arg1, Arg2)'
      '  Values(0, :Title, :Description, :Formula, :Arg1, :Arg2)'
      ';')
    Left = 96
    Top = 24
  end
end
