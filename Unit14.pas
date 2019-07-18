unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, ExtCtrls, Db, DBTables, ActnList, ComCtrls;

type
  TForm14 = class(TForm)
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    CapBedeh: TLabel;
    Bevel2: TBevel;
    Action3: TAction;
    Action4: TAction;
    BitBtn4: TBitBtn;
    Action5: TAction;
    MemCDList: TRichEdit;
    txtPardakhti: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure txtPardakhtiKeyPress(Sender: TObject; var Key: Char);
    procedure MemCDListKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    MembCode:String;
  end;

var
  Form14: TForm14;

implementation

uses Unit13, Unit1, Unit8, Unit25, Unit9;

{$R *.DFM}

procedure TForm14.BitBtn3Click(Sender: TObject);
begin
Label13.Caption:='C';
close;
end;

procedure TForm14.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
label13.caption:='';
form9.table1.Open;
form9.table1.IndexFieldNames:='membcode';
form9.table1.FindKey([MembCode]);
capBedeh.Caption:='„»·€ »œÂÌ ò‰Ê‰Ì ›—œ= '+form9.table1.FieldByName('Bedeh').AsString;
form9.table1.Close;
MemCDList.SetFocus;
end;

procedure TForm14.SpinEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm14.BitBtn6Click(Sender: TObject);
var
S:String;
i:integer;
begin
form9.Table1.Open;
if form9.table1.IsEmpty then
      begin
      showmessage('ÂÌç „‘ —ÌÌ ÊÃÊœ ‰œ«—œ');
      exit;
      end;
If Not InputQuery('«÷«›Â ﬂ—œ‰ „»·€ »œÂÌ ›—œ','„»·€ „Ê—œ ‰Ÿ— «‰ —« »Â  Ê„«‰ Ê«—œ ﬂ‰Ìœ',S) then exit;
if (length(trim(S))=0)or(StrtoInt(trim(S))=0) then exit;
For i:= 1 to Length(s) do
        begin
        if Not (S[i] in ['0','1','2','3','4','5','6','7','8','9']) then
                begin
                MessageDlg('⁄œœ Ê«—œ ‘œÂ „⁄ »— ‰Ì” . ⁄„·Ì«  «‰Ã«„ ‰‘œ',mtError,[mbOk],0);
                exit;
                end;
        end;
form9.table1.IndexFieldNames:='membcode';
form9.table1.FindKey([MembCode]);
form9.table1.edit;
form9.table1.FieldByName('Bedeh').AsInteger:=form9.table1.FieldByName('Bedeh').AsInteger+StrtoInt(S);
form9.table1.post;
FormShow(Nil);
end;

procedure TForm14.BitBtn2Click(Sender: TObject);
var
S:String;
i:integer;
begin
form9.Table1.Open;
if form9.table1.IsEmpty then
      begin
      showmessage('ÂÌç „‘ —ÌÌ ÊÃÊœ ‰œ«—œ');
      exit;
      end;
If Not InputQuery('ﬂ„ ﬂ—œ‰ «“ „»·€ »œÂÌ','„»·€ „Ê—œ ‰Ÿ— «‰ —« »Â  Ê„«‰ Ê«—œ ﬂ‰Ìœ',S) then exit;
if (length(trim(S))=0)or(StrtoInt(trim(S))=0) then exit;
For i:= 1 to Length(s) do
        begin
        if Not (S[i] in ['0','1','2','3','4','5','6','7','8','9']) then
                begin
                MessageDlg('⁄œœ Ê«—œ ‘œÂ „⁄ »— ‰Ì” . ⁄„·Ì«  «‰Ã«„ ‰‘œ',mtError,[mbOk],0);
                exit;
                end;
        end;
form9.table1.IndexFieldNames:='membcode';
form9.table1.FindKey([MembCode]);
form9.table1.edit;
form9.table1.FieldByName('Bedeh').AsInteger:=form9.table1.FieldByName('Bedeh').AsInteger-StrtoInt(S);
form9.table1.post;
form13.table1.Open;
form13.table1.append;
form13.table1.FieldByName('regcode').asstring:='»œÂÌ „‘ —Ì';
form13.table1.FieldByName('pay').AsInteger:=StrtoInt(S);
form13.table1.FieldByName('membcode').asstring:=form9.table1.FieldByName('membcode').asstring;
form13.table1.FieldByName('retdate').asstring:=form1.label1.caption;
form13.table1.FieldByName('UserName').asstring:=Form1.User_Name;
form13.table1.post;
form13.table1.Close;
form9.Table1.Close;
FormShow(Nil);
end;

procedure TForm14.BitBtn4Click(Sender: TObject);
begin
if form1.PrinterSetupDialog1.execute then MemCDList.Print('’Ê—  Õ”«» „‘ —Ì');
end;

procedure TForm14.txtPardakhtiKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#13,#8]) then key:=#0;
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm14.MemCDListKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtPardakhti.SetFocus;
end;

end.
