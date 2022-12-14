unit Unit_Shutter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IniFiles, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm_Shutter = class(TForm)
    SB: TStatusBar;
    IdTCPClient: TIdTCPClient;
    Panel1: TPanel;
    CB_Connect: TCheckBox;
    Edit_IP: TEdit;
    Label1: TLabel;
    Edit_Addr: TEdit;
    UD_Addr: TUpDown;
    Panel2: TPanel;
    BB_OPEN: TBitBtn;
    BB_CLOSE: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    Label_ST: TLabel;
    RB_STR: TRadioButton;
    RB_16C: TRadioButton;
    Edit_OP: TEdit;
    Edit_CP: TEdit;
    Label3: TLabel;

    function Connect(IP,Port:string): boolean;
    function DisConnect: boolean;

    procedure Prologic_Init;

    procedure GetStatus(Sender: TObject);
    procedure BB_OPENClick(Sender: TObject);
    procedure BB_CLOSEClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CB_ConnectClick(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form_Shutter: TForm_Shutter;


implementation

{$R *.dfm}

{ TForm_Shutter }

procedure TForm_Shutter.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Top     := Ini.ReadInteger( 'Form_Shutter', 'Top', 100 );
    Left    := Ini.ReadInteger( 'Form_Shutter', 'Left', 100 );
    if Ini.ReadBool( 'Form_Shutter', 'InitMax', false ) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;

    Edit_IP.Text := Ini.ReadString('Shutter', 'IP', '10.7.3.130');
    UD_Addr.Position := Ini.ReadInteger('Shutter', 'GPIB', 7);
    if Ini.ReadString('Shutter','Inst','STR5')='STR5' then
      RB_STR.Checked := true
    else
      RB_16C.Checked := true;
    Edit_OP.Text := Ini.ReadString('Shutter', 'OPEN_P', '70');
    Edit_CP.Text := Ini.ReadString('Shutter', 'CLOSE_P', '0');
  finally
    Ini.Free;
  end;
end;


procedure TForm_Shutter.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteInteger( 'Form_Shutter', 'Top', Top);
    Ini.WriteInteger( 'Form_Shutter', 'Left', Left);
    Ini.WriteBool( 'Form_Shutter', 'InitMax', WindowState = wsMaximized );

    Ini.WriteString('Shutter', 'IP', Edit_IP.Text );
    Ini.WriteInteger('Shutter', 'GPIB', UD_Addr.Position);

    Ini.WriteString('Shutter', 'OPEN_P', Edit_OP.Text);
    Ini.WriteString('Shutter', 'CLOSE_P', Edit_CP.Text);
    if RB_16C.Checked then
      Ini.WriteString('Shutter','Inst','PM16C')
    else
      Ini.WriteString('Shutter','Inst','STR5');

  finally
    Ini.Free;
  end;

end;

function TForm_Shutter.Connect(IP, Port: string): boolean;
begin
  IdTCPClient.Host := IP;
  IdTCPClient.Port := StrToInt(Port);
  IdTCPClient.Connect;
  if IdTCPClient.Connected then
    Connect := true
  else
    Connect := false;
end;

function TForm_Shutter.DisConnect: boolean;
begin
  IdTCPClient.Disconnect;
  if IdTCPClient.Connected then
    DisConnect := true
  else
    DisConnect := false;
end;

procedure TForm_Shutter.Prologic_Init;
begin
    //Prologic init
  IdTCPClient.IOHandler.WriteLn('++mode 1'+CHR(10));
  IdTCPClient.IOHandler.WriteLn('++auto 1'+CHR(10));
  IdTCPClient.IOHandler.WriteLn('++ifc'+CHR(10));

  IdTCPClient.IOHandler.WriteLn('++addr '+UD_Addr.Position.ToString+CHR(10));

  IdTCPClient.IOHandler.WriteLn('R'+CHR(13)+CHR(10)+CHR(10));
//  IdTCPClient.IOHandler.ReadLn();
end;

procedure TForm_Shutter.GetSTatus(Sender: TObject);
var
  TmpStr : string;
begin
  IdTCPClient.IOHandler.WriteLn('ST'+CHR(13)+CHR(10)+CHR(10));
  TmpStr := IdTCPClient.IOHandler.ReadLn();
  SB.SimpleText := TmpStr;

  if TmpStr[2] <> '0' then
  begin
    Label_ST.Caption := 'OPEN';
    Label_ST.Font.Color := clRed;
  end
  else
  begin
    Label_ST.Caption := 'CLOSE';
    Label_ST.Font.Color := clBlue;
  end;
end;





procedure TForm_Shutter.CB_ConnectClick(Sender: TObject);
var
  GetPos: longint;
begin
  //クリックした後の状態でコーディング
  if CB_Connect.checked then
  begin
    if RB_STR.Checked then
    begin
      if Connect(Edit_IP.Text,'1234') then
      begin
        Form_Shutter.Prologic_Init;
        Form_Shutter.GetStatus(Sender);
        BB_OPEN.Enabled := true;
        BB_CLOSE.Enabled := true;
      end
      else
      begin
        ShowMessage('Could NOT Connectet to STR5!');
      end;
    end
    else
    begin
      if Connect(Edit_IP.Text,'7777') then
      begin
        BB_OPEN.Enabled := true;
        BB_CLOSE.Enabled := true;
        IdTCPClient.IOHandler.WriteLn('PS?'+IntToHex(UD_Addr.Position,1)+CHR(13)+CHR(10));
        GetPos := StrToInt(IdTCPClient.IOHandler.ReadLn());
        if GetPos.ToString = Edit_OP.Text then
        begin
          Label_ST.Caption := 'OPEN';
          Label_ST.Font.Color := clRed;
        end;
        if GetPos.ToString = Edit_CP.Text then
        begin
          Label_ST.Caption := 'CLOSE';
          Label_ST.Font.Color := clBlue;
        end;
      end
      else
      begin
        ShowMessage('Could NOT Connectet to PM16C!');
      end;
    end
  end
  else
  begin
    DisConnect;

    Label_ST.Caption := '--';
    Label_ST.Font.Color := clGreen;
  end;
end;

procedure TForm_Shutter.BB_CLOSEClick(Sender: TObject);
begin
  if RB_STR.Checked then
  begin
    repeat
      IdTCPClient.IOHandler.WriteLn('SOP1'+CHR(13)+CHR(10)+CHR(10));
      IdTCPClient.IOHandler.ReadLn();
      Sleep(200);

      GetSTatus(Sender);
      Sleep(200);

    until Label_ST.Caption = 'CLOSE';
  end
  else
  begin
    IdTCPClient.IOHandler.WriteLn('ABS'+IntToHex(UD_Addr.Position,1)+Edit_CP.Text+CHR(13)+CHR(10));
    Sleep(1000);
    Label_ST.Caption := 'CLOSE';
    Label_ST.Font.Color := clBlue;
  end;
end;

procedure TForm_Shutter.BB_OPENClick(Sender: TObject);
begin
  if RB_STR.Checked then
  begin
    repeat
      IdTCPClient.IOHandler.WriteLn('SCL1'+CHR(13)+CHR(10)+CHR(10));
      IdTCPClient.IOHandler.ReadLn();
      Sleep(200);

      GetSTatus(Sender);
      Sleep(200);
    until Label_ST.Caption = 'OPEN';
  end
  else
  begin
    IdTCPClient.IOHandler.WriteLn('ABS'+IntToHex(UD_Addr.Position,1)+Edit_OP.Text+CHR(13)+CHR(10));
    Sleep(1000);
    Label_ST.Caption := 'OPEN';
    Label_ST.Font.Color := clRed;
  end;
end;


end.
