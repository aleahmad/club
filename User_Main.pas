unit User_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, DB, ADODB, ImgList, DBTables;

type
  TUsers = class(TForm)
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
    ImageList: TImageList;
    N8: TMenuItem;
    Query: TADOQuery;
    SQuery: TADOQuery;
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  end;

var
  Users: TUsers;

implementation

uses User_Insert, ChangPwordAdmin, Adminpassword, Decode, Unit1;

{$R *.dfm}

resourcestring
    InconsistMsg='ÊÃÊœ ‰«”«“ê«—Ì œ— »«‰ﬂ';


procedure TUsers.N4Click(Sender: TObject);
begin
close;
end;

procedure TUsers.N1Click(Sender: TObject);
begin
UserInsert := TUserInsert.Create(Self);
try
UserInsert.ShowModal;
finally
UserInsert.Free;
end;
end;

procedure TUsers.N2Click(Sender: TObject);
var Pass:TPass;
    UName,SPass,SCode:string;
    i,Ability:integer;
begin
if Query.IsEmpty then exit;
Pass:=TPass.Create;
Pass.Encode(Query.fieldbyname('Spec').asstring,UName,SPass,SCode);
Pass.Free;
if (UName<>Query.fieldbyname('UName').AsString)then
   begin
      ShowMessage(InconsistMsg);
      Exit;
   end;
UserInsert := TUserInsert.Create(Self);
if Query.FieldByName('UName').AsString='„œÌ—' then UserInsert.PAbility.Enabled:=false;
try
with userinsert do begin
  NameU.Text:=Query.fieldbyname('UName').AsString;
  NameU.Tag:=StrtoInt(SCode);
  LastPass:=SPass;
  Pass.Text:='**********';
  NameU.Enabled:=false;
  NameU.Color:=clBtnFace;
  Ability:=Ord(Query.fieldbyname('Ability').AsString[1])-60;
  for i:=7 downto 0 do
  begin
    if (Ability and $1)=1 then
        PAbility.Checked[i]:=True;
    Ability:=Ability shr 1;
  end;
  Ability:=Ord(Query.fieldbyname('Ability').AsString[2])-60;
  for i:=15 downto 8 do
  begin
    if (Ability and $1)=1 then
        PAbility.Checked[i]:=True;
    Ability:=Ability shr 1;
  end;
  Ability:=Ord(Query.fieldbyname('Ability').AsString[3])-60;
  for i:=PAbility.Count-1 downto 16 do
  begin
    if (Ability and $1)=1 then
        PAbility.Checked[i]:=True;
    Ability:=Ability shr 1;
  end;
  ShowModal;
end;
finally
UserInsert.Free;
end;
end;

procedure TUsers.N8Click(Sender: TObject);
begin
if Query.IsEmpty then exit;
if Query.FieldByName('UName').AsString='„œÌ—' then
  begin
  Messagedlg('ò«—»— „œÌ— —« ‰„Ì  Ê«‰ Õ–› ò—œ',mtError,[mbOK],0);
  exit
  end;
if messagedlg('¬Ì« «“ «Ì‰ ò«— «ÿ„Ì‰«‰ œ«—Ìœ',mtwarning,[mbyes,mbno],0)=mrno then exit;
SQuery.SQL.Clear;
SQuery.SQL.Text:=('Delete from Users where UName='+QuotedStr(Query.FieldByName('UName').AsString));
SQuery.ExecSQL;
Query.Close;
Query.Open;
end;

procedure TUsers.FormShow(Sender: TObject);
begin
Query.Close;
Query.Open;
end;

procedure TUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Query.Close;
end;

end.
