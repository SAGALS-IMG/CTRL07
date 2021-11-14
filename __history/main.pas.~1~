unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, IniFiles;

type
  TForm_main = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    BB_Imager: TBitBtn;
    BB_Shutter: TBitBtn;
    BB_Counter: TBitBtn;
    BB_PM16C: TBitBtn;
    BB_Macro: TBitBtn;
    BB_CT: TBitBtn;
    BB_Scan: TBitBtn;
    BB_Option: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    SB_Log_Save: TSpeedButton;
    CB_Auto_Save: TCheckBox;
    Memo: TRichEdit;
    StatusBar1: TStatusBar;
    SaveDialog1: TSaveDialog;
    CB_Log: TCheckBox;
    SB_Help: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SB_Log_SaveClick(Sender: TObject);
    procedure BB_ImagerClick(Sender: TObject);
    procedure BB_PM16CClick(Sender: TObject);
    procedure BB_CounterClick(Sender: TObject);
    procedure BB_ShutterClick(Sender: TObject);
    procedure BB_MacroClick(Sender: TObject);
    procedure BB_OptionClick(Sender: TObject);
    procedure BB_ScanClick(Sender: TObject);
    procedure BB_CTClick(Sender: TObject);
    procedure SB_HelpClick(Sender: TObject);

  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  Form_main: TForm_main;

implementation

{$R *.dfm}

uses Unit_Imager, Unit_PM16C, Unit_CT48, Unit_Shutter, unit_macro,
  Unit_Scan, Unit_ACT, Unit_PW, Unit_Ph_PW, Unit_SAKAS, Unit_ABOUT;

procedure TForm_main.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Top     := Ini.ReadInteger( 'Form_Main', 'Top', 100 );
    Left    := Ini.ReadInteger( 'Form_Main', 'Left', 100 );
    if Ini.ReadBool( 'Form_Main', 'InitMax', false ) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;

    CB_Auto_Save.Checked := Ini.ReadBool('Form_Main','Auto_Log',false);
    CB_Log.Checked := Ini.ReadBool('Form_Main','Logging',false);
    BB_Shutter.Visible := Ini.ReadBool('Form_Main','Shutter',false);
  finally
    Ini.Free;
  end;

  Memo.Lines.Add('CTRL7 started at '+DateTimeToStr(Now));
end;

procedure TForm_main.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
  TmpStr : string;
begin
  if CB_Auto_Save.Checked then
  begin
    DateTimeToString(TmpStr,'yyyy_mm_dd_hh_nn_ss',Now);
    Memo.Lines.SaveToFile(ExtractFileDir(Application.ExeName)+'/'+TmpStr+'.log');
  end;

  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteInteger( 'Form_Main', 'Top', Top);
    Ini.WriteInteger( 'Form_Main', 'Left', Left);
    Ini.WriteBool( 'Form_Main', 'InitMax', WindowState = wsMaximized );

    Ini.WriteBool('Form_Main','Auto_Log',CB_Auto_Save.Checked);
    Ini.WriteBool('Form_Main','Logging',CB_Log.Checked);
  finally
    Ini.Free;
  end;
end;

procedure TForm_main.SB_HelpClick(Sender: TObject);
begin
  AboutBox.Show;
end;

procedure TForm_main.SB_Log_SaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Memo.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm_main.BB_PM16CClick(Sender: TObject);
begin
  Form_PM16C.Show
end;

procedure TForm_main.BB_CounterClick(Sender: TObject);
begin
  Form_CT48.Show;
end;

procedure TForm_main.BB_ShutterClick(Sender: TObject);
begin
  Form_Shutter.Show;
end;

procedure TForm_main.BB_ImagerClick(Sender: TObject);
begin
  Form_Imager.Show;
  Form_PW.Show;
end;


procedure TForm_main.BB_ScanClick(Sender: TObject);
begin
  Form_Scan.Show;
end;

procedure TForm_main.BB_CTClick(Sender: TObject);
begin
  Form_ACT.Show;
end;

procedure TForm_main.BB_MacroClick(Sender: TObject);
begin
  Form_Macro.Show;
end;

procedure TForm_main.BB_OptionClick(Sender: TObject);
begin
  Form_SAKAS.Show;
end;

end.



