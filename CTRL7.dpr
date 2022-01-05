
program CTRL7;

uses
  Vcl.Forms,
  Unit_Imager in 'Unit_Imager.pas' {Form_Imager},
  Unit_CT48 in 'Unit_CT48.pas' {Form_CT48},
  unit_macro in 'unit_macro.pas' {Form_Macro},
  Unit_PM16C in 'Unit_PM16C.pas' {Form_PM16C},
  Unit_PM16C_Op in 'Unit_PM16C_Op.pas' {Form_PM16C_Op},
  Unit_Shutter in 'Unit_Shutter.pas' {Form_Shutter},
  Unit_Scan in 'Unit_Scan.pas' {Form_Scan},
  Unit_ACT in 'Unit_ACT.pas' {Form_ACT},
  Unit_Status in 'Unit_Status.pas' {Form_Status},
  Unit_PM16C_Table in 'Unit_PM16C_Table.pas' {Form_16C_Table},
  Unit_Ph_PW in 'Unit_Ph_PW.pas' {Form_Ph_PW},
  Unit_ABOUT in 'Unit_ABOUT.pas' {AboutBox},
  Unit_LP in '..\SAKAS-COM\Unit_LP.pas' {Form_LP},
  Unit_PW in '..\SAKAS-COM\Unit_PW.pas' {Form_PW},
  Unit_SAKAS in '..\SAKAS-COM\Unit_SAKAS.pas' {Form_SAKAS},
  main in 'main.pas' {Form_main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'CTRL_07';
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(TForm_Imager, Form_Imager);
  Application.CreateForm(TForm_CT48, Form_CT48);
  Application.CreateForm(TForm_Macro, Form_Macro);
  Application.CreateForm(TForm_PM16C, Form_PM16C);
  Application.CreateForm(TForm_PM16C_Op, Form_PM16C_Op);
  Application.CreateForm(TForm_Shutter, Form_Shutter);
  Application.CreateForm(TForm_Scan, Form_Scan);
  Application.CreateForm(TForm_ACT, Form_ACT);
  Application.CreateForm(TForm_Status, Form_Status);
  Application.CreateForm(TForm_16C_Table, Form_16C_Table);
  Application.CreateForm(TForm_Ph_PW, Form_Ph_PW);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm_PW, Form_PW);
  Application.CreateForm(TForm_SAKAS, Form_SAKAS);
  Application.Run;
end.
