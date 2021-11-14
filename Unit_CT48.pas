unit Unit_CT48;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  Vcl.ComCtrls, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, Vcl.CheckLst,
  Vcl.ExtCtrls, Vcl.Buttons, IniFiles;

type
  ArrayStr = array[0..1000000] of string;
  TForm_CT48 = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    BB_SetTIme: TBitBtn;
    Edit_CT: TEdit;
    BB_Start: TBitBtn;
    BB_Stop: TBitBtn;
    BB_Read: TBitBtn;
    BB_Clear: TBitBtn;
    BB_Cycle: TBitBtn;
    RG_CN: TRadioGroup;
    BB_Stop2: TBitBtn;
    CLB: TCheckListBox;
    BB_Save: TBitBtn;
    IdTCPClient: TIdTCPClient;
    GroupBox1: TGroupBox;
    SB: TStatusBar;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Memo: TRichEdit;
    SaveDialog1: TSaveDialog;
    BB_1Cy: TBitBtn;
    Panel1: TPanel;
    Edit_IP: TEdit;
    CB_Connect: TCheckBox;
    SB_ver: TSpeedButton;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CB_ConnectClick(Sender: TObject);

    procedure BB_SetTImeClick(Sender: TObject);
    procedure BB_StartClick(Sender: TObject);
    procedure BB_StopClick(Sender: TObject);
    procedure BB_ReadClick(Sender: TObject);
    procedure BB_ClearClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_CycleClick(Sender: TObject);
    procedure BB_Stop2Click(Sender: TObject);
    procedure BB_1CyClick(Sender: TObject);

    function Connect(IP:string; Port:longint):boolean;
    function DisConnect:boolean;
    function Get_Ver:string;

    function SetPresetT(PresetT:longint):string;

    function Timer_Mode:boolean;
    function CntStart:boolean;
    function CntStp:boolean;
    function CntCLR:boolean;
    function CntRead:string;

    function MEM_CLR:boolean;
    function MEM_SET(Ite:longint):boolean;
    function Get_Edge_ST:boolean;

    function ClearTimer:boolean;

    procedure Read_48Data(var DataN:longint;var SData:ArrayStr; Sender: TObject);
    procedure Read_8Data(var DataN:longint;var SData:ArrayStr; Sender: TObject);
    procedure SB_verClick(Sender: TObject);


  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form_CT48: TForm_CT48;
  Edit_CTV : array[0..47] of TEdit;
  Label_CT : array[0..47] of TLabel;

  lData : array[0..63] of longint;
  SData :  ArrayStr;

  Go : boolean;

implementation

{$R *.dfm}

procedure TForm_CT48.FormCreate(Sender: TObject);
var
  li:byte;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Top     := Ini.ReadInteger( 'Form_CT48', 'Top', 100 );
    Left    := Ini.ReadInteger( 'Form_CT48', 'Left', 100 );
    if Ini.ReadBool( 'Form_CT48', 'InitMax', false ) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;

    Edit_IP.Text := Ini.ReadString('CT48', 'IP', '10.7.3.124');
    Edit_CT.Text := Ini.ReadString('CT48', 'CountT', '1000');
    RG_CN.ItemIndex := Ini.ReadInteger('CT48', 'CH', 0);
  finally
    Ini.Free;
  end;


  for li:=0 to 47 do
  begin
    Label_CT[li] := TLabel.Create(Self);
    Label_CT[li].Parent := GroupBox1;

    Label_CT[li].Top := 24+(li mod 12)*30;
    Label_CT[li].Left := 10+(li div 12)*130;

    Label_CT[li].Caption := 'CH'+li.ToString;
  end;
  for li:=0 to 47 do
  begin
    Edit_CTV[li] := TEdit.Create(Self);
    Edit_CTV[li].Parent := GroupBox1;
    Edit_CTV[li].Width := 68;
    Edit_CTV[li].Height := 20;
    Edit_CTV[li].Top := 21+(li mod 12)*30;
    Edit_CTV[li].Left := 50+(li div 12)*130;
    Edit_CTV[li].ReadOnly := true;
  end;
  Panel2.Enabled := false;
  GroupBox1.Enabled := false;
end;

procedure TForm_CT48.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteInteger( 'Form_CT48', 'Top', Top);
    Ini.WriteInteger( 'Form_CT48', 'Left', Left);
    Ini.WriteBool( 'Form_CT48', 'InitMax', WindowState = wsMaximized );

    Ini.WriteString('CT48', 'IP', Edit_IP.Text );
    Ini.WriteString('CT48', 'CountT', Edit_CT.Text );
    Ini.WriteInteger('CT48', 'CH', RG_CN.ItemIndex);
  finally
    Ini.Free;
  end;
end;

procedure TForm_CT48.CB_ConnectClick(Sender: TObject);
begin
  //クリックした後の状態でコーディング
  if not(CB_Connect.Checked) then
  begin
    DisConnect;
    Panel2.Enabled := false;
    GroupBox1.Enabled := false;
  end
  else
  begin
    if Connect(Edit_IP.Text,7777) then
    begin
      Panel2.Enabled := true;
      GroupBox1.Enabled := true;
    end
    else
      ShowMessage('Could NOT connected to CT48!');
  end;
end;



procedure TForm_CT48.BB_SaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Memo.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm_CT48.BB_SetTImeClick(Sender: TObject);
begin
  Form_CT48.Timer_Mode;
  Form_CT48.SetPresetT(StrToInt(Edit_CT.Text));
end;

procedure TForm_CT48.BB_StartClick(Sender: TObject);
begin
  Form_CT48.CntStart;
end;

procedure TForm_CT48.BB_StopClick(Sender: TObject);
begin
  Form_CT48.CntStp;
end;

procedure TForm_CT48.BB_ReadClick(Sender: TObject);
var
  lStr :string;
  sl:TStringList;
  li, MaxC:longint;
begin
  sl:=TStringList.Create;
  case RG_CN.ItemIndex of
    0:MaxC :=8;
    1:MaxC :=48;
  else
    MaxC :=8;
  end;

  lStr :=Form_CT48.CntRead;

  sl.Delimiter:= '_';
  sl.DelimitedText:= lStr;
  For li:= 0 To sl.Count-1 do
  begin
    lData[li] := StrToInt(sl.Strings[li]);
//    Memo.Lines.Add(li.ToString+' : '+lData[li].ToString);
  end;
    sl.Free;

  for li:=0 to MaxC-1 do
  begin
    Edit_CTV[li].Text := lData[li].ToString
  end;
end;

procedure TForm_CT48.BB_1CyClick(Sender: TObject);
begin
  BB_StartClick(Sender);
  Sleep(Round(StrToInt(Edit_CT.Text)*1.05));
  BB_StopClick(Sender);
  BB_ReadClick(Sender);
  BB_ClearClick(Sender);
end;

procedure TForm_CT48.BB_ClearClick(Sender: TObject);
begin
  Form_CT48.CntCLR;
end;

procedure TForm_CT48.BB_CycleClick(Sender: TObject);
var
  k:longint;
begin
  k:=0;
  Go := true;
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  Series5.Clear;
  Series6.Clear;
  Series7.Clear;
  Series8.Clear;
  repeat
    BB_StartClick(Sender);
    Sleep(StrToInt(Edit_CT.Text)+100);
    BB_StopClick(Sender);
    BB_ReadClick(Sender);
    BB_ClearClick(Sender);

    if CLB.Checked[0] then
      Series1.AddY(lData[0]);
    if CLB.Checked[1] then
      Series2.AddY(lData[1]);
    if CLB.Checked[2] then
      Series3.AddY(lData[2]);
    if CLB.Checked[3] then
      Series4.AddY(lData[3]);
    if CLB.Checked[4] then
      Series5.AddY(lData[4]);
    if CLB.Checked[5] then
      Series6.AddY(lData[5]);
    if CLB.Checked[6] then
      Series7.AddY(lData[6]);
    if CLB.Checked[7] then
      Series8.AddY(lData[7]);

    Application.ProcessMessages;
    SB.SimpleText := k.ToString;
    Inc(k);
  until not(Go);
end;

procedure TForm_CT48.BB_Stop2Click(Sender: TObject);
begin
  Go := false;
end;

procedure TForm_CT48.SB_verClick(Sender: TObject);
begin
  if CB_Connect.Checked then
    ShowMessage('Counter timer 48 : ver. '+Get_ver);
end;









function TForm_CT48.Connect(IP:string; Port :longint): boolean;
begin
  IdTCPClient.Host := IP;
  IdTCPClient.Port := Port;
  IdTCPClient.Connect;
  if IdTCPClient.Connected then
    Connect := true
  else
    Connect := false;
end;

function TForm_CT48.DisConnect: boolean;
begin
  IdTCPClient.Disconnect;
  if IdTCPClient.Connected then
    DisConnect := true
  else
    DisConnect := false;
end;

function TForm_CT48.Get_Ver: string;
begin
  IdTCPClient.IOHandler.WriteLn('VER?'+CHR(13)+CHR(10));
  Get_ver := IdTCPClient.IOHandler.ReadLn();
end;

function TForm_CT48.Timer_Mode: boolean;
begin
  IdTCPClient.IOHandler.WriteLn('GATEIN_DS'+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('ENTS'+CHR(13)+CHR(10));
end;

function TForm_CT48.SetPresetT(PresetT:longint): string;
begin
  IdTCPClient.IOHandler.WriteLn('STPR'+IntToStr(PresetT)+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TPR?'+CHR(13)+CHR(10));
  SetPresetT := IdTCPClient.IOHandler.ReadLn();
end;

function TForm_CT48.ClearTimer: boolean;
begin
  IdTCPClient.IOHandler.WriteLn('CLTM'+CHR(13)+CHR(10));
end;

function TForm_CT48.CntCLR: boolean;
begin
  IdTCPClient.IOHandler.WriteLn('CLAL'+CHR(13)+CHR(10));
end;

function TForm_CT48.CntRead: string;
begin
  IdTCPClient.IOHandler.WriteLn('RDAL'+CHR(13)+CHR(10));
  CntRead :=IdTCPClient.IOHandler.ReadLn();
end;

function TForm_CT48.CntStart: boolean;
begin
  IdTCPClient.IOHandler.WriteLn('STRT'+CHR(13)+CHR(10));
end;

function TForm_CT48.CntStp: boolean;
begin
  IdTCPClient.IOHandler.WriteLn('STOP'+CHR(13)+CHR(10));
end;


function TForm_CT48.MEM_CLR: boolean;
begin
//  IdTCPClient.IOHandler.WriteLn('CLGSDN'+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('CLAL'+CHR(13)+CHR(10));
end;

function TForm_CT48.MEM_SET(Ite:longint): boolean;
begin
  IdTCPClient.IOHandler.WriteLn('GATEIN_EN'+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('GT_ACQ_DIF'+CHR(13)+CHR(10));

  IdTCPClient.IOHandler.WriteLn('GSDN0'+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('GSED'+IntToStr(Ite)+CHR(13)+CHR(10));
end;

function TForm_CT48.Get_Edge_ST: boolean;
begin
  IdTCPClient.IOHandler.WriteLn('GESTRT'+CHR(13)+CHR(10));
end;

procedure TForm_CT48.Read_48Data(var DataN:longint;var SData:ArrayStr; Sender: TObject);
var
  i:longint;
begin
//  IdTCPClient.IOHandler.WriteLn('GSED?'+CHR(13)+CHR(10));
//  k:= StrToInt(IdTCPClient.IOHandler.ReadLn());
  IdTCPClient.IOHandler.WriteLn('GSDALX?'+CHR(13)+CHR(10));
  i:=-1;
  repeat
    Inc(i);
    SData[i] := IdTCPClient.IOHandler.ReadLn();
  until SData[i]='EOF';
  DataN := i+1;
end;

procedure TForm_CT48.Read_8Data(var DataN:longint;var SData:ArrayStr; Sender: TObject);
var
  i:longint;
begin
//  IdTCPClient.IOHandler.WriteLn('GSED?'+CHR(13)+CHR(10));
//  k:= StrToInt(IdTCPClient.IOHandler.ReadLn());
  IdTCPClient.IOHandler.WriteLn('GSDAL?'+CHR(13)+CHR(10));
  i:=-1;
  repeat
    Inc(i);
    SData[i] := IdTCPClient.IOHandler.ReadLn();
  until SData[i]='EOF';
  DataN := i;
end;

end.
