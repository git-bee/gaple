object FormNew: TFormNew
  Left = 777
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Create Game'
  ClientHeight = 461
  ClientWidth = 236
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
  object BevelGame: TBevel
    Left = 5
    Top = 10
    Width = 226
    Height = 6
    Shape = bsTopLine
  end
  object LabelKind: TLabel
    Left = 10
    Top = 50
    Width = 54
    Height = 13
    Caption = 'Game &kind:'
    FocusControl = cbKind
  end
  object LabelName: TLabel
    Left = 10
    Top = 25
    Width = 54
    Height = 13
    Caption = 'Your &name:'
    FocusControl = EditName
  end
  object LabelIP: TLabel
    Left = 10
    Top = 95
    Width = 47
    Height = 13
    Caption = 'Server &IP:'
    FocusControl = EditIP
  end
  object BevelClient: TBevel
    Left = 5
    Top = 80
    Width = 226
    Height = 6
    Shape = bsTopLine
  end
  object BevelButton: TBevel
    Left = 5
    Top = 420
    Width = 226
    Height = 6
    Shape = bsTopLine
  end
  object LabelClient: TLabel
    Left = 10
    Top = 74
    Width = 46
    Height = 13
    Caption = ' As client '
  end
  object LabelGame: TLabel
    Left = 10
    Top = 4
    Width = 57
    Height = 13
    Caption = ' Game type '
  end
  object LabelPlayer2: TLabel
    Left = 10
    Top = 170
    Width = 64
    Height = 13
    Caption = 'Player &2 type:'
    FocusControl = cbPlayer2
  end
  object LabelPlayer3: TLabel
    Left = 10
    Top = 195
    Width = 64
    Height = 13
    Caption = 'Player &3 type:'
    FocusControl = cbPlayer3
  end
  object LabelPlayer4: TLabel
    Left = 10
    Top = 220
    Width = 64
    Height = 13
    Caption = 'Player &4 type:'
    FocusControl = cbPlayer4
  end
  object BevelServer: TBevel
    Left = 5
    Top = 155
    Width = 226
    Height = 6
    Shape = bsTopLine
  end
  object LabelServer: TLabel
    Left = 10
    Top = 149
    Width = 50
    Height = 13
    Caption = ' As server '
  end
  object BevelMsg: TBevel
    Left = 5
    Top = 280
    Width = 226
    Height = 6
    Shape = bsTopLine
  end
  object LabelMsg: TLabel
    Left = 10
    Top = 274
    Width = 96
    Height = 13
    Caption = ' Network messages '
  end
  object cbKind: TComboBox
    Left = 90
    Top = 45
    Width = 141
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'Alone against computer'
    OnSelect = cbKindSelect
    Items.Strings = (
      'Alone against computer'
      'Multiplayer as server'
      'Multiplayer as client')
  end
  object EditName: TEdit
    Left = 90
    Top = 20
    Width = 141
    Height = 21
    TabOrder = 0
  end
  object ButtonStart: TButton
    Left = 155
    Top = 430
    Width = 76
    Height = 26
    Caption = '&Start Game'
    Default = True
    ModalResult = 1
    TabOrder = 10
    OnClick = ButtonStartClick
  end
  object ButtonCancel: TButton
    Left = 80
    Top = 430
    Width = 71
    Height = 26
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 11
    OnClick = ButtonCancelClick
  end
  object EditIP: TEdit
    Left = 90
    Top = 90
    Width = 141
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object MemoMsg: TMemo
    Left = 5
    Top = 290
    Width = 226
    Height = 71
    TabStop = False
    Enabled = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 12
  end
  object cbPlayer4: TComboBox
    Left = 90
    Top = 215
    Width = 141
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = 'Network player'
    Items.Strings = (
      'Network player'
      'Computer player')
  end
  object cbPlayer3: TComboBox
    Left = 90
    Top = 190
    Width = 141
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = 'Network player'
    Items.Strings = (
      'Network player'
      'Computer player')
  end
  object cbPlayer2: TComboBox
    Left = 90
    Top = 165
    Width = 141
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = 'Network player'
    Items.Strings = (
      'Network player'
      'Computer player')
  end
  object ButtonServer: TButton
    Left = 165
    Top = 245
    Width = 66
    Height = 21
    Caption = '&Create'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = ButtonServerClick
  end
  object ButtonClient: TButton
    Left = 165
    Top = 120
    Width = 66
    Height = 21
    Caption = '&Join'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = ButtonClientClick
  end
  object EditMsg: TEdit
    Left = 5
    Top = 365
    Width = 226
    Height = 21
    TabOrder = 8
    OnEnter = EditMsgEnter
    OnExit = EditMsgExit
  end
  object ButtonMsg: TButton
    Left = 165
    Top = 390
    Width = 66
    Height = 21
    Caption = '&Send'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = ButtonMsgClick
  end
end
