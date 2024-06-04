program AutoTranslatorDemo;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
  Forms,
  FormMain in 'FormMain.pas' {frmTester},
  ccAppData;

{$R *.res}

begin
  Application.Initialize;
  AppData:= TAppData.Create('Cubic Automatic Translator');
  AppData.CreateMainForm(TfrmTester, frmTester, TRUE);
  Application.Run;
end.
