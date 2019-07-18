unit EnterUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, Buttons,StrUtils;

type
  TUserChange = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    UserName: TEdit;
    Password: TEdit;
    Image1: TImage;
    EnterBtn: TBitBtn;
    BitBtn2: TBitBtn;
    procedure UserNameKeyPress(Sender: TObject; var Key: Char);
    procedure CancelClick(Sender: TObject);
    procedure EnterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    counter:Integer;
    enteruser:boolean;
  end;

var
  UserChange: TUserChange;

implementation

uses User_Main, Unit1, Decode, KalaForosh, Unit13, Unit12,
  KalaSearch, Unit10, Unit11, Unit9, Unit19, Unit21, Unit2;

{$R *.DFM}
var checkclose:boolean;
procedure TUserChange.UserNameKeyPress(Sender: TObject; var Key: Char);
begin
if key=char(VK_RETURN) then Begin
   key:=#0;
   postmessage(Handle,WM_NEXTDLGCTL,0,0);
end;
end;

procedure TUserChange.CancelClick(Sender: TObject);
begin
checkclose:=true;
enteruser:=false;
Application.Terminate;
end;

procedure TUserChange.EnterClick(Sender: TObject);
var S,Spec:string;
    PassCls:TPass;
    Ability:integer;
begin
counter:=counter+1;
with Users.SQuery do begin
   s:=lowercase(username.text);
   sql.Clear;
   sql.add('select * from Users where uname='+quotedstr(s));
   open;

   if eof then begin
      messagedlg('˜Ï æÇÑÏ ÔÏå ãÚÊÈÑ äãí ÈÇÔÏ',mterror,[mbok],0);
      if counter>=3 then application.terminate;
      username.setfocus;
      abort;
   end
   else
   begin
      PassCls:=TPass.Create;
      Spec:=PassCls.Decode(fieldbyname('UName').AsString,
            Password.Text,'0');
      PassCls.Free;
      if fieldbyname('Spec').asstring=Spec then begin
        username.SetFocus;
        form1.User_Name:=lowercase(Fieldbyname('UName').asstring);
        checkclose:=true;

        //******Defining ability of the user
      With Form1 do
       begin
        //##########################################################
        Ability:=Ord(fieldbyname('Ability').AsString[1])-60;
        if (Ability and $1)=0 then
          begin
            ToolButton2.Enabled:=False;
            Form2.ToolButton2.Enabled:=False;
            N30.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
             ToolButton3.Enabled:=False;
             Form2.ToolButton3.Enabled:=False;
             N31.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
             ToolButton1.Enabled:=False;
             Form2.ToolButton1.Enabled:=False;
             N29.Enabled:=False;
             frmKalaForosh.SpeedButton5.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
             ToolButton5.Enabled:=False;
             Form2.ToolButton5.Enabled:=False;
             N18.Enabled:=False;
             Form13.SpeedButton5.Enabled:=False;
             Form12.SpeedButton6.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
             ToolButton4.Enabled:=False;
             Form2.ToolButton4.Enabled:=False;
             N5.Enabled:=False;
             Form12.SpeedButton1.Enabled:=False;
             Form12.SpeedButton2.Enabled:=False;
             Form12.SpeedButton3.Enabled:=False;
             Form12.SpeedButton4.Enabled:=False;
             Form12.SpeedButton5.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
             N27.Enabled:=False;
             frmKalaSearch.BitBtn1.Enabled:=False;
             frmKalaSearch.BitBtn3.Enabled:=False;
             frmKalaSearch.BitBtn4.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
             N3.Enabled:=False;
             Form12.BitBtn4.Enabled:=False;
             Form10.BitBtn1.Enabled:=False;
             Form10.BitBtn3.Enabled:=False;
             Form10.BitBtn4.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
             N2.Enabled:=False;
             Form11.BitBtn1.Enabled:=False;
             Form11.BitBtn3.Enabled:=False;
             Form11.BitBtn4.Enabled:=False;
          end;
        //##########################################################
        Ability:=Ord(fieldbyname('Ability').AsString[2])-60;
        if (Ability and $1)=0 then
          begin
           ToolButton13.Enabled:=False;
           Form2.ToolButton13.Enabled:=False;
           N11.Enabled:=False;
           form10.BitBtn6.Enabled:=false;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
           N17.Enabled:=False;
           N16.Enabled:=False;
           N12.Enabled:=False;
           Form1.ToolButton10.Enabled:=false;
           Form2.ToolButton10.Enabled:=false;
           form11.BitBtn6.Enabled:=false;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
           N22.Enabled:=False;
           N26.Enabled:=False;
           ToolButton15.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
            Form13.chkMarjo.Enabled:=false;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
           N24.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
           N19.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
           CD2.Enabled:=False;
           ToolButton8.Enabled:=False;
           Form2.ToolButton8.Enabled:=False;
           form19.BitBtn6.Enabled:=False;
           form21.BitBtn6.Enabled:=False;
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
           CD1.Enabled:=False;
           ToolButton6.Enabled:=False;
           Form2.ToolButton6.Enabled:=False;
          end;
        //##########################################################
        Ability:=Ord(fieldbyname('Ability').AsString[3])-60;
        if (Ability and $1)=0 then frmKalaSearch.BitBtn3.Enabled:=False;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then frmKalaSearch.BitBtn4.Enabled:=False;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then Form11.BitBtn3.Enabled:=False;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then Form11.BitBtn4.Enabled:=False;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then Form10.BitBtn3.Enabled:=False;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then Form10.BitBtn4.Enabled:=False;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
//          Form9.txtBedeh.Enabled:=False;
          Form10.BitBtn7.Enabled:=False;
          Form10.BitBtn8.Enabled:=False;
{          Form14.BitBtn2.Enabled:=False;
          Form14.BitBtn6.Enabled:=False;}
          end;
        Ability:=Ability shr 1;
        if (Ability and $1)=0 then
          begin
           ToolButton12.Enabled:=False;
           Form2.ToolButton12.Enabled:=False;
           N15.Enabled:=False;
          end;
       end;
        //*********************************************************
       Form1.statusbar.Panels[2].Text:=' ßÇÑÈÑ ÓíÓÊã : '+lowercase(UserName.Text);
       enteruser:=true;
       userchange.Hide;
       Form1.ShowModal;
       end
       else begin
         messagedlg('˜Ï æÇÑÏ ÔÏå ãÚÊÈÑ äãí ÈÇÔÏ',mterror,[mbok],0);
        if counter>=3 then application.terminate;
        password.setfocus;
        abort;
      end;
   end;
end;
end;

procedure TUserChange.FormShow(Sender: TObject);
begin
checkclose:=false;
enteruser:=false;
end;

procedure TUserChange.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=checkclose;
end;

procedure TUserChange.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
if key=char(VK_RETURN) then Begin
   key:=#0;
   EnterBtn.OnClick(Sender);
end;

end;

procedure TUserChange.FormCreate(Sender: TObject);
begin
counter:=0;
end;

end.
