unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBTables, Spin, ActnList, ADODB;

type
  TForm12 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    txtCode1: TEdit;
    BitBtn3: TBitBtn;
    FamilyCap: TLabel;
    OnvanCap1: TLabel;
    Label1: TLabel;
    Button4: TButton;
    Button3: TButton;
    txtGero: TComboBox;
    BitBtn4: TBitBtn;
    SpeedButton1: TSpeedButton;
    OnvanCap2: TLabel;
    SpeedButton2: TSpeedButton;
    txtCode2: TEdit;
    txtCode3: TEdit;
    SpeedButton3: TSpeedButton;
    OnvanCap3: TLabel;
    txtCode4: TEdit;
    SpeedButton4: TSpeedButton;
    OnvanCap4: TLabel;
    txtCode5: TEdit;
    SpeedButton5: TSpeedButton;
    OnvanCap5: TLabel;
    SpeedButton6: TSpeedButton;
    Label2: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    txtMoney: TEdit;
    Label8: TLabel;
    Label15: TLabel;
    Action9: TAction;
    Action10: TAction;
    Table1: TADOTable;
    Query1: TADOQuery;
    Panel5: TPanel;
    Shape1: TShape;
    Label14: TLabel;
    capMojodi: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Action11: TAction;
    Label9: TLabel;
    txtBedeh: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    txtBedehTozih: TEdit;
    Label12: TLabel;
    txtBestan: TEdit;
    Label13: TLabel;
    Label16: TLabel;
    txtBestanTozih: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtCode1Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure txtCode1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure txtGeroKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure txtCode2Exit(Sender: TObject);
    procedure txtCode3Exit(Sender: TObject);
    procedure txtCode4Exit(Sender: TObject);
    procedure txtCode5Exit(Sender: TObject);
    procedure txtCode2KeyPress(Sender: TObject; var Key: Char);
    procedure txtCode3KeyPress(Sender: TObject; var Key: Char);
    procedure txtCode4KeyPress(Sender: TObject; var Key: Char);
    procedure txtCode5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure txtMoneyKeyPress(Sender: TObject; var Key: Char);
    procedure txtGeroChange(Sender: TObject);
    procedure txtPishKeyPress(Sender: TObject; var Key: Char);
    procedure txtMoneyExit(Sender: TObject);
    procedure txtCode1Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure txtCode1Change(Sender: TObject);
    procedure txtCode2Change(Sender: TObject);
    procedure txtCode3Change(Sender: TObject);
    procedure txtCode4Change(Sender: TObject);
    procedure txtCode5Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Table1BeforeOpen(DataSet: TDataSet);
    procedure BitBtn6Click(Sender: TObject);
    procedure txtBedehExit(Sender: TObject);
    procedure txtBedehKeyPress(Sender: TObject; var Key: Char);
    procedure txtBedehTozihKeyPress(Sender: TObject; var Key: Char);
    procedure txtBestanKeyPress(Sender: TObject; var Key: Char);
    procedure txtBestanExit(Sender: TObject);
    procedure txtBestanTozihKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses Unit1, Unit9, Unit8, Unit10, Unit11, Unit25, Unit13, Unit18, Unit20,
  Unit19, Unit21, Variants;

{$R *.DFM}

procedure TForm12.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm12.BitBtn1Click(Sender: TObject);
var
Count:integer;
MemberCode:string;
RegCode1:string;
RegCode2:string;
RegCode3:string;
RegCode4:string;
RegCode5:string;
RegCode1Checked:boolean;
RegCode2Checked:boolean;
RegCode3Checked:boolean;
RegCode4Checked:boolean;
RegCode5Checked:boolean;
begin
MemberCode:=form9.ConvetCode(edit1.text,edit1.MaxLength);
RegCode1:=Form9.ConvetCode(txtCode1.text,txtCode1.MaxLength);
RegCode2:=Form9.ConvetCode(txtCode2.text,txtCode2.MaxLength);
RegCode3:=Form9.ConvetCode(txtCode3.text,txtCode3.MaxLength);
RegCode4:=Form9.ConvetCode(txtCode4.text,txtCode4.MaxLength);
RegCode5:=Form9.ConvetCode(txtCode5.text,txtCode5.MaxLength);

if (length(RegCode1)=0)and(length(RegCode2)=0)and(length(RegCode3)=0)and(length(RegCode4)=0)and(length(RegCode5)=0) then
   begin
   messagedlg('ÂÌç „Ê—œÌ ÃÂ  «„«‰  Ê«—œ ‰‘œÂ «” ',mtError,[mbOK],0);
   end;
if length(MemberCode)=0 then
   begin
    messagedlg('ﬂœ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    edit1.SetFocus;
    exit;
   end;
//checking if the CD was borrowed before too
Query1.Close;
Query1.SQL.Clear;
Query1.SQL.text:=('select regcode from borrow where (membcode=:mcode) and((RegCode=:rcode5)or(RegCode=:rcode4)or(RegCode=:rcode3)or(RegCode=:rcode2)or(RegCode=:rcode1))');
Query1.Parameters.ParamByName('mcode').Value:=MemberCode;
Query1.Parameters.ParamByName('rcode1').Value:=RegCode1;
Query1.Parameters.ParamByName('rcode2').Value:=RegCode2;
Query1.Parameters.ParamByName('rcode3').Value:=RegCode3;
Query1.Parameters.ParamByName('rcode4').Value:=RegCode4;
Query1.Parameters.ParamByName('rcode5').Value:=RegCode5;
Query1.Open;
RegCode1Checked:=false;
RegCode2Checked:=false;
RegCode3Checked:=false;
RegCode4Checked:=false;
RegCode5Checked:=false;
while not Query1.Eof do
begin
if (not RegCode1Checked)and(RegCode1=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode1Checked:=true;
  messagedlg('—« Â„ «ﬂ‰Ê‰ œ— «„«‰  œ«—œ. „‘ —Ì ‰„Ì  Ê«‰œ œÊ ‰”ŒÂ «“ ›Ì·„ —« Â„“„«‰ «„«‰  »êÌ—œ CD1 «Ì‰ „‘ —Ì',mterror,[mbok],0);
  txtCode1.SetFocus;
  exit;
  end;
if (not RegCode2Checked)and(RegCode2=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode2Checked:=true;
  messagedlg('—« Â„ «ﬂ‰Ê‰ œ— «„«‰  œ«—œ. „‘ —Ì ‰„Ì  Ê«‰œ œÊ ‰”ŒÂ «“ ›Ì·„ —« Â„“„«‰ «„«‰  »êÌ—œ CD2 «Ì‰ „‘ —Ì',mterror,[mbok],0);
      txtCode2.SetFocus;
      exit;
  end;
if (not RegCode3Checked)and(RegCode3=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode3Checked:=true;
  messagedlg('—« Â„ «ﬂ‰Ê‰ œ— «„«‰  œ«—œ. „‘ —Ì ‰„Ì  Ê«‰œ œÊ ‰”ŒÂ «“ ›Ì·„ —« Â„“„«‰ «„«‰  »êÌ—œ CD3 «Ì‰ „‘ —Ì',mterror,[mbok],0);
      txtCode3.SetFocus;
      exit;
  end;
if (not RegCode4Checked)and(RegCode4=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode4Checked:=true;
  messagedlg('—« Â„ «ﬂ‰Ê‰ œ— «„«‰  œ«—œ. „‘ —Ì ‰„Ì  Ê«‰œ œÊ ‰”ŒÂ «“ ›Ì·„ —« Â„“„«‰ «„«‰  »êÌ—œ CD4 «Ì‰ „‘ —Ì',mterror,[mbok],0);
      txtCode4.SetFocus;
      exit;
  end;
if (not RegCode5Checked)and(RegCode5=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode5Checked:=true;
  messagedlg('—« Â„ «ﬂ‰Ê‰ œ— «„«‰  œ«—œ. „‘ —Ì ‰„Ì  Ê«‰œ œÊ ‰”ŒÂ «“ ›Ì·„ —« Â„“„«‰ «„«‰  »êÌ—œ CD5 «Ì‰ „‘ —Ì',mterror,[mbok],0);
      txtCode5.SetFocus;
      exit;
  end;
Query1.Next;
end;

//checking if the CD was returned before too
Query1.Close;
Query1.SQL.Clear;
Query1.SQL.text:=('select regcode from payment where (membcode=:mcode) and((RegCode=:rcode5)or(RegCode=:rcode4)or(RegCode=:rcode3)or(RegCode=:rcode2)or(RegCode=:rcode1))');
Query1.Parameters.ParamByName('mcode').Value:=MemberCode;
Query1.Parameters.ParamByName('rcode1').Value:=RegCode1;
Query1.Parameters.ParamByName('rcode2').Value:=RegCode2;
Query1.Parameters.ParamByName('rcode3').Value:=RegCode3;
Query1.Parameters.ParamByName('rcode4').Value:=RegCode4;
Query1.Parameters.ParamByName('rcode5').Value:=RegCode5;
Query1.Open;
RegCode1Checked:=false;
RegCode2Checked:=false;
RegCode3Checked:=false;
RegCode4Checked:=false;
RegCode5Checked:=false;
while not Query1.Eof do
begin
if (not RegCode1Checked)and(RegCode1=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode1Checked:=true;
  if messagedlg('—« ﬁ»·« Â„ «„«‰  ê—› Â «” .¬Ì« Â„ç‰«‰ „Ì ŒÊ«ÂÌœ ¬‰—« »Â „‘ —Ì «„«‰  œÂÌœ CD1 «Ì‰ „‘ —Ì',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      begin
      txtCode1.SetFocus;
      exit;
      end;
  end;
if (not RegCode2Checked)and(RegCode2=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode2Checked:=true;
  if messagedlg('—« ﬁ»·« Â„ «„«‰  ê—› Â «” .¬Ì« Â„ç‰«‰ „Ì ŒÊ«ÂÌœ ¬‰—« »Â „‘ —Ì «„«‰  œÂÌœ CD2 «Ì‰ „‘ —Ì',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      begin
      txtCode2.SetFocus;
      exit;
      end;
  end;
if (not RegCode3Checked)and(RegCode3=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode3Checked:=true;
  if messagedlg('—« ﬁ»·« Â„ «„«‰  ê—› Â «” .¬Ì« Â„ç‰«‰ „Ì ŒÊ«ÂÌœ ¬‰—« »Â „‘ —Ì «„«‰  œÂÌœ CD3 «Ì‰ „‘ —Ì',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      begin
      txtCode3.SetFocus;
      exit;
      end;
  end;
if (not RegCode4Checked)and(RegCode4=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode4Checked:=true;
  if messagedlg('—« ﬁ»·« Â„ «„«‰  ê—› Â «” .¬Ì« Â„ç‰«‰ „Ì ŒÊ«ÂÌœ ¬‰—« »Â „‘ —Ì «„«‰  œÂÌœ CD4 «Ì‰ „‘ —Ì',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      begin
      txtCode4.SetFocus;
      exit;
      end;
  end;
if (not RegCode5Checked)and(RegCode5=Query1.FieldByName('RegCode').AsString) then
  begin
  RegCode5Checked:=true;
  if messagedlg('—« ﬁ»·« Â„ «„«‰  ê—› Â «” .¬Ì« Â„ç‰«‰ „Ì ŒÊ«ÂÌœ ¬‰—« »Â „‘ —Ì «„«‰  œÂÌœ CD5 «Ì‰ „‘ —Ì',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      begin
      txtCode5.SetFocus;
      exit;
      end;
  end;
Query1.Next;
end;

Count:=0;
if (length(RegCode1)<>0) then
begin
 Inc(Count);
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(RegCode1,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD1 ﬂœ',mterror,[mbok],0);
        txtCode1.SetFocus;
        exit;
       end;
  OnvanCap1.Caption:=form8.table1.FieldByName('name').asstring;
{table1.IndexFieldNames:='Regcode';
table1.SetRangeStart;
  table1.FieldByName('Regcode').AsString := RegCode1;
  table1.SetRangeEnd;
  table1.FieldByName('Regcode').AsString := RegCode1;
  table1.ApplyRange;}
  if form8.table1.FieldByName('RemTedad').AsInteger<=0 then
   begin
    messagedlg('»Â «„«‰  —› Â «”  CD1 Â„Â „ÊÃÊœÌ',mterror,[mbok],0);
    txtCode1.SetFocus;
    exit;
   end;
end;

if (length(RegCode2)<>0) then
begin
 Inc(Count);
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(RegCode2,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD2 ﬂœ',mterror,[mbok],0);
        txtCode2.SetFocus;
        exit;
       end;
 OnvanCap2.Caption:=form8.table1.FieldByName('name').asstring;
{  table1.IndexFieldNames:='Regcode';
  table1.SetRangeStart;
  table1.FieldByName('Regcode').AsString := RegCode2;
  table1.SetRangeEnd;
  table1.FieldByName('Regcode').AsString := RegCode2;
  table1.ApplyRange;}
  if form8.table1.FieldByName('RemTedad').AsInteger<=0 then
   begin
    messagedlg('»Â «„«‰  —› Â «”  CD2 Â„Â „ÊÃÊœÌ',mterror,[mbok],0);
    txtCode2.SetFocus;
    exit;
   end;
end;

if (length(RegCode3)<>0) then
begin
 Inc(Count);
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(RegCode3,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD3 ﬂœ',mterror,[mbok],0);
        txtCode3.SetFocus;
        exit;
       end;
 OnvanCap3.Caption:=form8.table1.FieldByName('name').asstring;
{  table1.IndexFieldNames:='Regcode';
  table1.SetRangeStart;
  table1.FieldByName('Regcode').AsString := RegCode3;
  table1.SetRangeEnd;
  table1.FieldByName('Regcode').AsString := RegCode3;
  table1.ApplyRange;}
  if form8.table1.FieldByName('RemTedad').AsInteger<=0 then
   begin
    messagedlg('»Â «„«‰  —› Â «”  CD3 Â„Â „ÊÃÊœÌ',mterror,[mbok],0);
    txtCode3.SetFocus;
    exit;
   end;
end;

if (length(RegCode4)<>0) then
begin
 Inc(Count);
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(RegCode4,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD4 ﬂœ',mterror,[mbok],0);
        txtCode4.SetFocus;
        exit;
       end;
{ OnvanCap4.Caption:=form8.table1.FieldByName('name').asstring;
  table1.IndexFieldNames:='Regcode';
  table1.SetRangeStart;
  table1.FieldByName('Regcode').AsString := RegCode4;
  table1.SetRangeEnd;
  table1.FieldByName('Regcode').AsString := RegCode4;
  table1.ApplyRange;
  if table1.RecordCount>=form8.table1.FieldByName('tedad').AsInteger then}
  if form8.table1.FieldByName('RemTedad').AsInteger<=0 then
   begin
    messagedlg('»Â «„«‰  —› Â «”  CD4 Â„Â „ÊÃÊœÌ',mterror,[mbok],0);
    txtCode4.SetFocus;
    exit;
   end;
end;

if (length(RegCode5)<>0) then
begin
 Inc(Count);
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(RegCode5,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD5 ﬂœ',mterror,[mbok],0);
        txtCode5.SetFocus;
        exit;
       end;
 OnvanCap5.Caption:=form8.table1.FieldByName('name').asstring;
{  table1.IndexFieldNames:='Regcode';
  table1.SetRangeStart;
  table1.FieldByName('Regcode').AsString := RegCode5;
  table1.SetRangeEnd;
  table1.FieldByName('Regcode').AsString := RegCode5;
  table1.ApplyRange;
  if table1.RecordCount>=form8.table1.FieldByName('tedad').AsInteger then}
  if form8.table1.FieldByName('RemTedad').AsInteger<=0 then
   begin
    messagedlg('»Â «„«‰  —› Â «”  CD5 Â„Â „ÊÃÊœÌ',mterror,[mbok],0);
    txtCode5.SetFocus;
    exit;
   end;
end;
form9.Table1.Open;
    form9.table1.IndexFieldNames:='membcode';
    //form9.table1.SetKey;
    if not(form9.table1.Seek(MemberCode,soFirstEQ)) then
       begin
        messagedlg('ﬂœ „‘ —Ì „Ê—œ ‰Ÿ— ‘„« ÊÃÊœ ‰œ«—œ',mterror,[mbok],0);
        edit1.SetFocus;
        exit;
       end
       else
        if form9.table1.FieldByName('IsActive').asstring='*' then
          begin
            Messagedlg('«Ì‰ „‘ —Ì €Ì—›⁄«· ‘œÂ «”  Ê ‰„Ì  Ê«‰Ìœ »Â «Ê «„«‰  œÂÌœ',mterror,[mbok],0);
            exit;
          end;
with table1 do
         begin
          //edit1.Text:=form9.table1.FieldByName('membcode').asstring;
          FamilyCap.Caption:=form9.table1.FieldByName('name').asstring;
          IndexFieldNames:='membcode';
{          SetRangeStart;
          FieldByName('membcode').AsString := MemberCode;
          SetRangeEnd;
          FieldByName('membcode').AsString := MemberCode;
          ApplyRange;}
          Filtered := true;
          Filter := 'membcode='+QuotedStr(MemberCode);
          if recordcount+Count>=form25.SpinEdit4.Value then
             if messagedlg('œ— «„«‰  œ«—œ.¬Ì«  „ÌŒÊ«ÂÌœ  »Ì‘ «“ Õœ„Ã«“ »Â «Ê «„«‰  œÂÌœ CD/Film '+' «Ì‰ „‘ —Ì'+inttostr(recordcount),mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;
          Filter := '';
          Filtered := false;
         end;

{dcheck:=form9.table1.fieldbyname('regdate').AsString;
counting difference between no. of days}
{yy:=(strtoint(form1.label1.Caption[1]+form1.label1.Caption[2])-strtoint(dcheck[1]+dcheck[2]));
mm1:=strtoint(dcheck[4]+dcheck[5]);
mm2:=strtoint(form1.label1.Caption[4]+form1.label1.Caption[5]);
if mm1<7 then mm1:=(mm1-1)*31 else
   if mm1<13 then  mm1:=186+(mm1-7)*30;
if mm2<7 then mm2:=(mm2-1)*31 else
   if mm2<13 then  mm2:=186+(mm2-7)*30;
if mm1>mm2 then
    begin
     mm:=(365-mm1)+mm2;
     Dec(yy);
    end
    else mm:=mm2-mm1;
dd:=strtoint(form1.label1.Caption[7]+form1.label1.Caption[8])-strtoint(dcheck[7]+dcheck[8]);
days:=yy*365+mm+dd;
if days<0 then
      begin
       messagedlg(' «—ÌŒ À»  ‰«„ „‘ —Ì «‘ »«Â Ê«—œ ‘œÂ Ì«  «—ÌŒ «„—Ê“ «‘ »«Â Ê«—œ ‘œÂ «” ',mterror,[mbok],0);
       exit;
      end;}
{
if (length(RegCode1)<>0) then
begin
  table1.IndexFieldNames:='MembCode';
  //table1.SetKey;
  table1.Filtered:=true;
  while not table1.Eof
  begin
    if (table1.FieldByName('RegCode').AsString=RegCode1) then
    begin
      messagedlg('ﬁ»·«  Ê”ÿ «Ì‰ ›—œ «„«‰  ê—› Â ‘œÂ Ê Â‰Ê“ »«“ê—œ«‰œÂ ‰‘œÂ «”  CD1',mterror,[mbok],0);
      txtCode1.SetFocus;
      table1.Filtered:=false;
      exit;
    end;
  end;
  table1.Filtered:=false;
end;

if (length(RegCode2)<>0) then
begin
  table1.IndexFieldNames:='RegCode;MembCode';
  //table1.SetKey;
  if (table1.Seek(varArrayOf([RegCode2,MemberCode]),soFirstEQ)) then
  begin
    messagedlg('ﬁ»·«  Ê”ÿ «Ì‰ ›—œ «„«‰  ê—› Â ‘œÂ Ê Â‰Ê“ »«“ê—œ«‰œÂ ‰‘œÂ «”  CD2',mterror,[mbok],0);
    txtCode2.SetFocus;
    exit;
  end;
end;

if (length(RegCode3)<>0) then
begin
  table1.IndexFieldNames:='RegCode;MembCode';
  //table1.SetKey;
  if (table1.Seek(varArrayOf([RegCode3,MemberCode]),soFirstEQ)) then
  begin
    messagedlg('ﬁ»·«  Ê”ÿ «Ì‰ ›—œ «„«‰  ê—› Â ‘œÂ Ê Â‰Ê“ »«“ê—œ«‰œÂ ‰‘œÂ «”  CD3',mterror,[mbok],0);
    txtCode3.SetFocus;
    exit;
  end;
end;

if (length(RegCode4)<>0) then
begin
  table1.IndexFieldNames:='RegCode;MembCode';
  //table1.SetKey;
  if (table1.Seek(varArrayOf([RegCode4,MemberCode]),soFirstEQ)) then
  begin
    messagedlg('ﬁ»·«  Ê”ÿ «Ì‰ ›—œ «„«‰  ê—› Â ‘œÂ Ê Â‰Ê“ »«“ê—œ«‰œÂ ‰‘œÂ «”  CD4',mterror,[mbok],0);
    txtCode4.SetFocus;
    exit;
  end;
end;

if (length(RegCode5)<>0) then
begin
  table1.IndexFieldNames:='RegCode;MembCode';
  //table1.SetKey;
  if (table1.Seek(varArrayOf([RegCode5,MemberCode]),soFirstEQ)) then
  begin
    messagedlg('ﬁ»·«  Ê”ÿ «Ì‰ ›—œ «„«‰  ê—› Â ‘œÂ Ê Â‰Ê“ »«“ê—œ«‰œÂ ‰‘œÂ «”  CD5',mterror,[mbok],0);
    txtCode5.SetFocus;
    exit;
  end;
end;
}
{form8.table1.Close;
form8.table1.Open;}
// counting customer bedeh
form9.Table1.Open;
form9.table1.IndexFieldNames:='membcode';
form9.table1.Seek(MemberCode,soFirstEQ);
//go to the customer
if not txtMoney.Visible then txtMoney.Text:='0';
if (trim(txtGero.Text)='ÅÊ·')and(strtoint(txtMoney.Text)<>0) then
    begin
    form9.table1.edit;
    form9.table1.FieldByName('Gero').AsString:=' ÅÊ· »Â „»·€ '+txtMoney.Text;
    form9.table1.FieldByName('Bedeh').AsInteger:=form9.table1.FieldByName('Bedeh').AsInteger-strtoint(txtMoney.Text);
    form9.table1.post;
    with form13 do
          begin
          Table1.Open;
          table1.append;
          table1.FieldByName('regcode').asstring:='÷„«‰  «„«‰  ›Ì·„';
          table1.FieldByName('pay').AsString:=inttostr(strtoint(txtMoney.Text));
          table1.FieldByName('membcode').asstring:=trim(MemberCode);
          table1.FieldByName('retdate').asstring:=form1.label1.caption;
          table1.FieldByName('UserName').asstring:=Form1.User_Name;
          table1.post;
          table1.Close;
          end;
    end
    else
    begin
    form9.table1.edit;
    form9.table1.FieldByName('Gero').AsString:=txtGero.Text;
    form9.table1.post;
    end;
// «Ì‰ ﬁ”„  »—«Ì »” «‰ﬂ«—Ì Ê »œÂ ﬂ«—Ì «” 
if (txtBedeh.Text<>'0') then
    form10.HesabMoshtari(txtBedeh.Text,txtBedehTozih.Text,-1);
if (txtBestan.Text<>'0') then
    form10.HesabMoshtari(txtBestan.Text,txtBestanTozih.Text,1);
////////////

form8.table1.IndexFieldNames:='Regcode';
if (length(RegCode1)<>0) then
begin
  form8.table1.Seek(RegCode1,soFirstEQ);
  form8.table1.Edit;
  form8.table1.FieldByName('RemTedad').AsInteger := form8.table1.FieldByName('RemTedad').AsInteger - 1;
  form8.table1.post;
  table1.Append;
  table1['regcode']:=RegCode1;
  table1['borodate']:=form1.Label1.caption;
  table1['membcode']:=MemberCode;
  table1['BoroTime']:=copy(DateTimeTostr(now),12,15);
  table1.post;
end;
if (length(RegCode2)<>0) then
begin
  form8.table1.Seek(RegCode2,soFirstEQ);
  form8.table1.Edit;
  form8.table1.FieldByName('RemTedad').AsInteger := form8.table1.FieldByName('RemTedad').AsInteger - 1;
  form8.table1.post;
  table1.Append;
  table1['regcode']:=RegCode2;
  table1['borodate']:=form1.Label1.caption;
  table1['membcode']:=MemberCode;
  table1['BoroTime']:=copy(DateTimeTostr(now),12,15);
  table1.post;
end;
if (length(RegCode3)<>0) then
begin
  form8.table1.Seek(RegCode3,soFirstEQ);
  form8.table1.Edit;
  form8.table1.FieldByName('RemTedad').AsInteger := form8.table1.FieldByName('RemTedad').AsInteger - 1;
  form8.table1.post;
  table1.Append;
  table1['regcode']:=RegCode3;
  table1['borodate']:=form1.Label1.caption;
  table1['membcode']:=MemberCode;
  table1['BoroTime']:=copy(DateTimeTostr(now),12,15);
  table1.post;
end;
if (length(RegCode4)<>0) then
begin
  form8.table1.Seek(RegCode4,soFirstEQ);
  form8.table1.Edit;
  form8.table1.FieldByName('RemTedad').AsInteger := form8.table1.FieldByName('RemTedad').AsInteger - 1;
  form8.table1.post;
  table1.Append;
  table1['regcode']:=RegCode4;
  table1['borodate']:=form1.Label1.caption;
  table1['membcode']:=MemberCode;
  table1['BoroTime']:=copy(DateTimeTostr(now),12,15);
  table1.post;
end;
if (length(RegCode5)<>0) then
begin
  form8.table1.Seek(RegCode5,soFirstEQ);
  form8.table1.Edit;
  form8.table1.FieldByName('RemTedad').AsInteger := form8.table1.FieldByName('RemTedad').AsInteger - 1;
  form8.table1.post;
  table1.Append;
  table1['regcode']:=RegCode5;
  table1['borodate']:=form1.Label1.caption;
  table1['membcode']:=MemberCode;
  table1['BoroTime']:=copy(DateTimeTostr(now),12,15);
  table1.post;
end;    
//messagedlg('—«  ÕÊÌ· œÂÌœ CD „Ì  Ê«‰Ìœ ›Ì·„ Ì«',mtinformation,[mbok],0);
Edit1.Text:='';
txtGero.Text:='';
txtCode1.Text:='';
txtCode2.Text:='';
txtCode3.Text:='';
txtCode4.Text:='';
txtCode5.Text:='';
FamilyCap.Caption:='';
OnvanCap1.Caption:='';
OnvanCap2.Caption:='';
OnvanCap3.Caption:='';
OnvanCap4.Caption:='';
OnvanCap5.Caption:='';
txtBedeh.Text:='0';
txtBedehTozih.Text:='';
txtBestan.Text:='0';
txtBestanTozih.Text:='';
form9.Table1.Close;
Table1.Close;
form9.Table1.Open;
Table1.Open;
close;
end;

procedure TForm12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
//form9.table1.Close;
//form8.table1.Close;
//form13.table1.Close;
txtGero.Items.SaveToFile('Gero.txt');
table1.cancel;
//table1.FlushBuffers;
//table1.Close;
Query1.Close;
end;

procedure TForm12.BitBtn3Click(Sender: TObject);
var
s:pchar;
begin
getmem(s,13);
strcopy(s,'Explorer ');
strcat(s,' ');
s[9]:=form25.drivecombobox1.Drive;
strcat(s,':\');
s[12]:=chr(0);
winexec(s,SW_SHOWMAXIMIZED);
freemem(s);
end;

procedure TForm12.FormShow(Sender: TObject);
begin
txtMoney.Text:='0';
//txtPish.Text:='0';
capMojodi.Caption:='0';
Edit1.Text:='';
txtCode1.Text:='';
txtCode2.Text:='';
txtCode3.Text:='';
txtCode4.Text:='';
txtCode5.Text:='';
txtGero.Text:='';
FamilyCap.Caption:='';
OnvanCap1.Caption:='';
OnvanCap2.Caption:='';
OnvanCap3.Caption:='';
OnvanCap4.Caption:='';
OnvanCap5.Caption:='';
txtMoney.Visible:=false;
Label8.Visible:=txtMoney.Visible;
Label15.Visible:=txtMoney.Visible;
Form8.table1.close;
Form9.table1.close;
Form8.table1.open;
Form9.table1.open;
table1.Active:=true;
txtGero.Items.LoadFromFile('Gero.txt');
capMojodi.Caption:='0';
Shape1.Brush.Color:=clWhite;
txtBedeh.Text:='0';
txtBedehTozih.Text:='';
txtBestan.Text:='0';
txtBestanTozih.Text:='';
txtCode1.SetFocus;
end;

procedure TForm12.txtCode1Exit(Sender: TObject);
var Code:string;
begin
Code:=form9.ConvetCode(UpperCase(txtCode1.text),txtCode1.MaxLength);
if length(Code)=0 then
   begin
    exit;
   end
  else
   begin
    form8.table1.IndexFieldNames:='Regcode';
    if not(form8.table1.Seek(Code,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD ﬂœ',mterror,[mbok],0);
        exit;
       end;
   end;
onvanCap1.caption:=form8.table1['Name'];
if Code<>'' then
 if (txtCode1.Text=txtCode2.Text)or(txtCode1.Text=txtCode3.Text)or(txtCode1.Text=txtCode4.Text)or(txtCode1.Text=txtCode5.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode1.Text:='';
  onvanCap1.caption:='';
  end;
end;

procedure TForm12.Edit1Exit(Sender: TObject);
var Code:String;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
form9.table1.Open;
Code:=form9.ConvetCode(UpperCase(Edit1.text),edit1.MaxLength);
if length(Code)=0 then
   begin
    exit;
   end
  else
   begin
    form9.table1.IndexFieldNames:='membcode';
    //form9.table1.SetKey;
    if not(form9.table1.Seek(Code,soFirstEQ)) then
       begin
        messagedlg('ﬂœ „‘ —Ì „Ê—œ ‰Ÿ— ‘„« ÊÃÊœ ‰œ«—œ',mterror,[mbok],0);
        exit;
       end
       else
        with form12.table1 do
         begin
          FamilyCap.Caption:=form9.table1.FieldByName('name').asstring+' '+form9.table1.FieldByName('Family').asstring;
          if form9.table1.FieldByName('Bedeh').AsInteger=0 then
            begin
            Shape1.Brush.Color:=clWhite;
            capMojodi.Caption:='»Ì Õ”«»';
            end
            else
            if form9.table1.FieldByName('Bedeh').AsInteger<0 then
               begin
               Shape1.Brush.Color:=$00CCFFCC;
               capMojodi.Caption:=' »” «‰ò«— '+inttostr(abs(form9.table1.FieldByName('Bedeh').AsInteger))+'  Ê„«‰ ';
               end
               else
               begin
               Shape1.Brush.Color:=$00FFDFFF;
               capMojodi.Caption:=' »œÂò«— '+inttostr(abs(form9.table1.FieldByName('Bedeh').AsInteger))+'  Ê„«‰ ';
               end;
          txtMoney.Text:='0';
          //txtPish.Text:='0';
          txtBedeh.Text:='0';
          txtBedehTozih.Text:='';
          txtBestan.Text:='0';
          txtBestanTozih.Text:='';

          IndexFieldNames:='membcode';
          Filtered := true;
          Filter := 'membcode=' + QuotedStr(Code);
          {SetRangeStart;
          FieldByName('membcode').AsString := Code;
          SetRangeEnd;
          FieldByName('membcode').AsString := Code;
          ApplyRange;}
          if RecordCount>=form25.SpinEdit4.Value then
             begin
             messagedlg('œ— «„«‰  œ«—œ Ê»Ì‘ «“ Õœ „Ã«“ «”  CD '+' «Ì‰ „‘ —Ì  ⁄œ«œ'+inttostr(recordcount),mterror,[mbok],0);
             Filtered:=false;
             exit;
             end;
         Filtered:=false;
         end;
   end;
//form12.table1.CancelRange;
form9.table1.Close;
end;

procedure TForm12.Button3Click(Sender: TObject);
begin
if length(trim(txtGero.Text))=0 then exit;
txtGero.Items.Add(txtGero.Text)
end;

procedure TForm12.Button4Click(Sender: TObject);
begin
if (trim(txtGero.Text)='ÅÊ·') then
  begin
  Showmessage('«Ì‰ ê“Ì‰Â —« ‰„Ì  Ê«‰Ìœ Õ–› ò‰Ìœ');
  exit;
  end;
txtGero.Items.Delete(txtGero.Items.IndexOf(txtGero.Text));
end;

procedure TForm12.txtCode1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(txtCode1.Text))=0 then
    SpeedButton1Click(Nil)
    else
    Edit1.SetFocus;
key:=UpCase(Key);    
end;

procedure TForm12.Edit1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(Edit1.Text))=0 then
    SpeedButton6Click(Nil)
    else
    begin
    txtBedeh.SelectAll;
    txtBedeh.SetFocus;
    end;
key:=UpCase(Key);    
end;

procedure TForm12.txtGeroKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  if txtMoney.Visible then
      begin
      txtMoney.SetFocus;
      txtMoney.SelectAll;
      end
    else
      BitBtn1.SetFocus;
end;

procedure TForm12.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtCode1.SetFocus;
end;

procedure TForm12.BitBtn4Click(Sender: TObject);
begin
form9.bitbtn1.Visible:=true;
form9.bitbtn3.Visible:=false;
form9.showmodal;
Edit1Exit(nil);
txtBedeh.SetFocus;
end;

procedure TForm12.SpeedButton1Click(Sender: TObject);
begin
form11.Label2.Caption:='1';
{form11.bitbtn2.visible:=false;
form11.bitbtn5.visible:=true;}
form11.showmodal;
if txtCode1.Text<>'' then
 if (txtCode1.Text=txtCode2.Text)or(txtCode1.Text=txtCode3.Text)or(txtCode1.Text=txtCode4.Text)or(txtCode1.Text=txtCode5.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode1.Text:='';
  onvanCap1.caption:='';
  end;
end;

procedure TForm12.SpeedButton6Click(Sender: TObject);
begin
{form10.bitbtn2.visible:=false;
form10.bitbtn5.visible:=true;}
form10.showmodal;
edit1.OnExit(nil);
end;

procedure TForm12.SpeedButton2Click(Sender: TObject);
begin
form11.Label2.Caption:='2';
{form11.bitbtn2.visible:=false;
form11.bitbtn5.visible:=true;}
form11.showmodal;
if txtCode2.Text<>'' then
 if (txtCode2.Text=txtCode1.Text)or(txtCode2.Text=txtCode3.Text)or(txtCode2.Text=txtCode4.Text)or(txtCode2.Text=txtCode5.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode2.Text:='';
  onvanCap2.caption:='';
  end;
end;

procedure TForm12.SpeedButton3Click(Sender: TObject);
begin
form11.Label2.Caption:='3';
{form11.bitbtn2.visible:=false;
form11.bitbtn5.visible:=true;}
form11.showmodal;
if txtCode3.Text<>'' then
 if (txtCode3.Text=txtCode1.Text)or(txtCode3.Text=txtCode2.Text)or(txtCode3.Text=txtCode4.Text)or(txtCode3.Text=txtCode5.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode3.Text:='';
  onvanCap3.caption:='';
  end;
end;

procedure TForm12.SpeedButton4Click(Sender: TObject);
begin
form11.Label2.Caption:='4';
{form11.bitbtn2.visible:=false;
form11.bitbtn5.visible:=true;}
form11.showmodal;
if txtCode4.Text<>'' then
 if (txtCode4.Text=txtCode1.Text)or(txtCode4.Text=txtCode2.Text)or(txtCode4.Text=txtCode3.Text)or(txtCode4.Text=txtCode5.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode4.Text:='';
  onvanCap4.caption:='';
  end;
end;

procedure TForm12.SpeedButton5Click(Sender: TObject);
begin
form11.Label2.Caption:='5';
{form11.bitbtn2.visible:=false;
form11.bitbtn5.visible:=true;}
form11.showmodal;
if txtCode5.Text<>'' then
 if (txtCode5.Text=txtCode1.Text)or(txtCode5.Text=txtCode2.Text)or(txtCode5.Text=txtCode3.Text)or(txtCode5.Text=txtCode4.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode5.Text:='';
  onvanCap5.caption:='';
  end;
end;

procedure TForm12.txtCode2Exit(Sender: TObject);
var Code:string;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
Code:=form9.ConvetCode(UpperCase(txtCode2.text),txtCode2.MaxLength);
if length(Code)=0 then
   begin
    exit;
   end
  else
   begin
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(Code,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD ﬂœ',mterror,[mbok],0);
        exit;
       end;
   end;
onvanCap2.caption:=form8.table1['Name'];
if Code<>'' then
 if (txtCode2.Text=txtCode1.Text)or(txtCode2.Text=txtCode3.Text)or(txtCode2.Text=txtCode4.Text)or(txtCode2.Text=txtCode5.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode2.Text:='';
  onvanCap2.caption:='';
  end;
end;

procedure TForm12.txtCode3Exit(Sender: TObject);
var Code:string;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
Code:=Form9.ConvetCode(UpperCase(txtCode3.text),txtCode3.MaxLength);
if length(Code)=0 then
   begin
    exit;
   end
  else
   begin
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(Code,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD ﬂœ',mterror,[mbok],0);
        exit;
       end;
   end;
onvanCap3.caption:=form8.table1['Name'];
if Code<>'' then
 if (txtCode3.Text=txtCode1.Text)or(txtCode3.Text=txtCode2.Text)or(txtCode3.Text=txtCode4.Text)or(txtCode3.Text=txtCode5.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode3.Text:='';
  onvanCap3.caption:='';
  end;
end;

procedure TForm12.txtCode4Exit(Sender: TObject);
var Code:string;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
Code:=Form9.ConvetCode(UpperCase(txtCode4.text),txtCode4.MaxLength);
if length(Code)=0 then
   begin
    exit;
   end
  else
   begin
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(Code,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD ﬂœ',mterror,[mbok],0);
        exit;
       end;
   end;
onvanCap4.caption:=form8.table1['Name'];
if Code<>'' then
 if (txtCode4.Text=txtCode1.Text)or(txtCode4.Text=txtCode2.Text)or(txtCode4.Text=txtCode3.Text)or(txtCode4.Text=txtCode5.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode4.Text:='';
  onvanCap4.caption:='';
  end;
end;

procedure TForm12.txtCode5Exit(Sender: TObject);
var Code:string;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
Code:=Form9.ConvetCode(UpperCase(txtCode5.text),txtCode5.MaxLength);
if length(Code)=0 then
   begin
    exit;
   end
  else
   begin
    form8.table1.IndexFieldNames:='Regcode';
    //form8.table1.SetKey;
    if not(form8.table1.Seek(Code,soFirstEQ)) then
       begin
        messagedlg('Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ CD ﬂœ',mterror,[mbok],0);
        exit;
       end;
   end;
onvanCap5.caption:=form8.table1['Name'];
if Code<>'' then
 if (txtCode5.Text=txtCode1.Text)or(txtCode5.Text=txtCode2.Text)or(txtCode5.Text=txtCode3.Text)or(txtCode5.Text=txtCode4.Text) then
  begin
  Showmessage('«Ì‰ „Ê—œ ﬁ»·« œ— «Ì‰ ·Ì”  Ê«—œ ‘œÂ «” ');
  txtCode5.Text:='';
  onvanCap5.caption:='';
  end;
end;

procedure TForm12.txtCode2KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(txtCode2.Text))=0 then
    SpeedButton2Click(Nil)
    else
    Edit1.SetFocus;
key:=UpCase(Key);
end;

procedure TForm12.txtCode3KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(txtCode3.Text))=0 then
    SpeedButton3Click(Nil)
    else
    Edit1.SetFocus;
key:=UpCase(Key);
end;

procedure TForm12.txtCode4KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(txtCode4.Text))=0 then
    SpeedButton4Click(Nil)
    else
    Edit1.SetFocus;
key:=UpCase(Key);    
end;

procedure TForm12.txtCode5KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(txtCode5.Text))=0 then
    SpeedButton5Click(Nil)
    else
    Edit1.SetFocus;
key:=UpCase(Key);
end;

procedure TForm12.Edit1Change(Sender: TObject);
begin
FamilyCap.Caption:='';
capMojodi.Caption:='0';
end;

procedure TForm12.txtMoneyKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#13,#8]) then key:=#0;
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm12.txtGeroChange(Sender: TObject);
begin
txtMoney.Visible:=(trim(txtGero.Text)='ÅÊ·');
Label8.Visible:=txtMoney.Visible;
Label15.Visible:=txtMoney.Visible;
end;

procedure TForm12.txtPishKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#13,#8]) then key:=#0;
if key=#13 then
      begin
      txtGero.SelectAll;
      txtGero.SetFocus;
      end;
end;

procedure TForm12.txtMoneyExit(Sender: TObject);
begin
if trim(txtMoney.Text)='' then txtMoney.Text:='0'; 
end;

procedure TForm12.txtCode1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm12.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm12.txtCode1Change(Sender: TObject);
begin
onvancap1.Caption:='';
end;

procedure TForm12.txtCode2Change(Sender: TObject);
begin
onvancap2.Caption:='';
end;

procedure TForm12.txtCode3Change(Sender: TObject);
begin
onvancap3.Caption:='';
end;

procedure TForm12.txtCode4Change(Sender: TObject);
begin
onvancap4.Caption:='';
end;

procedure TForm12.txtCode5Change(Sender: TObject);
begin
onvancap5.Caption:='';
end;

procedure TForm12.BitBtn5Click(Sender: TObject);
begin
if length(edit1.text)=0 then
   begin
    messagedlg('ﬂœ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    edit1.SetFocus;
    exit;
   end;
Form10.ListAmanat(form9.ConvetCode(edit1.Text,edit1.MaxLength),'');
end;

procedure TForm12.Table1BeforeOpen(DataSet: TDataSet);
begin
table1.IndexFieldNames:='';
end;

procedure TForm12.BitBtn6Click(Sender: TObject);
begin
if length(edit1.text)=0 then
   begin
    messagedlg('ﬂœ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    edit1.SetFocus;
    exit;
   end;
Form10.ListAmanat(form9.ConvetCode(edit1.Text,edit1.MaxLength),'current');
end;

procedure TForm12.txtBedehExit(Sender: TObject);
begin
if Length(trim(txtBedeh.Text))=0 then txtBedeh.Text:='0';
if (Length(txtBedehTozih.Text)=0)and(txtBedeh.Text<>'0') then txtBedehTozih.Text:='»œÂÌ «„«‰  ›Ì·„';

end;

procedure TForm12.txtBedehKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBedehTozih.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TForm12.txtBedehTozihKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBestan.SetFocus;

end;

procedure TForm12.txtBestanKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBestanTozih.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TForm12.txtBestanExit(Sender: TObject);
begin
if Length(trim(txtBestan.Text))=0 then txtBestan.Text:='0';
if (Length(txtBestanTozih.Text)=0)and(txtBestan.Text<>'0') then txtBestanTozih.Text:='ÅÌ‘ Å—œ«Œ  «„«‰  ›Ì·„';

end;

procedure TForm12.txtBestanTozihKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtGero.SetFocus;

end;

end.
