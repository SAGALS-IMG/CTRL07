unit Unit_PM16C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IniFiles, Vcl.WinXCtrls;

type
  Tmotor = record
    Axis_Name : string;
    Unit_Name : string;
    CW, CCW : string;

    Position : longint;
    Conv : double;
    SP : byte;
    Enable: boolean;
  end;

  TForm_PM16C = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Panel3: TPanel;
    SB_Pulse: TSpeedButton;
    SB_Refresh: TSpeedButton;
    CB_Ping_Ch: TComboBox;
    SG_Pos: TStringGrid;
    SB_Opt: TSpeedButton;
    Panel2: TPanel;
    RG_SP: TRadioGroup;
    CB_PLS: TCheckBox;
    Panel4: TPanel;
    Label6: TLabel;
    RB_CCW: TRadioButton;
    BB_MoveBy_p: TBitBtn;
    BB_MoveTo: TBitBtn;
    BB_MoveBy_m: TBitBtn;
    SB_PM1: TSpeedButton;
    Edit_MoveBy: TEdit;
    Edit_MoveTo: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    SB_PM2: TSpeedButton;
    Panel5: TPanel;
    Label5: TLabel;
    RB_CW: TRadioButton;
    IdTCPClient: TIdTCPClient;
    Panel6: TPanel;
    CB_R_M: TCheckBox;
    Panel8: TPanel;
    CB_Connect: TCheckBox;
    Edit_IP: TEdit;
    Panel7: TPanel;
    CB_Mode: TComboBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SB_Table: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    CB_EN: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure SB_RefreshClick(Sender: TObject);
    procedure CB_ConnectClick(Sender: TObject);

    procedure CB_R_MClick(Sender: TObject);
    procedure SG_PosSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);

    procedure BB_MoveBy_mClick(Sender: TObject);
    procedure BB_MoveBy_pClick(Sender: TObject);
    procedure BB_MoveToClick(Sender: TObject);

    procedure SB_PM1Click(Sender: TObject);
    procedure SB_PM2Click(Sender: TObject);

    procedure SB_PulseClick(Sender: TObject);

    procedure RG_SPClick(Sender: TObject);
    procedure CB_PLSClick(Sender: TObject);
    procedure SB_OptClick(Sender: TObject);

    procedure Disp_Selected_Axis;
    procedure SB_verClick(Sender: TObject);

    procedure Load_IniFile(Sender: TObject);
    procedure Save_IniFile(Sender: TObject);

    function Connect(IP:string; Port :longint): boolean;
    function DisConnect: boolean;

    function Get_ver: string;
    function Set_Local: string;
    function Set_Remote: string;
    function isBusy(lCh: byte): boolean;

    function GetCh(lPos: byte): byte;
    function GetPos(lPos: byte): longint;
    function MoveBy(lCh, TPos: Integer;lWait, ShowDlg:boolean): string;
    function MoveTo(lCh, TPos: Integer;lWait, ShowDlg:boolean): string;
    function WaitForStop:boolean;

    function Get_LMin(lPos: byte): longint;
    function Get_LMax(lPos: byte): longint;
    function Set_LMin(lPos: byte; TPos:longint): longint;
    function Set_LMax(lPos: byte; TPos:longint): longint;

    function Get_SP(lPos: byte): byte;
    function GetHSP(lPos: byte): longint;
    function GetMSP(lPos: byte): longint;
    function GetLSP(lPos: byte): longint;
    function SetHSP(lPos: byte; SP:integer): longint;
    function SetMSP(lPos: byte; SP:integer): longint;
    function SetLSP(lPos: byte; SP:integer): longint;

    function Get_Rate(lPos: byte): byte;
    function Set_Rate(lPos: byte; RATE:integer): longint;

    function Get_LS(lPos: byte): byte;
    function Get_LS_Stat(lPos: byte): byte;

    procedure Pulse(Ch: longint);
    procedure SetPulse(lCh, lPos: longint);
    procedure DisPulse(lCh: longint);

    function SelectSP(lCh, lMode: byte): string;
    function SetCh(lPos, lCh: byte): byte;
    function SetPreset(lCh: byte; lSP: Integer): string;
    function SetSP(lCh, lMode: byte; lSP: Integer): string;
    function SetSPAll(lMode: byte): string;

    procedure ClearTMG(lCh: byte);
    procedure SetTMGP(lCh: byte; StP, EndP, dP: Integer);
    procedure SetTMGReady(lCh: byte);
    procedure Set_LS(lCh:byte; NONC:longint);

    function Stop: string;

    function Get_AxisName(lCh:byte):string;

    function Pause(Pause_ON:boolean):boolean;

    procedure Backup_Param;
    procedure Recover_Param;
    procedure SB_TableClick(Sender: TObject);
    procedure CB_ENClick(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    Go : boolean;
    Motor : array[0..15] of Tmotor;
    SelectedMot, SelectedNo : byte;
  end;

var
  Form_PM16C: TForm_PM16C;


implementation

{$R *.dfm}

uses Unit_Status, Unit_PM16C_Op, Unit_PM16C_Table, main;

{ TForm_PM16C }


function StrToHex(InpStr:string):integer;
var
  TmpInt,Code : longint;
begin
  Val(InpStr,TmpInt,Code);
  if Code<>0 then
    case InpStr[1] of
      'A' : TmpInt := 10;
      'B' : TmpInt := 11;
      'C' : TmpInt := 12;
      'D' : TmpInt := 13;
      'E' : TmpInt := 14;
      'F' : TmpInt := 15;
    else
      TmpInt := 0;
    end;
  StrToHex := TmpInt;
end;

procedure TForm_PM16C.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  li:byte;
  TmpStr : string;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Top     := Ini.ReadInteger( 'Form_PM16C', 'Top', 100 );
    Left    := Ini.ReadInteger( 'Form_PM16C', 'Left', 100 );
    if Ini.ReadBool( 'Form_PM16C', 'InitMax', false ) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;

    Edit_IP.Text := Ini.ReadString('PM16C', 'IP', '10.7.3.102');

    li:=1;
    TmpStr := 'ModeItem'+li.ToString;
    while Ini.ValueExists('PM16C',TmpStr) do
    begin
      CB_Mode.Items.Add(Ini.ReadString('PM16C', TmpStr,li.ToString));
      Inc(li);
      TmpStr := 'ModeItem'+li.ToString;
    end;

    CB_Mode.ItemIndex := Ini.ReadInteger('PM16C', 'Mode', 0);
    CB_PLS.Checked := Ini.ReadBool('PM16C', 'PLS', false);
    CB_Ping_Ch.ItemIndex := Ini.ReadInteger('PM16C', 'Ping_Ch', 0);
  finally
    Ini.Free;
  end;

  SG_Pos.ColWidths[0] := 40;
  SG_Pos.ColWidths[1] := 100;
  SG_Pos.ColWidths[2] := 100;
  SG_Pos.ColWidths[3] := 100;
  SG_Pos.ColWidths[4] := 35;
  SG_Pos.ColWidths[5] := 48;
  SG_Pos.ColWidths[6] := 48;

  SG_Pos.Cells[0,0] := 'No.';
  SG_Pos.Cells[1,0] := 'Axis Name';
  SG_Pos.Cells[2,0] := 'Position[pls]';
  SG_Pos.Cells[3,0] := 'Position';
  SG_Pos.Cells[4,0] := 'SP';
  SG_Pos.Cells[5,0] := 'CCW';
  SG_Pos.Cells[6,0] := 'CW';

  SelectedNo := 0;
end;

procedure TForm_PM16C.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  if CB_Connect.Checked then
    Save_IniFile(Sender);

  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteInteger( 'Form_PM16C', 'Top', Top);
    Ini.WriteInteger( 'Form_PM16C', 'Left', Left);
    Ini.WriteBool( 'Form_PM16C', 'InitMax', WindowState = wsMaximized );

    Ini.WriteString('PM16C', 'IP', Edit_IP.Text );
    Ini.WriteInteger('PM16C', 'Mode', CB_Mode.ItemIndex);
    Ini.WriteBool('PM16C', 'PLS', CB_PLS.Checked);
    Ini.WriteInteger('PM16C', 'Ping_Ch', CB_Ping_Ch.ItemIndex);
  finally
    Ini.Free;
  end;
end;

procedure TForm_PM16C.SB_RefreshClick(Sender: TObject);
var
  li : byte;
begin
  if CB_Connect.Checked then
  begin
    for li:=0 to 15 do
    begin
      begin
        Motor[li].Position := GetPos(li);
        Motor[li].SP := Get_SP(li);

        SG_Pos.Cells[0,li+1] := li.ToString;
        SG_Pos.Cells[1,li+1] := Motor[li].Axis_Name;

        SG_Pos.Cells[2,li+1] := Motor[li].Position.ToString;
        SG_Pos.Cells[3,li+1] := (Motor[li].Position/Motor[li].Conv).ToString+' ['+Motor[li].Unit_Name+']';
        SG_Pos.Cells[5,li+1] := Motor[li].CCW;
        SG_Pos.Cells[6,li+1] := Motor[li].CW;
        case Motor[li].SP of
          0:SG_Pos.Cells[4,li+1] := 'H';
          1:SG_Pos.Cells[4,li+1] := 'M';
          2:SG_Pos.Cells[4,li+1] := 'L';
        end;
      end;
    end;
    Disp_Selected_Axis;
  end;
end;

procedure TForm_PM16C.SB_TableClick(Sender: TObject);
begin
  Form_16C_Table.Show;
end;

procedure TForm_PM16C.CB_ConnectClick(Sender: TObject);
begin
  //クリックした後の状態でコーディング
  if not(CB_Connect.Checked) then
  begin
    if IdTCPClient.Connected then
    begin
      Save_IniFile(Sender);
      DisConnect;
    end;
    Panel1.Enabled := false;
  end
  else
  begin
    if Connect(Edit_IP.Text,7777) then
    begin
      Panel1.Enabled := true;
      Load_IniFile(Sender);
      SB_RefreshClick(Sender);
      Set_Remote;
      CB_R_M.Checked := true;
    end
    else
      ShowMessage('Could NOT connected to PM16C!');
  end;
end;

procedure TForm_PM16C.CB_ENClick(Sender: TObject);
begin
  Motor[SelectedNo].Enable := CB_EN.Checked;
end;

procedure TForm_PM16C.CB_R_MClick(Sender: TObject);
begin
  if CB_Connect.Checked then
    if CB_R_M.Checked then
      Set_Remote
    else
      Set_Local;
end;

procedure TForm_PM16C.SB_OptClick(Sender: TObject);
begin
  if Form_PM16C_Op.Showing then
    Form_PM16C_Op.BB_CloseClick(Sender);

  Form_PM16C_Op.lCh := SelectedNo;
  Form_PM16C_Op.Show;
end;

procedure TForm_PM16C.Disp_Selected_Axis;
begin
  if CB_PLS.Checked then
  begin
    Label3.Caption := '[pls]';
    Label4.Caption := '[pls]';
  end
  else
  begin
    Label3.Caption := '['+Motor[SelectedNo].Unit_Name+']';
    Label4.Caption := '['+Motor[SelectedNo].Unit_Name+']';
  end;

  SetCh(0,SelectedMot) ;
  RG_SP.ItemIndex := Motor[SelectedNo].SP;

  CB_EN.Checked := Motor[SelectedNo].Enable;

  Label1.Caption := 'CH : '+SelectedMot.ToString;
  Label2.Caption := 'POS : '+GetPos(SelectedMot).ToString+' [pls]';

  case Get_LS_Stat(SelectedMot) of
    0 : begin
          RB_CW.Checked := false;
          Label6.Font.Color := clBlack;
          RB_CCW.Checked := false;
          Label5.Font.Color := clBlack;
        end;
    1 : begin
          RB_CW.Checked := true;
          Label6.Font.Color := clBlack;
          RB_CCW.Checked := false;
          Label5.Font.Color := clRed;
        end;
    2 : begin
          RB_CW.Checked := false;
          Label6.Font.Color := clRed;
          RB_CCW.Checked := true;
          Label5.Font.Color := clBlack;
        end;
    3 : begin
          RB_CW.Checked := true;
          Label6.Font.Color := clRed;
          RB_CCW.Checked := true;
          Label5.Font.Color := clRed;
        end;
  end;
end;

procedure TForm_PM16C.SG_PosSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  SelectedNo := ARow-1;
  SelectedMot := SelectedNo;
  Disp_Selected_Axis;
end;

procedure TForm_PM16C.SB_PM1Click(Sender: TObject);
begin
  Edit_MoveBy.Text := (StrToFloat(Edit_MoveBy.Text)*(-1)).ToString;
end;

procedure TForm_PM16C.SB_PM2Click(Sender: TObject);
begin
  Edit_MoveTo.Text := (StrToFloat(Edit_MoveTo.Text)*(-1)).ToString;
end;

procedure TForm_PM16C.SB_PulseClick(Sender: TObject);
begin
  Pulse(CB_Ping_Ch.ItemIndex);
end;

procedure TForm_PM16C.BB_MoveBy_mClick(Sender: TObject);
var
  TmpPos:longint;
  lBool : boolean;
begin
  if Motor[SelectedNo].Enable then
  begin
    Go := true;
    if CB_PLS.Checked then
      MoveBy(SelectedMot,Round(-1*StrToFloat(Edit_MoveBy.Text)),true,true)
    else
      MoveBy(SelectedMot,Round(-1*StrToFloat(Edit_MoveBy.Text)*Motor[SelectedNo].Conv),true,true);

    TmpPos :=GetPos(SelectedMot);
    SG_PosSelectCell(Sender, SG_Pos.Col, SG_Pos.Row, lBool);

    SB_RefreshClick(Sender);

    Motor[SelectedNo].Position := TmpPos;
    SG_Pos.Cells[2,SelectedNo+1] :=TmpPos.ToString;
    SG_Pos.Cells[3,SelectedNo+1] :=(TmpPos/Motor[SelectedNo].Conv).ToString+' ['+Motor[SelectedNo].Unit_Name+']';
  end;
end;

procedure TForm_PM16C.BB_MoveBy_pClick(Sender: TObject);
var
  TmpPos:longint;
  lBool : boolean;
begin
  if Motor[SelectedNo].Enable then
  begin
    Go := true;
    if CB_PLS.Checked then
      MoveBy(SelectedMot,StrToInt(Edit_MoveBy.Text),true,true)
    else
      MoveBy(SelectedMot,Round(StrToFloat(Edit_MoveBy.Text)*Motor[SelectedNo].Conv),true,true);

    TmpPos := GetPos(SelectedMot);
    SG_PosSelectCell(Sender, SG_Pos.Col, SG_Pos.Row, lBool);

    SB_RefreshClick(Sender);

    Motor[SelectedNo].Position := TmpPos;
    SG_Pos.Cells[2,SelectedNo+1] :=TmpPos.ToString;
    SG_Pos.Cells[3,SelectedNo+1] :=(TmpPos/Motor[SelectedNo].Conv).ToString+' ['+Motor[SelectedNo].Unit_Name+']';
  end;
end;

procedure TForm_PM16C.BB_MoveToClick(Sender: TObject);
var
  TmpPos:longint;
  lBool : boolean;
begin
  if Motor[SelectedNo].Enable then
  begin
    Go := true;
    if CB_PLS.Checked then
      MoveTo(SelectedMot,Round(StrToFloat(Edit_MoveTo.Text)),true,true)
    else
      MoveTo(SelectedMot,Round(StrToFloat(Edit_MoveTo.Text)*Motor[SelectedNo].Conv),true,true);

    TmpPos :=GetPos(SelectedMot);

    SG_PosSelectCell(Sender, SG_Pos.Col, SG_Pos.Row, lBool);

    Motor[SelectedNo].Position := TmpPos;
    SG_Pos.Cells[2,SelectedNo+1] :=TmpPos.ToString;
    SG_Pos.Cells[3,SelectedNo+1] :=(TmpPos/Motor[SelectedNo].Conv).ToString+' ['+Motor[SelectedNo].Unit_Name+']';
  end;
end;

procedure TForm_PM16C.RG_SPClick(Sender: TObject);
begin
  SelectSP(SelectedMot,RG_SP.ItemIndex );

  Motor[SelectedNo].SP := RG_SP.ItemIndex;
  case RG_SP.ItemIndex of
    0:SG_Pos.Cells[4,SelectedNo+1] := 'H';
    1:SG_Pos.Cells[4,SelectedNo+1] := 'M';
    2:SG_Pos.Cells[4,SelectedNo+1] := 'L';
  end;
end;

procedure TForm_PM16C.CB_PLSClick(Sender: TObject);
begin
  if CB_PLS.Checked then
  begin
    Label3.Caption := '[pls]';
    Label4.Caption := '[pls]';
  end
  else
  begin
    Label3.Caption := '['+Motor[SelectedNo].Unit_Name+']';
    Label4.Caption := '['+Motor[SelectedNo].Unit_Name+']';
  end;
end;

procedure TForm_PM16C.SB_verClick(Sender: TObject);
begin
end;





//PM16C_Command

function TForm_PM16C.Get_AxisName(lCh: byte): string;
begin
  Get_AxisName :=  Motor[lCh].Axis_Name;
end;


procedure TForm_PM16C.Save_IniFile(Sender: TObject);
var
  li:longint;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ExtractFileDir(Application.ExeName)+'\'+IdTCPClient.Host+'_'+CB_Mode.ItemIndex.ToString+'.INI' );
  try
    for li:=0 to 15 do
    begin
      Ini.WriteString('Mot_'+li.ToString, 'Axis_Name',Motor[li].Axis_Name);
      Ini.WriteString('Mot_'+li.ToString, 'Unit_Name',Motor[li].Unit_Name);
      Ini.WriteString('Mot_'+li.ToString, 'CW',Motor[li].CW);
      Ini.WriteString('Mot_'+li.ToString, 'CCW',Motor[li].CCW);
      Ini.WriteFloat('Mot_'+li.ToString, 'Conv',Motor[li].Conv);
      Ini.WriteBool('Mot_'+li.ToString, 'Enable',Motor[li].Enable);
    end;
  finally
    Ini.Free;
  end;
end;

procedure TForm_PM16C.Load_IniFile(Sender: TObject);
var
  i:byte;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ExtractFileDir(Application.ExeName)+'\'+IdTCPClient.Host+'_'+CB_Mode.ItemIndex.ToString+'.INI' );
  try
    for i:=0 to 15 do
    begin
      Motor[i].Axis_Name := Ini.ReadString('Mot_'+i.ToString, 'Axis_Name', '' );
      Motor[i].Unit_Name := Ini.ReadString('Mot_'+i.ToString, 'Unit_Name', 'mm' );
      Motor[i].CW := Ini.ReadString('Mot_'+i.ToString, 'CW', 'Up' );
      Motor[i].CCW := Ini.ReadString('Mot_'+i.ToString, 'CCW', 'Down' );

      Motor[i].Conv := Ini.ReadFloat('Mot_'+i.ToString, 'Conv', 1000 );
      if Motor[i].Conv = 0 then
         Motor[i].Conv := 1000;
      Motor[i].Enable := Ini.ReadBool('Mot_'+i.ToString, 'Enable',false);
    end;
    finally
      Ini.Free;
  end;
end;

function TForm_PM16C.Connect(IP: string; Port :longint): boolean;
begin
  IdTCPClient.Host := IP;
  IdTCPClient.Port := Port;
  try
    IdTCPClient.Connect
  finally
    begin
      if IdTCPClient.Connected then
      begin
        Connect := true;
        CB_Connect.Checked := true;
      end
      else
      begin
        Connect := false;
        CB_Connect.Checked := false;
      end;
    end;
  end;
end;

function TForm_PM16C.DisConnect: boolean;
begin
  IdTCPClient.Disconnect;
  if IdTCPClient.Connected then
    DisConnect := true
  else
    DisConnect := false;
end;

function TForm_PM16C.Get_ver: string;
begin
  IdTCPClient.IOHandler.WriteLn('VER?'+CHR(13)+CHR(10));
  Get_ver := IdTCPClient.IOHandler.ReadLn();
end;

function TForm_PM16C.Set_Remote: string;
begin
  IdTCPClient.IOHandler.WriteLn('REM'+CHR(13)+CHR(10));
end;

function TForm_PM16C.Set_Local: string;
begin
  IdTCPClient.IOHandler.WriteLn('LOC'+CHR(13)+CHR(10));
end;

function TForm_PM16C.isBusy(lCh: byte): boolean;
var
  TmpStr : string;
begin
  //Sleep(50);
  IdTCPClient.IOHandler.WriteLn('STQ?'+CHR(13)+CHR(10));
  TmpStr := IdTCPClient.IOHandler.ReadLn();
  if Copy(TmpStr,2,1) = '4' then
    isBusy := false
  else
    isBusy := true;
end;

function TForm_PM16C.GetCh(lPos: byte): byte;
var
  TmpStr : string;
begin
  IdTCPClient.IOHandler.WriteLn('SETCH?'+CHR(13)+CHR(10));
  TmpStr := IdTCPClient.IOHandler.ReadLn();
  GetCh := StrToInt('$'+TmpStr[lPos+1]);
end;

function TForm_PM16C.SetCh(lPos, lCh: byte): byte;
var
  lStr : string;
begin
  case lPos of
    0:IdTCPClient.IOHandler.WriteLn('S11'+IntToHex(lCh,1)+lStr+CHR(13)+CHR(10));
    1:IdTCPClient.IOHandler.WriteLn('S12'+IntToHex(lCh,1)+lStr+CHR(13)+CHR(10));
    2:IdTCPClient.IOHandler.WriteLn('S15'+IntToHex(lCh,1)+lStr+CHR(13)+CHR(10));
    3:IdTCPClient.IOHandler.WriteLn('S16'+IntToHex(lCh,1)+lStr+CHR(13)+CHR(10));
  end;
end;

function TForm_PM16C.GetPos(lPos: byte): longint;
begin
  IdTCPClient.IOHandler.WriteLn('PS?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  GetPos := StrToInt(IdTCPClient.IOHandler.ReadLn());
end;

function TForm_PM16C.SetPreset(lCh: byte; lSP: Integer): string;
var
  TmpInt : longint;
begin
  if Form_Main.CB_Log.Checked then
    TmpInt := GetPos(lCh);

  IdTCPClient.IOHandler.WriteLn('PS'+IntToHex(lCh,1)+IntToStr(lSP)+CHR(13)+CHR(10));

  if (Form_Main.CB_Log.Checked) and (TmpInt<>lSP) then
    Form_Main.AddLine('SetPreset('+lCh.ToString+','+TmpInt.ToString+','+lSP.ToString+')',true);
end;

function TForm_PM16C.MoveBy(lCh, TPos: Integer; lWait,
  ShowDlg: boolean): string;
var
  OPOS:longint;
begin
  OPOS := GetPos(lCh);
  IdTCPClient.IOHandler.WriteLn('REL'+IntToHex(lCh,1)+IntToStr(TPos)+CHR(13)+CHR(10));
  if lWait then
  begin
    Go:=true;

    if ShowDlg then
      Form_Status.Show;

    repeat
      if ShowDlg then
      begin
        Form_Status.Label1.Caption := lCh.ToString+' : '+Get_AxisName(lCh);
        Form_Status.Label2.Caption := TPos.ToString;
        Form_Status.Label4.Caption := '/';
      end;

      Application.ProcessMessages;
      if not(Go) then
      begin
        Stop;
        if Form_Main.CB_Log.Checked then
        begin
          repeat
            Sleep(100);
          until not(isBusy(lCh));
          Form_Main.AddLine('Stopped('+lCh.ToString+','+OPOS.ToString+','+GetPos(lCh).ToString+')',true);
        end;
        exit;
      end;
      Form_Status.Label3.Caption :=(GetPos(lCh)-OPOS).ToString;
    until not(isBusy(lCh));
  end;
  if ShowDlg then
    Form_Status.Close;
  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('MoveBy('+lCh.ToString+','+OPOS.ToString+','+TPOS.ToString+')',true);
end;

function TForm_PM16C.MoveTo(lCh, TPos: Integer; lWait,
  ShowDlg: boolean): string;
var
  OPOS:longint;
begin
  OPOS := GetPos(lCh);
  IdTCPClient.IOHandler.WriteLn('ABS'+IntToHex(lCh,1)+IntToStr(TPos)+CHR(13)+CHR(10));
  if lWait then
  begin
    Go:=true;
    if ShowDlg then
      Form_Status.Show;

    repeat
      if ShowDlg then
      begin
        Form_Status.Label1.Caption := lCh.ToString+' : '+Get_AxisName(lCh);
        Form_Status.Label2.Caption := TPos.ToString;
        Form_Status.Label4.Caption := '→';
      end;

      Application.ProcessMessages;
      if not(Go) then
      begin
        Stop;
        if Form_Main.CB_Log.Checked then
        begin
          repeat
            Sleep(100);
          until not(isBusy(lCh));
          Form_Main.AddLine('Stopped('+lCh.ToString+','+OPOS.ToString+','+GetPos(lCh).ToString+')',true);
        end;
        exit;
      end;
      Form_Status.Label3.Caption :=GetPos(lCh).ToString;
    until not(isBusy(lCh));
  end;
  if ShowDlg then
    Form_Status.Close;
  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('MoveTo('+lCh.ToString+','+OPOS.ToString+','+TPOS.ToString+')',true);
end;

function TForm_PM16C.Stop: string;
begin
  Go := false;
  IdTCPClient.IOHandler.WriteLn('ASSTP'+CHR(13)+CHR(10));
end;

function TForm_PM16C.WaitForStop: boolean;
begin
  repeat
    Sleep(50);
    Application.ProcessMessages;
    if not(Go) then
      exit;
  until not(isBusy(0));
end;

function TForm_PM16C.Pause(Pause_ON: boolean): boolean;
begin
  if Pause_ON then
    IdTCPClient.IOHandler.WriteLn('PAUSE ON'+CHR(13)+CHR(10))
  else
    IdTCPClient.IOHandler.WriteLn('PAUSE OFF'+CHR(13)+CHR(10))
end;


function TForm_PM16C.SelectSP(lCh, lMode: byte): string;
begin
  case lMode of
    0:IdTCPClient.IOHandler.WriteLn('SPDH'+IntToHex(lCh,1)+CHR(13)+CHR(10));
    1:IdTCPClient.IOHandler.WriteLn('SPDM'+IntToHex(lCh,1)+CHR(13)+CHR(10));
    2:IdTCPClient.IOHandler.WriteLn('SPDL'+IntToHex(lCh,1)+CHR(13)+CHR(10));
  end;
end;

function TForm_PM16C.SetSP(lCh, lMode: byte; lSP: Integer): string;
begin
  case lMode of
    0:IdTCPClient.IOHandler.WriteLn('SPDH'+IntToHex(lCh,1)+IntToStr(lSP)+CHR(13)+CHR(10));
    1:IdTCPClient.IOHandler.WriteLn('SPDM'+IntToHex(lCh,1)+IntToStr(lSP)+CHR(13)+CHR(10));
    2:IdTCPClient.IOHandler.WriteLn('SPDL'+IntToHex(lCh,1)+IntToStr(lSP)+CHR(13)+CHR(10));
  end;
end;

function TForm_PM16C.SetSPAll(lMode: byte): string;
var
  i:byte;
begin
  for i:=0 to 15 do
  case lMode of
    0:IdTCPClient.IOHandler.WriteLn('SPDH'+IntToHex(i,1)+CHR(13)+CHR(10));
    1:IdTCPClient.IOHandler.WriteLn('SPDM'+IntToHex(i,1)+CHR(13)+CHR(10));
    2:IdTCPClient.IOHandler.WriteLn('SPDL'+IntToHex(i,1)+CHR(13)+CHR(10));
  end;
end;

function TForm_PM16C.SetHSP(lPos: byte; SP: integer): longint;
begin
  IdTCPClient.IOHandler.WriteLn('SPDH'+IntToHex(lPos,1)+SP.ToString+CHR(13)+CHR(10));
end;

function TForm_PM16C.SetMSP(lPos: byte; SP: integer): longint;
begin
  IdTCPClient.IOHandler.WriteLn('SPDM'+IntToHex(lPos,1)+SP.ToString+CHR(13)+CHR(10));
end;

function TForm_PM16C.SetLSP(lPos: byte; SP: integer): longint;
begin
  IdTCPClient.IOHandler.WriteLn('SPDL'+IntToHex(lPos,1)+SP.ToString+CHR(13)+CHR(10));
end;

function TForm_PM16C.GetHSP(lPos: byte): longint;
begin
  IdTCPClient.IOHandler.WriteLn('SPDH?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  GetHSP := StrToInt(IdTCPClient.IOHandler.ReadLn());
end;

function TForm_PM16C.GetMSP(lPos: byte): longint;
begin
  IdTCPClient.IOHandler.WriteLn('SPDM?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  GetMSP := StrToInt(IdTCPClient.IOHandler.ReadLn());
end;

function TForm_PM16C.GetLSP(lPos: byte): longint;
begin
  IdTCPClient.IOHandler.WriteLn('SPDL?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  GetLSP := StrToInt(IdTCPClient.IOHandler.ReadLn());
end;

function TForm_PM16C.Set_Rate(lPos: byte; RATE: integer): longint;
begin
  if (RATE>=0) and (RATE<116) then
  begin
    IdTCPClient.IOHandler.WriteLn('RTE'+IntToHex(lPos,1)+RATE.ToString+CHR(13)+CHR(10));
    Set_Rate := 0;
  end
  else
    Set_Rate := -1;
end;

function TForm_PM16C.Get_Rate(lPos: byte): byte;
var
  lStr : string;
begin
  IdTCPClient.IOHandler.WriteLn('RTE?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  lStr :=IdTCPClient.IOHandler.ReadLn();
  Get_Rate := lStr.ToInteger;
end;

function TForm_PM16C.Get_SP(lPos: byte): byte;
var
  lStr : string;
begin
  IdTCPClient.IOHandler.WriteLn('SPD?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  lStr :=IdTCPClient.IOHandler.ReadLn();
  if lStr = 'HSPD' then
    Get_SP := 0;
  if lStr = 'MSPD' then
    Get_SP := 1;
  if lStr = 'LSPD' then
    Get_SP := 2;
end;


procedure TForm_PM16C.Set_LS(lCh: byte; NONC: Integer);
begin
  if NONC = 0 then
    IdTCPClient.IOHandler.WriteLn('SETLS'+IntToHex(lCh,1)+'11110000'+CHR(13)+CHR(10))
  else
    IdTCPClient.IOHandler.WriteLn('SETLS'+IntToHex(lCh,1)+'11110111'+CHR(13)+CHR(10));
end;

function TForm_PM16C.Get_LS(lPos: byte): byte;
var
  lStr : string;
begin
  IdTCPClient.IOHandler.WriteLn('SETLS?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  lStr :=IdTCPClient.IOHandler.ReadLn();
  Get_LS := StrToInt(lStr[7]);
end;

function TForm_PM16C.Get_LS_Stat(lPos: byte): byte;
var
  TmpStr : string;
begin
  Sleep(20);
  IdTCPClient.IOHandler.WriteLn('STS'+IntToHex(lPos,1)+'?'+CHR(13)+CHR(10));
  TmpStr := IdTCPClient.IOHandler.ReadLn();
  if TmpStr[4]<>'-' then
    Get_LS_Stat := ((StrToHex(TmpStr[4]) mod 8) mod 4)
  else
    Get_LS_Stat := 0;
end;



procedure TForm_PM16C.SetPulse(lCh, lPos: Integer);
begin
  IdTCPClient.IOHandler.WriteLn('TMGM'+IntToHex(lCh,1)+'1'+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGS'+IntToHex(lCh,1)+IntToStr(lPos)+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGE'+IntToHex(lCh,1)+IntToStr(lPos+100)+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGI'+IntToHex(lCh,1)+'100'+CHR(13)+CHR(10));

  IdTCPClient.IOHandler.WriteLn('TMGR'+IntToHex(lCh,1)+CHR(13)+CHR(10));
  Sleep(10);
end;

procedure TForm_PM16C.DisPulse(lCh: Integer);
begin
  IdTCPClient.IOHandler.WriteLn('TMGC'+IntToHex(lCh,1)+CHR(13)+CHR(10));
end;

procedure TForm_PM16C.Pulse(Ch: Integer);
var
  lCh :byte;
  lPos:longint;
begin
  lCh := GetCh(Ch);
  lPos := GetPos(lCh);

  IdTCPClient.IOHandler.WriteLn('TMGM'+IntToHex(lCh,1)+'1'+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGS'+IntToHex(lCh,1)+IntToStr(lPos-100)+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGE'+IntToHex(lCh,1)+IntToStr(lPos+100)+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGI'+IntToHex(lCh,1)+'100'+CHR(13)+CHR(10));

  IdTCPClient.IOHandler.WriteLn('TMGR'+IntToHex(lCh,1)+CHR(13)+CHR(10));
  Sleep(10);
  IdTCPClient.IOHandler.WriteLn('TMGC'+IntToHex(lCh,1)+CHR(13)+CHR(10));
end;

procedure TForm_PM16C.ClearTMG(lCh: byte);
begin
  IdTCPClient.IOHandler.WriteLn('TMGC'+IntToHex(lCh,1)+CHR(13)+CHR(10));
end;


procedure TForm_PM16C.SetTMGP(lCh: byte; StP, EndP, dP: Integer);
begin
  IdTCPClient.IOHandler.WriteLn('TMGM'+IntToHex(lCh,1)+'3'+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGS'+IntToHex(lCh,1)+IntToStr(StP)+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGE'+IntToHex(lCh,1)+IntToStr(EndP)+CHR(13)+CHR(10));
  IdTCPClient.IOHandler.WriteLn('TMGI'+IntToHex(lCh,1)+IntToStr(dP)+CHR(13)+CHR(10));
end;

procedure TForm_PM16C.SetTMGReady(lCh: byte);
begin
  IdTCPClient.IOHandler.WriteLn('TMGR'+IntToHex(lCh,1)+CHR(13)+CHR(10));
end;


procedure TForm_PM16C.Recover_Param;
var
  li,lk:longint;
  BKF : textfile;
begin
  if OpenDialog1.Execute then
  begin
    Assignfile(BKF, OpenDialog1.FileName);
    ReSet(BKF);
    for lk:=0 to 15 do
    begin
      ReadLn(BKF, li);
      SetPreset(lk, li);
    end;
    CloseFile(BKF);
  end;
end;



procedure TForm_PM16C.Backup_Param;
var
  li,lk:longint;
  BKF : textfile;
begin
  if SaveDialog1.Execute then
  begin
    Assignfile(BKF, SaveDialog1.FileName);
    ReWrite(BKF);
    for lk:=0 to 15 do
    begin
      li := GetPos(lk);
      WriteLn(BKF, li.ToString);
    end;

    CloseFile(BKF);
  end;
end;

function TForm_PM16C.Get_LMax(lPos: byte): longint;
var
  lStr : string;
begin
  IdTCPClient.IOHandler.WriteLn('FL?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  lStr :=IdTCPClient.IOHandler.ReadLn();
  Get_LMax := StrToInt(lStr);
end;

function TForm_PM16C.Get_LMin(lPos: byte): longint;
var
  lStr : string;
begin
  IdTCPClient.IOHandler.WriteLn('BL?'+IntToHex(lPos,1)+CHR(13)+CHR(10));
  lStr :=IdTCPClient.IOHandler.ReadLn();
  Get_LMin := StrToInt(lStr);
end;

function TForm_PM16C.Set_LMax(lPos: byte; TPos: Integer): longint;
var
  lStr:string;
begin
  if TPos>0 then
    lStr := '+'+Format('%.7d',[TPos])
  else
    lStr := Format('%.7d',[TPos]);
  IdTCPClient.IOHandler.WriteLn('FL'+IntToHex(lPos,1)+lStr+CHR(13)+CHR(10)) ;
end;

function TForm_PM16C.Set_LMin(lPos: byte; TPos: Integer): longint;
var
  lStr:string;
begin
  if TPos>0 then
    lStr := '+'+Format('%.7d',[TPos])
  else
    lStr := Format('%.7d',[TPos]);
  IdTCPClient.IOHandler.WriteLn('BL'+IntToHex(lPos,1)+lStr+CHR(13)+CHR(10)) ;
end;


end.
