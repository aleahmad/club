object EnterCode: TEnterCode
  Left = 416
  Top = 278
  BiDiMode = bdRightToLeft
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1608#1585#1608#1583' '#1705#1583' '#1606#1585#1605' '#1575#1601#1586#1575#1585
  ClientHeight = 119
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 216
    Top = 52
    Width = 60
    Height = 14
    Caption = #1705#1583' '#1606#1585#1605' '#1575#1601#1586#1575#1585':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 236
    Top = 16
    Width = 41
    Height = 14
    Caption = #1588#1605#1575#1585#1607' :'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Code: TLabel
    Left = 8
    Top = 16
    Width = 226
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '0000000000'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RCode: TEdit
    Left = 8
    Top = 49
    Width = 201
    Height = 21
    AutoSize = False
    BiDiMode = bdLeftToRight
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 15
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 148
    Top = 83
    Width = 100
    Height = 25
    Caption = #1578#1600#1600#1600#1575#1574#1610#1600#1600#1583
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 36
    Top = 83
    Width = 100
    Height = 25
    Cancel = True
    Caption = #1575#1606#1589#1585#1575#1601
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
end
