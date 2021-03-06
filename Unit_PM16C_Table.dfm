object Form_16C_Table: TForm_16C_Table
  Left = 0
  Top = 0
  Caption = 'Options'
  ClientHeight = 631
  ClientWidth = 1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 1086
    Height = 612
    Align = alClient
    Caption = ' PM16C '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -6
    ExplicitWidth = 1106
    object Label6: TLabel
      Left = 16
      Top = 27
      Width = 56
      Height = 14
      Caption = 'IP adress'
    end
    object Label7: TLabel
      Left = 16
      Top = 54
      Width = 27
      Height = 14
      Caption = 'Port'
    end
    object SB_PM16C_Ver: TSpeedButton
      Left = 159
      Top = 51
      Width = 34
      Height = 22
      Caption = 'ver'
      Flat = True
      OnClick = SB_PM16C_VerClick
    end
    object Label9: TLabel
      Left = 608
      Top = 40
      Width = 12
      Height = 14
      Caption = '   '
    end
    object Label_PM16C_ver: TLabel
      Left = 204
      Top = 55
      Width = 24
      Height = 14
      Caption = '___'
    end
    object Label5: TLabel
      Left = 234
      Top = 90
      Width = 50
      Height = 14
      Caption = 'Position'
    end
    object Label10: TLabel
      Left = 321
      Top = 90
      Width = 51
      Height = 14
      Caption = 'H Speed'
    end
    object Label11: TLabel
      Left = 391
      Top = 90
      Width = 53
      Height = 14
      Caption = 'M Speed'
    end
    object Label12: TLabel
      Left = 463
      Top = 90
      Width = 49
      Height = 14
      Caption = 'L Speed'
    end
    object Label13: TLabel
      Left = 785
      Top = 82
      Width = 31
      Height = 14
      Caption = 'Conv'
    end
    object Label14: TLabel
      Left = 112
      Top = 90
      Width = 70
      Height = 14
      Caption = ' Axis Name '
    end
    object SB_Reflesh: TSpeedButton
      Left = 880
      Top = 52
      Width = 80
      Height = 22
      Caption = 'Reload'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00559999999995
        5555557777777775F5555559999999505555555777777757FFF5555555555550
        0955555555555FF7775F55555555995501955555555577557F75555555555555
        01995555555555557F5755555555555501905555555555557F57555555555555
        0F905555555555557FF75555555555500005555555555557777555555555550F
        F05555555555557F57F5555555555008F05555555555F775F755555555570000
        05555555555775577555555555700007555555555F755F775555555570000755
        55555555775F77555555555700075555555555F75F7755555555570007555555
        5555577F77555555555500075555555555557777555555555555}
      NumGlyphs = 2
      OnClick = SB_RefleshClick
    end
    object Label3: TLabel
      Left = 569
      Top = 90
      Width = 65
      Height = 14
      Caption = 'ACC. RATE'
    end
    object Label8: TLabel
      Left = 706
      Top = 90
      Width = 15
      Height = 14
      Caption = 'LS'
    end
    object Label15: TLabel
      Left = 764
      Top = 95
      Width = 79
      Height = 14
      Caption = '[pls/mm,sec]'
    end
    object Label16: TLabel
      Left = 17
      Top = 90
      Width = 63
      Height = 14
      Caption = 'PM16C Ch'
    end
    object SB_Save: TSpeedButton
      Left = 984
      Top = 24
      Width = 95
      Height = 22
      Caption = 'Save Pos.'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      OnClick = SB_SaveClick
    end
    object SB_Load: TSpeedButton
      Left = 984
      Top = 52
      Width = 95
      Height = 22
      Caption = 'Load Pos.'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = SB_LoadClick
    end
    object Label1: TLabel
      Left = 875
      Top = 90
      Width = 25
      Height = 14
      Caption = 'Unit'
    end
    object Label2: TLabel
      Left = 950
      Top = 90
      Width = 28
      Height = 14
      Caption = 'CCW'
    end
    object Label4: TLabel
      Left = 1030
      Top = 90
      Width = 20
      Height = 14
      Caption = 'CW'
    end
    object SB_Update: TSpeedButton
      Left = 880
      Top = 24
      Width = 80
      Height = 22
      Caption = 'Update'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      OnClick = SB_UpdateClick
    end
    object Edit_PM16C_IP: TEdit
      Left = 80
      Top = 24
      Width = 209
      Height = 22
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      Text = '10.7.3.104'
    end
    object Edit_PM16C_Port: TEdit
      Left = 80
      Top = 51
      Width = 73
      Height = 22
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '7777'
    end
    object CB_remote: TCheckBox
      Left = 785
      Top = 27
      Width = 71
      Height = 17
      Caption = 'Remote'
      TabOrder = 2
      OnClick = CB_remoteClick
    end
    object BB_CH0: TBitBtn
      Left = 16
      Top = 112
      Width = 65
      Height = 25
      Caption = 'CH0'
      TabOrder = 3
      OnClick = BB_CH0Click
    end
    object BB_CH1: TBitBtn
      Tag = 1
      Left = 16
      Top = 143
      Width = 65
      Height = 25
      Caption = 'CH1'
      TabOrder = 4
      OnClick = BB_CH0Click
    end
    object BB_CH2: TBitBtn
      Tag = 2
      Left = 16
      Top = 174
      Width = 65
      Height = 25
      Caption = 'CH2'
      TabOrder = 5
      OnClick = BB_CH0Click
    end
    object BB_CH3: TBitBtn
      Tag = 3
      Left = 16
      Top = 205
      Width = 65
      Height = 25
      Caption = 'CH3'
      TabOrder = 6
      OnClick = BB_CH0Click
    end
    object BB_CH4: TBitBtn
      Tag = 4
      Left = 16
      Top = 236
      Width = 65
      Height = 25
      Caption = 'CH4'
      TabOrder = 7
      OnClick = BB_CH0Click
    end
    object BB_CH5: TBitBtn
      Tag = 5
      Left = 16
      Top = 267
      Width = 65
      Height = 25
      Caption = 'CH5'
      TabOrder = 8
      OnClick = BB_CH0Click
    end
    object BB_CH6: TBitBtn
      Tag = 6
      Left = 16
      Top = 298
      Width = 65
      Height = 25
      Caption = 'CH6'
      TabOrder = 9
      OnClick = BB_CH0Click
    end
    object BB_CH7: TBitBtn
      Tag = 7
      Left = 16
      Top = 329
      Width = 65
      Height = 25
      Caption = 'CH7'
      TabOrder = 10
      OnClick = BB_CH0Click
    end
    object BB_CH8: TBitBtn
      Tag = 8
      Left = 16
      Top = 360
      Width = 65
      Height = 25
      Caption = 'CH8'
      TabOrder = 11
      OnClick = BB_CH0Click
    end
    object BB_CH9: TBitBtn
      Tag = 9
      Left = 16
      Top = 391
      Width = 65
      Height = 25
      Caption = 'CH9'
      TabOrder = 12
      OnClick = BB_CH0Click
    end
    object BB_CH10: TBitBtn
      Tag = 10
      Left = 16
      Top = 422
      Width = 65
      Height = 25
      Caption = 'CH10'
      TabOrder = 13
      OnClick = BB_CH0Click
    end
    object BB_CH11: TBitBtn
      Tag = 11
      Left = 16
      Top = 453
      Width = 65
      Height = 25
      Caption = 'CH11'
      TabOrder = 14
      OnClick = BB_CH0Click
    end
    object BB_CH12: TBitBtn
      Tag = 12
      Left = 16
      Top = 484
      Width = 65
      Height = 25
      Caption = 'CH12'
      TabOrder = 15
      OnClick = BB_CH0Click
    end
    object BB_CH13: TBitBtn
      Tag = 13
      Left = 16
      Top = 515
      Width = 65
      Height = 25
      Caption = 'CH13'
      TabOrder = 16
      OnClick = BB_CH0Click
    end
    object BB_CH14: TBitBtn
      Tag = 14
      Left = 16
      Top = 546
      Width = 65
      Height = 25
      Caption = 'CH14'
      TabOrder = 17
      OnClick = BB_CH0Click
    end
    object BB_CH015: TBitBtn
      Tag = 15
      Left = 16
      Top = 577
      Width = 65
      Height = 25
      Caption = 'CH15'
      TabOrder = 18
      OnClick = BB_CH0Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 612
    Width = 1086
    Height = 19
    Panels = <>
    ExplicitWidth = 714
  end
end
