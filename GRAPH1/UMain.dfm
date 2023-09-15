object FMain: TFMain
  Left = 0
  Top = 0
  Caption = #1043#1088#1072#1092#1080#1082' '#1090#1077#1089#1090' 1'
  ClientHeight = 223
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 176
    Width = 95
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1077#1085#1089#1086#1088#1072':'
  end
  object Button3: TButton
    Left = 8
    Top = 8
    Width = 115
    Height = 25
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1073#1072#1079#1091
    TabOrder = 0
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 60
    Width = 115
    Height = 25
    Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1075#1088#1072#1092#1080#1082
    TabOrder = 1
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 129
    Top = 10
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 35
    Width = 115
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1082#1085#1072
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 85
    Width = 115
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1072
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object Button1: TButton
    Left = 280
    Top = 196
    Width = 109
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1085#1089#1086#1088
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 4
    Top = 196
    Width = 265
    Height = 25
    TabOrder = 6
    Text = 'Edit2'
  end
  object FDC: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=S:\time.sqlite'
      'LockingMode=Normal'
      'JournalMode=Memory')
    LoginPrompt = False
    Left = 148
    Top = 48
  end
  object Query1: TFDQuery
    Connection = FDC
    SQL.Strings = (
      '')
    Left = 212
    Top = 48
  end
end
