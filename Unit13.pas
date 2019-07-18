unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ActnList,CheckLst,
  ADODB;

type
  TForm13 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    FamilyCap: TLabel;
    SpeedButton5: TSpeedButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    CDList: TCheckListBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    OnvanCap: TLabel;
    Label5: TLabel;
    Action4: TAction;
    Panel3: TPanel;
    Label8: TLabel;
    capGhPar: TLabel;
    Label12: TLabel;
    capPar: TLabel;
    Panel4: TPanel;
    Label6: TLabel;
    txtTakhfif: TEdit;
    Label7: TLabel;
    Panel5: TPanel;
    Shape1: TShape;
    Label14: TLabel;
    capMojodi: TLabel;
    Label13: TLabel;
    capZemanat: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    BitBtn3: TBitBtn;
    Action5: TAction;
    Table1: TADOTable;
    Panel6: TPanel;
    chkMarjo: TCheckBox;
    DirKardList: TCheckListBox;
    Label9: TLabel;
    Label16: TLabel;
    txtBedeh: TEdit;
    Label15: TLabel;
    Label17: TLabel;
    txtBedehTozih: TEdit;
    Label18: TLabel;
    txtBestan: TEdit;
    Label19: TLabel;
    txtBestanTozih: TEdit;
    Label20: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ListFilms;
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure txtTakhfifKeyPress(Sender: TObject; var Key: Char);
    procedure txtBedehKeyPress(Sender: TObject; var Key: Char);
    procedure txtTakhfifChange(Sender: TObject);
    procedure CDListKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure chkMarjoKeyPress(Sender: TObject; var Key: Char);
    procedure chkMarjoClick(Sender: TObject);
    procedure CDListClickCheck(Sender: TObject);
    procedure txtBedehExit(Sender: TObject);
    procedure txtBestanTozihKeyPress(Sender: TObject; var Key: Char);
    procedure txtBedehTozihKeyPress(Sender: TObject; var Key: Char);
    procedure txtBestanKeyPress(Sender: TObject; var Key: Char);
    procedure txtBestanExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FromMainForm: boolean;
  end;

var
  Form13: TForm13;
  CDArray: array [0..100] of string[11];
  CDArrayBoroDate: array [0..100] of string[8];
  Mablagh: array [0..100] of integer;
  Total,memBedeh:int64;
implementation

uses Unit1, Unit9 ,Unit8, Unit25, Unit10, Unit11, Unit12, Unit18, Variants;

{$R *.DFM}

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
//form8.table1.CancelRange;
//form8.table1.Close;
//form9.table1.Close;
//form12.table1.Close;
//Table1.Close;
CDList.Items.Clear;
DirKardList.Items.Clear;
end;

procedure TForm13.ListFilms;
var
Dcheck:string;
ItmNo,DayDirkerd,i,days,dd,mm,mm1,mm2,yy:integer;
MCode:string;
begin
form8.table1.Open;
form12.table1.Open;
form9.table1.Open;
MCode:=Form9.ConvetCode(UpperCase(edit1.text),edit1.MaxLength);
if length(MCode)=0 then
   begin
    messagedlg('ﬂœ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    edit1.SetFocus;
    label2.Caption:='';
    exit;
   end
  else
   begin
    form9.table1.IndexFieldNames:='membcode';
    //form9.table1.FieldByName('membcode').asstring:=MCode;
    //if not(form9.table1.Gotokey) then
    if not(form9.table1.Seek(MCode,soFirstEQ)) then
       begin
        messagedlg('ﬂœ „‘ —Ì „Ê—œ ‰Ÿ— ‘„« ÊÃÊœ ‰œ«—œ',mterror,[mbok],0);
        label2.Caption:='';
        edit1.SetFocus;
        exit;
       end;
   end;
FamilyCap.Caption:=form9.table1.FieldByName('Name').asstring+' '+form9.table1.FieldByName('Family').asstring;
label2.Caption:=form9.table1.FieldByName('HomeTel').asstring;
form12.table1.IndexFieldNames:='membcode';
{    form12.table1.SetKey;
    form12.table1.FieldByName('membcode').asstring:=MCode;

with form12.table1 do
 begin
  IndexFieldNames:='membcode';
  SetRangeStart;
  FieldByName('membcode').AsString := MCode;
  SetRangeEnd;
  FieldByName('membcode').AsString := MCode;
  ApplyRange;
 end;}
form12.table1.Filtered:=true;
form12.table1.Filter:='membcode='+QuotedStr(MCode);
form8.DataSource1.Enabled:=true;
form12.table1.First;
form8.table1.IndexFieldNames:='Regcode';
//CDList.Items.Clear;
//form8.table1.SetKey;
if CDList.Items.Count=0 then
  while not form12.table1.Eof do
    begin
    {if trim(form8.table1.FieldByName('Gero').asstring)<>'' then
      Str:=(' ÷„«‰  '+form8.table1.FieldByName('Gero').asstring)+' '
      else
      Str:=' ';
    check:=form8.table1.FieldByName('kinddisk').AsInteger;
    check:=check shr 1;
    if check=1 then Str:=Str+('‰”ŒÂ òÅÌ «” ')+' ' else Str:=Str+('‰”ŒÂ òÅÌ ‰Ì” ')+' ';
    check:=form8.table1.FieldByName('kinddisk').AsInteger;
    check:=check shl 7;
    check:=check shr 7;
    if check=1 then Str:=Str+('ﬁ›· œ«—œ')+' ' else Str:=Str+('ﬁ›· ‰œ«—œ')+' ';}

    form8.table1.Seek(form12.table1.FieldByName('RegCode').AsString ,soFirstEQ);
    ItmNo:=CDList.Items.Add(' «—ÌŒ «„«‰ : '+form12.table1.FieldByName('borodate').AsString+' '+form12.table1.FieldByName('BoroTime').asstring+' | '+form18.CodeTrimZero(form12.table1.FieldByName('RegCode').AsString)+' - '+form8.table1.FieldByName('Name').AsString);
    DirKardList.Items.Add(' «ŒÌ— ‰œ«—œ');
    DirKardList.Checked[ItmNo]:=false;
    CDArray[ItmNo]:=form12.table1.FieldByName('RegCode').AsString;
    CDArrayBoroDate[ItmNo]:=form12.table1.FieldByName('borodate').AsString;
    form12.table1.Next;
    end;
form12.table1.Filter:='';
form12.table1.Filtered:=false;
if (FromMainForm) then CDList.SetFocus;
if CDList.Items.Count=0 then
  begin
  Showmessage('ÂÌç „Ê—œÌ œ— «„«‰  ›—œ ‰Ì” ');
  exit;
  end;
//counting mablagh
form12.table1.IndexFieldNames:='Regcode';
//DayAmanat:=0;
DayDirkerd:=0;
Total:=0;
for i:=0 to CDLIst.Items.Count-1 do
    begin
      //form12.table1.IndexFieldNames:='RegCode;MembCode';
      //form12.table1.SetKey;
      //if (form12.table1.seek(VarArrayOf([CDArray[i],MCode]),soFirstEQ)) then
       form8.table1.Seek(CDArray[i],soFirstEQ);
      //form12.Table1.FindNearest([CDArray[i]]);
      dcheck := CDArrayBoroDate[i];//form12.table1.fieldbyname('borodate').AsString;
      //counting difference between no. of days
      yy:=(strtoint(form1.label1.Caption[1]+form1.label1.Caption[2])-strtoint(dcheck[1]+dcheck[2]));
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
         messagedlg(' «“ ·Ì”   «—ÌŒ «„«‰  €·ÿ Ê«—œ ‘œÂ «”  Ì«  «—ÌŒ ò«„ÅÌÊ — €·ÿ «”  '+inttostr(i)+' œ— —œÌ› ',mterror,[mbok],0);
         continue;
         end;
         //else
         //DayAmanat:=DayAmanat+days;
      //Mablagh[i]:=0;
      if days>0 then//this is only for calculating dirkardha
         if (days-form25.spinedit2.value)>0 then
            DirKardList.Items.Strings[i] := inttostr(days-form25.spinedit2.value)+'—Ê“  «ŒÌ—';
      if not(CDLIst.Checked[i]) then
         begin
         DirKardList.Checked[i]:=false;
         Continue;//if the film is not checked then we should not calculate mablagh for it
         end;
      if days=0 then
           begin
           //Mablagh[i]:=form8.table1.fieldbyname('Keraie').asinteger;
           Mablagh[i]:=form8.table1.fieldbyname('Keraie').asinteger;
           end
         else
           begin
           if (days-form25.spinedit2.value)>0 then
             begin
             if (DirKardList.Checked[i]=true) then
               Mablagh[i]:=(form25.spinedit2.value*form8.table1.fieldbyname('Keraie').asinteger)+((days-form25.spinedit2.value)*form8.table1.fieldbyname('DirKerd').asinteger)
               else
               Mablagh[i]:=form25.spinedit2.value*form8.table1.fieldbyname('Keraie').asinteger;
             end
           else
             Mablagh[i]:=days*form8.table1.fieldbyname('Keraie').asinteger;
           //Total:=Total+days*form8.table1.fieldbyname('Keraie').asinteger;
           end;
      Total:=Total+Mablagh[i];
    end;
//Total:=Total+(DayDirkerd*form8.table1.fieldbyname('DirKerd').asinteger);
capGhPar.Caption:=InttoStr(Total);
capPar.Caption:=InttoStr(Total);
//txtBedeh.Text := capPar.Caption;
txtTakhfif.Text:='0';
txtBedeh.Text:='0';
end;

procedure TForm13.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm13.BitBtn1Click(Sender: TObject);
var
i:integer;
NoSelection:boolean;
MCode:string;
RegCode:string;
begin
if form8.DataSource1.Enabled=false then
   begin
    messagedlg('«» œ« »«Ìœ ·Ì”  „Ê«—œ œ— «„«‰  „‘ —Ì  ÂÌÂ ‘Êœ',mterror,[mbok],0);
    exit;
   end;
if form8.table1.IsEmpty then
  begin
  messagedlg('ÂÌç „Ê—œÌ œ— «„«‰  „‘ —Ì ‰Ì” ',mterror,[mbok],0);
  exit;
  end;
NoSelection:=true;
for i:= 0 to CDList.Items.Count-1 do
    if CDList.Checked[i] then NoSelection:=false;
if NoSelection then
  begin
  messagedlg('ÂÌç „Ê—œÌ «‰ Œ«» ‰‘œÂ «” . ·ÿ›« ›Ì·„ Â«Ì „Ê—œ ‰Ÿ— ŒÊœ —« «“ ·Ì”  «‰ Œ«» ﬂ‰Ìœ',mterror,[mbok],0);
  exit;
  end;
{form14.MembCode:=form8.table1.FieldByName('MembCode').asstring;
form14.MemCDList.Lines.Clear;
form14.MemCDList.Lines.Add(CName);
form14.MemCDList.Lines.Add('‰«„: '+FamilyCap.Caption);
form14.MemCDList.Lines.Add(' «—ÌŒ ’Ê—  Õ”«»: '+copy(form1.Label1.Caption,7,2)+'/'+copy(form1.Label1.Caption,4,2)+'/'+copy(form1.Label1.Caption,0,2)+' '+form1.TimeCap.Caption);
form14.MemCDList.Lines.Add('=============================');
form8.table1.IndexFieldNames:='Regcode';
DayAmanat:=0;
DayDirkerd:=0;
Total:=0;
for i:=0 to CDLIst.Items.Count-1 do
  if CDLIst.Checked[i] then
    begin
    Form8.Table1.FindNearest([CDArray[i]]);
    form14.MemCDList.Lines.Add(' «—ÌŒ «„«‰ : '+copy(form8.table1.FieldByName('borodate').AsString,7,2)+'/'+copy(form8.table1.FieldByName('borodate').AsString,4,2)+'/'+copy(form8.table1.FieldByName('borodate').AsString,0,2)+' '+form8.table1.FieldByName('BoroTime').asstring+' - '+form8.table1.FieldByName('Name').AsString+' '+form8.table1.FieldByName('RegCode').AsString);
    dcheck:=form8.table1.fieldbyname('borodate').AsString;
    //counting difference between no. of days
    yy:=(strtoint(form1.label1.Caption[1]+form1.label1.Caption[2])-strtoint(dcheck[1]+dcheck[2]));
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
       form14.MemCDList.Lines.Add(' «—ÌŒ «„«‰  €·ÿ Ê«—œ ‘œÂ «”  Ì«  «—ÌŒ »—‰«„Â €·ÿ «” ');
       messagedlg(' «“ ·Ì”   «—ÌŒ «„«‰  €·ÿ Ê«—œ ‘œÂ «”  Ì«  «—ÌŒ ò«„ÅÌÊ — €·ÿ «”  '+inttostr(i)+' œ— —œÌ› ',mterror,[mbok],0);
       form14.MemCDList.Lines.Add('---------------------------------');
       continue;
       end
       else
       DayAmanat:=DayAmanat+days;
    form14.MemCDList.Lines.Add(' ò—«ÌÂ Â— —Ê“ «„«‰  = '+form8.table1.fieldbyname('Keraie').asstring);
    form14.MemCDList.Lines.Add('  ⁄œ«œ —Ê“ «„«‰  = '+InttoStr(days));
    Mablagh[i]:=0;
    if days=0 then
         begin
         Mablagh[i]:=form8.table1.fieldbyname('Keraie').asinteger;
         Total:=Total+Mablagh[i];
         form14.MemCDList.Lines.Add(' Ã„⁄ = '+inttostr(Mablagh[i]));
         end
       else
         begin
         form14.MemCDList.Lines.Add(' ò—«ÌÂ Â— —Ê“ œÌ—ò—œ = '+InttoStr(form25.spinedit5.value));
         if (days-form25.spinedit2.value)>0 then
           begin
           DayDirkerd:=DayDirkerd+(days-form25.spinedit2.value);
           form14.MemCDList.Lines.Add('  ⁄œ«œ —Ê“ œÌ—ò—œ = '+InttoStr(days-form25.spinedit2.value));
           Mablagh[i]:=(days*form8.table1.fieldbyname('Keraie').asinteger)+((days-form25.spinedit2.value)*form25.spinedit5.value);
           form14.MemCDList.Lines.Add('Ã„⁄ = '+inttostr(Mablagh[i]));
           end
           else
           begin
           form14.MemCDList.Lines.Add('  ⁄œ«œ —Ê“ œÌ—ò—œ = 0 ');
           Mablagh[i]:=days*form8.table1.fieldbyname('Keraie').asinteger;
           form14.MemCDList.Lines.Add('Ã„⁄ = '+inttostr(Mablagh[i]));
           end;
         Total:=Total+days*form8.table1.fieldbyname('Keraie').asinteger;
         end;
    form14.MemCDList.Lines.Add('------------------------------------');
    end;
Total:=Total+(DayDirkerd*form25.spinedit5.value);
Form14.txtPardakhti.text:=InttoStr(Total);
form14.MemCDList.Lines.Add(' Ã„⁄  ⁄œ«œ —Ê“ œÌ— ò—œ = '+InttoStr(DayDirkerd));
form14.MemCDList.Lines.Add(' Ã„⁄  ⁄œ«œ —Ê“ «„«‰  = '+InttoStr(DayAmanat));
form14.MemCDList.Lines.Add(' „»·€ ò· = '+InttoStr(Total));
Form14.showmodal;
if Form14.Label13.Caption='C' then exit;}
MCode:=form9.ConvetCode(UpperCase(edit1.Text),edit1.MaxLength);
RegCode:=form9.ConvetCode(UpperCase(edit2.Text),edit2.MaxLength);
table1.Open;
for i:=0 to CDLIst.Items.Count-1 do
  if CDLIst.Checked[i] then
    begin
    form8.table1.IndexFieldNames:='Regcode';
    form8.table1.Seek(CDArray[i],soFirstEQ);
    form8.table1.Edit;
    form8.table1.FieldByName('RemTedad').AsInteger := form8.table1.FieldByName('RemTedad').AsInteger + 1;
    form8.table1.post;

  {form12.table1.IndexFieldNames:='RegCode;MembCode';
  form12.table1.SetKey;
  if (form12.table1.Seek(VarArrayOf([CDArray[i],MCode]),soFirstEQ)) then
    form12.table1.Delete;}
    form12.Query1.Close;
    form12.Query1.SQL.Clear;
    form12.Query1.SQL.text:=('Delete from Borrow where RegCode=:RCode and MembCode=:MCode');
    form12.Query1.Parameters.ParamByName('mcode').Value:=MCode;
    form12.Query1.Parameters.ParamByName('rcode').Value:=CDArray[i];
    form12.Query1.ExecSQL;
    form12.Query1.Close;


    //Form8.Table1.FindNearest([CDArray[i]]);
    if (chkMarjo.Checked=false) then
      begin
      table1.append;
      table1.FieldByName('regcode').asstring:=CDArray[i];
      table1.FieldByName('pay').AsInteger:=Mablagh[i];
      table1.FieldByName('borodate').Asstring:=CDArrayBoroDate[i];
      table1.FieldByName('membcode').asstring:=MCode;
      table1.FieldByName('retdate').asstring:=form1.label1.caption;
      table1.FieldByName('UserName').asstring:=Form1.User_Name;
      table1.post;
      end;
    //form8.table1.edit;
    //form8.table1.FieldByName('borodate').AsString:='';
    //form8.table1.FieldByName('membcode').AsString:='';
//    form8.table1.FieldByName('Gero').AsString:='';
    //form8.table1.post;
    end;
if (chkMarjo.Checked=false)and(strtoint(txtTakhfif.Text)<>0) then
  begin
  table1.append;
  table1.FieldByName('regcode').asstring:=' Œ›Ì›';
  table1.FieldByName('pay').AsString:=inttostr(strtoint(txtTakhfif.Text)*-1);
  table1.FieldByName('membcode').asstring:=trim(MCode);
  table1.FieldByName('retdate').asstring:=form1.label1.caption;
  table1.FieldByName('UserName').asstring:=Form1.User_Name;
  table1.post;
  end;
{if (chkMarjo.Checked=false)and(strtoint(txtBedeh.Text)<>0) then
  begin
  table1.append;
  table1.FieldByName('regcode').asstring:='ò”— „ÊÃÊœÌ »«»  »—ê‘  ›Ì·„';
  table1.FieldByName('pay').AsString:=inttostr(strtoint(txtBedeh.Text)*-1);
  table1.FieldByName('membcode').asstring:=trim(MCode);
  table1.FieldByName('retdate').asstring:=form1.label1.caption;
  table1.FieldByName('UserName').asstring:=Form1.User_Name;
  table1.post;

  form9.Table1.Open;
  form9.table1.IndexFieldNames:='membcode';
  form9.table1.Seek(trim(MCode),soFirstEQ);
  form9.table1.edit;
  form9.table1.FieldByName('Bedeh').AsInteger:=form9.table1.FieldByName('Bedeh').AsInteger+StrtoInt(txtBedeh.Text);
  form9.table1.post;
  end;}
form9.Table1.Open;
form9.table1.IndexFieldNames:='membcode';
form9.table1.Seek(trim(MCode),soFirstEQ);
if trim(form9.table1.FieldByName('Gero').AsString)<>'' then
 if Messagedlg('¬Ì« ÷„«‰  „‘ —Ì —« »Â «Ê »—ê‘  œ«œÌœ',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
  form9.table1.edit;
  form9.table1.FieldByName('Gero').AsString:='';
  form9.table1.post;
  end;
// «Ì‰ ﬁ”„  »—«Ì »” «‰ﬂ«—Ì Ê »œÂ ﬂ«—Ì «” 
if (txtBedeh.Text<>'0') then
    form10.HesabMoshtari(txtBedeh.Text,txtBedehTozih.Text,-1);
if (txtBestan.Text<>'0') then
    form10.HesabMoshtari(txtBestan.Text,txtBestanTozih.Text,1);
////////////
CDList.Items.Clear;
DirKardList.Items.Clear;
table1.Close;
table1.Open;
txtBedeh.Text:='0';
txtBedehTozih.Text:='';
txtBestan.Text:='0';
txtBestanTozih.Text:='';
close;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
if (FromMainForm) then
  begin
  Edit1.Text:='';
  Edit2.Text:='';
  Edit2.SetFocus;
  OnvanCap.Caption:='';
  Label2.Caption:='';
  FamilyCap.Caption:='';
  capGhPar.Caption:='0';
  capPar.Caption:='0';
  capMojodi.Caption:='0';
  capZemanat.Caption:='';
  txtTakhfif.Text:='0';
  txtBedeh.Text:='0';
  chkMarjo.Checked:=false;
  form8.DataSource1.Enabled:=false;
  end;
table1.close;
form12.table1.close;
form9.table1.close;
form8.table1.close;
table1.Open;
form12.table1.Open;
form9.table1.open;
form8.table1.open;
end;

procedure TForm13.Edit1Change(Sender: TObject);
begin
form8.DataSource1.Enabled:=false;
label2.caption:='';
FamilyCap.Caption:='';
OnvanCap.Caption:='';
CDList.Items.Clear;
DirKardList.Items.Clear;
capGhPar.Caption:='0';
capPar.Caption:='0';
capMojodi.Caption:='0';
capZemanat.Caption:='';
txtTakhfif.Text:='0';
txtBedeh.Text:='0';
end;

procedure TForm13.Edit1Exit(Sender: TObject);
var MCode:string;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
MCode:=form9.ConvetCode(UpperCase(Edit1.text),Edit1.MaxLength);
if length(MCode)=0 then
   begin
    messagedlg('ﬂœ „‘ —Ì »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    exit;
   end
  else
   begin
//    form9.table1.Open;
    form9.table1.IndexFieldNames:='membcode';
    //form9.table1.SetKey;
    if not(form9.table1.Seek(MCode,soFirstEQ)) then
       begin
        messagedlg('ﬂœ „‘ —Ì „Ê—œ ‰Ÿ— ‘„« ÊÃÊœ ‰œ«—œ',mterror,[mbok],0);
        exit;
       end
       else
        with form8.table1 do
         begin
          FamilyCap.Caption:=form9.table1.FieldByName('name').asstring+' '+form9.table1.FieldByName('family').asstring;
          label2.Caption:=form9.table1.FieldByName('HomeTel').asstring;
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
         MemBedeh:=strtoint64(form9.table1.FieldByName('bedeh').AsString);
         capZemanat.Caption:=form9.table1.FieldByName('Gero').asstring;
         ListFilms;
         end;
   end;

end;

procedure TForm13.Edit1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(edit1.Text))=0 then
    SpeedButton5Click(Nil)
    else
    CDList.SetFocus;
key:=UpCase(Key);    
end;


procedure TForm13.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Edit1.SetFocus;
end;

procedure TForm13.SpeedButton5Click(Sender: TObject);
begin
form8.DataSource1.Enabled:=false;
{form10.bitbtn2.visible:=false;
form10.bitbtn5.visible:=true;}
form10.showmodal;
Edit1Exit(nil);
end;

procedure TForm13.Edit2Exit(Sender: TObject);
var
tmpCustomer:string;
InputNo:integer;
counter:integer;
MembCodes: array [0..100] of string[10];
RegCode: string;
function SafeConvert(s: string; var i: integer; min:integer; max:integer): boolean;
begin
   try
     i := StrToInt(s);
     Result := true;
   except
     Result := false;
   end;
   if (i>max)or(i<min) then Result := false;
end;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
RegCode:=form9.ConvetCode(UpperCase(edit2.text),edit2.MaxLength);
if (RegCode='')or(CDList.Count>0) then exit;//count>0 = procedure already done
form8.table1.IndexFieldNames:='Regcode';
//form8.table1.SetKey;
if not(form8.table1.seek(RegCode,soFirstEQ)) then
   begin
   showmessage('ﬂœ „Ê—œ ‰Ÿ— ‘„« Ì«›  ‰‘œ');
   exit;
   end;
OnvanCap.Caption:=form8.table1.fieldbyname('Name').asstring;
form12.table1.IndexFieldNames:='Regcode';
form12.table1.Filtered:=true;
form12.table1.Filter:='RegCode='+QuotedStr(RegCode);
{form12.table1.SetRangeStart;
form12.table1.FieldByName('Regcode').AsString := RegCode;
form12.table1.SetRangeEnd;
form12.table1.FieldByName('Regcode').AsString := RegCode;
form12.table1.ApplyRange;}
if form12.table1.RecordCount=0 then
   begin
   messagedlg('œ— «„«‰  ‰Ì”  CD/›Ì·„',mtinformation,[mbok],0);
   edit1.Text:='';
   form12.table1.Filter:='';
   form12.table1.Filtered:=false;
   exit;
   end;
if form12.table1.RecordCount=1 then
   begin
   edit1.Text:=form18.CodeTrimZero(form12.table1.FieldByName('membcode').AsString);
   end
   else
   begin
    tmpCustomer:='';
    form12.table1.First;
    form9.table1.IndexFieldNames:='membcode';
    //form9.table1.SetKey;
    counter:=0;
    while not form12.table1.Eof do
      begin
      counter:=counter+1;
      form9.table1.Seek(form12.table1.FieldByName('membcode').AsString,soFirstEQ);
      MembCodes[counter]:= form12.table1.FieldByName('membcode').AsString;
      tmpCustomer := tmpCustomer +chr(13)+ inttostr(counter) +'=ﬂœ „‘ —Ì:'+form18.CodeTrimZero(form9.table1.FieldByName('membcode').asstring)+' ‰«„:'+form9.table1.FieldByName('name').asstring;
      form12.table1.Next;
      end;
    repeat
    until SafeConvert(InputBox('«‰ Œ«» „‘ —Ì', '›Ì·„ œ— «„«‰   ⁄œ«œÌ „‘ —Ì «” ° ⁄œœ „ ‰«Ÿ— »« „‘ —Ì „Ê—œ ‰Ÿ— ŒÊœ —« «‰ Œ«» ›—„«∆Ìœ'+tmpCustomer, '1'), InputNo, 1, counter);
    edit1.Text:=form18.CodeTrimZero(trim(MembCodes[InputNo]));
   end;
form12.table1.Filter:='';
form12.table1.Filtered:=false;
Edit1Exit(nil);;
end;

procedure TForm13.Edit2KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(edit2.Text))=0 then
        SpeedButton1Click(Nil)
    else
        CDList.SetFocus;
key:=UpCase(Key);
end;

procedure TForm13.SpeedButton1Click(Sender: TObject);
begin
form11.showmodal;
edit2.OnExit(nil);
end;

procedure TForm13.txtTakhfifKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#13,#8]) then key:=#0;
if key=#13 then txtBedeh.SetFocus;
end;

procedure TForm13.txtBedehKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBedehTozih.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TForm13.txtTakhfifChange(Sender: TObject);
begin
if trim(txtBedeh.Text)='' then txtBedeh.Text:='0';
if trim(txtTakhfif.Text)='' then txtTakhfif.Text:='0';
capPar.Caption:=inttostr(strtoint64(capGhPar.Caption)-strtoint64(txtTakhfif.Text));//-strtoint64(txtBedeh.Text)
//txtBedeh.Text := capPar.Caption;
//capBedeh.Caption:=inttostr(memBedeh+strtoint64(txtBedeh.Text));
end;

procedure TForm13.CDListKeyPress(Sender: TObject; var Key: Char);
var i:integer;
begin
if key=#13 then
   chkMarjo.SetFocus;
end;

procedure TForm13.Edit2Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm13.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm13.BitBtn3Click(Sender: TObject);
begin
Winexec('calc',0);
end;

procedure TForm13.chkMarjoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 if (chkMarjo.Checked) then
   begin
   txtTakhfif.SelectAll;
   txtTakhfif.SetFocus;
   end;
end;

procedure TForm13.chkMarjoClick(Sender: TObject);
begin
txtTakhfif.Enabled := not chkMarjo.Checked;
txtBedeh.Enabled := not chkMarjo.Checked;
capPar.Enabled := not chkMarjo.Checked;
capGhPar.Enabled := not chkMarjo.Checked;
end;

procedure TForm13.CDListClickCheck(Sender: TObject);
var i:integer;
begin
for i:=0 to CDLIst.Items.Count-1 do
    if (CDLIst.Checked[i]) then
        DirKardList.Checked[i]:=true;
Edit1Exit(nil);
end;

procedure TForm13.txtBedehExit(Sender: TObject);
begin
if Length(trim(txtBedeh.Text))=0 then txtBedeh.Text:='0';
if (Length(txtBedehTozih.Text)=0)and(txtBedeh.Text<>'0') then txtBedehTozih.Text:='»œÂÌ »—ê‘  ›Ì·„';

end;

procedure TForm13.txtBestanTozihKeyPress(Sender: TObject; var Key: Char);
begin

if key=#13 then BitBtn1.SetFocus;

end;

procedure TForm13.txtBedehTozihKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBestan.SetFocus;
end;

procedure TForm13.txtBestanKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBestanTozih.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TForm13.txtBestanExit(Sender: TObject);
begin
if Length(trim(txtBestan.Text))=0 then txtBestan.Text:='0';
if (Length(txtBestanTozih.Text)=0)and(txtBestan.Text<>'0') then txtBestanTozih.Text:='ÅÌ‘ Å—œ«Œ  «„«‰  ›Ì·„';

end;

end.
