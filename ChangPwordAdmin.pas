unit ChangPwordAdmin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ExtCtrls ,db;

type
  TChangPassAdmin = class(TForm)
    Save: TButton;
    closeform: TButton;
    Pass: TEdit;
    PassCheck: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PasswordNonce: TEdit;
    procedure closeformClick(Sender: TObject);
    procedure PasswordNonceKeyPress(Sender: TObject; var Key: Char);
    procedure SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChangPassAdmin: TChangPassAdmin;

implementation

uses User_Main, Decode;

{$R *.DFM}

procedure TChangPassAdmin.closeformClick(Sender: TObject);
begin
close;
end;

procedure TChangPassAdmin.PasswordNonceKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=char(VK_RETURN) then Begin
   key:=#0;
   postmessage(Handle,WM_NEXTDLGCTL,0,0);
end;
end;

procedure TChangPassAdmin.SaveClick(Sender: TObject);
var PassCls:TPass;
    Spec:String;
begin
with Users.SQuery do
  begin
    PassCls:=TPass.Create;
    Spec:=PassCls.Decode('admin',PasswordNonce.Text,'110');
    PassCls.Free;
    sql.Clear;
    sql.Add('select * from Users where  UName='+Quotedstr('admin'));
    open;

    if Eof then begin
      showmessage('ÊÃÊœ ‰«”«“ê«—Ì œ— »«‰ﬂ');
      exit;
    end;

    if FieldByName('Spec').AsString<>Spec then
    begin
      showmessage('—„“ Ê«—œ ‘œÂ «‘ »«Â «” ');
      PasswordNonce.SetFocus;
      exit;
    end;
    if (pass.Text=PassCheck.Text) and (Pass.text<>'') then
    begin
      PassCls:=TPass.Create;
      Spec:=PassCls.Decode('admin',Pass.Text,'110');
      PassCls.Free;
      Spec:=StringReplace(Spec,'''','''''', [rfReplaceAll]);
      sql.Clear;
      sql.Add('Update Users Set Spec='''+Spec+''' where UName='+Quotedstr('admin'));
      execsql;
    end
    else
    begin
       showmessage('!⁄œ„ „ÿ«»ﬁ  —„“ Ê  «∆Ìœ —„“');
       Pass.SetFocus;
       exit;
    end;
    end;
close;
end;

end.
