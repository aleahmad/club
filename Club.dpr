program Club;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9},
  Unit10 in 'Unit10.pas' {Form10},
  Unit11 in 'Unit11.pas' {Form11},
  Unit12 in 'Unit12.pas' {Form12},
  Unit13 in 'Unit13.pas' {Form13},
  Unit17 in 'Unit17.pas' {Form17},
  Unit18 in 'Unit18.pas' {Form18},
  Unit19 in 'Unit19.pas' {Form19},
  Unit20 in 'Unit20.pas' {Form20},
  Unit21 in 'Unit21.pas' {Form21},
  Unit22 in 'Unit22.pas' {Form22},
  Unit23 in 'Unit23.pas' {Form23},
  Unit24 in 'Unit24.pas' {Form24},
  Unit25 in 'Unit25.pas' {Form25},
  KalaSabt in 'KalaSabt.pas' {frmKalaSabt},
  KalaSearch in 'KalaSearch.pas' {frmKalaSearch},
  KalaForosh in 'KalaForosh.pas' {frmKalaForosh},
  Hazine in 'Hazine.pas' {frmHazine},
  Decode in 'Decode.pas',
  User_Insert in 'User_Insert.pas' {UserInsert},
  User_Main in 'User_Main.pas' {Users},
  EnterUser in 'EnterUser.pas' {UserChange},
  CheckRegister in 'CheckRegister.pas' {RegisterCheck},
  Enter_Code in 'Enter_Code.pas' {EnterCode},
  IdeSN in 'IdeSN.pas',
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Club';
  Application.CreateForm(TUserChange, UserChange);
  Application.CreateForm(TForm25, Form25);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm24, Form24);
  Application.CreateForm(TUsers, Users);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfrmKalaSabt, frmKalaSabt);
  Application.CreateForm(TfrmKalaSearch, frmKalaSearch);
  Application.CreateForm(TfrmKalaForosh, frmKalaForosh);
  Application.CreateForm(TfrmHazine, frmHazine);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
