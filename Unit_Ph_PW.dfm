object Form_Ph_PW: TForm_Ph_PW
  Left = 0
  Top = 0
  Caption = 'Phase map'
  ClientHeight = 840
  ClientWidth = 761
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 840
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 757
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 757
        Height = 105
        Align = alClient
        Caption = 'Drawing'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Bevel3: TBevel
          Left = 552
          Top = 46
          Width = 76
          Height = 22
        end
        object Bevel2: TBevel
          Left = 533
          Top = 74
          Width = 95
          Height = 22
        end
        object Bevel1: TBevel
          Left = 552
          Top = 16
          Width = 76
          Height = 22
        end
        object Label7: TLabel
          Left = 7
          Top = 52
          Width = 33
          Height = 14
          Caption = 'B && C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 169
          Top = 52
          Width = 30
          Height = 14
          Caption = 'Mag.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 341
          Top = 40
          Width = 116
          Height = 40
          Brush.Color = clMoneyGreen
        end
        object Label1: TLabel
          Left = 463
          Top = 78
          Width = 72
          Height = 16
          Caption = 'Intensity : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 541
          Top = 76
          Width = 83
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 463
          Top = 24
          Width = 64
          Height = 16
          Caption = 'Position : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 560
          Top = 19
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Size: TLabel
          Left = 341
          Top = 52
          Width = 90
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = '157*103'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 249
          Top = 53
          Width = 48
          Height = 14
          Caption = 'Img No.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 560
          Top = 49
          Width = 66
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SB_Copy: TSpeedButton
          Left = 427
          Top = 50
          Width = 22
          Height = 22
          Hint = 'COPY ROI to Clipboard'
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
          ParentShowHint = False
          ShowHint = True
          OnClick = SB_CopyClick
        end
        object Label8: TLabel
          Left = 532
          Top = 19
          Width = 9
          Height = 16
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 532
          Top = 46
          Width = 9
          Height = 16
          Caption = 'Y'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Edit_PMin: TEdit
          Left = 7
          Top = 72
          Width = 75
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnKeyUp = Edit_PMaxKeyUp
        end
        object Edit_PMax: TEdit
          Left = 88
          Top = 72
          Width = 75
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
          Text = '10000'
          OnKeyUp = Edit_PMaxKeyUp
        end
        object CB_Mag: TComboBox
          Left = 169
          Top = 72
          Width = 61
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Text = '50%'
          OnChange = CB_MagChange
          Items.Strings = (
            '10%'
            '25%'
            '50%'
            '100%')
        end
        object BB_ReDraw: TBitBtn
          Left = 7
          Top = 21
          Width = 75
          Height = 25
          Caption = 'Redraw'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = BB_ReDrawClick
        end
        object Edit_Left: TEdit
          Left = 335
          Top = 24
          Width = 40
          Height = 22
          BevelOuter = bvRaised
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          TabOrder = 5
          Text = '350'
          OnKeyUp = Edit_LeftKeyUp
        end
        object Edit_Top: TEdit
          Left = 381
          Top = 24
          Width = 40
          Height = 22
          BevelOuter = bvRaised
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          TabOrder = 6
          Text = '250'
          OnKeyUp = Edit_LeftKeyUp
        end
        object Edit_Right: TEdit
          Left = 362
          Top = 71
          Width = 40
          Height = 22
          BevelOuter = bvRaised
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          TabOrder = 7
          Text = '700'
          OnKeyUp = Edit_LeftKeyUp
        end
        object Edit_Bottom: TEdit
          Left = 408
          Top = 71
          Width = 40
          Height = 22
          BevelOuter = bvRaised
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          TabOrder = 8
          Text = '500'
          OnKeyUp = Edit_LeftKeyUp
        end
        object BB_ImgCopy: TBitBtn
          Left = 88
          Top = 21
          Width = 75
          Height = 25
          Caption = 'Copy Img'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = BB_ImgCopyClick
        end
        object BB_Save: TBitBtn
          Left = 169
          Top = 21
          Width = 75
          Height = 25
          Caption = 'Save Img'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          OnClick = BB_SaveClick
        end
        object Edit_No: TEdit
          Left = 249
          Top = 73
          Width = 53
          Height = 22
          NumbersOnly = True
          TabOrder = 3
          Text = '0'
        end
        object UD_No: TUpDown
          Left = 302
          Top = 73
          Width = 16
          Height = 22
          Associate = Edit_No
          Max = 20
          TabOrder = 4
          OnClick = UD_NoClick
        end
      end
    end
    object ScrollBox1: TScrollBox
      Left = 2
      Top = 107
      Width = 757
      Height = 731
      Align = alClient
      TabOrder = 1
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 2600
        Height = 2200
        OnMouseDown = Image1MouseDown
        OnMouseMove = Image1MouseMove
      end
      object SS: TSelShape
        Left = 48
        Top = 48
        Width = 65
        Height = 65
        Brush.Style = bsClear
        Pen.Color = clRed
        OnMouseMove = SSMouseMove
        SizeSense = 5
        MinWidth = 5
        MinHeight = 5
        MinTop = 0
        MinLeft = 0
        MaxBottom = 0
        MaxRight = 0
        SelOption = [ResizeX, ResizeY, MoveX, MoveY]
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 202
    Top = 223
  end
end
