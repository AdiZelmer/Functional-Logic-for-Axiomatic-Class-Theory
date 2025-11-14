object TreeSentenceF: TTreeSentenceF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Sentence as tree'
  ClientHeight = 406
  ClientWidth = 297
  Color = clBtnFace
  Constraints.MinHeight = 445
  Constraints.MinWidth = 313
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 381
    Width = 297
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object CancelB: TButton
      Left = 222
      Top = 0
      Width = 75
      Height = 25
      Align = alRight
      Cancel = True
      Caption = 'Close'
      Default = True
      ModalResult = 2
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      297
      25)
    object Label1: TLabel
      Left = 16
      Top = 5
      Width = 24
      Height = 13
      Caption = 'Title:'
    end
    object TitleE: TEdit
      Left = 45
      Top = 2
      Width = 252
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 64
      TabOrder = 0
    end
  end
  object Tree: TTreeView
    Left = 0
    Top = 25
    Width = 297
    Height = 356
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    Indent = 19
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
end
