unit Unit_ACT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, Unit_PW, Unit_Ph_PW, Math, IniFiles,  Diagnostics, Zyla;

type
  TForm_ACT = class(TForm)
    SB_CT: TStatusBar;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Edit_Samp_Name: TEdit;
    Chart1: TChart;
    Series1: TLineSeries;
    Panel1: TPanel;
    BB_CT_ST: TBitBtn;
    BB_CT_STOP: TBitBtn;
    Edit_Ite: TEdit;
    UD_Ite: TUpDown;
    SB_ReShow: TSpeedButton;
    SB_SAKAS: TSpeedButton;
    SaveDialog1: TSaveDialog;
    RG_Method: TRadioGroup;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    CB_axis_rot: TComboBox;
    Edit_R_ST: TEdit;
    Edit_R_End: TEdit;
    Edit_R_d: TEdit;
    Edit_CT_Shift: TEdit;
    CB_Moni2: TCheckBox;
    Edit_EXPT: TEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label23: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label2: TLabel;
    CB_axis_x: TComboBox;
    Edit_XZ_M: TEdit;
    Edit_XZ_BK: TEdit;
    Edit_BKN: TEdit;
    Edit_BK_EXPT: TEdit;
    Edit_BK_Int: TEdit;
    CB_BKMode: TComboBox;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    SB_FS_Test: TSpeedButton;
    Label20: TLabel;
    Label19: TLabel;
    CB_axis_ph: TComboBox;
    Edit_FS_n: TEdit;
    Edit_FS_dP: TEdit;
    Edit_FS_Start: TEdit;
    Edit_FS_Orig: TEdit;
    CB_PHSave: TCheckBox;
    CB_DispPh: TCheckBox;
    RG_Scan: TRadioGroup;
    CB_XI_DEI: TComboBox;
    Label6: TLabel;
    CB_AutoSh: TCheckBox;
    CB_Ext_imager: TCheckBox;
    Edit_Pro: TEdit;
    Label9: TLabel;
    Edit_Int: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    SB_ExpT: TSpeedButton;
    Label5: TLabel;
    CB_ROT_RESET: TCheckBox;
    GroupBox1: TGroupBox;
    CB_Outer_Type: TComboBox;
    Edit_Outer_ST: TEdit;
    Edit_Outer_d: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    CB_Outer_Axis: TComboBox;
    Label21: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit_CTRL_Wait: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure SB_ReShowClick(Sender: TObject);
    procedure CB_axis_rotChange(Sender: TObject);
    procedure SB_SAKASClick(Sender: TObject);
    procedure SB_FS_TestClick(Sender: TObject);

    function Calc_AvI(Sender:TObject):double;
    procedure Calc_Phase(Sender: TObject);
    procedure Calc_DEI(Sender: TObject);
    procedure Save_Ph_Map(Sender: TObject);

    procedure Init_Cond(Ite:longint;Sender: TObject);
    procedure BK(Sender: TObject);
    procedure Step_CT(Sender: TObject);
    procedure Step_Int_CT(Sender: TObject);
    procedure Step_lCT(n:longint;Sender: TObject);

    procedure Check_rate(Sender: TObject);
    procedure Cont_CT(Sender: TObject);

    procedure BB_CT_STClick(Sender: TObject);
    procedure BB_CT_STOPClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CB_BKModeChange(Sender: TObject);
    procedure SB_ExpTClick(Sender: TObject);

    procedure CT_Cond_CTRL(Ite:longint;Sender: TObject);
  private
    { Private éŒ¾ }
  public
    { Public éŒ¾ }
  end;

var
  Form_ACT: TForm_ACT;

  CT_R_Ch, CT_X_Ch, Ph_Ch  : longint;

  Rot1, Rot2, dR, Rot_Shift :longint;
  BKm, BKbk, BKN, BK_Int : longint;
  PH_PH0, PH_PH1,PH_dPH, PH_n: longint;
  rate,  rate2, CT_N : longint;
  FPS : double;

  IData : array[0..50,0..2160,0..2560] of WORD;
  PHData : array[0..4,0..2160,0..2560] of double;

  Go : boolean;
  FS : TFileStream;
  AStopWatch : TStopWatch;
  X1,X2,Z1,Z2 : longint;

implementation
uses Unit_PM16C, Unit_Imager, Unit_SAKAS, main, Unit_Shutter, Unit_Cryo;

{$R *.dfm}


procedure TForm_ACT.FormActivate(Sender: TObject);
begin
  if Form_SAKAS.Edit_SName.Modified then
    Edit_Samp_Name.Text := Form_SAKAS.Edit_SName.Text;
end;

procedure TForm_ACT.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Top     := Ini.ReadInteger( 'Form_CT', 'Top', 100 );
    Left    := Ini.ReadInteger( 'Form_CT', 'Left', 100 );
    if Ini.ReadBool( 'Form_CT', 'InitMax', false ) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;

    UD_Ite.Position := Ini.ReadInteger('CT','Iteration',1);
    RG_Scan.ItemIndex := Ini.ReadInteger('CT','Step_Mode',1);
    CT_R_Ch         := Ini.ReadInteger('CT','R_Ch',0);
    CT_X_ch         := Ini.ReadInteger('CT','X_Ch',0);
    PH_Ch       := Ini.ReadInteger('CT','FS_Ch',0);

    RG_Method.ItemIndex := Ini.ReadInteger('CT','Method',0);

    Edit_R_ST.Text :=  Ini.ReadString('CT','RST','0');
    Edit_R_End.Text := Ini.ReadString('CT','REND','189000');
    Edit_R_d.Text :=   Ini.ReadString('CT','dR','180');
    Edit_Pro.Text :=  Ini.ReadString('CT','Pro','1000');
    Edit_CT_Shift.Text := Ini.ReadString('CT','Shift','180');
    Edit_EXPT.Text :=   Ini.ReadString('CT','Exp_Time','1000');
    CB_Moni2.Checked := Ini.ReadBool('CT','Mon_Int',true);

    CB_BKMode.ItemIndex := Ini.ReadInteger('CT','BK_Mode',1);
    Edit_XZ_M.Text :=  Ini.ReadString('CT','Xm','0');
    Edit_XZ_BK.Text := Ini.ReadString('CT','XBK','-20000');
    Edit_BKN.Text :=   Ini.ReadString('CT','BKN','100');
    Edit_BK_EXPT.Text :=   Ini.ReadString('CT','BK_EXp_Time','1000');
    Edit_BK_Int.Text :=   Ini.ReadString('CT','BK_Int','1050');

    Edit_FS_Orig.Text  :=Ini.ReadString('CT','FS_Orig','-1000');
    Edit_FS_Start.Text :=Ini.ReadString('CT','FS_ST','0');
    Edit_FS_dP.Text    :=Ini.ReadString('CT','FS_dP','2000');
    Edit_FS_n.Text     :=Ini.ReadString('CT','FS_ND','5');
    CB_DispPh.Checked := Ini.ReadBool('CT','Disp_Phmap',false);
    CB_XI_DEI.ItemIndex := Ini.ReadInteger('CT','Calc_XI_DEI',0);

    CB_AutoSh.Checked := Ini.ReadBool('CT','Auto_Shutter',false);

    CB_Outer_Type.ItemIndex := Ini.ReadInteger('Cond_CTRL','Type',0);
    Edit_Outer_ST.Text := Ini.ReadString('Cond_CTRL','ST','10');
    Edit_Outer_d.Text := Ini.ReadString('Cond_CTRL','d','10');

    Edit_Samp_Name.Text := Ini.ReadString('Sample','Name','');
//    Edit_Samp_Part.Text := Ini.ReadString('Sample','Part','');
//    Edit_Samp_Status.Text := Ini.ReadString('Sample','Status','');
//    Edit_Samp_Temp.Text := Ini.ReadString('Sample','Temp','');


  finally
    Ini.Free;
  end;
end;

procedure TForm_ACT.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteInteger( 'Form_CT', 'Top', Top);
    Ini.WriteInteger( 'Form_CT', 'Left', Left);
    Ini.WriteBool( 'Form_CT', 'InitMax', WindowState = wsMaximized );

    Ini.WriteInteger('CT','Iteration',UD_Ite.Position);
    Ini.WriteInteger('CT','Step_Mode',RG_Scan.ItemIndex);

    Ini.WriteInteger('CT','R_Ch', CT_R_Ch);
    Ini.WriteInteger('CT','X_Ch', CT_X_ch);
    Ini.WriteInteger('CT','FS_Ch',PH_Ch);

    Ini.WriteInteger('CT','Method',RG_Method.ItemIndex);

    Ini.WriteString('CT','RST',       Edit_R_ST.Text);
    Ini.WriteString('CT','REND',      Edit_R_End.Text);
    Ini.WriteString('CT','dR',        Edit_R_d.Text);
    Ini.WriteString('CT','Pro',       Edit_Pro.Text);
    Ini.WriteString('CT','Shift',     Edit_CT_Shift.Text);
    Ini.WriteString('CT','Exp_Time',  Edit_EXPT.Text);
    Ini.WriteBool('CT','Mon_Int',CB_Moni2.Checked );

    Ini.WriteInteger('CT','BK_Mode',  CB_BKMode.ItemIndex);
    Ini.WriteString('CT','Xm',        Edit_XZ_M.Text);
    Ini.WriteString('CT','XBK',       Edit_XZ_BK.Text);
    Ini.WriteString('CT','BKN',       Edit_BKN.Text);
    Ini.WriteString('CT','BK_EXp_Time', Edit_BK_EXPT.Text);
    Ini.WriteString('CT','BK_Int',    Edit_BK_Int.Text);

    Ini.WriteString('CT','FS_Orig',   Edit_FS_Orig.Text);
    Ini.WriteString('CT','FS_ST',     Edit_FS_Start.Text);
    Ini.WriteString('CT','FS_dP',     Edit_FS_dP.Text);
    Ini.WriteString('CT','FS_ND',     Edit_FS_n.Text);
    Ini.WriteBool('CT','Disp_Phmap',CB_DispPh.Checked);
    Ini.WriteInteger('CT','Calc_XI_DEI',CB_XI_DEI.ItemIndex);

    Ini.WriteInteger('Cond_CTRL','Type',CB_Outer_Type.ItemIndex);
    Ini.WriteString('Cond_CTRL','ST',Edit_Outer_ST.Text);
    Ini.WriteString('Cond_CTRL','d',Edit_Outer_d.Text);

    Ini.WriteBool('CT','Auto_Shutter',CB_AutoSh.Checked);

    Ini.WriteString('Sample','Name',  Edit_Samp_Name.Text);

  finally
    Ini.Free;
  end;
end;

procedure TForm_ACT.FormShow(Sender: TObject);
begin
  SB_ReShowClick(Sender);
end;

procedure TForm_ACT.SB_ReShowClick(Sender: TObject);
var
  li:byte;

  pFreeByte: PLargeInteger;
  useFreeByte, totalByte, freeByte: Int64;
begin
  if Form_PM16C.CB_Connect.Checked then
  begin
    CB_axis_rot.Items.Clear;
    CB_axis_x.Items.Clear;
    CB_axis_ph.Items.Clear;
    CB_Outer_Axis.Items.Clear;

    for li:=0 to 15 do
    begin
      CB_axis_rot.Items.Add(Form_PM16C.Motor[li].Axis_Name);
      CB_axis_x.Items.Add(Form_PM16C.Motor[li].Axis_Name);
      CB_axis_ph.Items.Add(Form_PM16C.Motor[li].Axis_Name);
      CB_Outer_Axis.Items.Add(Form_PM16C.Motor[li].Axis_Name);
    end;

    CB_axis_rot.ItemIndex := CT_R_Ch;
    CB_axis_x.ItemIndex := CT_X_ch;
    CB_axis_ph.ItemIndex := PH_Ch;
    CB_Outer_Axis.ItemIndex := 1;
  end;

end;

procedure TForm_ACT.CB_axis_rotChange(Sender: TObject);
begin
  CT_R_Ch :=     CB_axis_rot.ItemIndex;
  CT_X_ch :=     CB_axis_x.ItemIndex  ;
  PH_Ch   :=     CB_axis_ph.ItemIndex ;
end;

procedure TForm_ACT.CB_BKModeChange(Sender: TObject);
begin
  Rot1 := StrToInt(Edit_R_ST.Text);
  Rot2 := StrToInt(Edit_R_End.Text);
  dR := StrToInt(Edit_R_d.Text);

  if CB_BKMode.ItemIndex=1 then
    Edit_BK_Int.Text := ((Rot2-Rot1) div dR).ToString;
end;

procedure TForm_ACT.SB_SAKASClick(Sender: TObject);
var
  lPro, BKNum, BKIte, BKInt, FSN : longint;
begin
  with Form_SAKAS do
  begin
    Rot1 := StrToInt(Edit_R_ST.Text);
    Rot2 := StrToInt(Edit_R_End.Text);
    dR := StrToInt(Edit_R_d.Text);

    lPro := Round((Rot2-Rot1)/dR);
    BKInt := StrToInt(Edit_BK_Int.Text);
    BKNum := StrToInt(Edit_BKN.Text);
    if RG_Method.ItemIndex=0 then
      FSN := 1
    else
      FSN := StrToInt(Edit_FS_n.Text);
    LEdit_FSN.Text := FSN.ToString;

    Edit_SName.Text := Edit_Samp_Name.Text;

    Edit_Date.Text :=DateToStr(Now);
    Edit_Time.Text :=TimeToStr(Now);

    Edit_Exp_T.Text := Edit_EXPT.Text;
    Edit_BKExp_T.Text := Edit_BK_EXPT.Text;

    LEdit_Pro.Text := Edit_Pro.Text;

    LEdit_OW.Text := Form_Imager.OW.ToString;
    LEdit_OH.Text := Form_Imager.OH.ToString;
    LEdit_PW.Text := Form_Imager.PW.ToString;
    LEdit_PH.Text := Form_Imager.PH.ToString;
    LEdit_OFFX.Text := Form_Imager.Edit_ROI_X1.Text;
    LEdit_OFFY.Text := Form_Imager.Edit_ROI_Y1.Text;

    CB_Method.ItemIndex := RG_Method.ItemIndex;

    case CB_BKMode.ItemIndex of
      0: BKIte := 0;
      1: BKIte := 2;
      2: if (lPRo mod BKInt) =0 then
           BKIte := lPRo div BKInt+1
         else
           BKIte := lPRo div BKInt+2;
    end;
    Edit_ImgN.Text := ((lPro+BKNum*BKIte)*FSN).ToString ;

    Edit_BKInt.Text := Edit_BK_Int.Text;

    Edit_FNBK1.Text := '';
    Edit_FNBK2.Text := '';

    Rot_Memo.Lines.Clear;
    Rot_Memo.Lines.Add('Real FPS : '+FPS.ToString);
    Rot_Memo.Lines.Add('Rot table rate : '+rate.ToString);
    Rot_Memo.Lines.Add('Shift table rate : '+rate2.ToString);
  end;

  Form_SAKAS.Edit_BKN.Text := Edit_BKN.Text;
  Form_SAKAS.Show;
end;



procedure TForm_ACT.SB_FS_TestClick(Sender: TObject);
var
  lExpTime, FPS : double;
  i,j,k:longint;
  BufferSize : Int64;
begin
  if (Form_Imager.Zyla_Opened) or (CB_Ext_imager.Checked) then
  begin
    if Ph_Ch>=0 then
    begin
      Init_Cond(0,Sender);
      Series1.Clear;

      Form_PM16C.MoveTo(Ph_Ch,PH_PH0,true,true);
      Sleep(100);
      Form_PM16C.MoveTo(Ph_Ch,PH_PH1,true,true);

//      lExpTime  := StrToFloat(Edit_EXPT.Text)/1000;
//      Form_Imager.SetExpTime(lExpTime,FPS);
//      Edit_EXPT.Text := Format('%5.0f',[lExpTime*1000]);

      if not(CB_Ext_imager.Checked) then
      begin
        BufferSize := Form_Imager.GetImageSize;
        for i:=0 to NumberOfBuffers-1 do
          Form_Imager.Que_Buff(i,BufferSize);
        Form_Imager.SetCycleMode;
        Form_Imager.SetTrigMode(1);
        Form_Imager.Aquire_Start;
      end;

      AStopWatch := TStopwatch.StartNew;

      for k:=0 to PH_n-1 do
      begin
        SB_CT.SimpleText := 'FS : '+(k+1).ToString+'/'+PH_n.ToString;

        if not(CB_Ext_imager.Checked) then
        begin
          Form_Imager.Soft_Trigger;
          Form_Imager.Wait_Data(k mod NumberOfBuffers);
          for j:=0 to Form_PW.PH-1 do
            for i:=0 to Form_PW.PW-1 do
            begin
              Form_PW.PData[j,i] := Form_Imager.RAWData[j,i];
              IData[k,j,i] :=Form_Imager.RAWData[j,i];
            end;
          Form_PW.Draw_Data(Sender);
          if CB_Moni2.Checked then
            Series1.AddXY(PH_PH1+k*PH_dPH,Calc_AvI(Sender));
        end
        else
        begin
          Form_PM16C.SB_PulseClick(Sender);
          Sleep(StrToInt(Edit_EXPT.Text)+100);
        end;
        if (k<PH_n-1) then
          Form_PM16C.MoveBy(Ph_Ch,PH_dPH,true,false);

        if not(CB_Ext_imager.Checked) then
           Form_Imager.Que_Buff(k mod NumberOfBuffers,BufferSize);

        Application.ProcessMessages;
      end;

      AStopWatch.Stop;
      Form_Main.Memo.Lines.Add('Total time [ms]: '+ AStopWatch.ElapsedMilliseconds.ToString);

      if not(CB_Ext_imager.Checked) then
      begin
        Form_Imager.Aquire_Stop;
        Form_Imager.Flush;
      end;

      if CB_XI_DEI.ItemIndex = 0 then
        Calc_Phase(Sender)
      else
        Calc_DEI(Sender);

      if CB_PHSave.Checked then
        Save_Ph_Map(Sender);
    end;
    Form_PM16C.SB_RefreshClick(Sender);
  end;
end;

procedure TForm_ACT.Save_Ph_Map(Sender: TObject);
var
  i,j,k : longint;
  FS : TFileStream;
  lData : array[0..4100] of WORD;
begin
  if SaveDialog1.Execute then
  begin
    Form_Ph_PW.PData := Form_Ph_PW.SData[0];
    Form_Ph_PW.Save_Data(SaveDialog1.FileName+'.abs', Sender);
    Form_Ph_PW.PData := Form_Ph_PW.SData[1];
    Form_Ph_PW.Save_Data(SaveDialog1.FileName+'.ph', Sender);
    Form_Ph_PW.PData := Form_Ph_PW.SData[2];
    Form_Ph_PW.Save_Data(SaveDialog1.FileName+'.amp', Sender);

    Form_Ph_PW.PData := Form_Ph_PW.SData[1];

    FS := TfileStream.Create(SaveDialog1.FileName+'.dat',fmCreate);

    for k:=0 to PH_n-1 do
    begin
      for j:=0 to Form_Imager.PH-1 do
      begin
        for i:=0 to Form_Imager.PW-1 do
        begin
          lData[i] := IData[k,j,i];
        end;
        FS.WriteBuffer(lData,Form_Imager.PW*2);
      end;
    end;
    FS.Free;
  end;

//    Form_Ph_PW.PData := Form_Ph_PW.SData[3];
//    Form_Ph_PW.Save_Data(SaveDialog1.FileName+'.re', Sender);
//    Form_Ph_PW.PData := Form_Ph_PW.SData[4];
//    Form_Ph_PW.Save_Data(SaveDialog1.FileName+'.im', Sender);
end;

function TForm_ACT.Calc_AvI(Sender: TObject):double;
var
  TmpDbl : double;
  i,j:longint;
begin
  TmpDbl := 0;
  for j:=Z1 to Z2 do
    for i:=X1 to X2 do
      TmpDbl := TmpDbl + Form_Imager.RAWData[j,i];
  Calc_AvI := TmpDbl/((Z2-Z1+1)*(X2-X1+1));
end;

procedure TForm_ACT.Init_Cond(Ite:longint;Sender: TObject);
begin
  if Form_PM16C.CB_Connect.Checked then
    Form_PM16C.Set_Remote;

  Rot_Shift := StrToInt(Edit_CT_Shift.Text);

  Rot1 := StrToInt(Edit_R_ST.Text)+Rot_Shift*Ite;
  Rot2 := StrToInt(Edit_R_End.Text)+Rot_Shift*Ite;
  dR := StrToInt(Edit_R_d.Text);

  BKm := StrToInt(Edit_XZ_M.Text);
  BKbk := StrToInt(Edit_XZ_BK.Text);
  BKN := StrToInt(Edit_BKN.Text);
  if CB_BKMode.ItemIndex=1 then
    Edit_BK_Int.Text := ((Rot2-Rot1) div dR).ToString;

  BK_Int := StrToInt(Edit_BK_Int.Text);

  PH_PH0 := StrToInt(Edit_FS_Orig.Text);
  PH_PH1 := StrToInt(Edit_FS_Start.Text);
  PH_dPH := StrToInt(Edit_FS_dP.Text);
  PH_n   := StrToInt(Edit_FS_n.Text);

  X1 := StrToInt(Form_PW.Edit_Left.Text);
  X2 := StrToInt(Form_PW.Edit_Right.Text);
  Z1 := StrToInt(Form_PW.Edit_Top.Text);
  Z2 := StrToInt(Form_PW.Edit_Bottom.Text);

  Series1.Clear;
end;

procedure TForm_ACT.Calc_Phase(Sender: TObject);
var
  i,j,k:longint;
  Re, Im, TmpDbl : double;
  MyCos,MySin : array[0..50] of double;
begin
  for i:=0 to PH_n-1 do
  begin
    MyCos[i] := Cos(i/PH_n*2*Pi);
    MySin[i] := Sin(i/PH_n*2*Pi);
  end;

  for j:=0 to Form_Imager.PH-1 do
    for i:=0 to Form_Imager.PW-1 do
    begin
      Re := 0;
      Im := 0;
      TmpDbl := 0;

      for k:=0 to PH_n-1 do
      begin
        Im := Im + IData[k,j,i]*MySin[k];
        Re := Re + IData[k,j,i]*MyCos[k];
        TmpDbl := TmpDbl+IData[k,j,i];
      end;
      PHData[0,j,i] := TmpDbl;
      PHData[1,j,i] := ArcTan2(Im,Re);
      PHData[2,j,i] := Sqrt(Sqr(Im)+Sqr(Re));
      PHData[3,j,i] := Re;
      PHData[4,j,i] := Im;
    end;

  for k:=0 to 2 do
    for j:=0 to Form_Imager.PH-1 do
      for i:=0 to Form_Imager.PW-1 do
        Form_Ph_PW.SData[k,j,i] := PHData[k,j,i];

  Form_Ph_PW.PData := Form_Ph_PW.SData[1];
  Form_Ph_PW.UD_No.Position := 1;
  Form_Ph_PW.Edit_PMin.Text := '-3.14';
  Form_Ph_PW.Edit_PMax.Text :=  '3.14';

  Form_Ph_PW.Show;
  Form_Ph_PW.Draw_Data(Sender);
end;

procedure TForm_ACT.Calc_DEI(Sender: TObject);
var
  i,j,k:longint;
  lABS, lPH, TmpDbl : double;
begin
  for j:=0 to Form_Imager.PH-1 do
    for i:=0 to Form_Imager.PW-1 do
    begin
      lABS := 0;
      lPH := 0;
      TmpDbl :=0;
      for k:=0 to PH_n-1 do
      begin
        lABS := lABS + IData[k,j,i];
        lPH := lPH+ IData[k,j,i]*(k-PH_n/2);
        TmpDbl := TmpDbl+k;
      end;
      PHData[0,j,i] := lABS;
      PHData[1,j,i] := lPH/TmpDbl;
      PHData[2,j,i] := 0;
      PHData[3,j,i] := 0;
      PHData[4,j,i] := 0;
    end;

  for k:=0 to 2 do
    for j:=0 to Form_Imager.PH-1 do
      for i:=0 to Form_Imager.PW-1 do
        Form_Ph_PW.SData[k,j,i] := PHData[k,j,i];

  Form_Ph_PW.PData := Form_Ph_PW.SData[1];
  Form_Ph_PW.UD_No.Position := 1;

  Form_Ph_PW.Show;
  Form_Ph_PW.Draw_Data(Sender);
end;


procedure TForm_ACT.BK(Sender: TObject);
var
  lExpTime, FPS : double;
  i,j,k,m :longint;
  BufferSize : Int64;
  lData : array[0..3000] of WORD;
begin
  Form_PM16C.MoveTo(CT_X_Ch, BKbk,true,true);
  Sleep(1000);
  if CB_Moni2.Checked then
    Series1.Clear;

  if CB_Ext_imager.Checked then
  begin
    if  RG_Method.ItemIndex=0 then
    begin
      for k:=0 to BKN-1 do
      begin
        SB_CT.SimpleText := 'ABS BK : '+(k+1).ToString+'/'+BKN.ToString;
        Form_PM16C.SB_PulseClick(Sender);
        Sleep(StrToInt(Edit_BK_EXPT.Text));

        if not(Go) then
        begin
          ShowMessage('CT Canceled!');
          exit;
        end;
        Application.ProcessMessages;
      end;
      Form_PM16C.MoveTo(CT_X_Ch, BKm,true,true);
      exit;
    end
    else
    begin
      for k:=0 to BKN-1 do
      begin
        Form_PM16C.MoveTo(Ph_Ch,PH_PH0,true,false);
        Sleep(100);
        Form_PM16C.MoveTo(Ph_Ch,PH_PH1,true,false);
        for m:=0 to PH_n-1 do
        begin
          SB_CT.SimpleText := 'PH BK : '+(k+1).ToString+'/'+BKN.ToString+ ' PH : '+m.ToString;

          Form_PM16C.SB_PulseClick(Sender);
          Sleep(StrToInt(Edit_BK_EXPT.Text));

          if (m<PH_n-1) then
            Form_PM16C.MoveBy(Ph_Ch,PH_dPH,true,false);
          Application.ProcessMessages;
        end;
      end;
      Form_PM16C.MoveTo(CT_X_Ch, BKm,true,true);
      exit;
    end;
  end;

  if RG_Scan.ItemIndex=0 then
  begin
    lExpTime := StrToFloat(Edit_BK_EXPT.Text)/1000;
    Form_Imager.SetExpTime(lExpTime,FPS);
    Edit_BK_EXPT.Text := Format('%5.0f',[lExpTime*1000]);
  end;

  BufferSize := Form_Imager.GetImageSize;
  for i:=0 to NumberOfBuffers-1 do
    Form_Imager.Que_Buff(i,BufferSize);
  Form_Imager.SetCycleMode;

  AStopWatch := TStopwatch.StartNew;

  //ABS BK
  if  RG_Method.ItemIndex=0 then
  begin
    Form_Imager.SetTrigMode(0);
    Form_Imager.Aquire_Start;

    for k:=0 to BKN-1 do
    begin
      SB_CT.SimpleText := 'ABS BK : '+(k+1).ToString+'/'+BKN.ToString;

      Form_Imager.Wait_Data(k mod NumberOfBuffers);
      for j:=0 to Form_PW.PH-1 do
      begin
        for i:=0 to Form_PW.PW+-1 do
        begin
          Form_PW.PData[j,i] := Form_Imager.RAWData[j,i];
          lData[i] := Form_Imager.RAWData[j,i];
        end;
        FS.WriteBuffer(lData,Form_PW.PW*2);
      end;

      Form_PW.Draw_Data(Sender);
      Form_Imager.Que_Buff(k mod NumberOfBuffers,BufferSize);
      if CB_Moni2.Checked then
        Series1.AddY(Calc_AvI(Sender));

      if not(Go) then
      begin
        Form_Imager.Aquire_Stop;
        Form_Imager.Flush;
        ShowMessage('CT Canceled!');
        exit;
      end;
      Application.ProcessMessages;
    end;
    Form_Imager.Aquire_Stop;
    Form_Imager.Flush;
  end
  else
  begin
    Form_Imager.SetTrigMode(1);
    Form_Imager.Aquire_Start;
    for k:=0 to BKN-1 do
    begin
      Form_PM16C.MoveTo(Ph_Ch,PH_PH0,true,false);
      Sleep(100);
      Form_PM16C.MoveTo(Ph_Ch,PH_PH1,true,false);
      for m:=0 to PH_n-1 do
      begin
        SB_CT.SimpleText := 'PH BK : '+(k+1).ToString+'/'+BKN.ToString+ ' PH : '+m.ToString;

        Form_Imager.Soft_Trigger;
        Form_Imager.Wait_Data(k*PH_n+m mod NumberOfBuffers);
        for j:=0 to Form_PW.PH-1 do
        begin
          for i:=0 to Form_PW.PW+-1 do
          begin
            Form_PW.PData[j,i] := Form_Imager.RAWData[j,i];
            lData[i] := Form_Imager.RAWData[j,i];
            IData[m,j,i] :=Form_Imager.RAWData[j,i];
          end;
          FS.WriteBuffer(lData,Form_PW.PW*2);
        end;
        Form_PW.Draw_Data(Sender);
        if (m<PH_n-1) then
          Form_PM16C.MoveBy(Ph_Ch,PH_dPH,true,false);
        if CB_Moni2.Checked then
          Series1.AddY(Calc_AvI(Sender));
        Form_Imager.Que_Buff(k*PH_n+m mod NumberOfBuffers,BufferSize);

        Application.ProcessMessages;
      end;

      if CB_DispPh.Checked then
      begin
        if CB_XI_DEI.ItemIndex = 0 then
          Calc_Phase(Sender)
        else
          Calc_DEI(Sender);
      end;

      if not(Go) then
      begin
        Form_Imager.Aquire_Stop;
        Form_Imager.Flush;
        ShowMessage('CT Canceled!');
        exit;
      end;
    end;
    Form_Imager.Aquire_Stop;
    Form_Imager.Flush;
  end;

  AStopWatch.Stop;
  Form_Main.Memo.Lines.Add('BK time [ms]: '+ AStopWatch.ElapsedMilliseconds.ToString+' /'+BKN.ToString+' imgs');
  Form_SAKAS.Add_Str(Form_SAKAS.Tag_FN,'Proc_1', 'BK_frame_rate', AStopWatch.ElapsedMilliseconds.ToString+'/'+(CT_N+1).ToString+' imgs',Sender);

  Form_PM16C.MoveTo(CT_X_Ch, BKm,true,true);
end;

procedure TForm_ACT.Step_lCT(n:longint;Sender: TObject);
var
  lExpTime, FPS : double;
  i,j,k,m:longint;
  BufferSize : Int64;
  lData : array[0..3000] of WORD;
begin
  if CB_Ext_imager.Checked then
  begin
    if  RG_Method.ItemIndex=0 then
    begin
      for k := 0 to n-1 do
      begin
        SB_CT.SimpleText := 'ABS CT : '+(k+1).ToString+'/'+n.ToString;
        Form_PM16C.SB_PulseClick(Sender);
        Sleep(StrToInt(Edit_EXPT.Text)+100);
        Form_PM16C.MoveBy(CT_R_Ch,dR,true,false);

        if not(Go) then
        begin
          ShowMessage('CT Canceled!');
          exit;
        end;
        Application.ProcessMessages;
      end;
    end
    else
    begin
      for k := 0 to n-1 do
      begin
        Form_PM16C.MoveTo(Ph_Ch,PH_PH0,true,false);
        Sleep(20);
        Form_PM16C.MoveTo(Ph_Ch,PH_PH1,true,false);

        for m:=0 to PH_n-1 do
        begin
          SB_CT.SimpleText := 'PH CT : '+(k+1).ToString+'/'+n.ToString+ ' FS : '+m.ToString;

          Form_PM16C.SB_PulseClick(Sender);
          Sleep(StrToInt(Edit_EXPT.Text)+100);
          if (m<PH_n-1) then
            Form_PM16C.MoveBy(Ph_Ch,PH_dPH,true,false);
          Application.ProcessMessages;
        end;

        Form_PM16C.MoveBy(CT_R_Ch,dR,true,false);
        if not(Go) then
        begin
          ShowMessage('CT Canceled!');
          exit;
        end;
        Application.ProcessMessages;
      end;
      exit;
    end;
  end
  else
  begin
    lExpTime  := StrToFloat(Edit_EXPT.Text)/1000;
    Form_Imager.SetExpTime(lExpTime,FPS);
    Edit_EXPT.Text := Format('%5.0f',[lExpTime*1000]);

    BufferSize := Form_Imager.GetImageSize;
    for i:=0 to NumberOfBuffers-1 do
      Form_Imager.Que_Buff(i,BufferSize);
    Form_Imager.SetCycleMode;
    Form_Imager.SetTrigMode(1);
    Form_Imager.Aquire_Start;

    AStopWatch := TStopwatch.StartNew;

    //ABS
    if  RG_Method.ItemIndex=0 then
    begin
      for k := 0 to n-1 do
      begin
        SB_CT.SimpleText := 'ABS CT : '+(k+1).ToString+'/'+n.ToString;

        Form_Imager.Soft_Trigger;
        Form_Imager.Wait_Data(k mod NumberOfBuffers);
        for j:=0 to Form_PW.PH-1 do
        begin
          for i:=0 to Form_PW.PW+-1 do
          begin
            Form_PW.PData[j,i] := Form_Imager.RAWData[j,i];
            lData[i] := Form_Imager.RAWData[j,i];
          end;
          FS.WriteBuffer(lData,Form_PW.PW*2);
        end;
        Form_PW.Draw_Data(Sender);

        if CB_Moni2.Checked then
          Series1.AddY(Calc_AvI(Sender));

        Form_PM16C.MoveBy(CT_R_Ch,dR,true,false);
        Form_Imager.Que_Buff(k mod NumberOfBuffers,BufferSize);
        if not(Go) then
        begin
          Form_Imager.Aquire_Stop;
          Form_Imager.Flush;
          ShowMessage('CT Canceled!');
          exit;
        end;
        Application.ProcessMessages;
      end;
      Form_Imager.Aquire_Stop;
      Form_Imager.Flush;
    end
    else
    begin
      for k := 0 to n-1 do
      begin
        Form_PM16C.MoveTo(Ph_Ch,PH_PH0,true,false);
        Sleep(20);
        Form_PM16C.MoveTo(Ph_Ch,PH_PH1,true,false);

        for m:=0 to PH_n-1 do
        begin
          SB_CT.SimpleText := 'PH CT : '+(k+1).ToString+'/'+n.ToString+ ' FS : '+m.ToString;

          Form_Imager.Soft_Trigger;
          Form_Imager.Wait_Data(k*PH_n+m mod NumberOfBuffers);
          for j:=0 to Form_PW.PH-1 do
          begin
            for i:=0 to Form_PW.PW+-1 do
            begin
              Form_PW.PData[j,i] := Form_Imager.RAWData[j,i];
              lData[i] := Form_Imager.RAWData[j,i];
              IData[m,j,i] :=Form_Imager.RAWData[j,i];
            end;
            FS.WriteBuffer(lData,Form_PW.PW*2);
          end;
          Form_PW.Draw_Data(Sender);
          if (m<PH_n-1) then
            Form_PM16C.MoveBy(Ph_Ch,PH_dPH,true,false);
          if (CB_Moni2.Checked) and (m=0) then
            Series1.AddY(Calc_AvI(Sender));
          Form_Imager.Que_Buff(k*PH_n+m mod NumberOfBuffers,BufferSize);
          Application.ProcessMessages;
        end;

        Form_PM16C.MoveBy(CT_R_Ch,dR,true,false);

        if CB_DispPh.Checked then
        begin
          if CB_XI_DEI.ItemIndex = 0 then
            Calc_Phase(Sender)
          else
            Calc_DEI(Sender);
        end;

        if not(Go) then
        begin
          Form_Imager.Aquire_Stop;
          Form_Imager.Flush;
          ShowMessage('CT Canceled!');
          exit;
        end;
        Application.ProcessMessages;
      end;
      Form_Imager.Aquire_Stop;
      Form_Imager.Flush;
    end;
    AStopWatch.Stop;
    Form_Main.Memo.Lines.Add('CT time [ms]: '+ AStopWatch.ElapsedMilliseconds.ToString);
  end;

end;

procedure TForm_ACT.Step_CT(Sender: TObject);
var
  CT_N : Int64;
begin
  Form_PM16C.MoveTo(CT_R_Ch, Rot1-1000,true,true);
  Sleep(100);
  Form_PM16C.MoveTo(CT_R_Ch, Rot1,true,true);
  Sleep(1000);

  Series1.Clear;
  CT_N := Round((Rot2-Rot1)/dR);

  Step_lCT(CT_N,Sender);
end;

procedure TForm_ACT.Step_Int_CT(Sender: TObject);
var
  m, CT_m, lPro:longint;
begin
  Series1.Clear;
  Form_PM16C.MoveTo(CT_R_Ch, Rot1-1000,true,true);
  Sleep(100);
  Form_PM16C.MoveTo(CT_R_Ch, Rot1,true,true);
  Sleep(1000);

  lPro := Round((Rot2-Rot1)/dR);
  //Š„‚èØ‚ê‚éˆÈŠO‚Í{‚P‰ñ
  CT_m := Ceil(lPro/BK_Int);

  for m:=1 to CT_m do
  begin
    BK(Sender);
    Sleep(1000);
    if lPro<m*BK_Int then
      Step_lCT(lPro mod BK_Int, Sender)
    else
      Step_lCT(BK_Int, Sender);
    Sleep(1000);
  end;

  BK(Sender);
end;

procedure TForm_ACT.Check_rate(Sender: TObject);
var
  lExpTime, FPS, Total_T, lrate,lrate2 : double;
begin
  lExpTime := StrToFloat(Edit_EXPT.Text)/1000;
  Sleep(500);

  Form_Imager.SetExpTime(lExpTime,FPS);

  Edit_EXPT.Text := Format('%5.0f',[lExpTime*1000]);
  lExpTime  := RoundTo(lExpTime,-2);
  FPS := RoundTo(FPS, -3);

  if FPS=-1 then
  begin
    ShowMessage('FPS can NOT obtained !');
    Go := false;
    exit;
  end;

  Rot1 := StrToInt(Edit_R_ST.Text);
  Rot2 := StrToInt(Edit_R_End.Text);
  dR := StrToInt(Edit_R_d.Text);
  CT_N := (Rot2-Rot1) div dR;

  if FPS<>1/lExpTime then
    if MessageDlg('Frame rate '+FPS.ToString+' [fps] is SLOW! Adjust rot speed?',
       mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      Total_T := CT_N/FPS
    else
    begin
      Go := false;
      ShowMessage('CT Canceled!');
      exit;
    end
  else
    Total_T := CT_N*lExpTime;

  rate := Round((Rot2-Rot1)/Total_T);
  Form_main.Memo.Lines.Add('Rot table rate: '+rate.ToString+' [pls/s]');
end;



procedure TForm_ACT.Cont_CT(Sender: TObject);
var
  lExpTime, FPS : double;
  i,j,k,kk, bk_rate, bk_rate2, n_Scan:longint;
  BufferSize : Int64;
  lData : array[0..3000] of WORD;
begin
//  lExpTime := StrToFloat(Edit_EXPT.Text)/1000;
//  Form_Imager.SetExpTime(lExpTime,FPS);
//  Edit_EXPT.Text := Format('%5.0f',[lExpTime*1000]);

  if not(Go) then exit;

  bk_rate := Form_PM16C.GetLSP(CT_R_Ch);
  Form_PM16C.SetLSP(CT_R_Ch,rate);

  BufferSize := Form_Imager.GetImageSize;
  Form_Imager.SetCycleMode;
  Form_Imager.SetTrigMode(0);

  if RG_Method.ItemIndex=1 then
  begin
    n_Scan := StrToInt(Edit_FS_n.Text);

    Form_PM16C.MoveTo(Ph_Ch, PH_PH0,true,true);
    Form_PM16C.MoveTo(Ph_Ch, PH_PH1-PH_dPH,true,true);
  end
  else
    n_Scan := 1;

  for kk:=0 to n_SCan-1 do
  begin
    Series1.Clear;

    for i:=0 to NumberOfBuffers-1 do
      Form_Imager.Que_Buff(i,BufferSize);

    if RG_Method.ItemIndex=1 then
      Form_PM16C.MoveBy(Ph_Ch, PH_dPH,true,true);

    Form_PM16C.SelectSP(CT_R_Ch,0);
    Form_PM16C.MoveTo(CT_R_Ch, Rot1-1000,true,true);
    Form_PM16C.MoveTo(CT_R_Ch, Rot1-rate*2,true,true);

    Form_PM16C.SelectSP(CT_R_Ch,2);
    Form_PM16C.MoveTo(CT_R_Ch, Rot2+rate*2,false,false);

    Sleep(2000);
    Form_Imager.Aquire_Start;
    AStopWatch := TStopwatch.StartNew;

    for k := 0 to CT_N do
    begin
      SB_CT.SimpleText := 'CONT CT : '+kk.ToString+' : '+k.ToString+'/'+CT_N.ToString;

      Form_Imager.Wait_Data(k mod NumberOfBuffers);
      for j:=0 to Form_PW.PH-1 do
      begin
        for i:=0 to Form_PW.PW+-1 do
        begin
          Form_PW.PData[j,i] := Form_Imager.RAWData[j,i];
          lData[i] := Form_Imager.RAWData[j,i];
        end;
        FS.WriteBuffer(lData,Form_PW.PW*2);
      end;
      Form_PW.Draw_Data(Sender);

      if CB_Moni2.Checked then
        Series1.AddY(Calc_AvI(Sender));

      Form_Imager.Que_Buff(k mod NumberOfBuffers,BufferSize);
      if not(Go) then
      begin
        Form_Imager.Aquire_Stop;
        Form_Imager.Flush;
        Form_PM16C.STOP;
        Form_PM16C.SetLSP(CT_R_Ch,bk_rate);
        Form_PM16C.SelectSP(CT_R_Ch,0);
        ShowMessage('CT Canceled!');
        exit;
      end;
      Application.ProcessMessages;
    end;

    AStopWatch.Stop;
    Form_Imager.Aquire_Stop;
    Form_Imager.Flush;
    Form_PM16C.Stop;

    if CB_ROT_RESET.Checked then
    begin
      Sleep(100);
//      Form_PM16C.MoveTo(CT_R_Ch, 180000,true,true);
      Form_PM16C.MoveTo(CT_R_Ch, 40000,true,true);
      Sleep(100);
      Form_PM16C.SetPreset(CT_R_Ch,0)
    end;

    Sleep(1000);
    Form_Main.Memo.Lines.Add('Cont CT time [ms]: '+ AStopWatch.ElapsedMilliseconds.ToString+'/'+(CT_N+1).ToString+' imgs');
  end;

  Form_SAKAS.Add_Str(Form_SAKAS.Tag_FN,'Proc_1', 'CT_frame_rate', AStopWatch.ElapsedMilliseconds.ToString+' / '+(CT_N+1).ToString+' imgs',Sender);
  Form_PM16C.SetLSP(CT_R_Ch,bk_rate);
  Form_PM16C.SelectSP(CT_R_Ch,0);
end;



procedure TForm_ACT.CT_Cond_CTRL(Ite:longint;Sender: TObject);
var
  Target_V : double;
  MV_Ch : longint;
  m :longint;
begin
  Target_V := StrToFloat(Edit_Outer_ST.Text)+StrToFloat(Edit_Outer_d.Text)*Ite;
  if CB_Outer_Type.ItemIndex=1 then
  begin
    MV_Ch := CB_Outer_Axis.ItemIndex;
    if MV_CH>=0 then
      Form_PM16C.MoveTo(MV_CH, Round(Target_V),true,true);
  end;
  if CB_Outer_Type.ItemIndex=2 then
  begin
    if Form_Cryo.CB_Connect.Checked then
    begin
      Form_Cryo.Edit_SV.Text := Target_V.ToString;
      Form_Cryo.SB_SV_SetClick(Sender);
      Form_SAKAS.Edit_Temp.Text := 'SV: '+Target_V.ToString;

      Sleep(1000);
      repeat
        Sleep(1000);
        Application.ProcessMessages;
      until (Form_Cryo.RB_T.Checked) or (not(Go));
      Sleep(1000);
    end;
  end;
  m:=0;
  repeat
    Inc(m);
    Sleep(1000);
    SB_CT.SimpleText := 'Waiting...'+m.ToString+' [s]';
    Application.ProcessMessages;
  until m>StrToInt(Edit_CTRL_Wait.Text);
end;

procedure TForm_ACT.BB_CT_STClick(Sender: TObject);
var
  m:longint;
  TmpFN : string;

  pFreeByte: PLargeInteger;
  useFreeByte, totalByte, freeByte: Int64;
begin
  if ((Form_Imager.Zyla_Opened) and (Form_PM16C.CB_Connect.Checked)) or
     ((CB_Ext_imager.Checked) and (Form_PM16C.CB_Connect.Checked))  then
  begin
    if (SaveDialog1.Execute) then
    begin

      GetDiskFreeSpaceEx(PWideChar(Copy(SaveDialog1.FileName,1,3)), useFreeByte, totalByte, @pFreeByte);
      freeByte := Int64(pFreeByte) div 1024 div 1024 div 1024;
      if not(MessageDlg('Free Disk Space: '+IntToStr(freeByte)+'[GB]. Continue?',
      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes) then exit;

      Go := true;

      if CB_AutoSh.Checked then
        if Form_Shutter.CB_Connect.Checked then
          Form_Shutter.BB_OPENClick(Sender);

      Form_PM16C.Set_Remote;
      Form_PM16C.SetCh(0,PH_Ch);
      Form_PM16C.SetCh(1,CT_R_Ch);
      Form_PM16C.SetCh(2,CT_X_Ch);

      try
        if RG_Scan.ItemIndex=1 then
        begin
          Check_rate(Sender);
          if not(go) then exit;
        end;

        m:=0;
        repeat
          if CB_Outer_Type.ItemIndex>0 then
            CT_Cond_CTRL(m,Sender);

          AStopWatch := TStopwatch.StartNew;

          TmpFN := SaveDialog1.FileName+'_'+m.ToString;
          FS := TFileStream.Create(TmpFN,fmCreate);
          Init_Cond(m,Sender);

          SB_SAKASClick(Sender);
          Form_SAKAS.Edit_FN.Text := TmpFN;
          Form_SAKAS.Tag_FN := TmpFN+'.tag';
          Form_SAKAS.Label_FN.Caption := TmpFN+'.tag';
          Form_SAKAS.Save_Karte(Form_SAKAS.Tag_FN,Sender);

          try
            case CB_BKMode.ItemIndex of
            0:begin
                if RG_Scan.ItemIndex=0 then
                  Step_CT(Sender)
                else
                  Cont_CT(Sender);
              end;
            1:begin
                BK(Sender);
                if not(go) then exit;
                if RG_Scan.ItemIndex=0 then
                  Step_CT(Sender)
                else
                  Cont_CT(Sender);
                if not(go) then exit;
                BK(Sender);
                if not(go) then exit;
              end;
            2:begin
                Step_Int_CT(Sender);
              end;
            end;
          finally
            if not(CB_Ext_imager.Checked) then
              FS.Free;
          end;
          AStopWatch.Stop;
          if (Edit_Int.Text <>'') then
            Sleep(StrToInt(Edit_Int.Text){- (AStopWatch.ElapsedMilliseconds div 1000))}*1000);
          Inc(m);
        until m > UD_Ite.Position-1;
      finally
        Form_PM16C.SB_RefreshClick(Sender);
        if not(Go) then
          Form_SAKAS.Add_Str(Form_SAKAS.Tag_FN,'BL_Cond', 'End_Time',TimeToStr(Now),Sender);
        if CB_AutoSh.Enabled then
          if Form_Shutter.CB_Connect.Checked then
            Form_Shutter.BB_CLOSEClick(Sender);
        if Go then
          ShowMessage('CT Completed!');
      end;

    end;
  end;
end;

procedure TForm_ACT.BB_CT_STOPClick(Sender: TObject);
begin
  Go := false;
end;

procedure TForm_ACT.SB_ExpTClick(Sender: TObject);
var
  ExpTime, FPS : double;
begin
  ExpTime := StrToFloat(Edit_ExpT.Text)/1000;
  Form_Imager.SetExpTime(ExpTime,FPS);
  Edit_ExpT.Text := Format('%5.0f',[ExpTime*1000]);
//  SB_CT.SimpleText := 'FPS: '+Format('%3.3f',[FPS]);
end;

end.


