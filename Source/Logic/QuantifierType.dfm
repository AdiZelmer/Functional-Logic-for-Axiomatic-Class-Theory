object QuantifierTypeF: TQuantifierTypeF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Type'
  ClientHeight = 193
  ClientWidth = 149
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
  object QuantifierRG: TRadioGroup
    Left = 6
    Top = 17
    Width = 137
    Height = 65
    Caption = 'Quantifier'
    ItemIndex = 0
    Items.Strings = (
      'Universal quantifier'
      'Existential quantifier')
    TabOrder = 0
  end
  object ConditionRG: TRadioGroup
    Left = 6
    Top = 95
    Width = 137
    Height = 65
    Caption = 'Condition'
    ItemIndex = 0
    Items.Strings = (
      'No condition'
      'Condition as set')
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 168
    Width = 149
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 175
    ExplicitWidth = 300
    object CancelB: TButton
      Left = 74
      Top = 0
      Width = 75
      Height = 25
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 225
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
end
