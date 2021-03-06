object Form_PM16C: TForm_PM16C
  Left = 0
  Top = 0
  Caption = 'PM16C'
  ClientHeight = 556
  ClientWidth = 482
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
  object SB: TStatusBar
    Left = 0
    Top = 537
    Width = 482
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 22
    Width = 482
    Height = 515
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 482
      Height = 21
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object SB_Pulse: TSpeedButton
        Left = 459
        Top = 0
        Width = 23
        Height = 21
        Hint = 'Ping pulse'
        Align = alRight
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337FF3333333333330003333333333333777F333333333333080333
          3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
          33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
          B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
          BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
          B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
          3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
          333333333337F33333333333333B333333333333333733333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_PulseClick
        ExplicitLeft = 360
      end
      object SB_Refresh: TSpeedButton
        Left = 49
        Top = 0
        Width = 28
        Height = 21
        Hint = 'Refresh'
        Align = alLeft
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
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_RefreshClick
        ExplicitLeft = 46
      end
      object SB_Opt: TSpeedButton
        Left = 82
        Top = 0
        Width = 28
        Height = 21
        Hint = 'Option'
        Align = alLeft
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
          1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
          1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
          193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
          11155557F755F777777555000755033305555577755F75F77F55555555503335
          0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
          05555757F75F75557F5505000333555505557F777FF755557F55000000355557
          07557777777F55557F5555000005555707555577777FF5557F55553000075557
          0755557F7777FFF5755555335000005555555577577777555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_OptClick
        ExplicitLeft = 76
      end
      object SB_Table: TSpeedButton
        Left = 110
        Top = 0
        Width = 27
        Height = 21
        Hint = 'Option table'
        Align = alLeft
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C8807FF7777777777FF700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SB_TableClick
        ExplicitLeft = 457
        ExplicitTop = 6
      end
      object Label7: TLabel
        Left = 384
        Top = 3
        Width = 35
        Height = 14
        Caption = 'Ping: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CB_Ping_Ch: TComboBox
        Left = 424
        Top = 0
        Width = 35
        Height = 21
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = '0'
        Items.Strings = (
          '0'
          '1'
          '2'
          '3')
      end
      object Panel6: TPanel
        Left = 77
        Top = 0
        Width = 5
        Height = 21
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
      end
      object CB_R_M: TCheckBox
        Left = 3
        Top = 0
        Width = 46
        Height = 21
        Align = alLeft
        Caption = 'R/ L'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        OnClick = CB_R_MClick
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 3
        Height = 21
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
      end
    end
    object SG_Pos: TStringGrid
      Left = 0
      Top = 21
      Width = 482
      Height = 397
      Align = alClient
      ColCount = 7
      DefaultRowHeight = 22
      FixedCols = 0
      RowCount = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      ParentFont = False
      TabOrder = 1
      OnSelectCell = SG_PosSelectCell
      ColWidths = (
        64
        64
        64
        64
        64
        64
        64)
      RowHeights = (
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22
        22)
    end
    object Panel2: TPanel
      Left = 0
      Top = 418
      Width = 482
      Height = 97
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object SB_PM1: TSpeedButton
        Left = 82
        Top = 31
        Width = 23
        Height = 22
        Caption = #177
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SB_PM1Click
      end
      object Label4: TLabel
        Left = 173
        Top = 67
        Width = 32
        Height = 13
        Caption = '[mm]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 173
        Top = 34
        Width = 32
        Height = 13
        Caption = '[mm]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SB_PM2: TSpeedButton
        Left = 81
        Top = 63
        Width = 23
        Height = 22
        Caption = #177
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SB_PM2Click
      end
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 30
        Height = 16
        Caption = 'CH : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 73
        Top = 6
        Width = 38
        Height = 16
        Caption = 'POS : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RG_SP: TRadioGroup
        Left = 292
        Top = 9
        Width = 116
        Height = 41
        Caption = ' Speed '
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'H'
          'M'
          'L')
        ParentFont = False
        TabOrder = 5
        OnClick = RG_SPClick
      end
      object CB_PLS: TCheckBox
        Left = 213
        Top = 68
        Width = 48
        Height = 15
        Caption = 'PLS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = CB_PLSClick
      end
      object Panel4: TPanel
        Left = 292
        Top = 56
        Width = 85
        Height = 32
        TabOrder = 7
        object Label6: TLabel
          Left = 23
          Top = 8
          Width = 54
          Height = 16
          Caption = 'CCW SW'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RB_CCW: TRadioButton
          Left = 3
          Top = 8
          Width = 14
          Height = 17
          Checked = True
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnFace
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          TabStop = True
        end
      end
      object BB_MoveBy_p: TBitBtn
        Left = 211
        Top = 29
        Width = 75
        Height = 26
        Caption = 'Move By'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BB_MoveBy_pClick
      end
      object BB_MoveTo: TBitBtn
        Left = 5
        Top = 61
        Width = 75
        Height = 26
        Caption = 'Move To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BB_MoveToClick
      end
      object BB_MoveBy_m: TBitBtn
        Left = 5
        Top = 29
        Width = 75
        Height = 26
        Caption = 'Move -By'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 33023
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BB_MoveBy_mClick
      end
      object Edit_MoveBy: TEdit
        Left = 103
        Top = 31
        Width = 65
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Text = '0.000'
      end
      object Edit_MoveTo: TEdit
        Left = 103
        Top = 64
        Width = 65
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Text = '0.000'
      end
      object Panel5: TPanel
        Left = 387
        Top = 56
        Width = 85
        Height = 32
        TabOrder = 8
        object Label5: TLabel
          Left = 31
          Top = 8
          Width = 46
          Height = 16
          Caption = 'CW SW'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RB_CW: TRadioButton
          Left = 8
          Top = 8
          Width = 17
          Height = 17
          TabOrder = 0
        end
      end
      object CB_EN: TCheckBox
        Left = 414
        Top = 27
        Width = 64
        Height = 15
        Caption = 'Enable'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = CB_ENClick
      end
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object CB_Connect: TCheckBox
      Left = 3
      Top = 0
      Width = 82
      Height = 22
      Align = alLeft
      Caption = 'Connect : '
      TabOrder = 0
      OnClick = CB_ConnectClick
    end
    object Edit_IP: TEdit
      Left = 85
      Top = 0
      Width = 125
      Height = 22
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitHeight = 24
    end
    object Panel7: TPanel
      Left = 210
      Top = 0
      Width = 51
      Height = 22
      Align = alLeft
      BevelOuter = bvNone
      Caption = '  Mode : '
      TabOrder = 3
    end
    object CB_Mode: TComboBox
      Left = 261
      Top = 0
      Width = 84
      Height = 22
      Align = alLeft
      TabOrder = 2
      Text = 'Exp'
    end
    object Panel9: TPanel
      Left = 0
      Top = 0
      Width = 3
      Height = 22
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 4
    end
  end
  object IdTCPClient: TIdTCPClient
    ConnectTimeout = 0
    Host = '192.168.0.120'
    IPVersion = Id_IPv4
    Port = 7777
    ReadTimeout = -1
    Left = 56
    Top = 134
  end
  object OpenDialog1: TOpenDialog
    Left = 56
    Top = 189
  end
  object SaveDialog1: TSaveDialog
    Left = 128
    Top = 189
  end
end
