object SaveF: TSaveF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Save'
  ClientHeight = 200
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DescriptionM: TMemo
    Left = 0
    Top = 25
    Width = 300
    Height = 150
    Align = alClient
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 175
    Width = 300
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object AxiomB: TButton
      Left = 113
      Top = 0
      Width = 74
      Height = 25
      Caption = 'Axiom'
      ModalResult = 6
      TabOrder = 1
      Visible = False
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
      TabOrder = 2
    end
    object SaveB: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 25
      Align = alLeft
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
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
      Width = 24
      Height = 13
      Caption = 'Title:'
    end
    object TitleE: TEdit
      Left = 48
      Top = 2
      Width = 250
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 64
      TabOrder = 0
    end
  end
end
