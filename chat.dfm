object FormChat: TFormChat
  Left = 510
  Top = 108
  Width = 499
  Height = 164
  BorderStyle = bsSizeToolWin
  Caption = 'Gaple Chat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnHide = FormHide
  OnShow = FormShow
  DesignSize = (
    491
    136)
  PixelsPerInch = 96
  TextHeight = 13
  object LabelChat: TLabel
    Left = 5
    Top = 5
    Width = 75
    Height = 13
    Caption = 'Chat messages:'
  end
  object LabelMsg: TLabel
    Left = 5
    Top = 95
    Width = 46
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Message:'
  end
  object MemoChat: TMemo
    Left = 5
    Top = 20
    Width = 481
    Height = 71
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = True
    ParentCtl3D = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object EditChat: TEdit
    Left = 5
    Top = 110
    Width = 481
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    OnKeyPress = EditChatKeyPress
  end
end
