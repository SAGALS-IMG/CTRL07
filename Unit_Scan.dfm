object Form_Scan: TForm_Scan
  Left = 0
  Top = 0
  Caption = 'Scanning'
  ClientHeight = 732
  ClientWidth = 1125
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object SB: TStatusBar
    Left = 0
    Top = 713
    Width = 1125
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1125
    Height = 321
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 89
      Top = 0
      Width = 177
      Height = 321
      Align = alLeft
      Caption = ' 1st loop '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 19
        Width = 30
        Height = 14
        Caption = 'AXIS'
      end
      object Label2: TLabel
        Left = 16
        Top = 182
        Width = 30
        Height = 14
        Caption = 'AXIS'
      end
      object Label3: TLabel
        Left = 16
        Top = 75
        Width = 40
        Height = 14
        Caption = 'START'
      end
      object Label4: TLabel
        Left = 16
        Top = 103
        Width = 24
        Height = 14
        Caption = 'END'
      end
      object Label5: TLabel
        Left = 16
        Top = 131
        Width = 30
        Height = 14
        Caption = 'STEP'
      end
      object Label6: TLabel
        Left = 16
        Top = 238
        Width = 40
        Height = 14
        Caption = 'START'
      end
      object Label7: TLabel
        Left = 16
        Top = 266
        Width = 24
        Height = 14
        Caption = 'END'
      end
      object Label8: TLabel
        Left = 16
        Top = 294
        Width = 30
        Height = 14
        Caption = 'STEP'
      end
      object Label14: TLabel
        Left = 16
        Top = 47
        Width = 25
        Height = 14
        Caption = 'Orig'
      end
      object Label15: TLabel
        Left = 16
        Top = 210
        Width = 25
        Height = 14
        Caption = 'Orig'
      end
      object CB_L1: TComboBox
        Left = 76
        Top = 16
        Width = 89
        Height = 22
        TabOrder = 0
      end
      object Edit_L1_ST: TEdit
        Left = 76
        Top = 72
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 2
        Text = '0'
      end
      object Edit_L1_End: TEdit
        Left = 76
        Top = 100
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 3
        Text = '10000'
      end
      object Edit_L1_d: TEdit
        Left = 76
        Top = 128
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 4
        Text = '200'
      end
      object CB_L12: TComboBox
        Left = 76
        Top = 179
        Width = 89
        Height = 22
        TabOrder = 5
      end
      object CB_L1_Sync: TCheckBox
        Left = 16
        Top = 159
        Width = 97
        Height = 17
        Caption = 'Synchro axis'
        TabOrder = 10
      end
      object Edit_L12_ST: TEdit
        Left = 76
        Top = 235
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 7
        Text = '0'
      end
      object Edit_L12_End: TEdit
        Left = 76
        Top = 263
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 8
        Text = '1000'
      end
      object Edit_L12_d: TEdit
        Left = 76
        Top = 291
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 9
        Text = '0'
      end
      object Edit_OX11: TEdit
        Left = 76
        Top = 44
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 1
        Text = '-500'
      end
      object Edit_OX12: TEdit
        Left = 76
        Top = 207
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 6
        Text = '-500'
      end
    end
    object GroupBox2: TGroupBox
      Left = 266
      Top = 0
      Width = 177
      Height = 321
      Align = alLeft
      Caption = ' 2nd loop '
      TabOrder = 1
      object Label9: TLabel
        Left = 18
        Top = 47
        Width = 30
        Height = 14
        Caption = 'AXIS'
      end
      object Label11: TLabel
        Left = 18
        Top = 103
        Width = 40
        Height = 14
        Caption = 'START'
      end
      object Label12: TLabel
        Left = 18
        Top = 131
        Width = 24
        Height = 14
        Caption = 'END'
      end
      object Label13: TLabel
        Left = 18
        Top = 159
        Width = 30
        Height = 14
        Caption = 'STEP'
      end
      object Label16: TLabel
        Left = 18
        Top = 75
        Width = 25
        Height = 14
        Caption = 'Orig'
      end
      object Label23: TLabel
        Left = 18
        Top = 187
        Width = 30
        Height = 14
        Caption = 'Shift'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 16
        Top = 215
        Width = 48
        Height = 14
        Caption = 'Wait [s]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CB_L2: TComboBox
        Left = 78
        Top = 44
        Width = 89
        Height = 22
        TabOrder = 1
      end
      object Edit_L2_ST: TEdit
        Left = 78
        Top = 100
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 3
        Text = '0'
      end
      object Edit_L2_End: TEdit
        Left = 78
        Top = 128
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 4
        Text = '1000'
      end
      object Edit_L2_d: TEdit
        Left = 78
        Top = 156
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 5
        Text = '150'
      end
      object CB_L2_Enable: TCheckBox
        Left = 16
        Top = 18
        Width = 97
        Height = 17
        Caption = ' Enable '
        TabOrder = 0
      end
      object Edit_OX2: TEdit
        Left = 78
        Top = 72
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 2
        Text = '-500'
      end
      object Edit_Shift: TEdit
        Left = 78
        Top = 184
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 6
        Text = '0'
      end
      object GroupBox4: TGroupBox
        Left = 6
        Top = 240
        Width = 165
        Height = 75
        Caption = 'Cont scan cnd && status'
        TabOrder = 8
        object Label24: TLabel
          Left = 12
          Top = 24
          Width = 84
          Height = 14
          Caption = 'Over run [pls]'
        end
        object Label27: TLabel
          Left = 12
          Top = 47
          Width = 54
          Height = 14
          Caption = 'Position:'
        end
        object Label28: TLabel
          Left = 80
          Top = 52
          Width = 73
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
        end
        object Edit_OR: TEdit
          Left = 102
          Top = 20
          Width = 59
          Height = 22
          TabOrder = 0
          Text = '100'
        end
      end
      object Edit_Wait: TEdit
        Left = 78
        Top = 212
        Width = 89
        Height = 22
        Alignment = taRightJustify
        TabOrder = 7
        Text = '0'
      end
    end
    object GroupBox3: TGroupBox
      Left = 443
      Top = 0
      Width = 682
      Height = 321
      Align = alClient
      Caption = ' NCT8 '
      TabOrder = 2
      object Bevel2: TBevel
        Left = 6
        Top = 223
        Width = 186
        Height = 90
      end
      object Label17: TLabel
        Left = 6
        Top = 18
        Width = 119
        Height = 14
        Caption = 'Counting time [ms]'
      end
      object Label10: TLabel
        Left = 216
        Top = 18
        Width = 44
        Height = 14
        Caption = 'Counts'
      end
      object Label18: TLabel
        Left = 11
        Top = 232
        Width = 13
        Height = 14
        Caption = 'Io'
      end
      object Label19: TLabel
        Left = 103
        Top = 232
        Width = 10
        Height = 14
        Caption = 'If'
      end
      object Bevel1: TBevel
        Left = 6
        Top = 112
        Width = 186
        Height = 86
      end
      object Label22: TLabel
        Left = 6
        Top = 92
        Width = 34
        Height = 14
        Caption = 'Chart'
      end
      object Label25: TLabel
        Left = 6
        Top = 203
        Width = 53
        Height = 14
        Caption = 'Mapping'
      end
      object Label20: TLabel
        Left = 14
        Top = 288
        Width = 83
        Height = 14
        Caption = 'Magnification'
      end
      object Label26: TLabel
        Left = 103
        Top = 260
        Width = 10
        Height = 14
        Caption = '~'
      end
      object CB_Redraw: TSpeedButton
        Left = 160
        Top = 199
        Width = 30
        Height = 22
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
        OnClick = CB_RedrawClick
      end
      object Label21: TLabel
        Left = 11
        Top = 260
        Width = 14
        Height = 14
        Caption = 'Lv'
      end
      object Edit_TC: TEdit
        Left = 141
        Top = 15
        Width = 51
        Height = 22
        Alignment = taRightJustify
        TabOrder = 0
        Text = '250'
      end
      object RG_CH: TRadioGroup
        Left = 6
        Top = 41
        Width = 186
        Height = 47
        Caption = ' Channel number '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '8 CH'
          '48 CH')
        TabOrder = 1
      end
      object CLB: TCheckListBox
        Left = 111
        Top = 117
        Width = 72
        Height = 76
        ItemHeight = 14
        Items.Strings = (
          'CH0'
          'CH1'
          'CH2'
          'CH3'
          'CH4'
          'CH5'
          'CH6'
          'CH7')
        TabOrder = 5
      end
      object CB_Map_I0: TComboBox
        Left = 32
        Top = 229
        Width = 61
        Height = 22
        ItemIndex = 0
        TabOrder = 6
        Text = 'non'
        Items.Strings = (
          'non'
          'CH0'
          'CH1'
          'CH2'
          'CH3'
          'CH4'
          'CH5'
          'CH6'
          'CH7')
      end
      object CB_Map_I: TComboBox
        Left = 122
        Top = 229
        Width = 61
        Height = 22
        TabOrder = 7
        Text = 'CH1'
        Items.Strings = (
          'CH0'
          'CH1'
          'CH2'
          'CH3'
          'CH4'
          'CH5'
          'CH6'
          'CH7')
      end
      object CB_Diff: TCheckBox
        Left = 14
        Top = 120
        Width = 69
        Height = 17
        Caption = 'Diff'
        TabOrder = 2
      end
      object CB_PM: TCheckBox
        Left = 14
        Top = 143
        Width = 91
        Height = 17
        Caption = 'Convert '#177
        TabOrder = 3
      end
      object CB_DivI0: TCheckBox
        Left = 14
        Top = 166
        Width = 85
        Height = 17
        Caption = 'Div by CH0'
        TabOrder = 4
      end
      object Edit_Min: TEdit
        Left = 32
        Top = 257
        Width = 61
        Height = 22
        Alignment = taRightJustify
        TabOrder = 8
        Text = '0'
      end
      object Edit_Max: TEdit
        Left = 122
        Top = 257
        Width = 61
        Height = 22
        Alignment = taRightJustify
        TabOrder = 9
        Text = '100'
      end
      object CB_Mag: TComboBox
        Left = 122
        Top = 285
        Width = 61
        Height = 22
        ItemIndex = 0
        TabOrder = 10
        Text = '100%'
        Items.Strings = (
          '100%'
          '200%'
          '400%'
          '800%')
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 89
      Height = 321
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object BB_Start: TBitBtn
        Left = 8
        Top = 14
        Width = 75
        Height = 25
        Caption = 'Start'
        TabOrder = 0
        OnClick = BB_StartClick
      end
      object BB_Stop: TBitBtn
        Left = 8
        Top = 92
        Width = 75
        Height = 25
        Caption = 'STOP'
        TabOrder = 1
        OnClick = BB_StopClick
      end
      object CB_P: TCheckBox
        Left = 14
        Top = 45
        Width = 65
        Height = 17
        Caption = 'Ping pls'
        TabOrder = 2
      end
      object CB_Save: TCheckBox
        Left = 14
        Top = 68
        Width = 59
        Height = 17
        Caption = 'Save'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 3
      end
      object BB_Get_Motor_Info: TBitBtn
        Left = 8
        Top = 259
        Width = 75
        Height = 25
        Caption = 'Motor Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = BB_Get_Motor_InfoClick
      end
      object BB_Test: TBitBtn
        Left = 8
        Top = 290
        Width = 75
        Height = 25
        Hint = 'Counting test'
        Caption = 'NCT08 Test'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = BB_TestClick
      end
      object RG_Method: TRadioGroup
        Left = 8
        Top = 123
        Width = 75
        Height = 75
        Caption = 'Scan'
        ItemIndex = 0
        Items.Strings = (
          'STEP'
          'CONT')
        TabOrder = 4
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 321
    Width = 1125
    Height = 392
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 2
    object Chart1: TChart
      Left = 0
      Top = 0
      Width = 644
      Height = 392
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
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TLineSeries
        HoverElement = [heCurrent]
        Title = 'CH0'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series2: TLineSeries
        HoverElement = [heCurrent]
        Title = 'CH1'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series3: TLineSeries
        HoverElement = [heCurrent]
        Title = 'CH2'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series4: TLineSeries
        HoverElement = [heCurrent]
        Title = 'CH3'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series5: TLineSeries
        HoverElement = [heCurrent]
        Title = 'CH4'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series6: TLineSeries
        HoverElement = [heCurrent]
        Title = 'CH5'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series7: TLineSeries
        HoverElement = [heCurrent]
        Title = 'CH6'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series8: TLineSeries
        HoverElement = [heCurrent]
        Title = 'CH7'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object ScrollBox1: TScrollBox
      Left = 644
      Top = 0
      Width = 481
      Height = 392
      Align = alClient
      TabOrder = 1
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 1000
        Height = 1000
        OnMouseMove = Image1MouseMove
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 320
    Top = 337
  end
end
