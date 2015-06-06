object FormOptions: TFormOptions
  Left = 328
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 151
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BevelPref: TBevel
    Left = 5
    Top = 10
    Width = 196
    Height = 101
    Shape = bsFrame
  end
  object LabelPref: TLabel
    Left = 10
    Top = 4
    Width = 63
    Height = 13
    Caption = ' Preferences '
  end
  object LabelInitFirst: TLabel
    Left = 35
    Top = 65
    Width = 119
    Height = 13
    Caption = 'Initial &first card pair value:'
    FocusControl = EditInitFirst
  end
  object BevelNames: TBevel
    Left = 210
    Top = 10
    Width = 196
    Height = 101
    Shape = bsFrame
  end
  object LabelNames: TLabel
    Left = 215
    Top = 4
    Width = 71
    Height = 13
    Caption = ' Player Names '
  end
  object LabelPlayer2: TLabel
    Left = 220
    Top = 30
    Width = 41
    Height = 13
    Caption = 'Player &2:'
    FocusControl = EditPlayer2
  end
  object LabelPlayer3: TLabel
    Left = 220
    Top = 55
    Width = 41
    Height = 13
    Caption = 'Player &3:'
    FocusControl = EditPlayer3
  end
  object LabelPlayer4: TLabel
    Left = 220
    Top = 80
    Width = 41
    Height = 13
    Caption = 'Player &4:'
    FocusControl = EditPlayer4
  end
  object cbPassCard: TCheckBox
    Left = 15
    Top = 25
    Width = 126
    Height = 17
    Caption = '&Passing card required.'
    TabOrder = 0
  end
  object cbIncFirst: TCheckBox
    Left = 15
    Top = 45
    Width = 156
    Height = 17
    Caption = '&Increase first card pair value.'
    TabOrder = 1
    OnClick = cbIncFirstClick
  end
  object EditPlayer2: TEdit
    Left = 275
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object EditPlayer3: TEdit
    Left = 275
    Top = 50
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object EditPlayer4: TEdit
    Left = 275
    Top = 75
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object ButtonOK: TButton
    Left = 330
    Top = 120
    Width = 76
    Height = 26
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 5
    OnClick = ButtonOKClick
  end
  object ButtonCancel: TButton
    Left = 245
    Top = 120
    Width = 76
    Height = 26
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object EditInitFirst: TMaskEdit
    Left = 35
    Top = 80
    Width = 41
    Height = 21
    EditMask = '9;0; '
    MaxLength = 1
    TabOrder = 7
  end
end
