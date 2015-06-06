object FormGaple: TFormGaple
  Left = 381
  Top = 240
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gaple'
  ClientHeight = 521
  ClientWidth = 606
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000999999999999999999999999990000009
    BBBBBBBBBBBBBBBBBBBBBBBB90000009BBBBBBBBBBBBBBBBBBBBBBBB90000009
    BBBBBBBBBBBBBBBBBBBBBBBB90000009BBBBBBBBBBBBBBBBBBBBBBBB90000009
    BBBBBBBBB999999BBBBBBBBB90000009BBBBBBB9999999999BBBBBBB90000009
    BBBBBB999999999999BBBBBB90000009BBBBB99999999999999BBBBB90000009
    BBBBB99999999999999BBBBB90000009BBBB9999999999999999BBBB90000009
    BBBB9999999999999999BBBB90000009BBBB9999999999999999BBBB90000009
    BBBB9999999999999999BBBB90000009BBBB9999999999999999BBBB90000009
    BBBB9999999999999999BBBB90000009BBBBB99999999999999BBBBB90000009
    BBBBB99999999999999BBBBB90000009BBBBBB999999999999BBBBBB90000009
    BBBBBBB999999999BBBBBBBB90000009BBBBBBBBB999999BBBBBBBBB90000009
    BBBBBBBBBBBBBBBBBBBBBBBB90000009BBBBBBBBBBBBBBBBBBBBBBBB90000009
    BBBBBBBBBBBBBBBBBBBBBBBB90000009BBBBBBBBBBBBBBBBBBBBBBBB90000009
    9999999999999999999999999000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFE0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007E0000007FFFFFFFFFFFFFFFFFFFFFFFF}
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  DesignSize = (
    606
    521)
  PixelsPerInch = 96
  TextHeight = 13
  object DominoDeck: TDominoCard
    Left = 230
    Top = 210
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Deck = cdDeck
    ShowDeck = True
  end
  object DominoCard1: TDominoCard
    Tag = 1
    Left = 95
    Top = 415
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
    OnClick = DominoCardClick
    OnMouseUp = DominoCardMouseUp
  end
  object DominoCard2: TDominoCard
    Tag = 1
    Left = 140
    Top = 415
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
    OnClick = DominoCardClick
    OnMouseUp = DominoCardMouseUp
  end
  object DominoCard3: TDominoCard
    Tag = 1
    Left = 185
    Top = 415
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
    OnClick = DominoCardClick
    OnMouseUp = DominoCardMouseUp
  end
  object DominoCard4: TDominoCard
    Tag = 1
    Left = 230
    Top = 415
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
    OnClick = DominoCardClick
    OnMouseUp = DominoCardMouseUp
  end
  object DominoCard5: TDominoCard
    Tag = 1
    Left = 275
    Top = 415
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
    OnClick = DominoCardClick
    OnMouseUp = DominoCardMouseUp
  end
  object DominoCard6: TDominoCard
    Tag = 1
    Left = 320
    Top = 415
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
    OnClick = DominoCardClick
    OnMouseUp = DominoCardMouseUp
  end
  object DominoCard7: TDominoCard
    Tag = 1
    Left = 365
    Top = 415
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
    OnClick = DominoCardClick
    OnMouseUp = DominoCardMouseUp
  end
  object DominoCard8: TDominoCard
    Tag = 2
    Left = 415
    Top = 365
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard9: TDominoCard
    Tag = 2
    Left = 415
    Top = 320
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard10: TDominoCard
    Tag = 2
    Left = 415
    Top = 275
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard11: TDominoCard
    Tag = 2
    Left = 415
    Top = 230
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard12: TDominoCard
    Tag = 2
    Left = 415
    Top = 185
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard13: TDominoCard
    Tag = 2
    Left = 415
    Top = 140
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard14: TDominoCard
    Tag = 2
    Left = 415
    Top = 95
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard15: TDominoCard
    Tag = 3
    Left = 365
    Top = 5
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard16: TDominoCard
    Tag = 3
    Left = 320
    Top = 5
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard17: TDominoCard
    Tag = 3
    Left = 275
    Top = 5
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard18: TDominoCard
    Tag = 3
    Left = 230
    Top = 5
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard19: TDominoCard
    Tag = 3
    Left = 185
    Top = 5
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard20: TDominoCard
    Tag = 3
    Left = 140
    Top = 5
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard21: TDominoCard
    Tag = 3
    Left = 95
    Top = 5
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard22: TDominoCard
    Tag = 4
    Left = 5
    Top = 95
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard23: TDominoCard
    Tag = 4
    Left = 5
    Top = 140
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard24: TDominoCard
    Tag = 4
    Left = 5
    Top = 185
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard25: TDominoCard
    Tag = 4
    Left = 5
    Top = 230
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard26: TDominoCard
    Tag = 4
    Left = 5
    Top = 275
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard27: TDominoCard
    Tag = 4
    Left = 5
    Top = 320
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object DominoCard28: TDominoCard
    Tag = 4
    Left = 5
    Top = 365
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    ShowDeck = True
    Visible = False
    OnClick = DominoCardClick
  end
  object CardPlayer1: TDominoCard
    Left = 230
    Top = 300
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
  end
  object CardPlayer2: TDominoCard
    Left = 280
    Top = 230
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    Visible = False
  end
  object CardPlayer3: TDominoCard
    Left = 230
    Top = 120
    Width = 41
    Height = 82
    TopValue = 0
    BottomValue = 0
    Visible = False
  end
  object CardPlayer4: TDominoCard
    Left = 140
    Top = 230
    Width = 82
    Height = 41
    TopValue = 0
    BottomValue = 0
    Orientation = coLandscape
    Visible = False
  end
  object ShapeStatus: TShape
    Left = 0
    Top = 503
    Width = 606
    Height = 18
    Align = alBottom
  end
  object LabelPlayer1: TLabel
    Left = 410
    Top = 485
    Width = 81
    Height = 13
    AutoSize = False
    Caption = 'Player 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelPlayer2: TLabel
    Left = 415
    Top = 80
    Width = 81
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Player 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelPlayer3: TLabel
    Left = 10
    Top = 5
    Width = 81
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Player 3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelPlayer4: TLabel
    Left = 5
    Top = 410
    Width = 81
    Height = 13
    AutoSize = False
    Caption = 'Player 4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelStatus: TLabel
    Left = 5
    Top = 505
    Width = 136
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Waiting for new game...'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object LabelCards: TLabel
    Left = 515
    Top = 5
    Width = 58
    Height = 13
    Caption = 'Deck cards:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object BevelCards: TBevel
    Left = 501
    Top = 5
    Width = 6
    Height = 491
    Shape = bsRightLine
    Visible = False
  end
  object LabelDeck: TLabel
    Left = 555
    Top = 505
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Deck = '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object ListBoxCards: TListBox
    Left = 515
    Top = 20
    Width = 86
    Height = 476
    TabStop = False
    Color = clWhite
    Ctl3D = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 0
    Visible = False
  end
  object PanelBee: TPanel
    Left = 555
    Top = 450
    Width = 42
    Height = 42
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    object ImageBee: TImage
      Left = 0
      Top = 0
      Width = 42
      Height = 42
      AutoSize = True
      Picture.Data = {
        07544269746D61706E0B0000424D6E0B00000000000036040000280000002A00
        00002A000000010008000000000038070000C40E0000C40E0000000100000001
        00000000000088929700007EAC0000516F00298EB500CACCCC0090C4DE00377F
        99002992FD0000ADEC00FFFFFF0022282B00AFD4E4003C515B005B9DDD00578B
        BC009DBBC600B2CDD900DBEDF5003034360031667B00037BF3006A787D0013BE
        FE005BCEFA0000425B002BC5FE0000151C00B4E0F400C9E4F0006D95B8000691
        C500708993008AC4FF000063880055606400E4F1F60065ACF3003E97BC008FA9
        B400079ED600B3C9D200A1D6F000062D3B00C7E3EF004B5153005097DE0073D5
        FA005F707700D2E6EE000925320000B9FE0085AAC40096D2EE00123E50003A47
        4C003DC7FB00E9F6FC007C929B002C373B001581AB00AEE4FE00A8B9BD00717C
        7F003185CC0072B8FF0019518200125DA700A6AAAC00455B690051A6C8000709
        0A0069B8DC0061666700BAE3F4008CA0A80096CAFF00C2DAE40004A2DD001247
        770026B2E7004092E4001193C400CADBE200141A1C004B97B7002A98C10085CD
        ED00D3F2FE0050A7FF00DBF0F600526B760090D9F6002191BB009BBFCD00A7D3
        FF007D838600202528001C303C00CDEBF8006299CF0022374800E4F8FF00BAEA
        FC00798A91002F4C5B001DC1FD003A97F6008FAEBB00292E31004F585C00B3C0
        C60024A5D5003D4244004363700084A0AD0025628300457C9100959EA100BCD3
        DD003559670006192900DCF1FA00829AA30081B0E10074B6D30065D0F9008CD7
        F600627E8A00ACDEF3005E7286004ECCFC00434A4D00F6FCFF00D4EDF800147B
        E200BBCCD2009BD6F000C4EDFD00006E970033A2CC00283643002993BD001E40
        4C0073A9DF00438BA900060E11000F31530048A4C900519FBE000496CD00BABE
        C0005AB0D40080BFFF004C5B6200E3F3FA00B2E8FC000DBDFE004B555A001649
        5C0028619800A1DEFA0061AFFF00373C3D0055666E00CAE9F600C5E8F6001B88
        B200008ABD00A2B3BA009AAAB1009BCFE80075848A0096A4AA00D4DBDE002555
        72006A6C6D0095CAE400919A9C00184F63009DDEF80001A4E100A6C5D20042A0
        FF00839197001783F0002D434B00CBF1FF001011120082B7CB00718D9A006B80
        8800C0DDE9000F171B0051A0F0001D3D56000996CB003C4B5300C4D0D500368C
        AF005F9EBB00C2E6F500212C320081C3DF00335B730083D8F7005B6E760025C2
        FD00A6AEB10063A9C6001497C9002C323400515D6100828D92007D878B006874
        79005253530075BDDB00D8EFF90097B3BF00C4D5DC00507C9900A3E3FC00454E
        52006F99A8002385AB001A304100353E4300162634006AD3FB0034708700B1D2
        E200ADBCC300CFE2E7002C3B4500ECFAFF0009A0D900B2C3CB005C666B00339A
        C300CFD4D50088A4B00075D8FD00A3B9C200AEE9FF00A3DAF500626B6F008398
        9F000B9CD3007280840043CAFC00D4EAF4003395F9003A9CFF00585B5D009CD2
        ED000A0A0A0A0A0A0A0A0A0A0A0A0A0A0A354656D228282828D25646350A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0A00000A0A0A0A0A0A0A0A0A0A0A0A8926C4333333
        333333333333333333C426890A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
        0A0A0A0A890409333333333333333333333333333333330904890A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A55B5333333333396A83333CFCF33333333
        3333333333B5550A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A2AA73333333333
        331AE6781CC9C91C1C817F18CF333333333333A72A0A0A0A0A0A0A0A0A0A0A0A
        0A0A0A0AB11F3333333333FAB4C920D3F10CC9C91C1C1C1C1C5CFA3333333333
        1FB10A0A0A0A0A0A0A0A0A0A0A0A0AB1C433333333CFB4A6A6A6B6A40B54C0C9
        C91C1C1C1C1C1C7F6A33333333C4B10A0A0A0A0A0A0A0A0A0A0A2A1F33333333
        18A6A6A6A6A6A6C9CE9AC9C9C9C91C1C1C1C1C1C8183333333331F2A0A0A0A0A
        0A0A0A0A0A0AA7333333332FA6A6A6A6A6A6A62779793720DBC9C91C1C1C1C1C
        1C1CE533333333A70A0A0A0A0A0A0A0A0A5533333333CD6363A6A6A6A6B6EA42
        8715794773C9C9C91C1C1C1C1C1C1CE533333333550A0A0A0A0A0A0A89B53333
        33186363632065C3E4E251FD08B9799F8FC56CC9C9C91C1C1C1C1C1C83333333
        B5890A0A0A0A0A0A043333331A6363E7EAA00887E225A259FD932233A81B360D
        0CC973726569BE1C816A333333040A0A0A0A0A89093333339C63118D2E59B7C3
        7C9941A2401B1B030092528CEA0D43426B74AF5B1C7F33333309890A0A0A0A26
        33333383DA63BA9041A2C2CA5F4C90E200000000002B70EF324FFCB7A2250F78
        5E1C38333333260A0A890AC43333339CDA27824C2164E2C1DFEA32038B8B8B8B
        5250B300E24059A24199DDD1801C5C333333C40A0A26353333331ADADA4B8234
        45C5C09E47472274450B8413DFBC9207F2CC0E99211EC8CB5B1C1CCF33333335
        0AC446333333F2DADADA68D7E8DA63313AD46DD8AE608585B0D8722FD9BA8FEA
        DDC857BDBF1C1C183333334635338E333333DE5ADADADADADADADA63C07160EB
        EB60EB856085D06D47546200485789BE6C1C1C7F3333338E4633D2333333635A
        5ADADADADADADADA9EEDB2666660EBEB60EBAEFED3EA92925789819A1CC9C981
        333333528E332833339D5A5A5A5ADADADADADAEDEEA9F9ADAAF6ADDC6066D624
        9E16787D35812720C9C9C9C99D333328D2334E33336A5A5A5A5A5ADADADADAEE
        D7C05866666666EDD5ADF966E854D935810C9EC0C9C9C9C91733334E28334E33
        336A5A5A5A5A5A5ADADADA6DBBBB58585858585866FB167766CA35F5B6DFE7C9
        C9C9C9C91733334E4E332833339D665A5A88E8DA5ADADADF8AF9B8F1BBBBBBA6
        686863AD778D34CEEEC0A6A6C9C9C9C99D3333284E33D233333358665A5AD76E
        E95A5A377BE966F7C98ABBBF5A5AF9BBF76D68E7A6A6A627C0C9C91C33333352
        28338E333333F466665A16AAEED6FB9E68666FA37B8A5EA96629F6103A9EA6A6
        A6A623BFA6A6C95C3333338ED23346333333F26666665A5ADA5A5AB8AC666E00
        DF672066662D6D9A3AF763C07BD43A30A6A6A67E333333468E33353333331A66
        6666665A5A5A5A316E66844437672066666DD8DFEA2C63C0F3A6A64AA6A6A61A
        3333333546330AC43333339C66666666665A5A5A49E9EED880F45BA966D3B00B
        4B6363636363A6A6A6A6B4333333C40A35330A26333333836666666666665A5A
        449744B089DEE0B2AA3F0B7163632C63636363A6A6A6FA333333260A0AC40A89
        093333339CC66F66D70123AA8897F023BDDEDE760505B22CDA112D114B636363
        A6B433333309890A0A260A0A043333195D53BC2D7101D5665AE8F9F69E3B9A0B
        7644EDDADADAACD413F3D4DBA61A333333040A0A0A890A0A89B533091914A3C6
        E8666666665ADC715A5AC0DFDADADADADADADA63D7EE0BC007193333B5890A0A
        0A0A0A0A0A9533333302C1666666666653842D885ADC2DA95ADADADADADADADA
        63C054628B333333550A0A0A0A0A0A0A0A0AA7333333B5CD666666665A66665A
        60F66F5A5A5ADADADADADADADA2775333333333C0A0A0A0A0A0A0A0A0A0AF5C4
        33333333E5666666666666665A5A5A5A5A5A5ADADADADADA6318333333331FAB
        0A0A0A0A0A0A0A0A0A0A0AFFC4333333331A67666666666666665A5A5A5A5A5A
        DADADA9CCF3333333396060A0A0A0A0A0A0A0A0A0A0A0A0A891F333333333383
        676666666666665A5A5A5A5A5A9C8333333333331F060A0A0A0A0A0A0A0A0A0A
        0A0A0A0A0AF55D3333333333331AF2F4586666665ADADEE51A3333333333333C
        AB0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A46B53333333333333333331A1A
        333333333333333333B5913D0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
        F5EF093333333333333333333333333333333309E1060A0A0A0A0A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0AF594F83333333333333333333333331FC706
        0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0ADE988C
        D22828282852A795060A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A}
      Transparent = True
    end
  end
  object MainMenu: TMainMenu
    Left = 5
    Top = 5
    object MenuGame: TMenuItem
      Caption = '&Game'
      object ItemNew: TMenuItem
        Caption = '&New..'
        ShortCut = 113
        OnClick = ItemNewClick
      end
      object ItemOptions: TMenuItem
        Caption = '&Options...'
        OnClick = ItemOptionsClick
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object ItemExit: TMenuItem
        Caption = 'E&xit'
        OnClick = ItemExitClick
      end
    end
    object MenuView: TMenuItem
      Caption = '&View'
      object ItemChat: TMenuItem
        AutoCheck = True
        Caption = 'Chat &window'
        Enabled = False
        ShortCut = 114
        OnClick = ItemChatClick
      end
      object ItemCards: TMenuItem
        AutoCheck = True
        Caption = 'Deck &cards'
        OnClick = ItemCardsClick
      end
      object ItemDeck: TMenuItem
        AutoCheck = True
        Caption = 'Deck &table'
        ShortCut = 115
        OnClick = ItemDeckClick
      end
      object ItemScores: TMenuItem
        Caption = '&Scores'
        OnClick = ItemScoresClick
      end
      object Separator2: TMenuItem
        Caption = '-'
      end
      object ItemSort: TMenuItem
        Caption = 'S&ort my cards'
        Enabled = False
        ShortCut = 116
        OnClick = ItemSortClick
      end
    end
    object MenuHelp: TMenuItem
      Caption = '&Help'
      object ItemAbout: TMenuItem
        Caption = '&About'
        ShortCut = 112
        OnClick = ItemAboutClick
      end
      object ItemHelp: TMenuItem
        Caption = 'How to &play'
      end
    end
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 2700
    Left = 5
    Top = 35
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 2700
    ServerType = stNonBlocking
    Left = 35
    Top = 35
  end
end
