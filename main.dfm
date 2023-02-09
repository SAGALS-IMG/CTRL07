object Form_main: TForm_main
  Left = 0
  Top = 0
  Caption = 'CTRL7'
  ClientHeight = 388
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 270
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 132
      Top = 9
      Width = 3
      Height = 162
    end
    object BB_Imager: TBitBtn
      Left = 8
      Top = 74
      Width = 105
      Height = 28
      Hint = 'Zyla'
      Caption = 'Imager'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BB_ImagerClick
    end
    object BB_Shutter: TBitBtn
      Left = 8
      Top = 108
      Width = 105
      Height = 28
      Caption = 'Shutter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BB_ShutterClick
    end
    object BB_Counter: TBitBtn
      Left = 8
      Top = 40
      Width = 105
      Height = 28
      Hint = 'TC48'
      Caption = 'CT48'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BB_CounterClick
    end
    object BB_PM16C: TBitBtn
      Left = 8
      Top = 6
      Width = 105
      Height = 28
      Hint = 'PM16C'
      Caption = 'PM16C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BB_PM16CClick
    end
    object BB_Macro: TBitBtn
      Left = 151
      Top = 74
      Width = 105
      Height = 28
      Caption = 'Macro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BB_MacroClick
    end
    object BB_CT: TBitBtn
      Left = 151
      Top = 6
      Width = 105
      Height = 28
      Caption = 'CT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BB_CTClick
    end
    object BB_Scan: TBitBtn
      Left = 151
      Top = 40
      Width = 105
      Height = 28
      Caption = 'Scanning'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BB_ScanClick
    end
    object BB_Option: TBitBtn
      Left = 151
      Top = 108
      Width = 105
      Height = 28
      Caption = 'SAKAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BB_OptionClick
    end
    object BB_Cryo: TBitBtn
      Left = 8
      Top = 142
      Width = 105
      Height = 28
      Caption = 'Cryo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = BB_CryoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 177
    Width = 270
    Height = 192
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 266
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object SB_Log_Save: TSpeedButton
        Left = 243
        Top = 0
        Width = 23
        Height = 20
        Hint = 'Save log'
        Align = alRight
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
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_Log_SaveClick
        ExplicitLeft = 238
        ExplicitTop = -5
      end
      object SB_Help: TSpeedButton
        Left = 0
        Top = 0
        Width = 23
        Height = 20
        Hint = 'Version Info'
        Align = alLeft
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_HelpClick
        ExplicitLeft = 40
        ExplicitHeight = 22
      end
      object SB_time: TSpeedButton
        Left = 23
        Top = 0
        Width = 23
        Height = 20
        Hint = 'Insert date & time'
        Align = alLeft
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333700000733333333F777773FF3333333007F0F70
          0333333773373377FF3333300FFF7FFF003333773F3333377FF33300F0FFFFF0
          F00337737333F37377F33707FFFF0FFFF70737F33337F33337FF300FFFFF0FFF
          FF00773F3337F333377F30707FFF0FFF70707F733337F333737F300FFFF09FFF
          FF0077F33377F33337733707FF0F9FFFF70737FF3737F33F37F33300F0FF9FF0
          F003377F7337F373773333300FFF9FFF00333377FF37F3377FF33300007F9F70
          000337777FF7FF77773333703070007030733373777777737333333333330333
          333333333337FF33333333333330003333333333337773333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_timeClick
        ExplicitLeft = 88
        ExplicitTop = -5
        ExplicitHeight = 22
      end
      object CB_Auto_Save: TCheckBox
        Left = 177
        Top = 0
        Width = 66
        Height = 20
        Align = alRight
        Caption = 'Auto Save'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object CB_Log: TCheckBox
        Left = 137
        Top = 0
        Width = 40
        Height = 20
        Align = alRight
        Caption = 'Log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object Memo: TRichEdit
      Left = 2
      Top = 22
      Width = 266
      Height = 168
      Align = alClient
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PlainText = True
      ScrollBars = ssBoth
      TabOrder = 1
      Zoom = 100
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 369
    Width = 270
    Height = 19
    Panels = <>
  end
  object SaveDialog1: TSaveDialog
    Left = 24
    Top = 177
  end
end
