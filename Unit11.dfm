object Form11: TForm11
  Left = 67
  Top = 90
  Width = 733
  Height = 480
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 
    '                                                                ' +
    '                 '#1605#1583#1610#1585#1610#1578' '#1601#1610#1604#1605' '#1607#1575'  '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000001
    1111111111111111111111000000011877777777777777777777770000000100
    00000000000000000000008000000050FFFFFFFFFFFFFF7777777F0000000705
    0FFFFFFFFFFF777777FFFF00000000095088888888888888888FFF0000000015
    950FFFFF7777777FFFFFFF00000007095950888888888888888FFF0000000005
    95990777777777FFFFFFFF00000000195959088888888888888FFF0000000705
    959907777777FFFFFFFFFF00000000095959088888888888888FFF0000000015
    9599077777FFFFFFFFFFFF00000007095959080888888888888FF0D9D9000005
    959907F00FFFF000000FF00D9D9000195959088050000FFFFF800880D9D00705
    95990FFF00FFFFFFFFFFFFFF0D9000095959088880000008FFFFFFFF09D00015
    95990FFFF00D0F08FFFFFFFF0D900709595908888080D008FFFFFFFF09D00009
    95990FFFF0F80D08FFFFFFF00000000099590000000F80D0FFFFF00000000000
    099900000000F80D0FFF0000000000000099000000000FF0D000000000000000
    00090000000000000D00000000000000000000000000000000D0000000000000
    0000000000000000000D00000000000000000000000000000000D00000000000
    000000000000000000000D00000000000000000000000000000000D000000000
    0000000000000000000000000000FFFFFFFFE000003F8000001F8000000F8000
    000F0000000F0000000F8000000F0000000F0000000F8000000F0000000F0000
    000F800000030000000100000000800000000000000000000000800000000000
    000000000001E000001FF07E007FF87F00FFFC7F81FFFE7FF8FFFFFFFC7FFFFF
    FE3FFFFFFF1FFFFFFF8FFFFFFFCF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0001111111111110000000
    00000000000000FFFFFF77777000000888888888F00009D0FF777FFFF000009D
    08888888F00009D9077FFFFFF000009D0888000FF09009D900000FF000D0009D
    080000FFF09009D90F0FD0FFF000009D000FFD0F00000009000000D000000000
    0000000D0000000000000000D000000000000000000080070000800300000003
    0000800300000003000080030000000100008000000000000000800000000000
    000080030000C60F0000E7C70000FFE30000FFF30000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 334
    Top = 83
    Width = 3
    Height = 13
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 725
    Height = 324
    Cursor = crHandPoint
    Align = alClient
    BiDiMode = bdRightToLeft
    DataSource = Form8.DataSource1
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'System'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Title.Caption = #1603#1583' '#1601#1610#1604#1605
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rade2'
        Title.Caption = #1606#1608#1593
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1593#1606#1608#1575#1606
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kind'
        Title.Caption = #1605#1608#1590#1608#1593
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RemTedad'
        Title.Caption = #1605#1608#1580#1608#1583#1610
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tedad'
        Title.Caption = #1578#1593#1583#1575#1583
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rade1'
        Title.Caption = #1586#1610#1585' '#1585#1583#1607
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bazigar'
        Title.Caption = #1576#1575#1586#1610#1711#1585#1575#1606
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Keshvar'
        Title.Caption = #1578#1608#1604#1610#1583' '#1603#1588#1608#1585
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Regdate'
        Title.Caption = #1578#1575#1585#1610#1582' '#1579#1576#1578
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kargardan'
        Title.Caption = #1603#1575#1585#1711#1585#1583#1575#1606#1607#1575
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nevisande'
        Title.Caption = #1606#1608#1610#1587#1606#1583#1711#1575#1606
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mahsol'
        Title.Caption = #1578#1608#1604#1610#1583' '#1588#1585#1603#1578
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Buydate'
        Title.Caption = #1578#1575#1585#1610#1582' '#1582#1585#1610#1583
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Buyname'
        Title.Caption = #1606#1575#1605' '#1582#1585#1610#1583#1575#1585
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gheimat'
        Title.Caption = #1602#1610#1605#1578
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Keraie'
        Title.Caption = #1603#1585#1575#1610#1607' '#1607#1585' '#1585#1608#1586
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DirKerd'
        Title.Alignment = taRightJustify
        Title.Caption = #1580#1585#1610#1605#1607' '#1583#1610#1585#1603#1585#1583
        Title.Font.Charset = ARABIC_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Times New Roman'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 725
    Height = 81
    Align = alTop
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 26
      Top = 45
      Width = 140
      Height = 29
      Cancel = True
      Caption = '(ESC)'#1575#1606#1589#1585#1575#1601
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn2Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF003F3DED413B38EB08FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00211FE3081E1CE241FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF004A47F0414F4CF2FF403EEDFD3C39EB08FFFFFF00FFFFFF00FFFFFF00FFFF
        FF002725E5082422E4FC312FEAFF1F1DE241FFFFFF00FFFFFF00FFFFFF005451
        F3415856F5FF6361FAFF5855F6FF413FEDFC3D3AEC08FFFFFF00FFFFFF00302D
        E7082C2AE6FC413FF1FF4C4AF6FF312FEAFF1F1DE241FFFFFF00FFFFFF005956
        F52B5B58F6FF6562FAFF7170FFFF5956F6FF4240EEFC3E3BEC083937EB083532
        E9FC4745F2FF6362FFFF4A48F4FF2F2DE9FF2220E32BFFFFFF00FFFFFF00FFFF
        FF005A57F52B5B59F6FF6663FAFF7471FFFF5A58F6FF4341EEFC3E3CECFD504D
        F4FF6867FFFF504EF5FF3634EBFF2A27E52BFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF005B58F62B5C5AF6FF6764FAFF7472FFFF7370FFFF706EFFFF6E6C
        FFFF5755F7FF3F3DEEFF3230E82BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF005C59F62B5D5BF7FF7976FFFF5956FFFF5754FFFF7270
        FFFF4846F0FF3C39EB2BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00615EF8085D5AF6FD7D79FFFF5E5BFFFF5B58FFFF7674
        FFFF4643EFFD413FED08FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF006967FB086663F9FC706DFBFF807EFFFF7E7BFFFF7C79FFFF7977
        FFFF5E5CF7FF4744EFFC4240EE08FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00716EFD086E6BFCFC7774FDFF8682FFFF7673FCFF6462F8FF605DF7FF6D6A
        FAFF7B79FFFF605DF7FF4845EFFC4341EE08FFFFFF00FFFFFF00FFFFFF007673
        FF087471FEFD7D7AFEFF8A87FFFF7C79FDFF6C69FBFF6361F92B5F5CF72B615E
        F8FF6E6CFAFF7D7AFFFF615FF7FF4946F0FC4441EE05FFFFFF00FFFFFF007774
        FF1F7A77FFFF817EFFFF817EFEFF7471FDFF6C69FB2BFFFFFF00FFFFFF00605D
        F72B625FF8FF6F6DFBFF7E7CFFFF625FF8FF4A47F06F4542EE02FFFFFF00FFFF
        FF007774FF1F7A77FFFF7976FEFF726FFD2BFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00615EF82B6461F8FF6A68F9FF5451F3A84F4DF229FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007774FF1F7774FF2BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00625FF82B5D5BF76F5956F53EFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF006360F80AFFFFFF00FFFFFF00FFFFFF00}
    end
    object RadioButton1: TRadioButton
      Left = 661
      Top = 16
      Width = 36
      Height = 17
      BiDiMode = bdRightToLeft
      Caption = #1603#1583':'
      Checked = True
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 637
      Top = 48
      Width = 60
      Height = 17
      BiDiMode = bdRightToLeft
      Caption = #1593#1606#1608#1575#1606':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      OnClick = RadioButton2Click
    end
    object Edit1: TEdit
      Left = 532
      Top = 13
      Width = 121
      Height = 23
      BiDiMode = bdLeftToRight
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      MaxLength = 11
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnChange = Edit1Change
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 260
      Top = 44
      Width = 372
      Height = 23
      BiDiMode = bdRightToLeft
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      MaxLength = 100
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      OnChange = Edit2Change
      OnEnter = Edit2Enter
    end
    object BitBtn5: TBitBtn
      Left = 26
      Top = 8
      Width = 140
      Height = 29
      Caption = '(F12)'#1578#1575#1610#1610#1583
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn5Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        11001212120013131300141414001515150016161600171717001C191700221A
        1800271C18002C1E1900301F1900342019003A221900422319004B2518005226
        1700582716005E2815006228140065291300662913006729130068291300682A
        1300692A12006A2B12006E2C1100742F0F0079310E007D320D0080340C008335
        0B0084350B0086360B0089370A008D390900913A0800923B0800943C0700953C
        0700973E08009A3F08009D400700A0410600A3420500A7430400AB440300AE45
        0200AF450200B0450100B2460100B3460100B4470100B5470100B5470000B647
        0000B8480000B8480000B9490000BA490000BA490000BB4A0000BB4A0000BB4A
        0000BB4B0000BB4B0000BB4C0100BB4D0200BC4E0300BC500500BC520600BC54
        0800BC550A00BC580D00BD5B1000BD5E1400BE611700BF631900BF651C00C167
        1F00C26A2100C26C2400C26D2700C06E2900BF6F2C00B96E2F00B56E3200AE6E
        3800A36E4000986E4A008C6E5300816E5D00786E65006F6F6F00707070007171
        7100727272007373730074747400757575007676760077777700787878007979
        79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
        8100828282008383830084848400858585008686860087878700888888008989
        89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
        A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
        A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
        B100B6B6B600BBBBBB00C0C0C000C5C5C500C9C9C900CDCDCD00D1D1D100D4D4
        D400D7D7D700DADADA00DFDFDF00E2E2E200E6E6E600E8E8E800EDEDED00F0F0
        F000F2F2F200F4F4F400F6F6F600F8F8F800F9F9F900FAFAFA00FBFBFB00FBFA
        F900FAF8F500F9F4EF00F7EEE500F5E7D900F4E2D000F3DEC900F2DBC400F1D8
        BF00F1D6BC00F0D4B900EFD2B400EECDAD00EDCAA800EBC5A000E9C09900E6BB
        9100E4B78C00E3B48700E3B18200E2AE7D00E1AC7900E1AA7600E0A87300DFA6
        7000DFA46D00DEA16900DD9E6500DB9B6100DA985D00D9975B00D8955900D893
        5600D7915400D58D5000D48B4E00D48A4C00D3884C00D3844D00D47F5400D773
        6200DA677100DF578600E83DA800EF27C500F41AD800F711E500FA0AF000FC06
        F600FD03FA00FE01FC00FE00FD00FE00FE00FE00FE00FE00FE00FDFDFDFDFD25
        2727272727FDFDFDFDFDFDFDFD28275353535353532727FDFDFDFDFD31475151
        5151515353534727FDFDFD30484A494949494A4E5353534727FDFD3F4945435A
        66EFEF644E53535328FD36545555EFC8C8C8C8DB494E535353253A5A5A5BC8DD
        5E5B5742444A515353283A62605FC8645D5A44DB4349515353283AED6665C8E3
        625E5AC8DD485153532839E3E5EFD7C8CFD0CDC8C8D85153532839E4D7E5E9DC
        D6D7D2C8C8D951535325FD3BD5D5E0E9EF6661C8DE53515328FDFD39E2CFD3E0
        EE6662DF5B56534724FDFDFD39E2D2CFD7E1E9ED6659472DFDFDFDFDFD3A3DDF
        D9D9DFED5F3C2CFDFDFDFDFDFDFDFD3B3C3C3C3C32FDFDFDFDFD}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 725
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Label2: TLabel
      Left = 0
      Top = 26
      Width = 23
      Height = 13
      Caption = 'temp'
      Visible = False
    end
    object BitBtn3: TBitBtn
      Left = 197
      Top = 6
      Width = 150
      Height = 29
      Hint = #1578#1594#1610#1610#1585' '#1605#1588#1582#1589#1575#1578
      Caption = '(F7) '#1578#1594#1610#1610#1585' '#1605#1588#1582#1589#1575#1578
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        5555000000005550555500550005505555550055500555555555500550050055
        5555550050501105555555550509991055555005550999910555500505509990
        305555005055090B03055555555550B0B03055550555550B0B33555555555550
        BBB35550555555550BBB55555555555550BB555555555555550B}
    end
    object BitBtn4: TBitBtn
      Left = 20
      Top = 6
      Width = 150
      Height = 29
      Hint = #1581#1584#1601
      Caption = '(F8) '#1581#1584#1601
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000000000000000000000010000000100000005F0000005
        F1000005F2000005F2000005F1000005EF000005EC000005E7000005E3000005
        DF000005DC000005D8000005D4000005D0000005CD000005C8000005C1000005
        BA000005B7000005B7000005B7000005B6000005B6000005B6000005B6000005
        B6000005B5000005B5000005B4000005B3000106B0000206AD000307A6000509
        9D00070B94000A0D8B000D10800010137400151766001A1B56001C1E50001F20
        49002223420025263B00292934002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        5100525252005353530054545400555555005656560057575700585858005959
        59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
        6100626262006363630064646400656565006666660067676700686868006969
        69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
        7100727272007373730074747400757575007676760077777700787878007979
        79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
        8100828282008383830084848400858585008686860087878700888888008989
        89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
        A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
        A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
        B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
        B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
        C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
        C900CACACA00D1B2D100D994D900E46CE400F139F100F917F900FD07FD00FE01
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00E9E9E9E9E9E9
        E9E9E9E9E9E9E9E91212E91212E9E9E9E9E9E9E9E9E9E91212E9E9121212E9E9
        E9E9E9E9E9E91212E9E9E912151212E9E9E9E9E9E91212E9E9E9E9E90B111212
        E9E9E9E91212E9E9E9E9E9E9E9E9121215E9151212E9E9E9E9E9E9E9E9E9E915
        0F0F0E1CE9E9E9E9E9E9E9E9E9E9E9E910100BE9E9E9E9E9E9E9E9E9E9E9E915
        0B0E0B07E9E9E9E9E9E9E9E9E9E9080B0CE9E90805E9E9E9E9E9E9E9E9030B05
        E9E9E9E90303E9E9E9E9E9E9030303E9E9E9E9E9E90303E9E9E9E9030303E9E9
        E9E9E9E9E9E9E903E9E9030303E9E9E9E9E9E9E9E9E9E9E9E9E90303E9E9E9E9
        E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9}
    end
    object BitBtn1: TBitBtn
      Left = 374
      Top = 6
      Width = 150
      Height = 29
      Caption = '(F4) '#1579#1576#1578' '#1580#1583#1610#1583
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333300000333333333007F777003333330FFF7F777F033330DEF4F7F7FE
        D03330DD444FFFEDD0330BB44E440EDFBB030A44B0744BBBAA030EEAA07044AA
        EE030AABB077744BAA030BBFDE000E44BB0330DDEFFFFFE4403330DEF7F7FFFE
        4033330FFF7F7FFF033333300FF7F70033333333300000333333}
    end
    object BitBtn6: TBitBtn
      Left = 552
      Top = 6
      Width = 150
      Height = 29
      Hint = #1578#1607#1610#1607' '#1711#1586#1575#1585#1588' '#1575#1601#1585#1575#1583#1610' '#1603#1607' '#1583#1585' '#1581#1575#1604' '#1581#1575#1590#1585' '#1601#1610#1604#1605' '#1585#1575' '#1583#1585' '#1575#1605#1575#1606#1578' '#1583#1575#1585#1606#1583
      Caption = '(F3) '#1575#1605#1575#1606#1578' '#1711#1610#1585#1606#1583#1607' '#1607#1575
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn6Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000073
        0000007300000073000000730000007300000073000000730000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000630000007B
        000000940800089410000894100063AD73000894100000940800007300008442
        21008442210084422100844221008442210084422100FF00FF0000630000007B
        000042AD6B0042AD6B007B9C8C00DEE7D6005AAD6B000894100000730000B55A
        3100F77B5A00F77B5A00F77B5A00EF735200DE6B420084422100006300000073
        000042AD6B0008941000DEE7D600DEE7D6006BA57B0042AD6B0000730000B55A
        3100DED6CE00DEE7D600D6634200F77B5A00E76B4A0084422100FF00FF000063
        000000730000185A8400316B9C00528CAD0042AD6B00089410005AAD6B00F77B
        5A00E7DECE00DEE7D600E7BDDE00D6634200F77B5A0084422100FF00FF002121
        21002121210021212900105A9C00105A9C00105A9C00FF00FF00DE6B4200F77B
        5A00D6C6C600DEE7D600DEE7D600F77B5A0084422100FF00FF00212121002121
        210021212900106BB500106BB500106BB500106BB500106BB500FF00FF00106B
        B500217BD600217BDE00217BDE00106BAD00FF00FF00FF00FF00212121002121
        2100185A84001873CE001873CE001873CE001873CE001873CE00106BB50039A5
        F70039A5F70039A5F70039A5F70039A5F700106BAD00FF00FF00212121002121
        2100185A8400217BDE00217BDE00217BDE00217BDE00217BDE003194EF0042AD
        F70042ADF70042ADF70042ADF70042ADF70042ADF700106BAD00212121002121
        210021212900298CE7003194EF003194EF003194EF00298CE70042ADF70042AD
        F70042ADF70042ADF70042ADF70042ADF70042ADF700106BA500212121002121
        21007B9C8C0021212900185A8400296394002963940021212900319CEF0042AD
        EF0042ADF70042ADF70042ADF70042ADF7004AADEF0008528400FF00FF000829
        0800212121007B9C8C007B9C8C002121210021212100FF00FF00106BA5003194
        EF00085284000852840008528400528CAD00105A940008528400FF00FF00FF00
        FF0021212100212121002121210008290800FF00FF00FF00FF00FF00FF00106B
        A500106BA500106BA500106BA5000852840008528400FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00106BA500106BA500106BA500105A9400FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 360
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 123
      OnExecute = BitBtn5Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 115
      OnExecute = BitBtn1Click
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 118
      OnExecute = BitBtn3Click
    end
    object Action4: TAction
      Caption = 'Action4'
      ShortCut = 119
      OnExecute = BitBtn4Click
    end
    object Action5: TAction
      Caption = 'Action5'
      ShortCut = 114
      OnExecute = BitBtn6Click
    end
  end
end