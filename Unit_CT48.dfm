object Form_CT48: TForm_CT48
  Left = 0
  Top = 0
  Caption = 'CT48'
  ClientHeight = 741
  ClientWidth = 536
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
  object Panel2: TPanel
    Left = 0
    Top = 22
    Width = 536
    Height = 92
    Align = alTop
    BevelOuter = bvNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 159
      Top = 9
      Width = 27
      Height = 14
      Caption = '[ms]'
    end
    object BB_SetTIme: TBitBtn
      Left = 3
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Set time'
      TabOrder = 0
      OnClick = BB_SetTImeClick
    end
    object Edit_CT: TEdit
      Left = 92
      Top = 6
      Width = 61
      Height = 22
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 1
      Text = '1000'
    end
    object BB_Start: TBitBtn
      Left = 208
      Top = 4
      Width = 75
      Height = 25
      Caption = 'START'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BB_StartClick
    end
    object BB_Stop: TBitBtn
      Left = 289
      Top = 4
      Width = 75
      Height = 25
      Caption = 'STOP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BB_StopClick
    end
    object BB_Read: TBitBtn
      Left = 370
      Top = 4
      Width = 75
      Height = 25
      Caption = 'READ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BB_ReadClick
    end
    object BB_Clear: TBitBtn
      Left = 451
      Top = 4
      Width = 75
      Height = 25
      Caption = 'CLEAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BB_ClearClick
    end
    object BB_Cycle: TBitBtn
      Left = 208
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Cycle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BB_CycleClick
    end
    object RG_CN: TRadioGroup
      Left = 7
      Top = 34
      Width = 185
      Height = 47
      Caption = ' CH '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '8'
        '48')
      TabOrder = 2
    end
    object BB_Stop2: TBitBtn
      Left = 208
      Top = 66
      Width = 75
      Height = 25
      Caption = 'STOP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = BB_Stop2Click
    end
    object CLB: TCheckListBox
      Left = 370
      Top = 35
      Width = 156
      Height = 56
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
      TabOrder = 11
    end
    object BB_Save: TBitBtn
      Left = 289
      Top = 65
      Width = 75
      Height = 25
      Caption = 'Save'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = BB_SaveClick
    end
    object BB_1Cy: TBitBtn
      Left = 289
      Top = 34
      Width = 75
      Height = 25
      Caption = 'One cycle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = BB_1CyClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 114
    Width = 536
    Height = 384
    Align = alTop
    Caption = ' Counted values '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object SB: TStatusBar
    Left = 0
    Top = 722
    Width = 536
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Chart1: TChart
    Left = 0
    Top = 498
    Width = 536
    Height = 173
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
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
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
  object Memo: TRichEdit
    Left = 0
    Top = 671
    Width = 536
    Height = 51
    Align = alBottom
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
    Zoom = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object SB_ver: TSpeedButton
      Left = 488
      Top = 0
      Width = 48
      Height = 22
      Align = alRight
      Caption = 'ver'
      Flat = True
      OnClick = SB_verClick
      ExplicitLeft = 430
      ExplicitHeight = 21
    end
    object Edit_IP: TEdit
      Left = 78
      Top = 1
      Width = 130
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object CB_Connect: TCheckBox
      Left = 2
      Top = 3
      Width = 70
      Height = 17
      Caption = 'Connect : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = CB_ConnectClick
    end
  end
  object IdTCPClient: TIdTCPClient
    ConnectTimeout = 0
    Host = '192.168.0.121'
    IPVersion = Id_IPv4
    Port = 7777
    ReadTimeout = -1
    Left = 40
    Top = 150
  end
  object SaveDialog1: TSaveDialog
    Left = 128
    Top = 153
  end
end
