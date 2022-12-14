object Form_Cryo: TForm_Cryo
  Left = 0
  Top = 0
  Caption = 'Form_Cryo'
  ClientHeight = 319
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 97
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 16
    ExplicitTop = -6
    object Label1: TLabel
      Left = 7
      Top = 36
      Width = 60
      Height = 14
      Caption = 'Target SV'
    end
    object Label2: TLabel
      Left = 7
      Top = 68
      Width = 16
      Height = 14
      Caption = 'SV'
    end
    object Label3: TLabel
      Left = 319
      Top = 8
      Width = 27
      Height = 14
      Caption = '[ms]'
    end
    object Label4: TLabel
      Left = 199
      Top = 8
      Width = 48
      Height = 14
      Caption = 'Interval'
    end
    object SB_SV_Set: TSpeedButton
      Left = 155
      Top = 33
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = SB_SV_SetClick
    end
    object CB_Connect: TCheckBox
      Left = 7
      Top = 8
      Width = 70
      Height = 17
      Caption = 'Connect : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CB_ConnectClick
    end
    object Edit_IP: TEdit
      Left = 93
      Top = 5
      Width = 85
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = '10.7.0.12'
    end
    object CB_Chart: TCheckBox
      Left = 264
      Top = 33
      Width = 97
      Height = 17
      Caption = 'Draw chart '
      TabOrder = 2
    end
    object Edit_SV: TEdit
      Left = 93
      Top = 33
      Width = 60
      Height = 22
      TabOrder = 3
      Text = '-50'
      OnEnter = Edit_SVEnter
    end
    object Edit_Int: TEdit
      Left = 264
      Top = 5
      Width = 49
      Height = 22
      TabOrder = 4
      Text = '1000'
    end
    object RB_T: TRadioButton
      Left = 184
      Top = 36
      Width = 17
      Height = 17
      TabOrder = 5
    end
  end
  object Chart1: TChart
    Left = 0
    Top = 97
    Width = 409
    Height = 203
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
    Legend.Font.Height = -11
    Legend.Font.Name = 'Verdana'
    Legend.Shadow.Transparency = 0
    Legend.Title.Font.Height = -9
    RightWall.Color = 14745599
    Title.Font.Name = 'Verdana'
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Axis.Color = 4210752
    BottomAxis.Grid.Color = 11119017
    BottomAxis.LabelsFormat.Font.Height = -9
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
    LeftAxis.LabelsFormat.Font.Height = -9
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
    TabOrder = 1
    ExplicitTop = 89
    ExplicitHeight = 214
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object SB_Chart_Clear: TSpeedButton
      Left = 320
      Top = 143
      Width = 65
      Height = 46
      Caption = 'Clear chart'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      OnClick = SB_Chart_ClearClick
    end
    object Series1: TFastLineSeries
      HoverElement = []
      Selected.Hover.Visible = True
      Title = 'Target SV'
      LinePen.Color = 10708548
      LinePen.EndStyle = esRound
      TreatNulls = tnDontPaint
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TFastLineSeries
      HoverElement = []
      Selected.Hover.Visible = True
      Title = 'SV'
      LinePen.Color = 3513587
      LinePen.EndStyle = esRound
      TreatNulls = tnDontPaint
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series3: TFastLineSeries
      HoverElement = []
      Selected.Hover.Visible = True
      Title = 'PV'
      LinePen.Color = 1330417
      LinePen.EndStyle = esRound
      TreatNulls = tnDontPaint
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 300
    Width = 409
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitLeft = 104
    ExplicitTop = 408
    ExplicitWidth = 0
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 368
    Top = 209
  end
  object IdTCPClient: TIdTCPClient
    ConnectTimeout = 0
    Host = '10.7.0.12'
    IPVersion = Id_IPv4
    Port = 7777
    ReadTimeout = -1
    Left = 317
    Top = 206
  end
end
