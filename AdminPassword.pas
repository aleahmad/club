unit Adminpassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TPasswordAdmin = class(TForm)
    Label2: TLabel;
    Pass: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure CancelClick(Sender: TObject);
    procedure EnterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    counter:Integer;
    { Public declarations }
  end;

var
  PasswordAdmin: TPasswordAdmin;

implementation

uses User_Main, Decode;


var cclose:boolean;
{$R *.DFM}

procedure TPasswordAdmin.CancelClick(Sender: TObject);
begin
application.Terminate;
end;

procedure TPasswordAdmin.EnterClick(Sender: TObject);
var Spec:string;
    PassCls:TPass;
begin
counter:=counter+1;
with Users.SQuery do begin
    PassCls:=TPass.Create;
    Spec:=PassCls.Decode('admin',Pass.Text,'110');
    PassCls.Free;
    sql.Clear;
    sql.Add('select * from Users where UName='+QuotedStr('admin'));
    open;

    if Eof then begin
      showmessage('ÊÃÊœ ‰«”«“ê«—Ì œ— »«‰ﬂ');
      Application.Terminate;
    end;

    if FieldByName('Spec').AsString<>Spec then
    begin
      messagedlg('—„“ ‰«„⁄ »—',mterror,[mbok],0);
      if counter>=3 then application.terminate;
      pass.setfocus;
      abort;
    end
    else
    begin
          cclose:=true;
          passwordadmin.close;
    end;
end;
end;

procedure TPasswordAdmin.FormActivate(Sender: TObject);
begin
counter:=0;
cclose:=false;
end;

procedure TPasswordAdmin.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=cclose;
end;

end.
