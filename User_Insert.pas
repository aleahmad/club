unit User_Insert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons, ExtCtrls,math;

type
  TUserInsert = class(TForm)
    Label2: TLabel;
    Label5: TLabel;
    NameU: TEdit;
    Pass: TEdit;
    Label4: TLabel;
    PAbility: TCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Shape1: TShape;
    procedure Button2Click(Sender: TObject);
    procedure NameUKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure PassKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Spec,LastPass:string;
    { Public declarations }
  end;

var
  UserInsert: TUserInsert;

implementation

uses User_Main, ADODB, Decode;

{$R *.dfm}

procedure TUserInsert.Button2Click(Sender: TObject);
begin
close;
end;

procedure TUserInsert.NameUKeyPress(Sender: TObject; var Key: Char);
begin
if key=char(VK_RETURN) then Begin
   key:=#0;
   postmessage(Handle,WM_NEXTDLGCTL,0,0);
end;

end;

procedure TUserInsert.Button1Click(Sender: TObject);
var Pass:TPass;
    BAbility:String;
    i:integer;
    MAbil:byte;
begin
with Users.SQuery do
  begin
   if nameu.Enabled then begin
    sql.Clear;
    sql.Add('select * from Users where UName='''+Trim(LowerCase(NameU.Text))+'''');
    open;
    if not eof then begin
       showmessage('‰«„ Ê«—œ ‘œÂ  ﬂ—«—Ì «” ');
       NameU.SetFocus;
       exit;
    end;
    end;
    Pass:=TPass.Create;
    Spec:=Pass.Decode(NameU.Text,LastPass,inttostr(NameU.Tag));
    Pass.Free;
    BAbility:='';
    MAbil:=0;
    for i:=0 to 7 do
    begin
       MAbil:=MAbil shl 1;
       if PAbility.Checked[i] then
          MAbil:=MAbil xor 1;
    end;
    BAbility:=BAbility+chr(MAbil+60);
    MAbil:=0;
    for i:=8 to 15 do
    begin
       MAbil:=MAbil shl 1;
       if PAbility.Checked[i] then
          MAbil:=MAbil xor 1;
    end;
    BAbility:=BAbility+chr(MAbil+60);
    MAbil:=0;
    for i:=16 to PAbility.Items.Count-1 do
    begin
       MAbil:=MAbil shl 1;
       if PAbility.Checked[i] then
          MAbil:=MAbil xor 1;
    end;
    BAbility:=BAbility+chr(MAbil+60);

    Users.SQuery.SQL.Clear;
    Users.SQuery.SQL.Text:=('Delete from Users where UName='''+LowerCase(NameU.Text)+'''');
    Users.SQuery.ExecSQL;
    Users.SQuery.SQL.Text:=('INSERT INTO Users('+
         'UName,'+
         'Spec,'+
         'Ability)'+
         'VALUES('''+
          Trim(LowerCase(NameU.Text))+''','+
         ':Spec,'+
         ':Ability)');
    Users.SQuery.Parameters.ParamByName('Spec').Value:=Spec;
    Users.SQuery.Parameters.ParamByName('Ability').Value:=BAbility;
    Users.SQuery.ExecSQL;
  end;
Users.Query.Close;
Users.Query.Open;
close;
end;

procedure TUserInsert.PassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
LastPass:=Pass.Text;
end;

end.
