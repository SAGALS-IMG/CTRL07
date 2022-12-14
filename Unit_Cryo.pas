unit Unit_Cryo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, Vcl.StdCtrls, Vcl.ExtCtrls,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ComCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  Vcl.Buttons;

type
  TForm_Cryo = class(TForm)
    Panel1: TPanel;
    CB_Connect: TCheckBox;
    Edit_IP: TEdit;
    Chart1: TChart;
    SB: TStatusBar;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    CB_Chart: TCheckBox;
    Timer1: TTimer;
    Label1: TLabel;
    Edit_SV: TEdit;
    Label2: TLabel;
    Edit_Int: TEdit;
    Label3: TLabel;
    IdTCPClient: TIdTCPClient;
    SB_Chart_Clear: TSpeedButton;
    Label4: TLabel;
    SB_SV_Set: TSpeedButton;
    RB_T: TRadioButton;
    procedure CB_ConnectClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SB_Chart_ClearClick(Sender: TObject);
    procedure SB_SV_SetClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  Form_Cryo: TForm_Cryo;

implementation

{$R *.dfm}

procedure TForm_Cryo.CB_ConnectClick(Sender: TObject);
var
  Connect : boolean;
  TmpStr : string;
begin
  if CB_Connect.checked then
  begin
    Series1.Clear;
    Series2.Clear;
    Series3.Clear;

    IdTCPClient.Host := Edit_IP.Text;
    IdTCPClient.Port := 7777;

    try
      IdTCPClient.Connect;
    finally
      begin
        if IdTCPClient.Connected then
        begin
          Sleep(100);
          TmpStr := IdTCPClient.IOHandler.ReadLn();
          SB.SimpleText := 'Connection: '+TmpStr;
          Timer1.Interval := StrToInt(Edit_Int.Text);
          Timer1.Enabled := true;
        end
        else
        begin
          Connect := false;
          SB.SimpleText := 'Not connected';
        end;
      end;
    end;
  end
  else
  begin
    Timer1.Enabled := false;
    if IdTCPClient.Connected then
    begin
      IdTCPClient.IOHandler.WriteLn('~');
      Sleep(200);
      IdTCPClient.Disconnect;
    end;
  end;
end;

procedure TForm_Cryo.FormDestroy(Sender: TObject);
begin
  Timer1.Enabled := false;
  if IdTCPClient.Connected then
  begin
    IdTCPClient.IOHandler.WriteLn('~');
    Sleep(200);
    IdTCPClient.Disconnect;
  end;
end;

procedure TForm_Cryo.SB_Chart_ClearClick(Sender: TObject);
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
end;

procedure TForm_Cryo.SB_SV_SetClick(Sender: TObject);
var
  TmpStr : string;
begin
  TmpStr := Format('%5.0f',[StrToFloat(Edit_SV.Text)]);
  if IdTCPClient.Connected then
    IdTCPClient.IOHandler.WriteLn(' 11,1,'+TmpStr);
end;

procedure TForm_Cryo.Timer1Timer(Sender: TObject);
var
  TmpStr : string;
  sl:TStringList;
  li : longint;
  SV,PV:double;
begin
  if IdTCPClient.Connected then
  begin
    sl:=TStringList.Create;
    IdTCPClient.IOHandler.WriteLn(' 1, 1,');
    Sleep(100);
    TmpStr := IdTCPClient.IOHandler.ReadLn();
    sl.commaText:= TmpStr;
    if sl.Count>5 then
    begin
      SV := StrToFloat(sl.Strings[4]);
      PV := StrToFloat(sl.Strings[2]);
      if CB_Chart.Checked then
      begin
        Series1.AddY(StrToFloat(Edit_SV.Text));
        Series2.AddY(SV);
        Series3.AddY(PV);
      end;
      Label2.Caption := 'SV: '+Format('%10.2f',[SV])+'Åé  PV: '+Format('%10.2f',[PV])+'Åé';
      if (Abs(SV-PV)<1) and (SV = StrToFloat(Edit_SV.Text)) then
        RB_T.Checked := true
      else
        RB_T.Checked := false;
    end;
    sl.Free;
  end;
end;

end.
