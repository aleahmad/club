unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons,
  ActnList;

type
  TForm10 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn1: TBitBtn;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    RadioButton3: TRadioButton;
    Edit3: TEdit;
    Panel3: TPanel;
    Label12: TLabel;
    capMojodi: TLabel;
    Shape1: TShape;
    BitBtn6: TBitBtn;
    Action7: TAction;
    RadioButton4: TRadioButton;
    Edit4: TEdit;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Change(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RadioButton4Click(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4Change(Sender: TObject);

  private
    { Private declarations }
  public
       { Public declarations }
           procedure ListAmanat(MemberCode:string; Zaman:String);
           procedure HesabMoshtari(Mablagh:String; Sharh:String; Bestan:integer);
  end;

var
  Form10: TForm10;

implementation

uses Unit9, Unit8, Unit12, Unit13, Unit1, Unit18, Unit17, Unit22, Unit20,
  Unit19, adodb, KalaForosh;

{$R *.DFM}

procedure TForm10.HesabMoshtari(Mablagh:String; Sharh:String; Bestan:integer);
begin
//moshtari should be searched before
form9.table1.edit;
form9.table1.FieldByName('Bedeh').AsInteger:=form9.table1.FieldByName('Bedeh').AsInteger-(Bestan*StrtoInt(Mablagh));
form9.table1.post;
form13.table1.Open;
form13.table1.append;
if (Bestan=1) then
  form13.table1.FieldByName('regcode').asstring:='«›“«Ì‘ „ÊÃÊœÌ:' + Sharh
  else
  form13.table1.FieldByName('regcode').asstring:='ﬂ‹‹«Â‘ „ÊÃÊœÌ:' + Sharh;

form13.table1.FieldByName('pay').AsInteger:=Bestan*StrtoInt(Mablagh);
form13.table1.FieldByName('membcode').asstring:=form9.table1.FieldByName('membcode').asstring;
form13.table1.FieldByName('UserName').asstring:=Form1.User_Name;
form13.table1.FieldByName('retdate').asstring:=form1.label1.caption;
form13.table1.post;
form13.table1.Close;
end;

procedure TForm10.ListAmanat(MemberCode:string; Zaman:String);
begin
form18.QueryCDBank.Close;
form18.QueryCDBank.SQL.Clear;
if (Zaman='current') then
  begin
  form18.QueryCDBank.SQL.text:=('SELECT cdbank.*,borrow.borodate FROM cdbank LEFT JOIN borrow ON cdbank.Regcode = borrow.RegCode  where  ');
  form18.QueryCDBank.SQL.Add('  (borrow.RegCode>=" " and borrow.RegCode<="ZZZZZZZZ") and (borrow.membcode=:mcode) order by borrow.borodate desc;');
  end
  else
  begin
  form18.QueryCDBank.SQL.text:=('SELECT cdbank.*,payment.borodate FROM cdbank LEFT JOIN payment ON cdbank.Regcode = payment.RegCode  where  ');
  form18.QueryCDBank.SQL.Add('  (payment.RegCode>=" " and payment.RegCode<="ZZZZZZZZ") and (payment.membcode=:mcode) order by payment.borodate desc;');
  end;

form18.QueryCDBank.Parameters.ParamByName('mcode').Value:=MemberCode;
//form18.QueryCDBank.Prepare;
form18.QueryCDBank.Open;

form18.QRLabel18.Enabled:=false;
form18.QRLabel14.Enabled:=false;
form18.QRLabel17.Enabled:=false;
form18.QRLabel19.Enabled:=false;
form18.QRLabel3.Enabled:=false;
form18.QRLabel4.Enabled:=false;
form18.QRLabel5.Enabled:=false;
form18.QRLabel6.Enabled:=false;
form18.QRLabel36.Caption:=' «—ÌŒ «„«‰ ';
form18.QRDBText15.DataField:='borodate';
form19.DBGrid1.Columns[5].Title.Caption:=' «—ÌŒ «„«‰ ';
form19.DBGrid1.Columns[5].FieldName:='borodate';
form19.DBGrid1.Refresh;
form19.showmodal;
form19.DBGrid1.Columns[5].Title.Caption:=' «—ÌŒ À» ';
form19.DBGrid1.Columns[5].FieldName:='regdate';
form19.DBGrid1.Refresh;
form18.QRLabel36.Caption:=' «—ÌŒ Œ—Ìœ';
form18.QRDBText15.DataField:='buydate';
form18.QueryCDBank.Close;
end;

procedure TForm10.RadioButton2Click(Sender: TObject);
begin
RadioButton2.Checked:=true;
form9.table1.IndexFieldNames:='Family';
edit2.SetFocus;
edit2.SelectAll;
end;

procedure TForm10.RadioButton1Click(Sender: TObject);
begin
RadioButton1.Checked:=true;
form9.table1.IndexFieldNames:='membcode';
edit1.SetFocus;
edit1.SelectAll;
end;

procedure TForm10.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm10.BitBtn3Click(Sender: TObject);
var check:byte;
begin
if form9.table1.IsEmpty then
      begin
      showmessage('ÂÌç „‘ —ÌÌ ÊÃÊœ ‰œ«—œ');
      exit;
      end;
//form9.txtMoney.Enabled:=false;
//form9.chkIsSub.Enabled:=false;
form9.edit1.Text:=form18.CodeTrimZero(form9.table1.fieldbyname('membcode').AsString);
form9.maskedit1.Text:=form9.table1.fieldbyname('regdate').AsString;
form9.txtName.text:=form9.table1.fieldbyname('name').AsString;
form9.txtFamily.text:=form9.table1.fieldbyname('Family').AsString;
form9.txtTozih.text:=form9.table1.fieldbyname('Tozih').AsString;
form9.edit3.text:=form9.table1.fieldbyname('noshen').AsString;
form9.edit6.text:=form9.table1.fieldbyname('homeadd').AsString;
form9.maskedit3.text:=form9.table1.fieldbyname('hometel').AsString;
//form9.txtBedeh.text:=form9.table1.fieldbyname('Bedeh').AsString;
if form9.table1.fieldbyname('IsActive').AsString='*' then
      form9.chkInActive.Checked:=true
    else
      form9.chkInActive.Checked:=false;
if form9.table1.fieldbyname('IsSub').AsString='*' then
      form9.chkIsSub.Checked:=true
    else
      form9.chkIsSub.Checked:=false;
form9.txtMoney.Text:=form9.table1.fieldbyname('SubMoney').AsString;
form9.BitBtn1.Visible:=false;
form9.BitBtn3.Visible:=true;
label1.caption:=form9.table1.fieldbyname('membcode').AsString;
form9.showmodal;
//form9.txtMoney.Enabled:=true;
//form9.chkIsSub.Enabled:=true;
//form9.table1.IndexFieldNames := '';
form9.table1.open;
form9.table1.IndexFieldNames:='membcode';
Form9.Table1.Locate('membcode',label1.caption,[loPartialKey]);
label1.caption:='';
end;

procedure TForm10.FormShow(Sender: TObject);
begin
form9.table1.Close;
//form9.table1.IndexFieldNames := '';
form9.table1.open;
//form8.table1.IndexFieldNames := '';
form8.table1.Close;
form8.table1.open;
//form12.table1.IndexFieldNames := '';
form12.table1.Close;
form12.table1.Open;
Edit1.Text:='';
Edit2.Text:='';
//if Radiobutton1.Checked then Edit1.SetFocus else Edit2.SetFocus;
Edit1.SetFocus;
Form9.Table1AfterScroll(Nil);
end;

procedure TForm10.BitBtn4Click(Sender: TObject);
begin
if form9.table1.IsEmpty then
      begin
      showmessage('ÂÌç „‘ —ÌÌ ÊÃÊœ ‰œ«—œ');
      exit;
      end;
form12.table1.IndexFieldNames:='membcode';
//form12.table1.SetKey;
//form12.table1['membcode']:=form9.table1['membcode'];
  if (form12.table1.Seek(form9.table1['membcode'],soFirstEQ))or(form9.table1.FieldByName('Bedeh').AsInteger<>0) then
      messagedlg('œ— «„«‰  „‘ —Ì —« »—ê‘  œÂÌœ Ê ”Å” Õ”«» ÊÌ —« ’›— ﬂ‰Ìœ CD/Film «» œ«',mterror,[mbok],0)
      else
      if messagedlg('ò·ÌÂ «ÿ·«⁄«  Õ”«»Â«Ì „‘ —Ì Ê ”Ê«»ﬁ «„«‰ Â«Ì «Ê° «“ »Ì‰ ŒÊ«Âœ —› .«Ì« «“ «Ì‰ ﬂ«— «ÿ„Ì‰«‰ œ«—Ìœ',mtconfirmation,[mbyes,mbno],0)=mryes then
          begin
          Form18.QueryCDBank.Active:=false;
          Form18.QueryCDBank.SQL.Text:='Update Payment Set MembCode='+QuotedStr('Õ–› ‘œÂ')+' where MembCode='+QuotedStr(form9.table1['membcode'])+' and RegCode<>'+QuotedStr('›—Ê‘ ò«·«/Œœ„« ');
          Form18.QueryCDBank.ExecSQL;
          if (form9.table1.FieldByName('SubMoney').AsInteger<>0)and(messagedlg('«Ì« „Ì ŒÊ«ÂÌœ Õﬁ «‘ —«ò —« »Â „‘ —Ì »—ê‘  œÂÌœ',mtconfirmation,[mbyes,mbno],0)=mryes) then
           with form13 do
            begin
            //table1.IndexFieldNames:='';
            table1.Open;
            table1.append;
            table1.FieldByName('regcode').asstring:='»—ê‘  Õﬁ «‘ —«ﬂ';
            table1.FieldByName('pay').AsString:=inttostr(form9.table1.FieldByName('SubMoney').AsInteger*-1);
            table1.FieldByName('membcode').asstring:='Õ–› ‘œÂ';
            table1.FieldByName('retdate').asstring:=form1.label1.caption;
            table1.FieldByName('UserName').asstring:=Form1.User_Name;
            table1.post;
            table1.Close;
            end;
          Form9.table1.Delete;
          end;
end;

procedure TForm10.BitBtn5Click(Sender: TObject);
begin
IF BITBTN5.Visible = FALSE THEN EXIT;
  form12.edit1.text:=form18.CodeTrimZero(form9.table1.fieldbyname('membcode').asstring);
  form12.FamilyCap.Caption:=form9.table1.fieldbyname('name').asstring + ' ' + form9.table1.fieldbyname('family').asstring;
form13.edit1.text:=form18.CodeTrimZero(form9.table1.fieldbyname('membcode').asstring);
form13.FamilyCap.Caption:=form9.table1.fieldbyname('name').asstring + ' ' + form9.table1.fieldbyname('family').asstring;
form13.capZemanat.Caption:=form9.table1.FieldByName('Gero').asstring;
form22.Edit1.Text:=form18.CodeTrimZero(form9.table1.fieldbyname('membcode').asstring);
form22.FamilyCap.Caption:=form9.table1.fieldbyname('name').asstring + ' ' + form9.table1.fieldbyname('family').asstring;
frmKalaForosh.Edit1.Text:=form18.CodeTrimZero(form9.table1.fieldbyname('membcode').asstring);
frmKalaForosh.FamilyCap.Caption:=form9.table1.fieldbyname('name').asstring + ' ' + form9.table1.fieldbyname('family').asstring;
close;
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
RadioButton1.SetFocus;
label1.caption:='-200';
Form9.edit1.Text:='';
Form9.txtName.text:='';
Form9.txtFamily.text:='';
Form9.txtTozih.text:='';
Form9.edit3.text:='';
Form9.edit6.text:='';
Form9.maskedit3.text:='';
//form9.table1.Close;
//form8.table1.Close;
//form12.table1.Close;
end;

procedure TForm10.Edit1Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
//Edit1.Text:=Form9.ConvetCode(UpperCase(Edit1.text),edit1.MaxLength);
end;

procedure TForm10.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then if radiobutton1.Checked then Edit1.SetFocus else Edit2.SetFocus;
end;

procedure TForm10.Edit1Change(Sender: TObject);
begin
Form9.Table1.Locate('membcode',Form9.ConvetCode(Edit1.Text,Edit1.MaxLength),[loPartialKey]);
form9.Table1AfterScroll(Nil);
end;

procedure TForm10.Edit2Change(Sender: TObject);
begin
Form9.Table1.Locate('family',Edit2.Text,[loPartialKey]);
form9.Table1AfterScroll(Nil);
end;

procedure TForm10.DBGrid1DblClick(Sender: TObject);
begin
if BitBtn5.Visible then
  BitBtn5Click(Nil)
  else
  BitBtn3Click(Nil);
end;

procedure TForm10.BitBtn1Click(Sender: TObject);
begin
form9.bitbtn1.Visible:=true;
form9.bitbtn3.Visible:=false;
form9.fromMainForm:=true;
form9.showmodal;
//form9.table1.IndexFieldNames:='';
form9.Table1.Open;
end;

procedure TForm10.BitBtn7Click(Sender: TObject);
var
B,S:String;
i:integer;
begin
if form9.table1.IsEmpty then
      begin
      showmessage('ÂÌç „‘ —ÌÌ ÊÃÊœ ‰œ«—œ');
      exit;
      end;
If Not InputQuery('ﬂ«Â‘ „ÊÃÊœÌ','„»·€ „Ê—œ ‰Ÿ— «‰ —« »Â  Ê„«‰ Ê«—œ ﬂ‰Ìœ',S) then exit;
if (length(trim(S))=0)or(StrtoInt(trim(S))=0) then exit;
For i:= 1 to Length(s) do
        begin
        if Not (S[i] in ['0','1','2','3','4','5','6','7','8','9']) then
                begin
                MessageDlg('⁄œœ Ê«—œ ‘œÂ „⁄ »— ‰Ì” . ⁄„·Ì«  «‰Ã«„ ‰‘œ',mtError,[mbOk],0);
                exit;
                end;
        end;
If Not InputQuery('ﬂ«Â‘ „ÊÃÊœÌ','·ÿ›« ‘—Õ œÂÌœ ﬂ«Â‘ „ÊÃÊœÌ »«»  çÌ” ',B) then exit;
HesabMoshtari(S,B,-1);
form9.Table1.AfterScroll(Nil);
end;

procedure TForm10.BitBtn8Click(Sender: TObject);
var
B,S:String;
i:integer;
begin
if form9.table1.IsEmpty then
      begin
      showmessage('ÂÌç „‘ —ÌÌ ÊÃÊœ ‰œ«—œ');
      exit;
      end;
If Not InputQuery('«›“«Ì‘ „ÊÃÊœÌ','„»·€ „Ê—œ ‰Ÿ— «‰ —« »Â  Ê„«‰ Ê«—œ ﬂ‰Ìœ',S) then exit;
if (length(trim(S))=0)or(StrtoInt(trim(S))=0) then exit;
For i:= 1 to Length(s) do
        begin
        if Not (S[i] in ['0','1','2','3','4','5','6','7','8','9']) then
                begin
                MessageDlg('⁄œœ Ê«—œ ‘œÂ „⁄ »— ‰Ì” . ⁄„·Ì«  «‰Ã«„ ‰‘œ',mtError,[mbOk],0);
                exit;
                end;
        end;
If Not InputQuery('«›“«Ì‘ „ÊÃÊœÌ','·ÿ›« ‘—Õ œÂÌœ «›“«Ì‘ „ÊÃÊœÌ »«»  çÌ” ',B) then exit;
HesabMoshtari(S,B,1);
form9.Table1.AfterScroll(Nil);
end;

procedure TForm10.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TForm10.Edit3Change(Sender: TObject);
begin
Form9.Table1.Locate('hometel',Edit3.Text,[loPartialKey]);
form9.Table1AfterScroll(Nil);
end;

procedure TForm10.RadioButton3Click(Sender: TObject);
begin
RadioButton3.Checked:=true;
form9.table1.IndexFieldNames:='hometel';
edit3.SetFocus;
edit3.SelectAll;
end;

procedure TForm10.Edit1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
key:=UpCase(Key);  
end;

procedure TForm10.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
RadioButton1Click(nil);
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
end;

procedure TForm10.Edit2Enter(Sender: TObject);
begin
RadioButton2Click(nil);
edit1.Text:='';
edit3.Text:='';
edit4.Text:='';

end;

procedure TForm10.Edit3Enter(Sender: TObject);
begin
RadioButton3Click(nil);
edit1.Text:='';
edit2.Text:='';
edit4.Text:='';

end;

procedure TForm10.DBGrid1CellClick(Column: TColumn);
begin
form9.Table1AfterScroll(Nil);
end;

procedure TForm10.BitBtn6Click(Sender: TObject);
begin
ListAmanat(form9.Table1.FieldByName('membcode').AsString,'');
end;

procedure TForm10.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DBGrid1.DataSource.DataSet.RecNo > 0 then
  begin
    if Column.Title.Caption = 'ﬂœ „‘ —Ì' then
      DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top, form18.CodeTrimZero(DBGrid1.DataSource.DataSet.fieldbyname('MembCode').AsString));
  end;

end;

procedure TForm10.RadioButton4Click(Sender: TObject);
begin
RadioButton4.Checked:=true;
form9.table1.IndexFieldNames:='Name';
edit4.SetFocus;
edit4.SelectAll;
end;

procedure TForm10.Edit4Enter(Sender: TObject);
begin
RadioButton4Click(nil);
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';

end;

procedure TForm10.Edit4Change(Sender: TObject);
begin
Form9.Table1.Locate('name',Edit4.Text,[loPartialKey]);
form9.Table1AfterScroll(Nil);
end;

end.
