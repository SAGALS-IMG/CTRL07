unit Unit_Imager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, IniFiles, Zyla, Unit_PW, MMSystem,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart,  Diagnostics;

const
  NumberOfBuffers = 100;

type
  TIData = array[0..2560*2160+8] of WORD;//char;

  TForm_Imager = class(TForm)
    SB: TStatusBar;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BB_Init: TBitBtn;
    Panel2: TPanel;
    BB_SetExp: TBitBtn;
    GroupBox2: TGroupBox;
    Shape2: TShape;
    Edit_ROI_Y1: TEdit;
    Edit_ROI_X1: TEdit;
    Edit_ROI_X2: TEdit;
    Edit_ROI_Y2: TEdit;
    Label2: TLabel;
    CB_BIN: TComboBox;
    Label3: TLabel;
    CB_Trig: TComboBox;
    Label4: TLabel;
    Edit_ExpT: TEdit;
    Label7: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label_tmep: TLabel;
    BB_Aq: TBitBtn;
    BB_Live: TBitBtn;
    Label8: TLabel;
    CB_Range: TComboBox;
    Label9: TLabel;
    CB_Shutte_Mode: TComboBox;
    Label10: TLabel;
    CB_Rate: TComboBox;
    CB_Cooling: TCheckBox;
    BB_ROI: TBitBtn;
    BB_Set_Full: TBitBtn;
    SB_Get_Temp: TSpeedButton;
    Label_PW: TLabel;
    Label_PH: TLabel;
    Label6: TLabel;
    SaveDialog1: TSaveDialog;
    BB_Scan_ST: TBitBtn;
    BB_Stop: TBitBtn;
    CB_SaveData: TCheckBox;
    Edit_Scan_Orig: TEdit;
    Label5: TLabel;
    Label26: TLabel;
    Edit_Scan_d: TEdit;
    Label27: TLabel;
    Edit_Scan_n: TEdit;
    CB_axis_aux: TComboBox;
    Edit_Scan_ST: TEdit;
    Chart1: TChart;
    Label11: TLabel;
    Label12: TLabel;
    Label_FPS: TLabel;
    SB_Test: TSpeedButton;
    SB_Re_Show: TSpeedButton;
    BB_LiveOFF: TBitBtn;
    Series1: TLineSeries;
    Edit_Comm: TEdit;
    SB_Com: TSpeedButton;
    SB_Copy: TSpeedButton;
    Label1: TLabel;
    Edit_WaitT: TEdit;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure BB_InitClick(Sender: TObject);

    procedure CB_BINChange(Sender: TObject);
    procedure CB_RangeChange(Sender: TObject);
    procedure CB_TrigChange(Sender: TObject);
    procedure CB_Shutte_ModeChange(Sender: TObject);
    procedure CB_RateChange(Sender: TObject);
    procedure CB_CoolingClick(Sender: TObject);
    procedure SB_Get_TempClick(Sender: TObject);

    procedure BB_SetExpClick(Sender: TObject);
    procedure BB_Set_FullClick(Sender: TObject);
    procedure BB_ROIClick(Sender: TObject);
    procedure BB_AqClick(Sender: TObject);
    procedure BB_LiveClick(Sender: TObject);
    procedure BB_Scan_STClick(Sender: TObject);
    procedure BB_StopClick(Sender: TObject);

    procedure SB_TestClick(Sender: TObject);
    procedure SB_Re_ShowClick(Sender: TObject);
    procedure BB_LiveOFFClick(Sender: TObject);

    procedure SetExpTime(var ExpTime, FPS:double);
    procedure GetFrameRate(var FrameRate : double);
    procedure SetTrigMode(TrigMode:longint);
    procedure SetCycleMode;
    procedure Aquire_Start;
    procedure Soft_Trigger;
    procedure Que_Buff(li, lBufferSize: Int64);
    procedure Wait_Data(li: Int64);
    procedure Aquire_Stop;
    procedure Flush;

    procedure Get_Img(Show_Img:boolean; Sender: TObject);
    procedure Get_mImg(SN:longint; Show_Img:boolean; Sender: TObject);
    procedure Save_mImg(FN:string; SN:longint; Sender: TObject);

    function GetImageSize:longint;
    procedure CB_axis_auxChange(Sender: TObject);
    procedure SB_ComClick(Sender: TObject);
    procedure SB_CopyClick(Sender: TObject);


  private
    { Private êÈåæ }
    AStopWatch : TStopWatch;
  public
    { Public êÈåæ }
    Go,  Zyla_Opened : boolean;

    Hndl, Buf_Size, MotorAXIS:Int64;
    PW, PH, OW, OH, Stride : Int64 ;

    AlignedBuffers : array[0..NumberOfBuffers-1] of ^TIData;

    RAWData : array[0..2160,0..2560] of WORD;
  end;

var
  Form_Imager: TForm_Imager;

implementation

{$R *.dfm}

uses Unit_PM16C, Unit_Ph_PW, main, Unit_SAKAS;

procedure TForm_Imager.SetCycleMode;
begin
  AT_SetEnumString(Hndl, 'CycleMode', 'Continuous');
end;

procedure TForm_Imager.SetExpTime(var ExpTime, FPS:double);
var
  FPSMin, FPSMax : double;
begin
  AT_SetFloat(Hndl,'ExposureTime',ExpTime);
  if AT_GetFloat(Hndl,'ExposureTime',@ExpTime)=AT_SUCCESS then
    Form_Main.AddLine('ExpT : '+ExpTime.ToString,true);

  Sleep(100);

  AT_GetFloatMin(Hndl,'FrameRate',@FPSMin);
  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('FPS Min'+FPSMin.ToString,true);
  AT_GetFloatMax(Hndl,'FrameRate',@FPSMax);
  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('FPS Max'+FPSMax.ToString,true);

  Sleep(100);

  if AT_SetFloat(Hndl,'FrameRate',FPSMax) = AT_SUCCESS then
  if AT_SetFloat(Hndl,'FrameRate',1/ExpTime) = AT_SUCCESS then
    if Form_Main.CB_Log.Checked then
      Form_Main.AddLine('FPS set successed',true)
  else
    if Form_Main.CB_Log.Checked then
      Form_Main.AddLine('FPS set Not successed',true);

  if AT_GetFloat(Hndl,'FrameRate',@FPS)=AT_SUCCESS then
    Form_Main.AddLine('Framerate : '+FPS.ToString,true);
end;

procedure TForm_Imager.GetFrameRate(var FrameRate: double);
var
  ExpTime, FPS : double;
begin
  if AT_GetFloat(Hndl,'FrameRate',@FPS)=AT_SUCCESS then
    FrameRate := FPS
  else
    FrameRate := -1;
end;


procedure TForm_Imager.SetTrigMode(TrigMode: Integer);
var
  Res : Int64;
begin
  case TrigMode of
    0:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
    1:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'Software');
    2:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'External');
    3:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'External Start');
    4:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'External Exposure');
  end;
  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('Trigger : '+TrigMode.ToString,true);
end;

function TForm_Imager.GetImageSize: longint;
var
  ImageSizeBytes : Int64;
begin
  AT_GetInt(Hndl, 'ImageSizeBytes', @ImageSizeBytes);
  GetImageSize := ImageSizeBytes;
end;

procedure TForm_Imager.Get_Img(Show_Img:boolean; Sender: TObject);
var
  i,j,rBufSize:longint;
  Buf : PChar;
begin
  AT_GetInt(Hndl, 'ImageSizeBytes',@Buf_Size);
  AT_QueueBuffer(Hndl, AlignedBuffers[0], Buf_Size);
  AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
  AT_Command(Hndl,'AcquisitionStart');

  AT_WaitBuffer(Hndl,@Buf,@rBufSize,AT_INFINITE);

  if Show_Img then
  begin
    for j:=0 to PH-1 do
      for i:=0 to Stride-1 do
        if i<PW then
          Form_PW.PData[j,i] := AlignedBuffers[0][j*Stride+i];
    Form_PW.Show;
    Form_PW.Draw_Data(Sender);
  end;

  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('Get_Img',true);

  AT_Command(Hndl,'AcquisitionStop');
  AT_Flush(Hndl);
end;

procedure TForm_Imager.Get_mImg(SN:longint; Show_Img:boolean; Sender: TObject);
var
  i,j,k : longint;
  rBufSize:longint;
  Buf : PChar;
begin
  if SN>NumberOfBuffers then
    exit;

  if Show_Img then
    Form_PW.Show;

  AT_GetInt(Hndl, 'ImageSizeBytes',@Buf_Size);
  for i:=0 to NumberOfBuffers-1 do
    AT_QueueBuffer(Hndl, AlignedBuffers[i], Buf_Size);

  AT_SetEnumString(Hndl, 'CycleMode', 'Continuous');
  AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
  AT_Command(Hndl,'AcquisitionStart');

  for k:=0 to SN-1 do
  begin
    AT_WaitBuffer(Hndl, @Buf, @rBufSize, AT_INFINITE);

    if Show_Img then
    begin
      for j:=0 to PH-1 do
        for i:=0 to Stride-1 do
          if i<PW then
            Form_PW.PData[j,i] := AlignedBuffers[k mod NumberOfBuffers]^[j*Stride+i];
      Form_PW.Draw_Data(Sender);
    end;

    AT_QueueBuffer(Hndl, AlignedBuffers[k mod NumberOfBuffers], Buf_Size);
    Application.ProcessMessages;
  end;

  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('Get_mImg : '+SN.ToString,true);

  AT_Command(Hndl, 'AcquisitionStop');
  AT_Flush(Hndl);
end;

procedure TForm_Imager.Save_mImg(FN: string; SN: Integer; Sender: TObject);
var
  i,j,k : longint;
begin
  for k:=0 to SN-1 do
  begin
      for j:=0 to PH-1 do
        for i:=0 to Stride-1 do
          if i<PW then
            Form_PW.PData[j,i] := AlignedBuffers[k]^[j*Stride+i];
    Form_PW.Save_Data(FN+'_'+k.ToString,Sender);
  end;
end;


procedure TForm_Imager.Que_Buff(li, lBufferSize: Int64);
begin
  AT_QueueBuffer(Hndl, AlignedBuffers[li mod NumberOfBuffers], lBufferSize);
end;

procedure TForm_Imager.Aquire_Start;
begin
  AT_Command(Hndl,'AcquisitionStart');
end;

procedure TForm_Imager.Wait_Data(li: Int64);
var
  i,j:longint;
  rBufSize:longint;
  Buf : PChar;
begin
  AT_WaitBuffer(Hndl, @Buf, @rBufSize, AT_INFINITE);
  for j:=0 to PH-1 do
    for i:=0 to Stride-1 do
      if i<PW then
        RawData[j,i] := AlignedBuffers[li mod NumberOfBuffers]^[j*Stride+i];
  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('Get_Img',true);
end;

procedure TForm_Imager.Aquire_Stop;
begin
  AT_Command(Hndl, 'AcquisitionStop');
end;

procedure TForm_Imager.Flush;
begin
  AT_Flush(Hndl);
end;

procedure TForm_Imager.Soft_Trigger;
begin
  AT_Command(Hndl,'SoftwareTrigger');
  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('Soft_Trig',true);
end;





procedure TForm_Imager.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Top     := Ini.ReadInteger( 'Form_Img', 'Top', 100 );
    Left    := Ini.ReadInteger( 'Form_Img', 'Left', 100 );
    if Ini.ReadBool( 'Form_Img', 'InitMax', false ) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;

    Edit_ROI_X1.Text := Ini.ReadString('Imager', 'ROI_X1', '1');
    Edit_ROI_Y1.Text := Ini.ReadString('Imager', 'ROI_Y1', '1');
    Edit_ROI_X2.Text := Ini.ReadString('Imager', 'ROI_X2', '2048');
    Edit_ROI_Y2.Text := Ini.ReadString('Imager', 'ROI_Y2', '2048');

    PW := StrToInt(Edit_ROI_X2.Text)-StrToInt(Edit_ROI_X1.Text)+1;
    PH := StrToInt(Edit_ROI_Y2.Text)-StrToInt(Edit_ROI_Y1.Text)+1;
    Label_PW.Caption := PW.ToString;
    Label_PH.Caption := PH.ToString;

    CB_BIN.ItemIndex := Ini.ReadInteger('Imager','BIN',0);
    CB_Range.ItemIndex := Ini.ReadInteger('Imager','Range',2);

    Edit_ExpT.Text := Ini.ReadString('Imager', 'EXPT', '1000');
    CB_Trig.ItemIndex := Ini.ReadInteger('Imager','Trig',0);
    CB_Shutte_Mode.ItemIndex := Ini.ReadInteger('Imager','Shutter',0);
    CB_Rate.ItemIndex := Ini.ReadInteger('Imager','Rate',0);
    CB_Cooling.Checked := Ini.ReadBool('Imager','Cooling',false);

    Edit_Scan_Orig.Text := Ini.ReadString('Iamger', 'Scan_Orig', '-1000');
    Edit_Scan_ST.Text := Ini.ReadString('Iamger', 'Scan_ST', '0');
    Edit_Scan_d.Text := Ini.ReadString('Iamger', 'Scan_d', '100');
    Edit_Scan_n.Text := Ini.ReadString('Iamger', 'Scan_n', '100');
    MotorAXIS := Ini.ReadInteger('Iamger', 'Motor_AXIS', 0);
  finally
    Ini.Free;
  end;
end;

procedure TForm_Imager.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
  li:longint;
begin

  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteInteger( 'Form_Img', 'Top', Top);
    Ini.WriteInteger( 'Form_Img', 'Left', Left);
    Ini.WriteBool( 'Form_Img', 'InitMax', WindowState = wsMaximized );

    Ini.WriteString('Imager', 'ROI_X1', Edit_ROI_X1.Text);
    Ini.WriteString('Imager', 'ROI_Y1', Edit_ROI_Y1.Text);
    Ini.WriteString('Imager', 'ROI_X2', Edit_ROI_X2.Text);
    Ini.WriteString('Imager', 'ROI_Y2', Edit_ROI_Y2.Text);
    Ini.WriteInteger('Imager','BIN', CB_BIN.ItemIndex);
    Ini.WriteInteger('Imager','Range', CB_Range.ItemIndex );

    Ini.WriteString('Imager', 'EXPT', Edit_ExpT.Text);
    Ini.WriteInteger('Imager','Trig',CB_Trig.ItemIndex);
    Ini.WriteInteger('Imager','ShutterN', CB_Shutte_Mode.ItemIndex);
    Ini.WriteInteger('Imager','Rate',CB_Rate.ItemIndex);
    Ini.WriteBool('Imager','Cooling',CB_Cooling.Checked);

    Ini.WriteString('Imager', 'Scan_Orig', Edit_Scan_Orig.Text);
    Ini.WriteString('Imager', 'Scan_ST',   Edit_Scan_ST.Text);
    Ini.WriteString('Imager', 'Scan_d',    Edit_Scan_d.Text);
    Ini.WriteString('Imager', 'Scan_n',    Edit_Scan_n.Text);
    Ini.WriteInteger('Imager', 'Motor_AXIS',     MotorAXIS );
  finally
    Ini.Free;
  end;

  for li:=0 to NumberOfBuffers-1 do
    Dispose(AlignedBuffers[li]);
  if Zyla_Opened then
  begin
//    AT_Close(Hndl);
//    AT_FinaliseLibrary;
  end;
end;


procedure TForm_Imager.FormShow(Sender: TObject);
var
  li:longint;
begin
  CB_axis_aux.Items.Clear;
  CB_axis_aux.Items.Add('non');
  CB_axis_aux.ItemIndex := 0;
  if Form_PM16C.CB_Connect.Checked then
  begin
    for li:=0 to 15 do
      CB_axis_aux.Items.Add(Form_PM16C.Motor[li].Axis_Name);
    CB_axis_aux.ItemIndex := MotorAXIS;
  end;
end;

procedure TForm_Imager.SB_Re_ShowClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TForm_Imager.BB_InitClick(Sender: TObject);
var
  TmpInt : Int64;
  TmpChr : array[0..64] of Char;
  li:longint;
begin
  if AT_InitialiseLibrary=AT_SUCCESS then
  begin
    Form_Main.AddLine('Initialize Andor Library: OK',true);
  end
  else
  begin
    ShowMessage('Could NOT initialize Andor Lib!');
    Exit;
  end;

  TmpInt := 0;
  AT_GetInt(AT_HANDLE_SYSTEM, 'DeviceCount', @TmpInt);
  if TmpInt<=0 then
  begin
    ShowMessage('Could NOT find Andor camera!');
    Exit;
  end;

  if AT_Open(0,@Hndl)<>AT_SUCCESS then
  begin
    ShowMessage('Could NOT open Andor camera!');
    Exit;
  end;

  Application.ProcessMessages;

  Zyla_Opened := true;
  Panel2.Enabled := true;
  BB_SetExp.Enabled := true;
  BB_Aq.Enabled := true;
  BB_LIVE.Enabled := true;
  BB_LiveOFF.Enabled := true;
  GroupBox2.Enabled := true;

//  if AT_GetString(Hndl,'CameraName',@TmpChr,64)=AT_SUCCESS then
//    Memo.Lines.Add('Camera Name : '+TmpChr);

  if AT_GetString(Hndl,'CameraModel',@TmpChr,64)=AT_SUCCESS then
  begin
    GroupBox1.Caption := ' '+String(TmpChr)+' ';
  end;
//    SB.SimpleText := 'Cemera Model : '+TmpChr;

//  if AT_GetString(Hndl,'SerialNumber',@TmpChr,64)=AT_SUCCESS then
//    Memo.Lines.Add('Serial No.: '+TmpChr);

  AT_SetEnumString(Hndl, 'PixelEncoding', 'Mono16');
  AT_SetBool(Hndl, 'Overlap', AT_TRUE);
  AT_SetBool(Hndl, 'FastAOIFrameRateEnable', AT_TRUE);
  AT_SetBool(Hndl, 'SpuriousNoiseFilter', AT_TRUE) ;

  CB_RangeChange(Sender);
  CB_TrigChange(Sender);
  CB_Shutte_ModeChange(Sender);
  CB_RateChange(Sender);
  CB_CoolingClick(Sender);
  BB_SetExpClick(Sender);

  if AT_GetInt(Hndl,'SensorWidth',@TmpInt)=AT_SUCCESS then
    OW := TmpInt;

  if AT_GetInt(Hndl,'SensorHeight',@TmpInt)=AT_SUCCESS then
    OH := TmpInt;

  BB_ROIClick(Sender);
  CB_BINChange(Sender);

  for li:=0 to NumberOfBuffers-1 do
    New(AlignedBuffers[li]);

  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('Imager Inited',true);

  BB_Init.Enabled := false;
end;

procedure TForm_Imager.BB_AqClick(Sender: TObject);
var
  i,j,rBufSize, lBIN, TmpInt:longint;
  Buf : PChar;
begin
//  New(AlignedBuffers[0]);
  AT_GetInt(Hndl, 'ImageSizeBytes',@Buf_Size);

//  AStopWatch := TStopwatch.StartNew;

//  Memo.Lines.Add('Buf to SDK: '+AT_QueueBuffer(Hndl, SData, Buf_Size).ToString);
//  Memo.Lines.Add('Set Trigger: '+AT_SetEnumString(Hndl, 'TriggerMode', 'Software').ToString);
//  Memo.Lines.Add('Start: '+AT_Command(Hndl,'AcquisitionStart').ToString);
//
//  AT_Command(Hndl,'SoftwareTrigger');
//  New(Buf);
//  Memo.Lines.Add('Wait: '+AT_WaitBuffer(Hndl,@Buf,@Buf_Size,AT_INFINITE).ToString);
//
//  Memo.Lines.Add('Stop: '+AT_Command(Hndl,'AcquisitionStop').ToString);
//  Memo.Lines.Add('Flush: '+AT_Flush(Hndl).ToString);
//  Memo.Lines.Add('Elapsed time [ms]: '+ (timeGetTime - TimeStart).ToString);

  AT_QueueBuffer(Hndl, AlignedBuffers[0], Buf_Size);
//  AT_SetEnumString(Hndl, 'TriggerMode', 'Software');
  AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
  AT_Command(Hndl,'AcquisitionStart');
//  AT_Command(Hndl,'SoftwareTrigger');
//  AT_WaitBuffer(Hndl,@Buf,@Buf_Size,AT_INFINITE);
  AT_WaitBuffer(Hndl,@Buf,@rBufSize,AT_INFINITE);
  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('Get_Img',true);

  AT_Command(Hndl,'AcquisitionStop');
  AT_Flush(Hndl);

//  AStopWatch.Stop;
//  Form_Main.Memo.Lines.Add('Exposed, elapsed time [ms]: '+ AStopWatch.ElapsedMilliseconds.ToString);

//  AT_GetInt(Hndl, 'AOIWidth', @TmpInt);
//  PW := TmpInt;

  Form_PW.PW := PW;
  Form_PW.PH := PH;
  for j:=0 to PH-1 do
    for i:=0 to Stride-1 do
    begin
      if i<PW then
      begin
        Form_PW.IData[j,i] := AlignedBuffers[0]^[j*Stride+i];
        Form_PW.PData[j,i] := Form_PW.IData[j,i] ;
      end;
    end;
//  Form_PW.SData[0] := Form_PW.PData ;

  Form_PW.Show;
  Form_PW.Draw_Data(Sender);
//  Dispose(AlignedBuffers[0]);

end;

procedure TForm_Imager.BB_LiveClick(Sender: TObject);
var
  i,j,k, m : longint;
  rBufSize:longint;
  Buf : PChar;
begin
  Go := true;
  k:=0;
  m:=0;

  if not(Form_PW.Showing) then
    Form_PW.Show;

  AT_GetInt(Hndl, 'ImageSizeBytes',@Buf_Size);
  for i:=0 to NumberOfBuffers-1 do
    AT_QueueBuffer(Hndl, AlignedBuffers[i], Buf_Size);

  AT_SetEnumString(Hndl, 'CycleMode', 'Continuous');
  AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
  AT_Command(Hndl,'AcquisitionStart');

  repeat
    AStopWatch := TStopwatch.StartNew;
    AT_WaitBuffer(Hndl, @Buf, @rBufSize, AT_INFINITE);

    for j:=0 to PH-1 do
      for i:=0 to Stride-1 do
        if i<PW then
          Form_PW.PData[j,i] := AlignedBuffers[k mod NumberOfBuffers]^[j*Stride+i];
    Form_PW.Draw_Data(Sender);

    AT_QueueBuffer(Hndl, AlignedBuffers[k mod NumberOfBuffers], Buf_Size);

    Inc(k);
    AStopWatch.Stop;
    SB.SimpleText := k.ToString+':'+AStopWatch.ElapsedMilliseconds.ToString;
    m := m+AStopWatch.ElapsedMilliseconds;
    Application.ProcessMessages;
  until not(Go) or (K>100);

  SB.SimpleText := 'Frame rate : '+(m/k).ToString;// 'Stopped Live... ';

  AT_Command(Hndl, 'AcquisitionStop');
  AT_Flush(Hndl);
end;

procedure TForm_Imager.BB_LiveOFFClick(Sender: TObject);
begin
  Go := false;
end;






procedure TForm_Imager.BB_ROIClick(Sender: TObject);
var
  PLeft, PTop, TmpInt, BINDIV : Int64;
begin
  case CB_BIN.ItemIndex of
    0: BINDIV := 1;
    1: BINDIV := 2;
    2: BINDIV := 3;
    3: BINDIV := 4;
    4: BINDIV := 8;
  end;

  PW := StrToInt(Edit_ROI_X2.Text)-StrToInt(Edit_ROI_X1.Text)+1;
  PW := PW div BINDIV;
  AT_SetInt(Hndl, 'AOIWidth', &PW);

  if AT_GetInt(Hndl, 'AOIWidth', @TmpInt)=AT_SUCCESS then
  begin
    PW := TmpInt;
  end;

  if AT_GetInt(Hndl, 'AOIStride', @TmpInt)=AT_SUCCESS then
  begin
    Stride := TmpInt div 2;
  end;


  PH := StrToInt(Edit_ROI_Y2.Text)-StrToInt(Edit_ROI_Y1.Text)+1;
  PH := PH div BINDIV;
  AT_SetInt(Hndl, 'AOIHeight', &PH);

  if AT_GetInt(Hndl, 'AOIHeight', @TmpInt)=AT_SUCCESS then
  begin
    PH := TmpInt;
  end;

  PLeft := StrToInt(Edit_ROI_X1.Text);
//  PLeft := PLeft div BINDIV;
  AT_SetInt(Hndl, 'AOILeft', &PLeft);

  PTop := StrToInt(Edit_ROI_Y1.Text);
//  PTop := PTop div BINDIV;
  AT_SetInt(Hndl, 'AOITop', &PTop);

//  AT_GetInt(Hndl, 'AOILeft', @TmpInt);
//  PW := TmpInt;

  Label_PW.Caption := PW.ToString;
  Label_PH.Caption := PH.ToString;
  Form_PW.PW := PW;
  Form_PW.PH := PH;

  Form_Ph_PW.PW := PW;
  Form_Ph_PW.PH := PH;

//  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('ROI : '+PW.ToString+'x'+PH.ToString,true);

end;

procedure TForm_Imager.BB_Set_FullClick(Sender: TObject);
begin
  Edit_ROI_X1.Text := '1';
  Edit_ROI_X2.Text := OW.ToString;

  Edit_ROI_Y1.Text := '1';
  Edit_ROI_Y2.Text := OH.ToString;
  BB_ROIClick(Sender);

  PW := OW;
  PH := OH;

  Label_PW.Caption := PW.ToString;
  Label_PH.Caption := PH.ToString;
  Form_PW.PW := PW;
  Form_PW.PH := PH;
  Form_Ph_PW.PW := PW;
  Form_Ph_PW.PH := PH;

  if Form_Main.CB_Log.Checked then
    Form_Main.AddLine('ROI : '+PW.ToString+'x'+PH.ToString,true);
end;

procedure TForm_Imager.BB_SetExpClick(Sender: TObject);
var
  ExpTime ,FPS: double;
begin
  ExpTime := StrToFloat(Edit_ExpT.Text)/1000;
  SetExpTime(ExpTime, FPS);
  Edit_ExpT.Text := Format('%5.0f',[ExpTime*1000]);
  Label_FPS.Caption := Format('%3.3f',[FPS]);
end;

procedure TForm_Imager.CB_BINChange(Sender: TObject);
var
  Res, TmpInt : Int64;
  TmpChr : array[0..64] of Char;
begin
  if Zyla_Opened then
  begin
    case CB_BIN.ItemIndex of
      0:Res := AT_SetEnumString(Hndl, 'AOIBinning', '1x1');
      1:Res := AT_SetEnumString(Hndl, 'AOIBinning', '2x2');
      2:Res := AT_SetEnumString(Hndl, 'AOIBinning', '3x3');
      3:Res := AT_SetEnumString(Hndl, 'AOIBinning', '4x4');
      4:Res := AT_SetEnumString(Hndl, 'AOIBinning', '8x8');
    end;

    AT_GetEnumIndex(Hndl, 'AOIBinning',@TmpInt) ;
    if AT_GetEnumStringByIndex(Hndl, 'AOIBinning',TmpInt,@TmpChr,64)=AT_SUCCESS then
      Form_Main.AddLine('Set Binning : '+TmpChr,true);

    AT_GetInt(Hndl, 'AOIWidth', @TmpInt);
    PW := TmpInt;

    AT_GetInt(Hndl, 'AOIHeight', @TmpInt);
    PH := TmpInt;

    Label_PW.Caption := PW.ToString;
    Label_PH.Caption := PH.ToString;
    Form_PW.PW := PW;
    Form_PW.PH := PH;

    Form_Ph_PW.PW := PW;
    Form_Ph_PW.PH := PH;

    case CB_BIN.ItemIndex of
      0:Form_SAKAS.Edit_BINX.Text:='1';
      1:Form_SAKAS.Edit_BINX.Text:='2';
      2:Form_SAKAS.Edit_BINX.Text:='3';
      3:Form_SAKAS.Edit_BINX.Text:='4';
      4:Form_SAKAS.Edit_BINX.Text:='8';
    end;
    Form_SAKAS.Edit_BINY.Text:= Form_SAKAS.Edit_BINX.Text;
  end;
end;

procedure TForm_Imager.CB_RangeChange(Sender: TObject);
var
  Res, TmpInt : Int64;
  TmpChr : array[0..64] of Char;
begin
  if Zyla_Opened then
  begin
    case CB_Range.ItemIndex of
      0:Res := AT_SetEnumString(Hndl, 'SimplePreAmpGainControl', '12-bit (high well capacity)');
      1:Res := AT_SetEnumString(Hndl, 'SimplePreAmpGainControl', '12-bit (low noise)');
      2:Res := AT_SetEnumString(Hndl, 'SimplePreAmpGainControl', '16-bit (low noise & high well capacity)');
    end;

    AT_GetEnumIndex(Hndl, 'SimplePreAmpGainControl',@TmpInt) ;
    if AT_GetEnumStringByIndex(Hndl, 'SimplePreAmpGainControl',TmpInt,@TmpChr,64)=AT_SUCCESS then
      Form_Main.AddLine('Set Range : '+TmpChr,true);
  end;
end;

procedure TForm_Imager.CB_TrigChange(Sender: TObject);
var
  Res, TmpInt : Int64;
  TmpChr : array[0..64] of Char;
begin
  if Zyla_Opened then
  begin
    case CB_Trig.ItemIndex of
      0:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
      1:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'Software');
      2:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'External');
      3:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'External Start');
      4:Res := AT_SetEnumString(Hndl, 'TriggerMode', 'External Exposure');
    end;

    AT_GetEnumIndex(Hndl, 'TriggerMode',@TmpInt) ;
    if AT_GetEnumStringByIndex(Hndl, 'TriggerMode',TmpInt,@TmpChr,64)=AT_SUCCESS then
      Form_Main.AddLine('Trigger Mode : '+TmpChr,true);
//    if Form_Main.CB_Log.Checked then
//      Form_Main.Memo.Lines.Add('Trigger : '+CB_Trig.ItemIndex.ToString);
  end;
end;

procedure TForm_Imager.CB_Shutte_ModeChange(Sender: TObject);
var
  Res, TmpInt : Int64;
  TmpChr : array[0..64] of Char;
begin
  if Zyla_Opened then
  begin
    case CB_Shutte_Mode.ItemIndex of
      0:Res := AT_SetEnumString(Hndl, 'ElectronicShutteringMode', 'Rolling');
      1:Res := AT_SetEnumString(Hndl, 'ElectronicShutteringMode', 'Global');
    end;

    AT_GetEnumIndex(Hndl, 'ElectronicShutteringMode',@TmpInt) ;
    if AT_GetEnumStringByIndex(Hndl, 'ElectronicShutteringMode',TmpInt,@TmpChr,64)=AT_SUCCESS then
      Form_Main.AddLine('Electronic Shuttering Mode : '+TmpChr,true);
  end;
end;

procedure TForm_Imager.CB_RateChange(Sender: TObject);
var
  Res, TmpInt : Int64;
  TmpChr : array[0..64] of Char;
begin
  if Zyla_Opened then
  begin
    case CB_Rate.ItemIndex of
      0:Res := AT_SetEnumString(Hndl, 'PixelReadoutRate', '100 MHz');
      1:Res := AT_SetEnumString(Hndl, 'PixelReadoutRate', '280 MHz');
    end;

    AT_GetEnumIndex(Hndl, 'PixelReadoutRate',@TmpInt) ;
    if AT_GetEnumStringByIndex(Hndl, 'PixelReadoutRate',TmpInt,@TmpChr,64)=AT_SUCCESS then
      Form_Main.AddLine('Pixel Readout Rate : '+TmpChr,true);
  end;
end;

procedure TForm_Imager.CB_CoolingClick(Sender: TObject);
var
  TmpInt : Int64;
  TmpChr : array[0..64] of Char;
begin
  if Zyla_Opened then
  begin
    if CB_Cooling.Checked then
      AT_SetBool(Hndl, 'SensorCooling', AT_TRUE)
    else
      AT_SetBool(Hndl, 'SensorCooling', AT_FALSE);

    AT_GetEnumIndex(Hndl, 'TemperatureStatus',@TmpInt) ;
    AT_GetEnumStringByIndex(Hndl, 'TemperatureStatus', TmpInt, TmpChr, 64);
    Form_Main.AddLine('Temperature Status : '+TmpChr,true);
    SB_Get_TempClick(Sender);
  end;
end;

procedure TForm_Imager.SB_ComClick(Sender: TObject);
var
  ExpTime, FPS,Temp : double;
  lBool : boolean;
begin
//  ExpTime := StrToFloat(Edit_ExpT.Text)/1000;
//  AT_SetFloat(Hndl,'ExposureTime',ExpTime);
//  if AT_GetFloat(Hndl,'ExposureTime',@ExpTime)=AT_SUCCESS then
//    Edit_ExpT.Text := Format('%5.0f',[ExpTime*1000]);
//
//  if AT_GetFloat(Hndl,'FrameRate',@FPS)=AT_SUCCESS then
//    Label_FPS.Caption := Format('%3.3f',[FPS]);

//  ExpTime := 0.1;
//  AT_SetFloat(Hndl,'ExposureTime',0.1);
//  if AT_GetFloat(Hndl,'ExposureTime',@ExpTime)=AT_SUCCESS then
//    Form_Main.Memo.Lines.Add('ExpT : '+ExpTime.ToString);
//  if AT_GetFloat(Hndl,'FrameRate',@FPS)=AT_SUCCESS then
//    Form_Main.Memo.Lines.Add('ExpT : '+FPS.ToString);
//
//  if AT_GetFloat(Hndl,'RowReadTime',@FPS)=AT_SUCCESS then
//    Form_Main.Memo.Lines.Add('ExpT : '+FPS.ToString);

//  if AT_GetBool(Hndl,'FullAOIControl',@lBool)=AT_SUCCESS then
//    if lBool then
//      Form_Main.AddLine('ROI : supported',true)
//    else
//      Form_Main.AddLine('ROI : not supported',true)
  AT_GetFloat(Hndl,PChar(Edit_Comm.Text),@Temp);
  Form_Main.AddLine('Coomand res: '+Temp.ToString,true);
end;

procedure TForm_Imager.SB_CopyClick(Sender: TObject);
begin
  Edit_ROI_X1.Text := Form_PW.Edit_Left.Text;
  Edit_ROI_Y1.Text := Form_PW.Edit_Top.Text;
  Edit_ROI_X2.Text := Form_PW.Edit_Right.Text;
  Edit_ROI_Y2.Text := Form_PW.Edit_Bottom.Text;
end;

procedure TForm_Imager.SB_Get_TempClick(Sender: TObject);
var
  Temp:double;
begin
  if Zyla_Opened then
  begin
    AT_GetFloat(Hndl,'SensorTemperature',@Temp);
    Label_tmep.Caption :=Format('%4.1f deg',[Temp]);
  end;
end;






procedure TForm_Imager.CB_axis_auxChange(Sender: TObject);
begin
  MotorAxis := CB_axis_aux.ItemIndex;
end;

procedure TForm_Imager.BB_Scan_STClick(Sender: TObject);
var
  SST,SN,SOrig,dS,AX:longint;
  X1,X2,Z1,Z2 : longint;

  i,j,BufSize,ImgNo:longint;
  ImageSizeBytes, BufferSize : Int64;
  pBuf : pointer;
  TmpDbl : double;

  FS : TFileStream;
  lData : array[0..2560] of WORD;
begin
  if CB_SaveData.Checked then
    if SaveDialog1.Execute then
      FS := TfileStream.Create(SaveDialog1.FileName,fmCreate)
    else
      exit;

  Go := true;
  ImgNo := 0;
  Series1.Clear;

  X1 := StrToInt(Form_PW.Edit_Left.Text);
  X2 := StrToInt(Form_PW.Edit_Right.Text);
  Z1 := StrToInt(Form_PW.Edit_Top.Text);
  Z2 := StrToInt(Form_PW.Edit_Bottom.Text);

  if not(Form_PW.Showing) then
    Form_PW.Show;

  AX := CB_axis_aux.ItemIndex-1;
  if AX>=0 then
  begin
    SST := StrToInt(Edit_Scan_ST.Text);
    SN := StrToInt(Edit_Scan_n.Text);
    SOrig := StrToInt(Edit_Scan_Orig.Text);
    dS := StrToInt(Edit_Scan_d.Text);

    Form_PM16C.Set_Remote;
    Form_PM16C.SetCh(0,AX);
    Form_PM16C.MoveTo(AX,SOrig,true,true);
    Form_PM16C.MoveTo(AX,SST,true,true);
  end
  else
  begin
    SST := 0;
    SN := StrToInt(Edit_Scan_n.Text);
    dS := 1;
  end;

  AT_GetInt(Hndl, 'ImageSizeBytes', @ImageSizeBytes);
  BufferSize := ImageSizeBytes;
  for i:=0 to NumberOfBuffers-1 do
    AT_QueueBuffer(Hndl, AlignedBuffers[i], BufferSize);
  AT_SetEnumString(Hndl, 'CycleMode', 'Continuous');
//  AT_SetEnumString(Hndl, 'CycleMode', 'Fixed');
//  AT_SetInt(Hndl, 'FrameCount', 1);
//  AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
  AT_SetEnumString(Hndl, 'TriggerMode', 'Software');
  AT_Command(Hndl,'AcquisitionStart');

  AStopWatch := TStopwatch.StartNew;

  repeat
    if AX>=0 then
      Form_PM16C.MoveTo(AX,SST+dS*ImgNo,true,false);

    AT_Command(Hndl,'SoftwareTrigger');
    AT_WaitBuffer(Hndl, Addr(pBuf), Addr(BufSize), AT_INFINITE);

    if Form_Main.CB_Log.Checked then
      Form_Main.AddLine('Get_Img',true);

    for j:=0 to PH-1 do
      for i:=0 to STride-1 do
        if i<PW then
          RawData[j,i] := AlignedBuffers[ImgNo mod NumberOfBuffers]^[j*Stride+i];

    for j:=0 to PH-1 do
      for i:=0 to PW+-1 do
        Form_PW.PData[j,i] := RAWData[j,i];
//    Form_PW.SData[ImgNo mod 21] := Form_PW.PData ;
    Form_PW.Draw_Data(Sender);

    if CB_SaveData.Checked then
    begin
      for j:=0 to PH-1 do
      begin
        for i:=0 to PW-1 do
          lData[i] := RAWData[j,i];
        FS.WriteBuffer(lData,PW*2);
      end;
    end;

    TmpDbl := 0;
    for j:=Z1 to Z2 do
      for i:=X1 to X2 do
        TmpDbl := TmpDbl + RAWData[j,i];
    TmpDbl := TmpDbl/((Z2-Z1+1)*(X2-X1+1));
    Series1.AddXY(SST+dS*ImgNo, TmpDbl);

    AT_QueueBuffer(Hndl, AlignedBuffers[ImgNo mod NumberOfBuffers], BufferSize);

    Sleep(StrToInt(Edit_WaitT.Text));
    if not(Go) then
    begin
      AT_Command(Hndl, 'AcquisitionStop');
      AT_Flush(Hndl);
      ShowMessage('Aquasition Stopped! ');

      for i:=0 to NumberOfBuffers-1 do
        Dispose(AlignedBuffers[i]);

      if CB_SaveData.Checked then
        FS.Free;
      exit;
    end;

    SB.SimpleText := 'Scan: '+(ImgNo+1).ToString+'/'+SN.ToString;
    Inc(ImgNo);
    Application.ProcessMessages;
  until (ImgNo > SN-1) or not(Go);

  AStopWatch.Stop;
  Form_Main.AddLine('Total time [ms]: '+ AStopWatch.ElapsedMilliseconds.ToString,true);

  AT_Command(Hndl, 'AcquisitionStop');
  AT_Flush(Hndl);
  ShowMessage('Aquasition Finished!');

  if CB_SaveData.Checked then
    FS.Free;
end;

procedure TForm_Imager.BB_StopClick(Sender: TObject);
begin
  Go := false;
end;

procedure TForm_Imager.SB_TestClick(Sender: TObject);
var
  i,j,k, SN : longint;
  rBufSize:longint;
  Buf : PChar;
begin
  Go := true;
  SN := StrToInt(Edit_Scan_n.Text);

//  for i:=0 to NumberOfBuffers-1 do
//    New(AlignedBuffers[i]);

  if not(Form_PW.Showing) then
    Form_PW.Show;

  AT_GetInt(Hndl, 'ImageSizeBytes',@Buf_Size);
  for i:=0 to NumberOfBuffers-1 do
    AT_QueueBuffer(Hndl, AlignedBuffers[i], Buf_Size);

  AT_SetEnumString(Hndl, 'CycleMode', 'Continuous');
  AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
  AT_Command(Hndl,'AcquisitionStart');

  AStopWatch := TStopwatch.StartNew;

  for k:=0 to SN-1 do
  begin
    AT_WaitBuffer(Hndl, @Buf, @rBufSize, AT_INFINITE);

    for j:=0 to PH-1 do
      for i:=0 to Stride-1 do
        if i<PW then
          Form_PW.PData[j,i] := AlignedBuffers[k mod NumberOfBuffers]^[j*Stride+i];
    Form_PW.Draw_Data(Sender);
//    if Form_Main.CB_Log.Checked then
//      Form_Main.Memo.Lines.Add('Get_Img');

    AT_QueueBuffer(Hndl, AlignedBuffers[k mod NumberOfBuffers], Buf_Size);

    SB.SimpleText := k.ToString+ ' / '+SN.ToString;
    Application.ProcessMessages;
  end;

  AStopWatch.Stop;
  Form_Main.AddLine('Total time [ms]: '+ AStopWatch.ElapsedMilliseconds.ToString,true);

  AT_Command(Hndl, 'AcquisitionStop');
  AT_Flush(Hndl);
  ShowMessage('Aquasition Finished!');

//  for i:=0 to NumberOfBuffers-1 do
//    Dispose(AlignedBuffers[i]);

  {
  //Singel Exposure
  //New(SData);
  New(AlignedBuffers[0]);
  AT_GetInt(Hndl, 'ImageSizeBytes',@Buf_Size);

  TimeStart :=  timeGetTime;

//  AT_QueueBuffer(Hndl, SData, Buf_Size);
  AT_QueueBuffer(Hndl, AlignedBuffers[0], Buf_Size);
  AT_SetEnumString(Hndl, 'TriggerMode', 'Internal');
  AT_Command(Hndl,'AcquisitionStart');

  //Software TriggerÇ»ÇÁ
  //  AT_Command(Hndl,'SoftwareTrigger');

  AT_WaitBuffer(Hndl,@Buf,@rBufSize,AT_INFINITE);
  AT_Command(Hndl,'AcquisitionStop');
  AT_Flush(Hndl);

  Memo.Lines.Add('Exposed, elapsed time [ms]: '+ (timeGetTime - TimeStart).ToString);

  for j:=0 to PH-1 do
    for i:=0 to PW-1 do
    begin
//      Form_PW.IData[j,i] := SData^[j*PW+i];
      Form_PW.IData[j,i] := AlignedBuffers[0]^[j*PW+i];
      Form_PW.PData[j,i] := Form_PW.IData[j,i] ;
    end;

  Form_PW.Show;
  Form_PW.Draw_Data(Sender);
  Dispose(sData);
  }
end;

end.
