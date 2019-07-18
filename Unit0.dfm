object Form0: TForm0
  Left = 324
  Top = 107
  Anchors = []
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Form0'
  ClientHeight = 66
  ClientWidth = 268
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 90
    Top = 10
    Width = 144
    Height = 16
    Caption = ':'#1604#1591#1601#1575' '#1578#1575#1585#1610#1582' '#1575#1605#1585#1608#1586' '#1585#1575' '#1608#1575#1585#1583' '#1603#1606#1610#1583
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 268
    Height = 66
    Align = alClient
    ParentShowHint = False
    Shape = bsFrame
    ShowHint = False
    Style = bsRaised
  end
  object MaskEdit1: TMaskEdit
    Left = 9
    Top = 5
    Width = 80
    Height = 24
    BiDiMode = bdRightToLeft
    EditMask = '99/99/99;'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 8
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    Text = '  /  /  '
    OnExit = MaskEdit1Exit
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 34
    Width = 75
    Height = 25
    Caption = #1578#1575#1610#1610#1583
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000C40E00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555555555555555555905555555555555999055555555555599905555
      5555555999990555555555999999055555555799059990555555790555599055
      5555555555599905555555555555990555555555555559905555555555555579
      0555555555555557905555555555555559905555555555555555}
  end
end
