object Form_Macro: TForm_Macro
  Left = 0
  Top = 0
  Caption = 'Macro'
  ClientHeight = 660
  ClientWidth = 821
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
  object Splitter1: TSplitter
    Left = 0
    Top = 549
    Width = 821
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 289
    ExplicitWidth = 18
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 641
    Width = 821
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object SB_RUN: TSpeedButton
      Left = 0
      Top = 0
      Width = 57
      Height = 25
      Align = alLeft
      Caption = 'RUN'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
        00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
        70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
        70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
        70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
        70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
        70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
        00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
      NumGlyphs = 2
      OnClick = SB_RUNClick
      ExplicitLeft = 40
      ExplicitTop = 8
      ExplicitHeight = 22
    end
    object SB_Load: TSpeedButton
      Left = 775
      Top = 0
      Width = 23
      Height = 25
      Hint = 'Open Macro'
      Align = alRight
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333333FFFFF3333333333CCCCC33
        33333FFFF77777FFFFFFCCCCCC808CCCCCC377777737F777777F008888070888
        8003773FFF7773FFF77F0F0770F7F0770F037F777737F777737F70FFFFF7FFFF
        F07373F3FFF7F3FFF37F70F000F7F000F07337F77737F777373330FFFFF7FFFF
        F03337FF3FF7F3FF37F3370F00F7F00F0733373F7737F77337F3370FFFF7FFFF
        0733337F33373F337333330FFF030FFF03333373FF7373FF7333333000333000
        3333333777333777333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SB_LoadClick
      ExplicitLeft = 400
      ExplicitTop = 8
      ExplicitHeight = 22
    end
    object SB_Save: TSpeedButton
      Left = 798
      Top = 0
      Width = 23
      Height = 25
      Hint = 'Save Macro'
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
      OnClick = SB_SaveClick
      ExplicitLeft = 448
      ExplicitTop = 16
      ExplicitHeight = 22
    end
  end
  object Memo_res: TRichEdit
    Left = 0
    Top = 552
    Width = 821
    Height = 89
    Align = alBottom
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    Zoom = 100
  end
  object Memo: TJvHLEditor
    Left = 0
    Top = 25
    Width = 821
    Height = 524
    Cursor = crIBeam
    Completion.ItemHeight = 13
    Completion.CRLF = '/n'
    Completion.Separator = '='
    TabStops = '3 5'
    BracketHighlighting.StringEscape = #39#39
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Colors.Comment.Style = [fsItalic]
    Colors.Comment.ForeColor = clOlive
    Colors.Comment.BackColor = clWindow
    Colors.Number.ForeColor = clNavy
    Colors.Number.BackColor = clWindow
    Colors.Strings.ForeColor = clPurple
    Colors.Strings.BackColor = clWindow
    Colors.Symbol.ForeColor = clBlue
    Colors.Symbol.BackColor = clWindow
    Colors.Reserved.Style = [fsBold]
    Colors.Reserved.ForeColor = clWindowText
    Colors.Reserved.BackColor = clWindow
    Colors.Identifier.ForeColor = clWindowText
    Colors.Identifier.BackColor = clWindow
    Colors.Preproc.ForeColor = clGreen
    Colors.Preproc.BackColor = clWindow
    Colors.FunctionCall.ForeColor = clWindowText
    Colors.FunctionCall.BackColor = clWindow
    Colors.Declaration.ForeColor = clWindowText
    Colors.Declaration.BackColor = clWindow
    Colors.Statement.Style = [fsBold]
    Colors.Statement.ForeColor = clWindowText
    Colors.Statement.BackColor = clWindow
    Colors.PlainText.ForeColor = clWindowText
    Colors.PlainText.BackColor = clWindow
  end
  object JvInterpreterProgram1: TJvInterpreterProgram
    OnGetValue = JvInterpreterProgram1GetValue
    Left = 64
    Top = 168
  end
  object OpenDialog1: TOpenDialog
    Left = 168
    Top = 168
  end
  object SaveDialog1: TSaveDialog
    Left = 240
    Top = 168
  end
end
