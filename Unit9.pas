unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls, Spin, ComCtrls, ActnList,
  Grids, DBGrids, ADODB;

type
  TForm9 = class(TForm)
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    txtName: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    Label9: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    chkInActive: TCheckBox;
    chkIsSub: TCheckBox;
    Label11: TLabel;
    txtMoney: TEdit;
    Label15: TLabel;
    maskEdit3: TEdit;
    Table1: TADOTable;
    Query1: TADOQuery;
    txtFamily: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    txtTozih: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure txtNameKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure txtBedehKeyPress(Sender: TObject; var Key: Char);
    procedure chkIsSubKeyPress(Sender: TObject; var Key: Char);
    procedure chkIsSubClick(Sender: TObject);
    procedure txtMoneyKeyPress(Sender: TObject; var Key: Char);
    procedure txtMoneyExit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1BeforeOpen(DataSet: TDataSet);
    procedure txtFamilyKeyPress(Sender: TObject; var Key: Char);
    procedure txtTozihKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
     { Public declarations }
     fromMainForm: boolean;
     function ConvetCode(Code:String;Len:integer):string;
  end;

var
  Form9: TForm9;

implementation

uses Unit10, Unit1, Unit18, Unit13, StrUtils, Unit12;

{$R *.DFM}

function TForm9.ConvetCode(Code:String;Len:integer):string;
var
i:integer;
s:string;
begin
if (length(Code)=0) then
  Result:=''
  else
  begin
  s:='';
  for i:= 1 to len-length(Code) do
    s:=s+'0';
  Result:=s+Code;
  end;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
edit1.Text:='';
txtName.text:='';
txtTozih.text:='';
txtFamily.text:='';
edit3.text:='';
edit6.text:='';
maskedit3.text:='';
chkIsSub.Checked:=false;
chkIsSubClick(nil);
chkInActive.Checked:=false;
table1.cancel;
//table1.FlushBuffers;
//table1.Close;
end;

procedure TForm9.MaskEdit1Exit(Sender: TObject);
var
s:string[8];
i:word;
b:boolean;
begin
b:=false;
s:=MaskEdit1.Text;
for i:=1 to 8 do
 if s[i]=' ' then b:=true;
if b then
 begin
    messagedlg('”«·°„«Â Ê —Ê“  «—ÌŒ »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    maskedit1.SetFocus;
    maskedit1.SelectAll;
 end
else
 if (strtoint(copy(MaskEdit1.Text,4,2))=0)or(strtoint(copy(MaskEdit1.Text,7,2))=0)or(strtoint(copy(MaskEdit1.Text,1,2))=0) then
 begin
  messagedlg('”«·°„«Â Ê —Ê“ ’›— ÊÃÊœ ‰œ«—œ.·ÿ›«  «—ÌŒ —« œ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
  MaskEdit1.SetFocus;
  MaskEdit1.SelectAll;
 end
 else
  if strtoint(copy(MaskEdit1.Text,4,2))<7 then
   begin
    if strtoint(copy(MaskEdit1.Text,7,2))>31 then
       begin
        messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
        MaskEdit1.SetFocus;
        MaskEdit1.SelectAll;
       end;
   end
   else
    if strtoint(copy(MaskEdit1.Text,4,2))<12 then
       begin
        if strtoint(copy(MaskEdit1.Text,7,2))>30 then
           begin
            messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
            MaskEdit1.SetFocus;
            MaskEdit1.SelectAll;
           end;
       end
       else
        if strtoint(copy(MaskEdit1.Text,4,2))=12 then
           begin
            if strtoint(copy(MaskEdit1.Text,7,2))>29 then
               begin
                messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
                MaskEdit1.SetFocus;
                MaskEdit1.SelectAll;
               end;
           end
           else
            begin
             messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
             MaskEdit1.SetFocus;
             MaskEdit1.SelectAll;
            end;
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm9.BitBtn1Click(Sender: TObject);
var
b:boolean;
s:string[8];
i:byte;
MCode:string;
begin
b:=false;
s:=maskedit1.Text;
MCode:=ConvetCode(UpperCase(Edit1.text),Edit1.Maxlength);
for i:=1 to 8 do
 if s[i]=' ' then b:=true;
if b then
   begin
    messagedlg('”«·°„«Â Ê —Ê“  «—ÌŒ À»  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    maskedit1.SetFocus;
    maskedit1.SelectAll;
    exit;
   end;
if length(edit1.text)=0 then
   begin
    messagedlg('ﬂœ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    edit1.SetFocus;
    edit1.SelectAll;
    exit;
   end;
if (length(txtName.text)=0)and(length(txtFamily.text)=0) then
   begin
    messagedlg('‰«„ Ì« ‰«„ Œ«‰Ê«œêÌ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    txtFamily.SetFocus;
    txtFamily.SelectAll;
    exit;
   end;
if Form1.L then
 if table1.RecordCount > Threshold then
   begin
     Messagedlg('«Ì‰ ‰”ŒÂ «“ »—‰«„Â „ÕœÊœ „Ì »«‘œ Ê »Ì‘ — «“ 200 „‘ —Ì ‰„Ì  Ê«‰Ìœ œ— ¬‰ –ŒÌ—Â ò‰Ìœ. ·ÿ›« ÃÂ  Œ—Ìœ ¬‰ «ﬁœ«„ ò‰Ìœ',mterror,[mbOk],0);
     exit;
   end;
//table1.Cancel;
table1.IndexFieldNames:='membcode';
if table1.Seek(MCode,soFirstEQ) then
   begin
    messagedlg('ﬂœ „‘ —Ì Ê«—œ ‘œÂ°ﬁ»·« »Â ‘Œ’ œÌê—Ì «Œ ’«’ Ì«› Â «” . ·ÿ›« ﬂœ œÌê—Ì —« Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
    edit1.SetFocus;
    edit1.SelectAll;
    exit;
    end;
table1.append;
table1['membcode']:=MCode;
table1['regdate']:=maskedit1.Text;
table1['name']:=txtName.text;
table1['Family']:=txtFamily.text;
table1['Tozih']:=txtTozih.text;
table1['noshen']:=edit3.text;
table1['homeadd']:=edit6.text;
table1['hometel']:=maskedit3.text;
table1['Bedeh']:=0;
if chkInActive.Checked then
      table1['IsActive']:='*'
    else
      table1['IsActive']:='';
if chkIsSub.Checked then
      table1['IsSub']:='*'
    else
      begin
      table1['IsSub']:='';
      txtMoney.Text:='0';
      end;
table1['SubMoney']:=txtMoney.Text;
table1['Gero']:='';
table1.post;
s:=MCode;
if strtoint(txtMoney.Text)<>0 then
 with form13 do
  begin
  //table1.IndexFieldNames := '';
  table1.Open;
  table1.append;
  table1.FieldByName('regcode').asstring:='Õﬁ «‘ —«ò';
  table1.FieldByName('pay').AsString:=txtMoney.Text;
  table1.FieldByName('membcode').asstring:=trim(s);
  table1.FieldByName('retdate').asstring:=form1.label1.caption;
  table1.FieldByName('UserName').asstring:=Form1.User_Name;
  table1.post;
  table1.Close;
  end;
form12.Edit1.Text:=Edit1.text;
edit1.Text:='';
txtName.text:='';
txtTozih.text:='';
txtFamily.text:='';
edit3.text:='';
edit6.text:='';
maskedit3.text:='';
chkIsSub.Checked:=false;
chkIsSubClick(nil);
chkInActive.Checked:=false;
//txtBedeh.Text:='';
txtMoney.Text:='0';
edit1.SetFocus;
table1.Close;
//table1.IndexFieldNames:='';
table1.Open;
if (fromMainForm=false) then
  close
  else
  showmessage('„‘Œ’«  À»  ‘œ');
end;

procedure TForm9.BitBtn3Click(Sender: TObject);
var
b:boolean;
s:string[8];
i:word;
MCode:string;
begin
b:=false;
s:=maskedit1.Text;
MCode:=ConvetCode(UpperCase(Edit1.text),Edit1.Maxlength);
for i:=1 to 8 do
 if s[i]=' ' then b:=true;
if b then
   begin
    messagedlg('”«·°„«Â Ê —Ê“  «—ÌŒ À»  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    maskedit1.SetFocus;
    maskedit1.SelectAll;
    exit;
   end;
if length(edit1.text)=0 then
   begin
    messagedlg('ﬂœ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    edit1.SetFocus;
    edit1.SelectAll;
    exit;
   end;
if (length(txtName.text)=0)and(length(txtName.text)=0) then
   begin
    messagedlg('‰«„ Ì« ‰«„ Œ«‰Ê«œêÌ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    txtFamily.SetFocus;
    txtFamily.SelectAll;
    exit;
   end;
//table1.Active:=false;
table1.Close;
table1.IndexFieldNames:='';
table1.Open;
table1.IndexFieldNames:='membcode';
//table1.Active:=true;
if table1.Seek(MCode,soFirstEQ) then
  if MCode<>form10.label1.caption then
   begin
    messagedlg('ﬂœ „‘ —Ì Ê«—œ ‘œÂ°ﬁ»·« »Â ‘Œ’ œÌê—Ì «Œ ’«’ Ì«› Â «” . ·ÿ›« ﬂœ œÌê—Ì —« Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
    edit1.SetFocus;
    edit1.SelectAll;
    exit;
    end;
//table1.FindKey([form10.table1['membcode']]);
table1.edit;
table1['membcode']:=MCode;
table1['regdate']:=maskedit1.Text;
table1['name']:=txtName.text;
table1['Family']:=txtFamily.text;
table1['Tozih']:=txtTozih.text;
table1['noshen']:=edit3.text;
table1['homeadd']:=edit6.text;
table1['hometel']:=maskedit3.text;
table1['homeadd']:=edit6.text;
//table1['Bedeh']:=txtBedeh.text;
if chkInActive.Checked then
      table1['IsActive']:='*'
    else
      table1['IsActive']:='';
if chkIsSub.Checked then
      table1['IsSub']:='*'
    else
      begin
      table1['IsSub']:='';
      txtMoney.Text:='0';
      end;
table1['SubMoney']:=txtMoney.Text;
table1.post;
Form18.QueryCDBank.Active:=false;
Form18.QueryCDBank.SQL.Text:='Update Payment Set MembCode='+QuotedStr(MCode)+' where MembCode='+QuotedStr(form10.label1.caption);
Form18.QueryCDBank.ExecSQL;
Form18.QueryCDBank.SQL.Text:='Update Borrow Set MembCode='+QuotedStr(MCode)+' where MembCode='+QuotedStr(form10.label1.caption);
Form18.QueryCDBank.ExecSQL;
//showmessage('„‘Œ’«  À»  ‘œ');
edit1.Text:='';
txtName.text:='';
txtFamily.text:='';
txtTozih.text:='';
edit3.text:='';
edit6.text:='';
maskedit3.text:='';
chkIsSub.Checked:=false;
chkIsSubClick(nil);
chkInActive.Checked:=false;
//txtBedeh.text:='';
txtMoney.Text:='0';
table1.Close;
//table1.IndexFieldNames:='';
table1.Open;
Close;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
Maskedit1.text:=form1.label1.Caption;
table1.Close;
table1.Open;
edit1.SetFocus;
end;

procedure TForm9.Edit1Exit(Sender: TObject);
function SafeConvert(s: string; var i: integer): boolean;
begin
if length(s)=0 then s:='0';
   try
     i := StrToInt(s);
     Result := true;
   except
     Result := false;
   end;
end;
var
i,rcode:integer;
strcode:string;
begin
Edit1.Text:=UpperCase(Edit1.text);
ActivateKeyboardLayout($00000429,KLF_REORDER);
if (Bitbtn3.Visible)and(edit1.text=form18.CodeTrimZero(form10.label1.caption)) then exit;
if Length(Edit1.Text)=0 then
  begin
  Query1.Close;
  Query1.Open;
  strcode:=Query1.fieldbyname('maxcode').asstring;
  Query1.Close;
  
  for i:=1 to length(strcode) do
      if (strcode[i]<>'0') then
         break;
  strcode:=Copy(strcode,i,length(strcode));

  if length(trim(strcode))=0 then
    Edit1.Text:='1'
    else
    begin
    for i:=1 to length(strcode) do
      if not (strcode[i] in ['0'..'9']) then
        break;
    if i>length(strcode) then i:=0;
    if (SafeConvert(RightStr(strcode,length(strcode)-i),rcode)) then
      Edit1.Text:=LeftStr(strcode,i)+IntToStr(rcode+1)
      else
      Edit1.Text:=strcode;
    end;
  end
  else
  begin
  table1.Cancel;
  table1.IndexFieldNames:='membcode';
  if table1.Seek(ConvetCode(Edit1.text,Edit1.Maxlength),soFirstEQ) then
      messagedlg('ﬂœ „‘ —Ì Ê«—œ ‘œÂ°ﬁ»·« »Â ‘Œ’ œÌê—Ì «Œ ’«’ Ì«› Â «” . ·ÿ›« ﬂœ œÌê—Ì —« Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
  end;

end;

procedure TForm9.Edit1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then txtName.SetFocus;
key:=UpCase(Key);
end;

procedure TForm9.txtNameKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtFamily.SetFocus;
end;

procedure TForm9.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Edit6.SetFocus;
end;

procedure TForm9.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then MaskEdit3.SetFocus;
end;

procedure TForm9.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#13,#8]) then key:=#0;
if key=#13 then begin
   key:=#0;
   PostMessage(Handle,WM_NEXTDLGCTL,0,0);
end;

end;

procedure TForm9.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Edit1.SetFocus;
end;

procedure TForm9.txtBedehKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  if chkIsSub.Enabled then
        chkIsSub.SetFocus
      else
        if BitBtn1.Visible then BitBtn1.SetFocus else BitBtn3.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TForm9.chkIsSubKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then chkIsSub.SetFocus;
   if (txtMoney.Visible)and(txtMoney.Enabled) then
      begin
      txtMoney.SelectAll;
      txtMoney.SetFocus;
      end
      else
        if BitBtn1.Visible then BitBtn1.SetFocus else BitBtn3.SetFocus;

end;

procedure TForm9.chkIsSubClick(Sender: TObject);
begin
txtMoney.Visible:=chkIsSub.Checked;
Label15.Visible:=txtMoney.Visible;
Label11.Visible:=txtMoney.Visible;
if (form9.Active)and(chkIsSub.Enabled)and(txtMoney.Visible)and(txtMoney.Enabled) then txtMoney.SetFocus;
end;

procedure TForm9.txtMoneyKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#13,#8]) then key:=#0;
if key=#13 then
   txtTozih.SetFocus;
end;

procedure TForm9.txtMoneyExit(Sender: TObject);
begin
if trim((sender as tedit).Text)='' then (sender as tedit).Text:='0';
end;

procedure TForm9.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then edit6.SetFocus;
end;

procedure TForm9.MaskEdit3Exit(Sender: TObject);
begin
if (Bitbtn3.Visible)and(form9.ConvetCode(edit1.text,edit1.MaxLength)=form10.label1.caption) then exit;
//if trim(MaskEdit3.Text)='' then MaskEdit3.Text:='0';
if (trim(MaskEdit3.Text)='') or (strtoint64(MaskEdit3.Text)=0) then exit;
table1.Close;
table1.Open;
table1.IndexFieldNames:='hometel';
if table1.Seek(trim(MaskEdit3.Text),soFirstEQ) then
    messagedlg(' ÊÃÂ: «Ì‰ ‘„«—Â  ·›‰ ﬁ»·« »—«Ì ‘Œ’ œÌê—Ì Ê«—œ ‘œÂ «” :'+' »« ‰«„ '+table1.FieldByName('name').AsString+' Ê ﬂœ '+table1.FieldByName('membcode').AsString,mtWarning,[mbok],0);
end;

procedure TForm9.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm9.Table1AfterScroll(DataSet: TDataSet);
begin
if form10.Active then
 if table1.Active then
   begin
    if table1.FieldByName('Bedeh').AsInteger=0 then
      begin
      form10.Shape1.Brush.Color:=clWhite;
      form10.capMojodi.Caption:='»Ì Õ”«»';
      end
      else
      if table1.FieldByName('Bedeh').AsInteger<0 then
         begin
         form10.Shape1.Brush.Color:=$00CCFFCC;
         form10.capMojodi.Caption:=' »” «‰ò«— '+inttostr(abs(table1.FieldByName('Bedeh').AsInteger))+'  Ê„«‰ ';
         end
         else
         begin
         form10.Shape1.Brush.Color:=$00FFDFFF;
         form10.capMojodi.Caption:=' »œÂò«— '+inttostr(abs(table1.FieldByName('Bedeh').AsInteger))+'  Ê„«‰ ';
         end;
   end;
end;

procedure TForm9.Table1BeforeOpen(DataSet: TDataSet);
begin
table1.IndexFieldNames:='';
end;

procedure TForm9.txtFamilyKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Edit3.SetFocus;
end;

procedure TForm9.txtTozihKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   if BitBtn1.Visible then BitBtn1.SetFocus else BitBtn3.SetFocus;

end;

end.
