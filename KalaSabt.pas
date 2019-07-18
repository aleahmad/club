unit KalaSabt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Mask, DBCtrls, StdCtrls, Spin, Buttons, Grids, DBGrids,
  ExtCtrls, ComCtrls, ActnList, ADODB;

type
  TfrmKalaSabt = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    txtSharh: TEdit;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    txtKCode: TEdit;
    Label7: TLabel;
    txtTedad: TEdit;
    txtGheimat: TEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Label6: TLabel;
    Label2: TLabel;
    CBKind: TComboBox;
    Table1: TADOTable;
    Query1: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtKCodeExit(Sender: TObject);
    procedure txtGheimatKeyPress(Sender: TObject; var Key: Char);
    procedure txtTedadKeyPress(Sender: TObject; var Key: Char);
    procedure txtKCodeKeyPress(Sender: TObject; var Key: Char);
    procedure txtSharhKeyPress(Sender: TObject; var Key: Char);
    procedure CBKindChange(Sender: TObject);
    procedure CBKindKeyPress(Sender: TObject; var Key: Char);
    procedure txtKCodeEnter(Sender: TObject);
    procedure Table1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKalaSabt: TfrmKalaSabt;

implementation

uses KalaSearch, Unit1, StrUtils, Unit9;


{$R *.DFM}

procedure TfrmKalaSabt.BitBtn1Click(Sender: TObject);
var KCode:string;
begin
KCode:=Form9.ConvetCode(txtKCode.Text,txtKCode.MaxLength);
if (length(trim(txtKCode.Text))=0)or(trim(txtKCode.Text)='0') then
   begin
    messagedlg('òœ ò«·«/Œœ„«  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    txtTedad.SetFocus;
    txtTedad.SelectAll;
    exit;
   end;
if length(txtSharh.text)=0 then
   begin
    messagedlg('‘—Õ ò«·«/Œœ„«  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    txtSharh.SetFocus;
    txtSharh.SelectAll;
    exit;
   end;
if length(txtTedad.Text)=0 then txtTedad.Text:='0';
if Form1.L then
 if table1.RecordCount > Threshold then
   begin
     Messagedlg('«Ì‰ ‰”ŒÂ «“ »—‰«„Â „ÕœÊœ „Ì »«‘œ Ê »Ì‘ — «“ 200 ò«·« ‰„Ì  Ê«‰Ìœ œ— ¬‰ –ŒÌ—Â ò‰Ìœ. ·ÿ›« ÃÂ  Œ—Ìœ ¬‰ «ﬁœ«„ ò‰Ìœ',mterror,[mbOk],0);
     exit;
   end;
table1.IndexFieldNames:='Kcode';
if table1.Seek(KCode,soFirstEQ) then
   begin
    messagedlg('òœ ò«·«/Œœ„«  ﬁ»·« »Â ò«·«/Œœ„«  œÌê—Ì «Œ ’«’ œ«œÂ ‘œÂ «” ',mterror,[mbok],0);
    txtKCode.SetFocus;
    txtKCode.SelectAll;
    exit;
    end;
table1.append;
table1.FieldByName('Kcode').AsString:=KCode;
table1.FieldByName('Sharh').AsString:=txtSharh.text;
table1.FieldByName('Gheimat').AsString:=txtGheimat.text;
if CBKind.ItemIndex=0 then
    table1.FieldByName('Tedad').AsString:=txtTedad.text
  else
    table1.FieldByName('Tedad').AsString:='-1';
table1.post;
Showmessage('«ÿ·«⁄«  À»  ‘œ');
txtSharh.Text:='';
txtGheimat.text:='0';
txtTedad.Text:='0';
txtKCode.Text:='';
txtKCode.SetFocus;
txtKCode.SelectAll;
table1.Close;
//table1.IndexFieldNames:='';
table1.Open;
end;

procedure TfrmKalaSabt.BitBtn2Click(Sender: TObject);
begin
close;
end;



procedure TfrmKalaSabt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
table1.cancel;
//table1.FlushBuffers;
table1.Close;
end;

procedure TfrmKalaSabt.BitBtn3Click(Sender: TObject);
var KCode:string;
begin
KCode:=Form9.ConvetCode(txtKCode.Text,txtKCode.MaxLength);
if (length(trim(txtKCode.Text))=0)or(trim(txtKCode.Text)='0') then
   begin
    messagedlg('òœ ò«·«/Œœ„«  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    txtTedad.SetFocus;
    txtTedad.SelectAll;
    exit;
   end;
if length(txtSharh.text)=0 then
   begin
    messagedlg('‘—Õ ò«·«/Œœ„«  »«Ìœ',mterror,[mbok],0);
    txtSharh.SetFocus;
    txtSharh.SelectAll;
    exit;
   end;
table1.IndexFieldNames:='Kcode';
if length(txtTedad.Text)=0 then txtTedad.Text:='0';
if table1.Seek(KCode,soFirstEQ) then
  if KCode<>frmKalaSearch.label1.caption then
   begin
    messagedlg('òœ ò«·«/Œœ„«  ﬁ»·« »Â ò«·«/Œœ„«  œÌê—Ì «Œ ’«’ œ«œÂ ‘œÂ «” ',mterror,[mbok],0);
    txtKCode.SetFocus;
    txtKCode.SelectAll;
    exit;
    end;
//table1.FindKey([frmKalaSearch.table1['regcode']]);
table1.edit;
table1.FieldByName('KCode').AsString:=KCode;
table1.FieldByName('Sharh').AsString:=txtSharh.text;
table1.FieldByName('Gheimat').AsString:=txtGheimat.text;
if CBKind.ItemIndex=0 then
    table1.FieldByName('Tedad').AsString:=txtTedad.text
  else
    table1.FieldByName('Tedad').AsString:='-1';
table1.post;
txtKCode.Text:='';
txtSharh.Text:='';
txtGheimat.text:='0';
txtTedad.Text:='0';
table1.Close;
//table1.IndexFieldNames:='';
table1.Open;
Close;
end;

procedure TfrmKalaSabt.FormShow(Sender: TObject);
begin
txtKCode.SetFocus;
table1.Close;
table1.Open;
end;

procedure TfrmKalaSabt.txtKCodeExit(Sender: TObject);
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
KCode:string;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
KCode:=Form9.ConvetCode(txtKCode.text,txtKCode.maxlength);
if (BitBtn3.Visible)and(KCode=frmKalaSearch.label1.caption) then exit;
if Length(trim(txtKCode.Text))=0 then
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
    txtKCode.Text:='1'
    else
    begin
    for i:=1 to length(strcode) do
      if not (strcode[i] in ['0'..'9']) then
        break;
    if i>length(strcode) then i:=0;
    if (SafeConvert(RightStr(strcode,length(strcode)-i),rcode)) then
      txtKCode.Text:=LeftStr(strcode,i)+IntToStr(rcode+1)
      else
      txtKCode.Text:=strcode;
    end;
  exit;
  end;

//txtKCode.Text:=Form9.ConvetCode(UpperCase(txtKCode.text),txtKCode.maxlength);
table1.Cancel;
table1.IndexFieldNames:='KCode';
if table1.seek(KCode,soFirstEQ) then
   begin
    messagedlg('«Ì‰ òœ ﬁ»·« »Â ò«·«/Œœ„«  œÌê—Ì «Œ ’«’ œ«œÂ ‘œÂ',mterror,[mbok],0);
    exit;
    end;
end;

procedure TfrmKalaSabt.txtGheimatKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
        if BitBtn1.Visible then BitBtn1.SetFocus else BitBtn3.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TfrmKalaSabt.txtTedadKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtGheimat.Setfocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TfrmKalaSabt.txtKCodeKeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then txtSharh.Setfocus;
key:=UpCase(Key);
end;

procedure TfrmKalaSabt.txtSharhKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then CBKind.Setfocus;
end;

procedure TfrmKalaSabt.CBKindChange(Sender: TObject);
begin
if CBKind.ItemIndex=0 then
  begin
    txtTedad.Visible:=true;
    Label4.Visible:=true;
  end
  else
  begin
    txtTedad.Visible:=false;
    Label4.Visible:=false;
  end;
end;

procedure TfrmKalaSabt.CBKindKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  if txtTedad.Visible then
    txtTedad.Setfocus
    else
    txtGheimat.SetFocus;
end;

procedure TfrmKalaSabt.txtKCodeEnter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TfrmKalaSabt.Table1BeforeOpen(DataSet: TDataSet);
begin
table1.IndexFieldNames:='';
end;

end.
