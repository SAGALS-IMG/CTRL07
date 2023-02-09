object AboutBox: TAboutBox
  Left = 200
  Top = 108
  BorderStyle = bsDialog
  Caption = #12496#12540#12472#12519#12531#24773#22577
  ClientHeight = 213
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 273
    Height = 161
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object Copyright: TLabel
      Left = 24
      Top = 128
      Width = 220
      Height = 16
      Alignment = taCenter
      Caption = 'Copyright(c) SAGA Light Source'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label1: TLabel
      Left = 82
      Top = 98
      Width = 99
      Height = 16
      Caption = 'Ver. 2023/2/10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label2: TLabel
      Left = 66
      Top = 51
      Width = 152
      Height = 16
      Caption = 'for SR-based imaging'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      IsControl = True
    end
    object Label3: TLabel
      Left = 93
      Top = 16
      Width = 96
      Height = 29
      Caption = 'CTRL07'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object OKButton: TButton
    Left = 111
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKButtonClick
  end
end
