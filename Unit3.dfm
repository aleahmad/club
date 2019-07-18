object Form3: TForm3
  Left = 234
  Top = 151
  Width = 870
  Height = 600
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1578#1581#1604#1610#1604' '#1606#1610#1575#1586' '#1605#1588#1578#1585#1610' '#1607#1575' '#1608' '#1583#1585#1570#1605#1583#1607#1575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart1: TDBChart
    Left = 273
    Top = 41
    Width = 589
    Height = 525
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    MarginBottom = 2
    MarginLeft = 2
    MarginRight = 2
    MarginTop = 2
    Title.Font.Charset = ARABIC_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -13
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'TDBChart')
    Title.Visible = False
    View3D = False
    Align = alClient
    TabOrder = 0
    object Series1: TBarSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      DataSource = Query1
      SeriesColor = clRed
      ShowInLegend = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'FieldCount'
      object TeeFunction1: THighTeeFunction
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label13: TLabel
      Left = 709
      Top = 13
      Width = 138
      Height = 14
      BiDiMode = bdRightToLeft
      Caption = #1606#1605#1575#1610#1588' '#1606#1605#1608#1583#1575#1585' '#1576#1585' '#1575#1587#1575#1587':'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
    end
    object BitBtn2: TBitBtn
      Left = 6
      Top = 6
      Width = 150
      Height = 29
      BiDiMode = bdRightToLeft
      Caption = #1670#1575#1662' (Ctrl+P)'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FAFEFEFAFEFE
        FAFEFEC89561CA9764CA9664CA9664CA9664CA9663C99663C99663CA9764C894
        61FAFEFEFAFEFEFAFEFE9FA0A0787979575757C79460F9F7F6F9F1ECF9F1EBF8
        F0E9F7EDE6F4EAE1F2E8DEFAF8F6C79360232323494A4A9395956A6A6AA6A6A6
        B4B4B4808080AEABA9C4BFBCC4BFBCC4BFBCC4BFBCC4BFBCC4BFBCACA9A72B2B
        2BB4B4B49A9A9A2222226F6F6FB4B4B4B4B4B49494948080808080807878786D
        6D6D6060605151514242424141416D6D6DB4B4B4B4B4B4242424747474BABABA
        BABABA8C8C8CD4D4D4B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8D3D3D38282
        82BABABABABABA292929797979D7D7D7D7D7D7969696D8D8D8BEBEBEBEBEBEBE
        BEBEBEBEBEBEBEBEBEBEBED7D7D78D8D8DD7D7D7D7D7D73E3E3E7D7D7DF9F9F9
        F9F9F9AAAAAADFDFDFCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDFDFDFA2A2
        A2F9F9F9F9F9F9606060838383FCFCFCFCFCFCCBCBCBF2F2F2F2F2F2F2F2F2F2
        F2F2F2F2F2F2F2F2F2F2F2F2F2F2C5C5C5FCFCFCFCFCFC707070969696D2D2D2
        E8E8E87C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C
        7CE8E8E8C3C3C36C6C6CD9DCDC999999CCCCCCC78A4DF9F4EDFEE8D8FEE8D7FD
        E5D3FCE4D1FAE0C7F9DDC2FAF4EDC78449C2C2C2737373C9CCCCFAFEFECBCDCD
        868686C4884BF9F4EFFEE7D7FDE7D5FCE6D2FBE1CCF8DCC1F6DABCFAF4EFC382
        47606060B9BBBBFAFEFEFAFEFEFAFEFEF6FAFAC58B4EF9F4F0FCE6D3FDE7D3FB
        E3CDFAE0C8F5D6BAF3D4B4F8F4F0C38449F5F8F8FAFEFEFAFEFEFAFEFEFAFEFE
        FAFEFEC78C50F9F5F1FCE3CFFCE4CFFAE1CAF9DDC3F4E9DFF7F2ECF5EFE9C27F
        47FAFEFEFAFEFEFAFEFEFAFEFEFAFEFEFAFEFEC78C51F9F5F1FCE3CDFBE3CDF9
        E0C8F8DCC1FDFBF8FCE6CDE2B583D3A783FAFEFEFAFEFEFAFEFEFAFEFEFAFEFE
        FAFEFEC4874CF7F2ECF8F4EEF8F3EDF8F3EDF8F2ECF2E6D7E2B17CDB9468F8FA
        F9FAFEFEFAFEFEFAFEFEFAFEFEFAFEFEFAFEFEE4CDB8D5A97BC88B4FC88B4ECA
        9054CB8F54C4884CDAAE8CFAFEFEFAFEFEFAFEFEFAFEFEFAFEFE}
    end
    object txtKind: TComboBox
      Left = 456
      Top = 10
      Width = 249
      Height = 27
      Hint = #1578#1593#1583#1575#1583' '#1575#1605#1575#1606#1578' '#1607#1575' '#1576#1585' '#1575#1587#1575#1587' '#1575#1610#1606' '#1605#1602#1583#1575#1585' '#1605#1581#1575#1587#1576#1607' '#1605#1610' '#1588#1608#1583
      BiDiMode = bdRightToLeft
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ItemHeight = 19
      ItemIndex = 5
      MaxLength = 20
      ParentBiDiMode = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = #1593#1606#1608#1575#1606' '#1601#1610#1604#1605
      OnSelect = txtKindSelect
      Items.Strings = (
        #1705#1583' '#1601#1610#1604#1605
        #1705#1583' '#1605#1588#1578#1585#1610
        #1705#1583' '#1705#1575#1604#1575'/'#1582#1583#1605#1575#1578
        #1578#1575#1585#1610#1582' '#1576#1585#1711#1588#1578
        #1606#1608#1593' '#1601#1610#1604#1605
        #1593#1606#1608#1575#1606' '#1601#1610#1604#1605
        #1605#1608#1590#1608#1593' '#1601#1610#1604#1605
        #1578#1593#1583#1575#1583
        #1586#1610#1585' '#1585#1583#1607
        #1576#1575#1586#1610#1711#1585#1575#1606
        #1578#1608#1604#1610#1583' '#1705#1588#1608#1585
        #1578#1575#1585#1610#1582' '#1579#1576#1578
        #1705#1575#1585#1711#1585#1583#1575#1606#1607#1575
        #1606#1608#1610#1587#1606#1583#1711#1575#1606
        #1578#1608#1604#1610#1583' '#1588#1585#1705#1578
        #1578#1575#1585#1610#1582' '#1582#1585#1610#1583
        #1606#1575#1605' '#1582#1585#1610#1583#1575#1585
        #1602#1610#1605#1578' '#1601#1610#1604#1605
        #1705#1585#1575#1610#1607' '#1607#1585' '#1585#1608#1586
        #1588#1585#1581' '#1705#1575#1604#1575
        #1606#1575#1605' '#1705#1575#1585#1576#1585#1610
        #1578#1575#1585#1610#1582' '#1575#1605#1575#1606#1578' '#1601#1610#1604#1605)
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 273
    Height = 525
    Align = alLeft
    BiDiMode = bdRightToLeft
    DataSource = DataSource1
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        Title.Caption = #1585#1583#1610#1601
        Width = 34
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #1705#1583' '#1601#1610#1604#1605
        Width = 134
        Visible = True
      end
      item
        Color = 12906751
        Expanded = False
        FieldName = 'FieldCount'
        Title.Caption = #1578#1593#1583#1575#1583
        Width = 70
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Left = 208
    Top = 8
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16464
      OnExecute = BitBtn1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 240
    Top = 8
  end
  object Query1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  payment.regcode as Code, Count(*)  as FieldCount FROM (p' +
        'ayment LEFT JOIN CDBank ON payment.RegCode = CDBank.Regcode) LEF' +
        'T JOIN Kala ON payment.KCode = Kala.KCode'
      'group by payment.regcode'
      'order by 2  desc'
      ''
      '')
    Left = 272
    Top = 8
  end
end
