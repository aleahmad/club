object ChangPassAdmin: TChangPassAdmin
  Left = 452
  Top = 315
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1578#1594#1610#1610#1585' '#1585#1605#1586' '#1605#1583#1610#1585' '#1587#1610#1587#1578#1605
  ClientHeight = 158
  ClientWidth = 237
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 184
    Top = 53
    Width = 40
    Height = 13
    Caption = #1585#1605#1586' '#1580#1583#1610#1583
  end
  object Label3: TLabel
    Left = 162
    Top = 91
    Width = 62
    Height = 13
    Caption = #1578#1575#1574#1610#1583' '#1585#1605#1586' '#1580#1583#1610#1583
  end
  object Label4: TLabel
    Left = 180
    Top = 16
    Width = 44
    Height = 13
    Caption = #1585#1605#1586' '#1601#1593#1604#1610
  end
  object Save: TButton
    Left = 137
    Top = 125
    Width = 78
    Height = 25
    Caption = #1579#1576#1578
    TabOrder = 3
    OnClick = SaveClick
  end
  object closeform: TButton
    Left = 27
    Top = 125
    Width = 78
    Height = 25
    Cancel = True
    Caption = #1575#1606#1589#1585#1575#1601
    TabOrder = 4
    OnClick = closeformClick
  end
  object Pass: TEdit
    Left = 15
    Top = 50
    Width = 132
    Height = 22
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = PasswordNonceKeyPress
  end
  object PassCheck: TEdit
    Left = 15
    Top = 87
    Width = 132
    Height = 22
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = PasswordNonceKeyPress
  end
  object PasswordNonce: TEdit
    Left = 15
    Top = 13
    Width = 132
    Height = 22
    Font.Charset = ARABIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = PasswordNonceKeyPress
  end
end
