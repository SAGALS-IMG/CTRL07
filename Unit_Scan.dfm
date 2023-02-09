object Form_Scan: TForm_Scan
  Left = 0
  Top = 0
  Caption = 'Scanning'
  ClientHeight = 812
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
    Top = 793
    Width = 1125
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 150
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1125
    Height = 439
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox3: TGroupBox
      Left = 361
      Top = 0
      Width = 764
      Height = 439
      Align = alClient
      Caption = ' NCT8 '
      TabOrder = 0
      ExplicitWidth = 893
      ExplicitHeight = 449
      object Bevel1: TBevel
        Left = 6
        Top = 100
        Width = 186
        Height = 140
      end
      object Bevel2: TBevel
        Left = 6
        Top = 272
        Width = 186
        Height = 149
      end
      object Label10: TLabel
        Left = 216
        Top = 18
        Width = 45
        Height = 16
        Caption = 'Counts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 14
        Top = 281
        Width = 13
        Height = 14
        Caption = 'Io'
      end
      object Label19: TLabel
        Left = 14
        Top = 309
        Width = 10
        Height = 14
        Caption = 'If'
      end
      object Label22: TLabel
        Left = 6
        Top = 80
        Width = 34
        Height = 14
        Caption = 'Chart'
      end
      object Label25: TLabel
        Left = 6
        Top = 250
        Width = 53
        Height = 14
        Caption = 'Mapping'
      end
      object Label20: TLabel
        Left = 14
        Top = 393
        Width = 83
        Height = 14
        Caption = 'Magnification'
      end
      object Label26: TLabel
        Left = 72
        Top = 365
        Width = 25
        Height = 14
        Caption = 'Max'
      end
      object CB_Redraw: TSpeedButton
        Left = 160
        Top = 246
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
        Top = 339
        Width = 25
        Height = 14
        Caption = 'B&&C'
      end
      object Label14: TLabel
        Left = 72
        Top = 337
        Width = 22
        Height = 14
        Caption = 'Min'
      end
      object RG_CH: TRadioGroup
        Left = 6
        Top = 18
        Width = 186
        Height = 56
        Caption = ' Channel number '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '8 CH'
          '48 CH')
        TabOrder = 0
      end
      object CLB: TCheckListBox
        Left = 111
        Top = 105
        Width = 72
        Height = 127
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
        TabOrder = 4
      end
      object CB_Map_I0: TComboBox
        Left = 108
        Top = 278
        Width = 75
        Height = 22
        ItemIndex = 0
        TabOrder = 5
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
        Left = 108
        Top = 306
        Width = 75
        Height = 22
        TabOrder = 6
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
        Top = 108
        Width = 69
        Height = 17
        Caption = 'Diff'
        TabOrder = 1
      end
      object CB_PM: TCheckBox
        Left = 14
        Top = 131
        Width = 91
        Height = 17
        Caption = 'Convert '#177
        TabOrder = 2
      end
      object CB_DivI0: TCheckBox
        Left = 14
        Top = 154
        Width = 85
        Height = 17
        Caption = 'Div by CH0'
        TabOrder = 3
      end
      object Edit_Min: TEdit
        Left = 108
        Top = 334
        Width = 75
        Height = 22
        Alignment = taRightJustify
        TabOrder = 7
        Text = '0'
      end
      object Edit_Max: TEdit
        Left = 108
        Top = 362
        Width = 75
        Height = 22
        Alignment = taRightJustify
        TabOrder = 8
        Text = '100'
      end
      object CB_Mag: TComboBox
        Left = 122
        Top = 390
        Width = 61
        Height = 22
        ItemIndex = 0
        TabOrder = 9
        Text = '100%'
        Items.Strings = (
          '100%'
          '200%'
          '400%'
          '800%')
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 361
      Height = 439
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitHeight = 449
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 361
        Height = 107
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label17: TLabel
          Left = 224
          Top = 13
          Width = 69
          Height = 14
          Caption = 'Count time'
        end
        object Label24: TLabel
          Left = 222
          Top = 63
          Width = 134
          Height = 14
          Caption = 'Over Run (Cnt. Scan) '
        end
        object Label30: TLabel
          Left = 301
          Top = 37
          Width = 42
          Height = 14
          Caption = '[ms/p]'
        end
        object Label31: TLabel
          Left = 301
          Top = 85
          Width = 27
          Height = 14
          Caption = '[pls]'
        end
        object BB_Start: TBitBtn
          Left = 8
          Top = 14
          Width = 85
          Height = 28
          Caption = 'Start'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
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
          ParentFont = False
          TabOrder = 0
          OnClick = BB_StartClick
        end
        object BB_Stop: TBitBtn
          Left = 8
          Top = 45
          Width = 85
          Height = 28
          Caption = 'STOP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
            00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
            70E337F33333333337F3E0F33333333370E337F333FFFFF337F3E0F330000033
            70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
            70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
            70E337F33777773337F3E0F33333333370E337F33333333337F3E0F333333333
            70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
            00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 1
          OnClick = BB_StopClick
        end
        object CB_P: TCheckBox
          Left = 101
          Top = 82
          Width = 52
          Height = 17
          Caption = 'Ping'
          TabOrder = 2
        end
        object BB_Get_Motor_Info: TBitBtn
          Left = 8
          Top = 76
          Width = 85
          Height = 28
          Caption = 'Motor Info'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = BB_Get_Motor_InfoClick
        end
        object BB_Test: TBitBtn
          Left = 24
          Top = 173
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
          TabOrder = 5
          Visible = False
          OnClick = BB_TestClick
        end
        object RG_Method: TRadioGroup
          Left = 100
          Top = 14
          Width = 101
          Height = 59
          Caption = 'Scan mode'
          ItemIndex = 0
          Items.Strings = (
            'STEP'
            'CONT')
          TabOrder = 3
        end
        object Edit_TC: TEdit
          Left = 236
          Top = 34
          Width = 59
          Height = 22
          Alignment = taRightJustify
          TabOrder = 6
          Text = '250'
        end
        object Edit_OR: TEdit
          Left = 236
          Top = 82
          Width = 59
          Height = 22
          Alignment = taRightJustify
          TabOrder = 7
          Text = '100'
        end
        object CB_AutoSh: TCheckBox
          Left = 154
          Top = 83
          Width = 74
          Height = 17
          Caption = 'Shutter'
          TabOrder = 8
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 107
        Width = 361
        Height = 167
        Align = alTop
        Caption = '1st loop'
        TabOrder = 1
        object Label32: TLabel
          Left = 16
          Top = 27
          Width = 30
          Height = 14
          Caption = 'AXIS'
        end
        object Label33: TLabel
          Left = 16
          Top = 55
          Width = 25
          Height = 14
          Caption = 'Orig'
        end
        object Label34: TLabel
          Left = 16
          Top = 83
          Width = 40
          Height = 14
          Caption = 'START'
        end
        object Label35: TLabel
          Left = 16
          Top = 111
          Width = 24
          Height = 14
          Caption = 'END'
        end
        object Label36: TLabel
          Left = 16
          Top = 139
          Width = 30
          Height = 14
          Caption = 'STEP'
        end
        object Label1: TLabel
          Left = 220
          Top = 55
          Width = 25
          Height = 14
          Caption = 'Orig'
        end
        object Label2: TLabel
          Left = 220
          Top = 83
          Width = 40
          Height = 14
          Caption = 'START'
        end
        object Label3: TLabel
          Left = 220
          Top = 111
          Width = 24
          Height = 14
          Caption = 'END'
        end
        object Label4: TLabel
          Left = 220
          Top = 139
          Width = 30
          Height = 14
          Caption = 'STEP'
        end
        object Label13: TLabel
          Left = 220
          Top = 27
          Width = 30
          Height = 14
          Caption = 'AXIS'
        end
        object CB_L1: TComboBox
          Left = 62
          Top = 24
          Width = 89
          Height = 22
          TabOrder = 0
        end
        object Edit_OX11: TEdit
          Left = 62
          Top = 52
          Width = 89
          Height = 22
          TabOrder = 1
          Text = 'Edit_OX11'
        end
        object Edit_L1_ST: TEdit
          Left = 62
          Top = 80
          Width = 89
          Height = 22
          TabOrder = 2
          Text = 'Edit_OX11'
        end
        object Edit_L1_End: TEdit
          Left = 62
          Top = 108
          Width = 89
          Height = 22
          TabOrder = 3
          Text = 'Edit_OX11'
        end
        object Edit_L1_d: TEdit
          Left = 62
          Top = 136
          Width = 89
          Height = 22
          TabOrder = 4
          Text = 'Edit_OX11'
        end
        object Edit_OX12: TEdit
          Left = 266
          Top = 52
          Width = 89
          Height = 22
          TabOrder = 5
          Text = 'Edit_OX11'
        end
        object Edit_L12_ST: TEdit
          Left = 266
          Top = 80
          Width = 89
          Height = 22
          TabOrder = 6
          Text = 'Edit_OX11'
        end
        object Edit_L12_End: TEdit
          Left = 266
          Top = 108
          Width = 89
          Height = 22
          TabOrder = 7
          Text = 'Edit_OX11'
        end
        object Edit_L12_d: TEdit
          Left = 266
          Top = 136
          Width = 89
          Height = 22
          TabOrder = 8
          Text = 'Edit_OX11'
        end
        object CB_L1_Sync: TCheckBox
          Left = 160
          Top = 25
          Width = 48
          Height = 17
          Caption = 'Sync'
          TabOrder = 9
        end
        object CB_L12: TComboBox
          Left = 266
          Top = 24
          Width = 89
          Height = 22
          TabOrder = 10
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 274
        Width = 361
        Height = 171
        Align = alTop
        Caption = '2nd loop'
        TabOrder = 2
        ExplicitTop = 278
        object Label5: TLabel
          Left = 16
          Top = 27
          Width = 30
          Height = 14
          Caption = 'AXIS'
        end
        object Label6: TLabel
          Left = 16
          Top = 55
          Width = 25
          Height = 14
          Caption = 'Orig'
        end
        object Label7: TLabel
          Left = 16
          Top = 83
          Width = 40
          Height = 14
          Caption = 'START'
        end
        object Label8: TLabel
          Left = 16
          Top = 111
          Width = 24
          Height = 14
          Caption = 'END'
        end
        object Label9: TLabel
          Left = 16
          Top = 139
          Width = 30
          Height = 14
          Caption = 'STEP'
        end
        object Label11: TLabel
          Left = 186
          Top = 55
          Width = 72
          Height = 14
          Caption = 'Shift [/line]'
        end
        object Label12: TLabel
          Left = 186
          Top = 83
          Width = 76
          Height = 14
          Caption = 'Wait [s/line]'
        end
        object CB_L2: TComboBox
          Left = 62
          Top = 24
          Width = 89
          Height = 22
          TabOrder = 0
        end
        object Edit_OX2: TEdit
          Left = 62
          Top = 52
          Width = 89
          Height = 22
          TabOrder = 1
          Text = 'Edit_OX11'
        end
        object Edit_L2_ST: TEdit
          Left = 62
          Top = 80
          Width = 89
          Height = 22
          TabOrder = 2
          Text = 'Edit_OX11'
        end
        object Edit_L2_End: TEdit
          Left = 62
          Top = 108
          Width = 89
          Height = 22
          TabOrder = 3
          Text = 'Edit_OX11'
        end
        object Edit_L2_d: TEdit
          Left = 62
          Top = 136
          Width = 89
          Height = 22
          TabOrder = 4
          Text = 'Edit_OX11'
        end
        object Edit_Shift: TEdit
          Left = 274
          Top = 52
          Width = 79
          Height = 22
          Alignment = taRightJustify
          TabOrder = 6
          Text = '0'
        end
        object Edit_Wait: TEdit
          Left = 274
          Top = 80
          Width = 79
          Height = 22
          Alignment = taRightJustify
          TabOrder = 7
          Text = '0'
        end
        object CB_L2_Enable: TCheckBox
          Left = 72
          Top = 0
          Width = 73
          Height = 17
          Caption = 'Enable'
          TabOrder = 5
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 439
    Width = 1125
    Height = 354
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 2
    ExplicitTop = 449
    ExplicitWidth = 1254
    ExplicitHeight = 344
    object Chart1: TChart
      Left = 0
      Top = 0
      Width = 644
      Height = 354
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
      ExplicitHeight = 344
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
      Height = 354
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 610
      ExplicitHeight = 344
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
    Left = 256
    Top = 457
  end
end
