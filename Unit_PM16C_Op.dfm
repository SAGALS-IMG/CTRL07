object Form_PM16C_Op: TForm_PM16C_Op
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'PM16C Options'
  ClientHeight = 486
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 60
    Width = 50
    Height = 14
    Caption = 'Position'
  end
  object Label2: TLabel
    Left = 8
    Top = 156
    Width = 71
    Height = 14
    Caption = 'High Spped'
  end
  object Label3: TLabel
    Left = 8
    Top = 183
    Width = 83
    Height = 14
    Caption = 'Middle Spped'
  end
  object Label4: TLabel
    Left = 8
    Top = 211
    Width = 68
    Height = 14
    Caption = 'Low Speed'
  end
  object Label5: TLabel
    Left = 112
    Top = 38
    Width = 84
    Height = 14
    Caption = 'Current Value'
  end
  object Label6: TLabel
    Left = 272
    Top = 38
    Width = 63
    Height = 14
    Caption = 'New Value'
  end
  object Label7: TLabel
    Left = 8
    Top = 239
    Width = 65
    Height = 14
    Caption = 'ACC. RATE'
  end
  object Bevel1: TBevel
    Left = 254
    Top = 48
    Width = 4
    Height = 358
  end
  object Label8: TLabel
    Left = 8
    Top = 277
    Width = 67
    Height = 14
    Caption = 'AXIS Name'
  end
  object Label9: TLabel
    Left = 8
    Top = 305
    Width = 60
    Height = 14
    Caption = 'Conv rate'
  end
  object Label10: TLabel
    Left = 7
    Top = 305
    Width = 20
    Height = 14
    Caption = 'CW'
  end
  object Label11: TLabel
    Left = 7
    Top = 333
    Width = 28
    Height = 14
    Caption = 'CCW'
  end
  object Label12: TLabel
    Left = 8
    Top = 16
    Width = 39
    Height = 19
    Caption = 'CH : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 7
    Top = 277
    Width = 25
    Height = 14
    Caption = 'Unit'
  end
  object Label14: TLabel
    Left = 8
    Top = 89
    Width = 80
    Height = 14
    Caption = 'Soft Limit (-)'
  end
  object Label15: TLabel
    Left = 8
    Top = 117
    Width = 85
    Height = 14
    Caption = 'Soft Limit (+)'
  end
  object Edit_P0: TEdit
    Left = 104
    Top = 58
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 13
    Text = 'Edit_P0'
  end
  object Edit_P1: TEdit
    Left = 264
    Top = 58
    Width = 140
    Height = 22
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit_HSP0: TEdit
    Left = 104
    Top = 153
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 14
    Text = 'Edit1'
  end
  object Edit_HSP1: TEdit
    Left = 264
    Top = 153
    Width = 140
    Height = 22
    TabOrder = 1
    Text = 'Edit1'
  end
  object Edit_MSP0: TEdit
    Left = 104
    Top = 180
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 15
    Text = 'Edit1'
  end
  object Edit_MSP1: TEdit
    Left = 264
    Top = 180
    Width = 140
    Height = 22
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit_LSP0: TEdit
    Left = 104
    Top = 208
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 16
    Text = 'Edit1'
  end
  object Edit_LSP1: TEdit
    Left = 264
    Top = 208
    Width = 140
    Height = 22
    TabOrder = 3
    Text = 'Edit1'
  end
  object BB_Set: TBitBtn
    Left = 193
    Top = 427
    Width = 81
    Height = 32
    Caption = 'Set'
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
    TabOrder = 11
    OnClick = BB_SetClick
  end
  object BB_Close: TBitBtn
    Left = 304
    Top = 427
    Width = 81
    Height = 32
    Caption = 'Close'
    TabOrder = 12
    OnClick = BB_CloseClick
  end
  object RG_LS: TRadioGroup
    Left = 8
    Top = 417
    Width = 145
    Height = 47
    Caption = ' LS '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'NO'
      'NC')
    TabOrder = 10
  end
  object CB_Rate1: TComboBox
    Left = 104
    Top = 236
    Width = 140
    Height = 22
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    TabStop = False
    Text = 'CB_Rate1'
    Items.Strings = (
      '1000 ms/1000pps'
      '910 ms/1000pps'
      '820 ms/1000pps'
      '750 ms/1000pps'
      '680 ms/1000pps'
      '620 ms/1000pps'
      '560 ms/1000pps'
      '510 ms/1000pps'
      '470 ms/1000pps'
      '430 ms/1000pps'
      '390 ms/1000pps'
      '360 ms/1000pps'
      '330 ms/1000pps'
      '300 ms/1000pps'
      '270 ms/1000pps'
      '240 ms/1000pps'
      '220 ms/1000pps'
      '200 ms/1000pps'
      '180 ms/1000pps'
      '160 ms/1000pps'
      '150 ms/1000pps'
      '130 ms/1000pps'
      '120 ms/1000pps'
      '110 ms/1000pps'
      '100 ms/1000pps'
      '91 ms/1000pps'
      '82 ms/1000pps'
      '75 ms/1000pps'
      '68 ms/1000pps'
      '62 ms/1000pps'
      '56 ms/1000pps'
      '51 ms/1000pps'
      '47 ms/1000pps'
      '43 ms/1000pps'
      '39 ms/1000pps'
      '36 ms/1000pps'
      '33 ms/1000pps'
      '30 ms/1000pps'
      '27 ms/1000pps'
      '24 ms/1000pps'
      '22 ms/1000pps'
      '20 ms/1000pps'
      '18 ms/1000pps'
      '16 ms/1000pps'
      '15 ms/1000pps'
      '13 ms/1000pps'
      '12 ms/1000pps'
      '11 ms/1000pps'
      '10 ms/1000pps'
      '9.1 ms/1000pps'
      '8.2 ms/1000pps'
      '7.5 ms/1000pps'
      '6.8 ms/1000pps'
      '6.2 ms/1000pps'
      '5.6 ms/1000pps'
      '5.1 ms/1000pps'
      '4.7 ms/1000pps'
      '4.3 ms/1000pps'
      '3.9 ms/1000pps'
      '3.6 ms/1000pps'
      '3.3 ms/1000pps'
      '3.0 ms/1000pps'
      '2.7 ms/1000pps'
      '2.4 ms/1000pps'
      '2.2 ms/1000pps'
      '2.0 ms/1000pps'
      '1.8 ms/1000pps'
      '1.6 ms/1000pps'
      '1.5 ms/1000pps'
      '1.3 ms/1000pps'
      '1.2 ms/1000pps'
      '1.1 ms/1000pps'
      '1.0 ms/1000pps')
  end
  object CB_Rate2: TComboBox
    Left = 264
    Top = 236
    Width = 140
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = 'CB_Rate2'
    Items.Strings = (
      '1000 ms/1000pps'
      '910 ms/1000pps'
      '820 ms/1000pps'
      '750 ms/1000pps'
      '680 ms/1000pps'
      '620 ms/1000pps'
      '560 ms/1000pps'
      '510 ms/1000pps'
      '470 ms/1000pps'
      '430 ms/1000pps'
      '390 ms/1000pps'
      '360 ms/1000pps'
      '330 ms/1000pps'
      '300 ms/1000pps'
      '270 ms/1000pps'
      '240 ms/1000pps'
      '220 ms/1000pps'
      '200 ms/1000pps'
      '180 ms/1000pps'
      '160 ms/1000pps'
      '150 ms/1000pps'
      '130 ms/1000pps'
      '120 ms/1000pps'
      '110 ms/1000pps'
      '100 ms/1000pps'
      '91 ms/1000pps'
      '82 ms/1000pps'
      '75 ms/1000pps'
      '68 ms/1000pps'
      '62 ms/1000pps'
      '56 ms/1000pps'
      '51 ms/1000pps'
      '47 ms/1000pps'
      '43 ms/1000pps'
      '39 ms/1000pps'
      '36 ms/1000pps'
      '33 ms/1000pps'
      '30 ms/1000pps'
      '27 ms/1000pps'
      '24 ms/1000pps'
      '22 ms/1000pps'
      '20 ms/1000pps'
      '18 ms/1000pps'
      '16 ms/1000pps'
      '15 ms/1000pps'
      '13 ms/1000pps'
      '12 ms/1000pps'
      '11 ms/1000pps'
      '10 ms/1000pps'
      '9.1 ms/1000pps'
      '8.2 ms/1000pps'
      '7.5 ms/1000pps'
      '6.8 ms/1000pps'
      '6.2 ms/1000pps'
      '5.6 ms/1000pps'
      '5.1 ms/1000pps'
      '4.7 ms/1000pps'
      '4.3 ms/1000pps'
      '3.9 ms/1000pps'
      '3.6 ms/1000pps'
      '3.3 ms/1000pps'
      '3.0 ms/1000pps'
      '2.7 ms/1000pps'
      '2.4 ms/1000pps'
      '2.2 ms/1000pps'
      '2.0 ms/1000pps'
      '1.8 ms/1000pps'
      '1.6 ms/1000pps'
      '1.5 ms/1000pps'
      '1.3 ms/1000pps'
      '1.2 ms/1000pps'
      '1.1 ms/1000pps'
      '1.0 ms/1000pps')
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 467
    Width = 414
    Height = 19
    Panels = <>
    ExplicitTop = 414
  end
  object Edit_AN0: TEdit
    Left = 104
    Top = 274
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 19
    Text = 'Edit_P0'
  end
  object Edit_AN1: TEdit
    Left = 264
    Top = 274
    Width = 140
    Height = 22
    TabOrder = 5
    Text = 'Edit1'
  end
  object Edit_CR0: TEdit
    Left = 104
    Top = 302
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 20
    Text = 'Edit_P0'
  end
  object Edit_CR1: TEdit
    Left = 264
    Top = 302
    Width = 140
    Height = 22
    TabOrder = 6
    Text = 'Edit1'
  end
  object Edit_CW0: TEdit
    Left = 104
    Top = 358
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 21
    Text = 'Edit_P0'
  end
  object Edit_CW1: TEdit
    Left = 264
    Top = 359
    Width = 140
    Height = 22
    TabOrder = 8
    Text = 'Edit1'
  end
  object Edit_CCW0: TEdit
    Left = 104
    Top = 386
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 22
    Text = 'Edit_P0'
  end
  object Edit_CCW1: TEdit
    Left = 264
    Top = 386
    Width = 140
    Height = 22
    TabOrder = 9
    Text = 'Edit1'
  end
  object Edit_U0: TEdit
    Left = 104
    Top = 330
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 23
    Text = 'Edit_U0'
  end
  object Edit_U1: TEdit
    Left = 264
    Top = 330
    Width = 140
    Height = 22
    TabOrder = 7
    Text = 'Edit_U1'
  end
  object Edit_SMin0: TEdit
    Left = 104
    Top = 86
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 24
    Text = '-1000000'
  end
  object Edit_SMin1: TEdit
    Left = 264
    Top = 86
    Width = 140
    Height = 22
    TabOrder = 25
    Text = '-1000000'
  end
  object Edit_SMax0: TEdit
    Left = 104
    Top = 114
    Width = 140
    Height = 22
    TabStop = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 26
    Text = '1000000'
  end
  object Edit_SMax1: TEdit
    Left = 264
    Top = 114
    Width = 140
    Height = 22
    TabOrder = 27
    Text = '1000000'
  end
end
