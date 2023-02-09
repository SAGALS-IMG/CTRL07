unit Unit_Scan;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls, Vcl.Buttons,MMSystem,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.CheckLst, VCLTee.TeeSurfa, VCLTee.TeeEdit, IniFiles;

const
  PWidth = 2060;

type
  TForm_Scan = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    RG_CH: TRadioGroup;
    Label10: TLabel;
    CLB: TCheckListBox;
    Panel3: TPanel;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    SaveDialog1: TSaveDialog;
    Label22: TLabel;
    Label18: TLabel;
    CB_Map_I0: TComboBox;
    Label19: TLabel;
    CB_Map_I: TComboBox;
    CB_Diff: TCheckBox;
    CB_PM: TCheckBox;
    CB_DivI0: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Label25: TLabel;
    Edit_Min: TEdit;
    Edit_Max: TEdit;
    Label20: TLabel;
    CB_Mag: TComboBox;
    Label26: TLabel;
    CB_Redraw: TSpeedButton;
    Label21: TLabel;
    Panel4: TPanel;
    Panel2: TPanel;
    BB_Start: TBitBtn;
    BB_Stop: TBitBtn;
    CB_P: TCheckBox;
    BB_Get_Motor_Info: TBitBtn;
    BB_Test: TBitBtn;
    RG_Method: TRadioGroup;
    Edit_TC: TEdit;
    Label17: TLabel;
    Label24: TLabel;
    Edit_OR: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    GroupBox5: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    CB_L1: TComboBox;
    Edit_OX11: TEdit;
    Edit_L1_ST: TEdit;
    Edit_L1_End: TEdit;
    Edit_L1_d: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_OX12: TEdit;
    Edit_L12_ST: TEdit;
    Edit_L12_End: TEdit;
    Edit_L12_d: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CB_L2: TComboBox;
    Edit_OX2: TEdit;
    Edit_L2_ST: TEdit;
    Edit_L2_End: TEdit;
    Edit_L2_d: TEdit;
    CB_L2_Enable: TCheckBox;
    CB_L1_Sync: TCheckBox;
    Edit_Shift: TEdit;
    Edit_Wait: TEdit;
    CB_L12: TComboBox;
    Label13: TLabel;
    CB_AutoSh: TCheckBox;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_TestClick(Sender: TObject);

    procedure Init_Cond(Sender: TObject);
    procedure Count_V(Sender:TObject);
    procedure Read_Counts(Sender:TObject);

    procedure BB_StartClick(Sender: TObject);
    procedure BB_StopClick(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure CB_RedrawClick(Sender: TObject);
    procedure BB_Get_Motor_InfoClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

  TData = array[0..PWidth,0..PWidth] of double;

var
  Form_Scan: TForm_Scan;
  Edit_CV : array[0..47] of TEdit;
  Label_CT : array[0..47] of TLabel;

  SX11, SX12, SX2, EX11, EX12, EX2, dX11, dX12, DX2 : longint;
  TX11,TX12,TX2:longint;
  OX11,OX12,OX2, AX11,AX12,AX2, MaxC,DN : longint;
//  M1, M12,M2 : longint;

  FS : Textfile;
  Go, PM :boolean;

  PData :TData;
  PW,PH :longint;

implementation

{$R *.dfm}

uses Unit_CT48, Unit_PM16C, main, Unit_Shutter;

procedure TForm_Scan.FormCreate(Sender: TObject);
var
  li:byte;
  Ini: TIniFile;
begin
  for li:=0 to 47 do
  begin
    Label_CT[li] := TLabel.Create(Self);
    Label_CT[li].Parent := GroupBox3;

    Label_CT[li].Top := 44+(li mod 12)*30;
    Label_CT[li].Left := 220+(li div 12)*130;

    Label_CT[li].Caption := 'CH'+li.ToString;
  end;
  for li:=0 to 47 do
  begin
    Edit_CV[li] := TEdit.Create(Self);
    Edit_CV[li].Parent := GroupBox3;
    Edit_CV[li].Width := 68;
    Edit_CV[li].Height := 20;
    Edit_CV[li].Top := 41+(li mod 12)*30;
    Edit_CV[li].Left := 260+(li div 12)*130;
    Edit_CV[li].ReadOnly := true;
    Edit_CV[li].Alignment := taRightJustify;
  end;


  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Top     := Ini.ReadInteger( 'Form_Img', 'Top', 100 );
    Left    := Ini.ReadInteger( 'Form_Img', 'Left', 100 );
    if Ini.ReadBool( 'Form_Img', 'InitMax', false ) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;

    Edit_OX11.Text := Ini.ReadString('Scan', 'OX11', '-500');
    Edit_L1_ST.Text := Ini.ReadString('Scan', 'SX11', '0');
    Edit_L1_End.Text := Ini.ReadString('Scan', 'EX11', '10000');
    Edit_L1_d.Text := Ini.ReadString('Scan', 'DX11', '200');

    Edit_OX12.Text := Ini.ReadString('Scan', 'OX12', '-500');
    Edit_L12_ST.Text := Ini.ReadString('Scan', 'SX12', '0');
    Edit_L12_End.Text := Ini.ReadString('Scan', 'EX12', '10000');
    Edit_L12_d.Text := Ini.ReadString('Scan', 'DX12', '200');

    Edit_OX2.Text := Ini.ReadString('Scan', 'OX2', '-500');
    Edit_L2_ST.Text := Ini.ReadString('Scan', 'SX2', '0');
    Edit_L2_End.Text := Ini.ReadString('Scan', 'EX2', '10000');
    Edit_L2_d.Text := Ini.ReadString('Scan', 'DX2', '200');
    Edit_Shift.Text := Ini.ReadString('Scan', 'Shift', '150');
    Edit_TC.Text :=  Ini.ReadString('Scan', 'ExpT', '250');

    CB_L2_Enable.Checked := Ini.ReadBool('Scan', '2nd_loop', false);
    CB_L1_Sync.Checked := Ini.ReadBool('Scan', 'L12', false);

    Edit_Min.Text := Ini.ReadString('Scan', 'PMin', '0');
    Edit_Max.Text := Ini.ReadString('Scan', 'PMax', '200');
    CB_Map_I0.ItemIndex := Ini.ReadInteger('Scan','Map_I0',0);
    CB_Map_I.ItemIndex := Ini.ReadInteger('Scan','Map_I',1);

    AX11 := Ini.ReadInteger('Scan','L1_axis',0);
    AX12 := Ini.ReadInteger('Scan','L12_axis',0);
    AX2 := Ini.ReadInteger('Scan','L2_axis',0);
  finally
    Ini.Free;
  end;
end;

procedure TForm_Scan.BB_Get_Motor_InfoClick(Sender: TObject);
var
  li:byte;
begin
  if Form_PM16C.CB_Connect.Checked then
  begin
    CB_L1.Items.Clear;
    CB_L12.Items.Clear;
    CB_L2.Items.Clear;

    for li:=0 to 15 do
    begin
      CB_L1.Items.Add(Form_PM16C.Motor[li].Axis_Name);
      CB_L12.Items.Add(Form_PM16C.Motor[li].Axis_Name);
      CB_L2.Items.Add(Form_PM16C.Motor[li].Axis_Name);
    end;
    CB_L1.ItemIndex := AX11;
    CB_L12.ItemIndex :=AX12;
    CB_L2.ItemIndex := AX2;
  end;
end;


procedure TForm_Scan.FormShow(Sender: TObject);
begin
  BB_Get_Motor_InfoClick(Sender);
end;

procedure TForm_Scan.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteInteger( 'Form_Img', 'Top', Top);
    Ini.WriteInteger( 'Form_Img', 'Left', Left);
    Ini.WriteBool( 'Form_Img', 'InitMax', WindowState = wsMaximized );

    Ini.WriteString('Scan', 'OX11', Edit_OX11.Text) ;
    Ini.WriteString('Scan', 'SX11', Edit_L1_ST.Text) ;
    Ini.WriteString('Scan', 'EX11', Edit_L1_End.Text) ;
    Ini.WriteString('Scan', 'dX11', Edit_L1_d.Text) ;

    Ini.WriteString('Scan', 'OX12', Edit_OX12.Text );
    Ini.WriteString('Scan', 'SX12', Edit_L12_ST.Text) ;
    Ini.WriteString('Scan', 'EX12', Edit_L12_End.Text) ;
    Ini.WriteString('Scan', 'dX12', Edit_L12_d.Text );

    Ini.WriteString('Scan', 'OX2', Edit_OX2.Text );
    Ini.WriteString('Scan', 'SX2', Edit_L2_ST.Text) ;
    Ini.WriteString('Scan', 'EX2', Edit_L2_End.Text) ;
    Ini.WriteString('Scan', 'dX2', Edit_L2_d.Text );
    Ini.WriteString('Scan', 'Shift', Edit_Shift.Text );
    Ini.WriteString('Scan', 'ExpT', Edit_TC.Text );

    Ini.WriteInteger('Scan','L1_axis',CB_L1.ItemIndex);
    Ini.WriteInteger('Scan','L12_axis',CB_L12.ItemIndex);
    Ini.WriteInteger('Scan','L2_axis',CB_L2.ItemIndex);

    Ini.WriteBool('Scan', '2nd_loop',CB_L2_Enable.Checked);
    Ini.WriteBool('Scan', 'L12',CB_L1_Sync.Checked);

    Ini.WriteString('Scan', 'PMin', Edit_Min.Text);
    Ini.WriteString('Scan', 'PMax', Edit_Max.Text);
    Ini.WriteInteger('Scan','Map_I0',CB_Map_I0.ItemIndex );
    Ini.WriteInteger('Scan','Map_I', CB_Map_I.ItemIndex );

 finally
    Ini.Free;
  end;
end;

procedure TForm_Scan.BB_TestClick(Sender: TObject);
var
  k:longint;
  li:longint;
  sl:TStringList;
begin
  k:=0;

  sl:=TStringList.Create;
  sl.Delimiter:= '_';
  case RG_CH.ItemIndex of
    0:MaxC :=8;
    1:MaxC :=48;
  end;

  Go := true;
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  Series5.Clear;
  Series6.Clear;
  Series7.Clear;
  Series8.Clear;

  Form_CT48.SetPresetT(StrToInt(Edit_TC.Text));

  repeat
    Form_CT48.CntStart;
    Sleep(StrToInt(Edit_TC.Text));
    Form_CT48.CntStp;

    sl.DelimitedText:= Form_CT48.CntRead;
    For li:= 0 To sl.Count-1 do
    begin
      lData[li] := StrToInt(sl.Strings[li]);
    end;

    for li:=0 to MaxC-1 do
    begin
      Edit_CV[li].Text := lData[li].ToString
    end;

    Form_CT48.CntCLR;

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
    SB.Panels[1].Text := k.ToString;
    Inc(k);
  until not(Go);

  sl.Free;
end;

procedure TForm_Scan.Init_Cond(Sender: TObject);
var
  li,lj:longint;
begin
  SX11 := StrToInt(Edit_L1_ST.Text);
  SX12 := StrToInt(Edit_L12_ST.Text);
  SX2 := StrToInt(Edit_L2_ST.Text);

  EX11 := StrToInt(Edit_L1_End.Text);
  EX12 := StrToInt(Edit_L12_End.Text);
  EX2 := StrToInt(Edit_L2_End.Text);

  dX11 := StrToInt(Edit_L1_d.Text);
  dX12 := StrToInt(Edit_L12_d.Text);
  dX2 := StrToInt(Edit_L2_d.Text);

  OX11 := StrToInt(Edit_OX11.Text);
  OX12 := StrToInt(Edit_OX12.Text);
  OX2 := StrToInt(Edit_OX2.Text);

  AX11 := CB_L1.ItemIndex;
  AX12 := CB_L12.ItemIndex;
  AX2 := CB_L2.ItemIndex;

  case RG_CH.ItemIndex of
    0:MaxC := 8;
    1:MaxC := 48;
  end;

  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  Series5.Clear;
  Series6.Clear;
  Series7.Clear;
  Series8.Clear;

  for lj:=0 to PWidth do
    for li:=0 to PWidth do
      PData[lj,li] := 0;
  PW := ABS(Round((EX11-SX11)/dX11))+1;
  PH := ABS(Round((EX2-SX2)/dX2))+1;
end;

procedure TForm_Scan.Read_Counts(Sender: TObject);
var
  li,lj, lk, TCH : longint;
  sl:TStringList;
  TmpDbl, lX : double;
begin
  TCH := CB_Map_I.ItemIndex;
  lk := (TX2-SX2) div dX2;

  case RG_CH.ItemIndex of
    0:Form_CT48.Read_8Data(DN,SData,Sender);
    1:Form_CT48.Read_48Data(DN,SData,Sender);
  end;

  if PM then
    for li:=0 to DN-1 do
      WriteLn(FS,(SX11+li*dX11).ToString+','+TX2.ToString+','+ SData[li])
  else
    for li:=0 to DN-1 do
      WriteLn(FS,(SX11+li*dX11).ToString+','+TX2.ToString+','+ SData[DN-li-1]);

  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  Series5.Clear;
  Series6.Clear;
  Series7.Clear;
  Series8.Clear;

  sl:=TStringList.Create;
  sl.Delimiter:= ',';

  for lj:=0 to DN-1 do
  begin
    sl.DelimitedText := SData[lj];
    for li:= 0 To sl.Count-1 do
      lData[li] := StrToInt(sl.Strings[li]);

    if PM then
      lX :=SX11+lj*dX11
    else
      lX :=EX11-lj*dX11;

    if CLB.Checked[0] then
      Series1.AddXY(lX,lData[0]);
    if CLB.Checked[1] then
      Series2.AddXY(lX,lData[1]);
    if CLB.Checked[2] then
      Series3.AddXY(lX,lData[2]);
    if CLB.Checked[3] then
      Series4.AddXY(lX,lData[3]);
    if CLB.Checked[4] then
      Series5.AddXY(lX,lData[4]);
    if CLB.Checked[5] then
      Series6.AddXY(lX,lData[5]);
    if CLB.Checked[6] then
      Series7.AddXY(lX,lData[6]);
    if CLB.Checked[7] then
      Series8.AddXY(lX,lData[7]);

    if CB_Map_I0.ItemIndex<>0 then
    begin
      TmpDbl := lData[CB_Map_I0.ItemIndex];
      if TmpDbl=0 then TmpDbl :=1;
    end
    else
      TmpDbl := 1;
    if PM then
      PData[lk,lj] := lData[TCH]/TmpDbl
    else
      PData[lk,DN-lj-1] := lData[TCH]/TmpDbl;
  end;
  sl.Free;

  CB_RedrawClick(Sender);
  for li:=0 to MaxC-1 do
    Edit_CV[li].Text := lData[li].ToString ;
end;

procedure TForm_Scan.Count_V(Sender: TObject);
var
  li,lj : longint;
  sl:TStringList;
  TmpDbl : double;
  PreData : array[0..47] of longint;
  DispData : array[0..47] of double;
begin
  for li:=0 to MaxC-1 do
    PreData[li] :=lData[li];

  Form_CT48.CntStart;
  Sleep(StrToInt(Edit_TC.Text){+10});
  Form_CT48.CntStp;

  sl:=TStringList.Create;
  sl.Delimiter:= '_';

  sl.DelimitedText:= Form_CT48.CntRead;

  if CB_L2_Enable.Checked then
    Write(FS,TX11.ToString+','+TX2.ToString+',')
  else
    Write(FS,TX11.ToString+',');


  For li:= 0 To MaxC-1 do
  begin
    lData[li] := StrToInt(sl.Strings[li]);
    Write(FS,sl.Strings[li]+',');
  end;
  WriteLn(FS);

  for li:=0 to MaxC-1 do
    Edit_CV[li].Text := lData[li].ToString ;

  Form_CT48.CntCLR;

  if CB_Map_I0.ItemIndex<>0 then
  begin
    TmpDbl := lData[CB_Map_I0.ItemIndex];
    if TmpDbl=0 then TmpDbl :=1;
  end
  else
    TmpDbl := 1;

  li := ABS(Round((TX11-SX11) div dX11));
  lj := ABS(Round((TX2-SX2) div dX2));
  PData[lj,li] :=lData[CB_Map_I.ItemIndex]/TmpDbl;
  CB_RedrawClick(Sender);

  for li:= 0 To MaxC-1 do
  begin
    if (CB_Diff.Checked) and (TX11<>SX11) then
    begin
      if CB_PM.Checked then
      begin
        if CB_DivI0.Checked then
          DispData[li]:=-PreData[li]/(PreData[0]+1)+lData[li]/(lData[0]+1)
        else
          DispData[li]:=-PreData[li]+lData[li];
      end
      else
      begin
        if CB_DivI0.Checked then
          DispData[li]:=PreData[li]/(PreData[0]+1)-lData[li]/(lData[0]+1)
        else
          DispData[li]:=PreData[li]-lData[li];
      end
    end
    else
    begin
      if CB_DivI0.Checked then
        DispData[li] := lData[li]/(lData[0]+1)
      else
        DispData[li] := lData[li];
    end;
  end;

  if (CB_Diff.Checked) and (TX11<>SX11) then
  begin
    if CLB.Checked[0] then
      Series1.AddY(DispData[0]);
    if CLB.Checked[1] then
      Series2.AddY(DispData[1]);
    if CLB.Checked[2] then
      Series3.AddY(DispData[2]);
    if CLB.Checked[3] then
      Series4.AddY(DispData[3]);
    if CLB.Checked[4] then
      Series5.AddY(DispData[4]);
    if CLB.Checked[5] then
      Series6.AddY(DispData[5]);
    if CLB.Checked[6] then
      Series7.AddY(DispData[6]);
    if CLB.Checked[7] then
      Series8.AddY(DispData[7]);
  end
  else
  begin
    if not(CB_Diff.Checked) then
    begin
      if CLB.Checked[0] then
        Series1.AddXY(TX11,DispData[0]);
      if CLB.Checked[1] then
        Series2.AddXY(TX11,DispData[1]);
      if CLB.Checked[2] then
        Series3.AddXY(TX11,DispData[2]);
      if CLB.Checked[3] then
        Series4.AddXY(TX11,DispData[3]);
      if CLB.Checked[4] then
        Series5.AddXY(TX11,DispData[4]);
      if CLB.Checked[5] then
        Series6.AddXY(TX11,DispData[5]);
      if CLB.Checked[6] then
        Series7.AddXY(TX11,DispData[6]);
      if CLB.Checked[7] then
        Series8.AddXY(TX11,DispData[7]);
    end;
  end;

  sl.Free;
end;

procedure TForm_Scan.CB_RedrawClick(Sender: TObject);
var
  i,j,TmpInt:longint;
  P:PByteArray;
  Bitmap : TBitMap;
  PMin, Pmax, PMag : double;
begin
  BitMap := TBitMap.Create;
  BitMap.Height := Image1.Height;
  BitMap.Width := Image1.Width;
  BitMap.PixelFormat := pf24bit;
  BitMap.Canvas.Pen.Color := clWhite;

  PMin := StrToFloat(Edit_Min.Text);
  PMax :=  StrToFloat(Edit_Max.Text);

  case CB_Mag.ItemIndex of
    0: PMag := 100;
    1: PMag := 200;
    2: PMag := 400;
    3: PMag := 800;
  else
    PMag := 100;
  end;

  for j:=0 to BitMap.Height-1 do
  begin
    P := BitMap.ScanLine[j];
    for i:=0 to BitMap.Width-1 do
    begin
      if (Round(i*100/PMag)<PW) and (Round(j*100/PMag)<PH) and ((PMax-PMin)<>0)then
        TmpInt := Round((PData[Round(j*100/PMag),Round(i*100/PMag)]-PMin)/(PMax-PMin)*255)
      else
        TmpInt := 50;
      if TmpInt>255 then TmpInt := 255;
      if TmpInt<0 then TmpInt := 0;
      p[i*3] := TmpInt;
      p[i*3+1] := TmpInt;
      p[i*3+2] := TmpInt;
    end;
  end;
  Image1.Picture.Graphic := BitMap;
  Image1.Refresh;
  BitMap.Free;
end;


procedure TForm_Scan.BB_StartClick(Sender: TObject);
var
  li,ODN, ORUN, bk_rate, rate, TC : longint;
  TimeStart : Cardinal;
begin
  if not(Form_CT48.CB_Connect.Checked) then
  begin
    ShowMessage('CT48 is NOT active!');
    Exit;
  end;
  if (Form_PM16C.Motor[CB_L2.ItemIndex].Enable = false) and (CB_L2_Enable.Checked) then
  begin
    ShowMessage('2nd loop axis in NOT enabled');
    exit;
  end;
  if (Form_PM16C.Motor[CB_L12.ItemIndex].Enable = false) and (CB_L1_Sync.Checked) then
  begin
    ShowMessage('1st loop axis in NOT enabled');
    exit;
  end;
  if Form_PM16C.Motor[CB_L1.ItemIndex].Enable = false then
  begin
    ShowMessage('1st loop axis in NOT enabled');
    exit;
  end;

  Form_CT48.BB_StopClick(Sender);
  Form_CT48.BB_ClearClick(Sender);
  if SaveDialog1.Execute then
  begin
    Go := true;
    AssignFile(FS,SaveDialog1.FileName);
    ReWrite(FS);
    Init_Cond(Sender);
    ODN := Abs((EX11-SX11) div dX11)+5;
    ORUN := StrToInt(Edit_OR.Text);
    PM := true;

    TimeStart := timeGetTime;

    Form_PM16C.Set_Remote;
    Form_PM16C.SetCh(0,AX11);
    Form_PM16C.SetCh(1,AX12);

    if CB_L1_Sync.Checked then
    begin
      Form_PM16C.Pause(true);
      Form_PM16C.MoveTo(AX12,OX12,false,false);
      Form_PM16C.MoveTo(AX11,OX11,false,false);
      Form_PM16C.Pause(false);
      Form_PM16C.WaitForStop;
    end
    else
      if RG_Method.ItemIndex=0 then
        Form_PM16C.MoveTo(AX11,OX11,true,true)
      else
        Form_PM16C.MoveTo(AX11,SX11-ORUN,true,true);
    TX11 := SX11;
    TX12 := SX12;

    if CB_L2_Enable.Checked then
    begin
      Form_PM16C.SetCh(2,AX2);
      Form_PM16C.MoveTo(AX2,OX2,true,true);
      TX2 := SX2;
    end
    else
      TX2 := EX2;

    TC :=StrToInt(Edit_TC.Text);
    Form_CT48.SetPresetT(TC);

    bk_rate := Form_PM16C.GetLSP(AX11);
    rate :=Round((Abs(dX11)/TC*1000));
    if RG_Method.ItemIndex =1 then
    begin
      Form_PM16C.SetLSP(AX11,rate);
      Form_PM16C.SelectSP(AX11,2);
    end;

    while ((TX2<=EX2) and (dX2>0)) or ((TX2>=EX2) and (dX2<0)) do
    begin
      if CB_L2_Enable.Checked then
      begin
        Sleep(StrToInt(Edit_Wait.Text)*1000);
        Form_PM16C.MoveTo(AX2,TX2,true,false);
      end;
      for li:=0 to MaxC-1 do
        lData[li] := -1;

      case RG_Method.ItemIndex of
      0:begin //Step Mode
          if not(CB_Diff.Checked) then
          begin
            Series1.Clear;
            Series2.Clear;
            Series3.Clear;
            Series4.Clear;
            Series5.Clear;
            Series6.Clear;
            Series7.Clear;
            Series8.Clear;
          end;
          while ((TX11<=EX11) and (dX11>0)) or ((TX11>=EX11) and (dX11<0)) do
          begin
            if CB_L1_Sync.Checked then
            begin
              Form_PM16C.Pause(true);
              Form_PM16C.MoveTo(AX11,TX11,false,false);
              Form_PM16C.MoveTo(AX12,TX12,false,false);
              Form_PM16C.Pause(false);
              Form_PM16C.WaitForStop;
            end
            else
              Form_PM16C.MoveTo(AX11,TX11,true,false);

            if CB_P.Checked then
              Form_PM16C.Pulse(0);

            Application.ProcessMessages;
            Count_V(Sender);
            if not(Go) then
            begin
              CloseFile(FS);
              ShowMessage('Canceled');
              exit;
            end;
            SB.Panels[1].Text := '1st loop: '+TX11.ToString;
            SB.Panels[2].Text := '2nd loop: '+TX2.ToString;
            TX12 := TX12+dX12;
            TX11 := TX11+dX11;
          end;

          if CB_L1_Sync.Checked then
          begin
            Form_PM16C.Pause(true);
            Form_PM16C.MoveTo(AX12,OX12,false,false);
            Form_PM16C.MoveTo(AX11,OX11,false,false);
            Form_PM16C.Pause(false);
            Form_PM16C.WaitForStop;
          end
          else
            Form_PM16C.MoveTo(AX11,OX11,true,true);

          SX11 := SX11+StrToInt(Edit_Shift.Text);
          EX11 := EX11+StrToInt(Edit_Shift.Text);
          TX11 := SX11;
          TX12 := SX12;
        end;

      1:begin //Cont Mode
          Form_CT48.MEM_CLR;
          Form_CT48.MEM_SET(ODN);

          Form_CT48.ClearTimer;
          Sleep(20);
          Form_CT48.Get_Edge_ST;

          if PM then
          begin
            Form_PM16C.SetTMGP(AX11,SX11,EX11+dX11,dX11);
            Form_PM16C.SetTMGReady(AX11);
            Form_PM16C.MoveTo(AX11,EX11+ORUN,false,false);
          end
          else
          begin
            Form_PM16C.SetTMGP(AX11,EX11,SX11-dX11,dX11);
            Form_PM16C.SetTMGReady(AX11);
            Form_PM16C.MoveTo(AX11,SX11-ORUN,false,false);
          end;
          Sleep(100);
          repeat
            SB.Panels[1].Text  := '1st loop: '+Form_PM16C.GetPos(AX11).ToString;
            Application.ProcessMessages;
            Sleep(100);
          until not(Form_PM16C.isBusy(0));

          Form_CT48.CntStp;
          Read_Counts(Sender);

          Application.ProcessMessages;
          SB.Panels[2].Text := '2nd loop: '+TX2.ToString;
          if not(Go) then
          begin
            Form_PM16C.SetLSP(AX11,bk_rate);
            Form_PM16C.SelectSP(AX11,0);
            CloseFile(FS);
            ShowMessage('Canceled');
            exit;
          end;
          PM := not(PM);
        end;
      end;
      if not(Go) then exit;
      TX2 := TX2+dX2;
    end;

    CloseFile(FS);
    ShowMessage('Finished: '+(timeGetTime - TimeStart).ToString);
    SB.Panels[1].Text  := '';
    SB.Panels[2].Text  := '';

    if RG_Method.ItemIndex =1 then
    begin
      Form_PM16C.SetLSP(AX11,bk_rate);
      Form_PM16C.SelectSP(AX11,0);
    end;

    if CB_AutoSh.Checked then
      if Form_Shutter.CB_Connect.Checked then
        Form_Shutter.BB_CLOSEClick(Sender);
  end;
end;



procedure TForm_Scan.BB_StopClick(Sender: TObject);
begin
  Go := false;
end;


procedure TForm_Scan.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  lMag, lX, lY : longint;
begin
  lMag := 1;
  case CB_Mag.ItemIndex of
    0:lMag := 1;
    1:lMag := 2;
    2:lMag := 4;
    3:lMag := 8;
  end;
  lX := Round(X/lMag);
  lY := Round(Y/lMag);
  if (lX<PWidth) and (lY<PWidth) then
    SB.Panels[0].Text := '(X,Y) = ('+lX.ToString+', '+lY.ToString+') = '+PData[lY,lX].ToString
  else
    SB.Panels[0].Text := '(X,Y) = ('+lX.ToString+', '+lY.ToString+') = Out od range';
end;



end.
