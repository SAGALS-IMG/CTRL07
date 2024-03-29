object Form_Imager: TForm_Imager
  Left = 0
  Top = 0
  Caption = 'Imager'
  ClientHeight = 582
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SB: TStatusBar
    Left = 0
    Top = 563
    Width = 399
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 399
    Height = 297
    Align = alTop
    Caption = ' Zyla '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Panel1: TPanel
      Left = 2
      Top = 16
      Width = 395
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object BB_Init: TBitBtn
        Left = 2
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Init'
        TabOrder = 0
        OnClick = BB_InitClick
      end
      object BB_SetExp: TBitBtn
        Left = 83
        Top = 4
        Width = 75
        Height = 25
        Hint = 'Set Exp. Time'
        Caption = 'Set ExpT'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BB_SetExpClick
      end
      object BB_Aq: TBitBtn
        Left = 175
        Top = 4
        Width = 75
        Height = 25
        Hint = 'Acqure image'
        Caption = 'Acquire'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BB_AqClick
      end
      object BB_Live: TBitBtn
        Left = 256
        Top = 4
        Width = 65
        Height = 25
        Hint = 'Live ON'
        Caption = 'LIVE'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BB_LiveClick
      end
      object BB_LiveOFF: TBitBtn
        Left = 327
        Top = 4
        Width = 65
        Height = 25
        Hint = 'Live OFF'
        Caption = 'STOP'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BB_LiveOFFClick
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 51
      Width = 395
      Height = 244
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 1
      object Shape2: TShape
        Left = 24
        Top = 25
        Width = 137
        Height = 48
        Brush.Color = clMoneyGreen
      end
      object Label2: TLabel
        Left = 8
        Top = 123
        Width = 54
        Height = 14
        Caption = 'Binning: '
      end
      object Label3: TLabel
        Left = 204
        Top = 72
        Width = 81
        Height = 14
        Caption = 'Trigger Mode'
      end
      object Label4: TLabel
        Left = 204
        Top = 17
        Width = 58
        Height = 14
        Caption = 'Exp. Time'
      end
      object Label7: TLabel
        Left = 353
        Top = 16
        Width = 27
        Height = 14
        Caption = '[ms]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 193
        Top = 9
        Width = 3
        Height = 193
      end
      object Bevel3: TBevel
        Left = 300
        Top = 170
        Width = 80
        Height = 22
      end
      object Label8: TLabel
        Left = 8
        Top = 148
        Width = 94
        Height = 14
        Caption = 'Dynamic Range'
      end
      object Label9: TLabel
        Left = 204
        Top = 126
        Width = 86
        Height = 14
        Caption = 'Readout Rate'
      end
      object Label10: TLabel
        Left = 204
        Top = 99
        Width = 86
        Height = 14
        Caption = 'Shutter Mode'
      end
      object SB_Get_Temp: TSpeedButton
        Left = 204
        Top = 170
        Width = 81
        Height = 22
        Caption = 'Get Temp     '
        Flat = True
        OnClick = SB_Get_TempClick
      end
      object Label_PW: TLabel
        Left = 41
        Top = 41
        Width = 49
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '2048'
      end
      object Label_PH: TLabel
        Left = 109
        Top = 41
        Width = 49
        Height = 13
        AutoSize = False
        Caption = '2048'
      end
      object Label6: TLabel
        Left = 96
        Top = 40
        Width = 10
        Height = 14
        Caption = #215
      end
      object Label11: TLabel
        Left = 204
        Top = 45
        Width = 73
        Height = 14
        Caption = 'Frame Rate '
      end
      object Label12: TLabel
        Left = 351
        Top = 44
        Width = 29
        Height = 14
        Caption = '[fps]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label_FPS: TLabel
        Left = 299
        Top = 45
        Width = 45
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '1.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label_tmep: TLabel
        Left = 309
        Top = 174
        Width = 65
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
      end
      object SB_Com: TSpeedButton
        Left = 353
        Top = 214
        Width = 27
        Height = 22
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
          055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
          005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
          B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
          305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
          305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
          30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
          3055577777555557F7F555000555555999555577755555577755}
        NumGlyphs = 2
        OnClick = SB_ComClick
      end
      object SB_Copy: TSpeedButton
        Left = 31
        Top = 38
        Width = 22
        Height = 22
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
        OnClick = SB_CopyClick
      end
      object Label13: TLabel
        Left = 8
        Top = 196
        Width = 61
        Height = 14
        Caption = 'Command'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit_ROI_Y1: TEdit
        Left = 59
        Top = 14
        Width = 45
        Height = 22
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 1
        Text = '1'
      end
      object Edit_ROI_X1: TEdit
        Left = 8
        Top = 14
        Width = 45
        Height = 22
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 0
        Text = '1'
      end
      object Edit_ROI_X2: TEdit
        Left = 84
        Top = 60
        Width = 45
        Height = 22
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        Text = '2560'
      end
      object Edit_ROI_Y2: TEdit
        Left = 135
        Top = 60
        Width = 45
        Height = 22
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 3
        Text = '2160'
      end
      object CB_BIN: TComboBox
        Left = 104
        Top = 120
        Width = 78
        Height = 22
        ItemIndex = 0
        TabOrder = 6
        Text = '1x1'
        OnChange = CB_BINChange
        Items.Strings = (
          '1x1'
          '2x2'
          '3x3'
          '4x4'
          '8x8')
      end
      object CB_Trig: TComboBox
        Left = 300
        Top = 69
        Width = 80
        Height = 22
        TabOrder = 9
        Text = 'Internal'
        OnChange = CB_TrigChange
        Items.Strings = (
          'Internal'
          'Software'
          'External'
          'External Start'
          'External Exposure')
      end
      object Edit_ExpT: TEdit
        Left = 300
        Top = 13
        Width = 47
        Height = 22
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        TabOrder = 8
        Text = '1000'
      end
      object CB_Range: TComboBox
        Left = 13
        Top = 168
        Width = 174
        Height = 22
        ItemIndex = 0
        TabOrder = 7
        Text = '12 bit (high well capacity)'
        OnChange = CB_RangeChange
        Items.Strings = (
          '12 bit (high well capacity)'
          '12 bit (low noise)'
          '16 bit (low noise & high well capacity)')
      end
      object CB_Shutte_Mode: TComboBox
        Left = 300
        Top = 96
        Width = 80
        Height = 22
        Enabled = False
        ItemIndex = 0
        TabOrder = 10
        Text = 'Rolling'
        OnChange = CB_Shutte_ModeChange
        Items.Strings = (
          'Rolling'
          'Global')
      end
      object CB_Rate: TComboBox
        Left = 300
        Top = 123
        Width = 80
        Height = 22
        Enabled = False
        ItemIndex = 0
        TabOrder = 11
        Text = '100 MHz'
        OnChange = CB_RateChange
        Items.Strings = (
          '100 MHz'
          '280 MHz')
      end
      object CB_Cooling: TCheckBox
        Left = 204
        Top = 150
        Width = 81
        Height = 17
        Caption = 'Cooling'
        Enabled = False
        TabOrder = 12
        OnClick = CB_CoolingClick
      end
      object BB_ROI: TBitBtn
        Left = 8
        Top = 87
        Width = 85
        Height = 25
        Caption = 'Set ROI'
        TabOrder = 4
        OnClick = BB_ROIClick
      end
      object BB_Set_Full: TBitBtn
        Left = 101
        Top = 87
        Width = 85
        Height = 25
        Caption = 'Set Full'
        TabOrder = 5
        OnClick = BB_Set_FullClick
      end
      object Edit_Comm: TEdit
        Left = 8
        Top = 214
        Width = 345
        Height = 22
        TabOrder = 13
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 297
    Width = 399
    Height = 104
    Align = alTop
    Caption = ' Aquasition test  '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label5: TLabel
      Left = 154
      Top = 94
      Width = 4
      Height = 14
    end
    object Label26: TLabel
      Left = 130
      Top = 55
      Width = 23
      Height = 14
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '~ '#916
    end
    object Label27: TLabel
      Left = 211
      Top = 57
      Width = 10
      Height = 14
      Caption = #215
    end
    object SB_Test: TSpeedButton
      Left = 374
      Top = 52
      Width = 17
      Height = 22
      Hint = 'Test'
      Caption = 'test'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -7
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SB_TestClick
    end
    object SB_Re_Show: TSpeedButton
      Left = 194
      Top = 21
      Width = 77
      Height = 22
      Caption = 'Move Axis'
      Flat = True
      OnClick = SB_Re_ShowClick
    end
    object Label1: TLabel
      Left = 15
      Top = 83
      Width = 109
      Height = 14
      Caption = 'Waiting time [ms]'
    end
    object BB_Scan_ST: TBitBtn
      Left = 10
      Top = 20
      Width = 85
      Height = 25
      Caption = 'Start'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BB_Scan_STClick
    end
    object BB_Stop: TBitBtn
      Left = 103
      Top = 20
      Width = 85
      Height = 25
      Caption = 'STOP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BB_StopClick
    end
    object CB_SaveData: TCheckBox
      Left = 282
      Top = 54
      Width = 81
      Height = 17
      Caption = 'Save Img'
      TabOrder = 7
    end
    object Edit_Scan_Orig: TEdit
      Left = 10
      Top = 52
      Width = 55
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taRightJustify
      TabOrder = 3
      Text = '-500'
    end
    object Edit_Scan_d: TEdit
      Left = 158
      Top = 52
      Width = 50
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taRightJustify
      TabOrder = 5
      Text = '100'
    end
    object Edit_Scan_n: TEdit
      Left = 224
      Top = 52
      Width = 50
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taRightJustify
      TabOrder = 6
      Text = '100'
    end
    object CB_axis_aux: TComboBox
      Left = 277
      Top = 21
      Width = 105
      Height = 22
      TabOrder = 2
      OnChange = CB_axis_auxChange
    end
    object Edit_Scan_ST: TEdit
      Left = 76
      Top = 52
      Width = 50
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taRightJustify
      TabOrder = 4
      Text = '0'
    end
    object Edit_WaitT: TEdit
      Left = 158
      Top = 80
      Width = 50
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taRightJustify
      TabOrder = 8
      Text = '0'
    end
  end
  object Chart1: TChart
    Left = 0
    Top = 401
    Width = 399
    Height = 162
    BackWall.Brush.Gradient.Direction = gdBottomTop
    BackWall.Brush.Gradient.EndColor = clWhite
    BackWall.Brush.Gradient.StartColor = 15395562
    BackWall.Brush.Gradient.Visible = True
    BackWall.Transparent = False
    Foot.Font.Color = clBlue
    Foot.Font.Name = 'Verdana'
    Gradient.Direction = gdBottomTop
    Gradient.EndColor = clWhite
    Gradient.MidColor = 15395562
    Gradient.StartColor = 15395562
    Gradient.Visible = True
    LeftWall.Color = 14745599
    Legend.Font.Name = 'Verdana'
    Legend.Shadow.Transparency = 0
    Legend.Visible = False
    RightWall.Color = 14745599
    Title.Font.Name = 'Verdana'
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Axis.Color = 4210752
    BottomAxis.Grid.Color = 11119017
    BottomAxis.LabelsFormat.Font.Name = 'Verdana'
    BottomAxis.TicksInner.Color = 11119017
    BottomAxis.Title.Font.Name = 'Verdana'
    DepthAxis.Axis.Color = 4210752
    DepthAxis.Grid.Color = 11119017
    DepthAxis.LabelsFormat.Font.Name = 'Verdana'
    DepthAxis.TicksInner.Color = 11119017
    DepthAxis.Title.Font.Name = 'Verdana'
    DepthTopAxis.Axis.Color = 4210752
    DepthTopAxis.Grid.Color = 11119017
    DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
    DepthTopAxis.TicksInner.Color = 11119017
    DepthTopAxis.Title.Font.Name = 'Verdana'
    LeftAxis.Axis.Color = 4210752
    LeftAxis.Grid.Color = 11119017
    LeftAxis.LabelsFormat.Font.Name = 'Verdana'
    LeftAxis.TicksInner.Color = 11119017
    LeftAxis.Title.Font.Name = 'Verdana'
    RightAxis.Axis.Color = 4210752
    RightAxis.Grid.Color = 11119017
    RightAxis.LabelsFormat.Font.Name = 'Verdana'
    RightAxis.TicksInner.Color = 11119017
    RightAxis.Title.Font.Name = 'Verdana'
    TopAxis.Axis.Color = 4210752
    TopAxis.Grid.Color = 11119017
    TopAxis.LabelsFormat.Font.Name = 'Verdana'
    TopAxis.TicksInner.Color = 11119017
    TopAxis.Title.Font.Name = 'Verdana'
    View3D = False
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      HoverElement = [heCurrent]
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 250
    Top = 450
  end
end
