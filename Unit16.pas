unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TForm16 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel3: TBevel;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    OnvanCap: TLabel;
    SpeedButton5: TSpeedButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    capCon: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses Unit8, Unit14, Unit1, Unit13, Unit25, Unit11, Unit9, Unit18, DB;

{$R *.DFM}

procedure TForm16.BitBtn1Click(Sender: TObject);
var
Dcheck:string;
Total,days,dd,mm,mm1,mm2,yy:integer;
begin
    form8.table1.IndexFieldNames:='Regcode';
    form8.table1.SetKey;
    if not(form8.table1.FindKey([edit1.text])) then
       begin
        showmessage('ﬂœ „Ê—œ ‰Ÿ— ‘„« Ì«›  ‰‘œ');
        edit1.SetFocus;
        exit;
       end;
if form8.table1.FieldByName('membcode').asstring='' then
   begin
   messagedlg('œ— «„«‰  ‰Ì”  CD/›Ì·„',mtinformation,[mbok],0);
   Edit1.SetFocus;
   exit;
   end;
{if messagedlg(form8.table1.fieldbyname('membcode').asstring+'›Ì·„ :œ— «„«‰  ﬂœ/CD «Ì« „«Ì· »Â »—ê‘  Â” Ìœø',
   mtconfirmation,[mbyes,mbno],0)=mrno then exit;}
form18.Query1.Active:=false;
form18.Query1.SQL.Text:='Select name from members where membcode='+QuotedStr(trim(form8.table1.fieldbyname('membcode').asstring));
form18.Query1.Active:=true;
form14.MembCode:=form8.table1.FieldByName('MembCode').asstring;
form14.MemCDList.Lines.Clear;
form14.MemCDList.Lines.Add(CName);
form14.MemCDList.Lines.Add('‰«„: '+trim(form18.Query1.fieldbyname('name').asstring));
form14.MemCDList.Lines.Add(' «—ÌŒ ’Ê—  Õ”«»: '+copy(form1.Label1.Caption,7,2)+'/'+copy(form1.Label1.Caption,4,2)+'/'+copy(form1.Label1.Caption,0,2)+' '+form1.TimeCap.Caption);
form14.MemCDList.Lines.Add('=============================');
form14.MembCode:=form8.table1.fieldbyname('membcode').asstring;
form18.Query1.Active:=false;
form14.MemCDList.Lines.Add(' «—ÌŒ «„«‰ : '+copy(form8.table1.FieldByName('borodate').AsString,7,2)+'/'+copy(form8.table1.FieldByName('borodate').AsString,4,2)+'/'+copy(form8.table1.FieldByName('borodate').AsString,0,2)+' '+form8.table1.FieldByName('Time').asstring+' - '+form8.table1.FieldByName('Name').AsString+' '+form8.table1.FieldByName('RegCode').AsString);
dcheck:=form8.table1.fieldbyname('borodate').AsString;
//counting difference between no. of days
yy:=strtoint(form1.label1.Caption[1]+form1.label1.Caption[2])-strtoint(dcheck[1]+dcheck[2]);
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
Total:=0;
if days<0 then
   begin
   form14.MemCDList.Lines.Add(' «—ÌŒ «„«‰  €·ÿ Ê«—œ ‘œÂ «”  Ì«  «—ÌŒ »—‰«„Â €·ÿ «” ');
   messagedlg(' «—ÌŒ «„«‰  €·ÿ Ê«—œ ‘œÂ «”  Ì«  «—ÌŒ »—‰«„Â €·ÿ «” ',mterror,[mbok],0);
   form14.MemCDList.Lines.Add('---------------------------------');
   end
  else
   with form14 do
    begin
    MemCDList.Lines.Add(' ò—«ÌÂ Â— —Ê“ «„«‰  = '+form8.table1.fieldbyname('Keraie').asstring);
    MemCDList.Lines.Add('  ⁄œ«œ —Ê“ «„«‰  = '+InttoStr(days));
    if days=0 then
         begin
         Total:=form8.table1.fieldbyname('Keraie').AsInteger;
         MemCDList.Lines.Add(' Ã„⁄ = '+inttostr(Total));
         end
       else
         begin
         MemCDList.Lines.Add(' ò—«ÌÂ Â— —Ê“ œÌ—ò—œ = '+InttoStr(form25.spinedit5.value));
         if (days-form25.spinedit2.value)>0 then
           begin
           MemCDList.Lines.Add('  ⁄œ«œ —Ê“ œÌ—ò—œ = '+InttoStr(days-form25.spinedit2.value));
           Total:=(days*form8.table1.fieldbyname('Keraie').asinteger)+((days-form25.spinedit2.value)*form25.spinedit5.value);
           MemCDList.Lines.Add('Ã„⁄ = '+inttostr(Total));
           end
           else
           begin
           MemCDList.Lines.Add('  ⁄œ«œ —Ê“ œÌ—ò—œ = 0 ');
           Total:=days*form8.table1.fieldbyname('Keraie').asinteger;
           MemCDList.Lines.Add('Ã„⁄ = '+inttostr(Total));
           end;
         end;
    end;
Form14.txtPardakhti.text:=inttostr(Total);
Form14.showmodal;
if Form14.Label13.Caption='C' then
  begin
  close;  
  exit;
  end;
{if Form14.SpinEdit2.Value<>0 then
     begin
     form9.table1.Open;
     form9.table1.IndexFieldNames:='membcode';
     form9.table1.SetKey;
     form9.table1.FindKey([form8.table1.FieldByName('membcode').AsString]);
     form9.table1.edit;
     form9.table1.FieldByName('Bedeh').AsInteger:=form9.table1.FieldByName('Bedeh').AsInteger+Form14.SpinEdit2.Value;
     form9.table1.post;
     form9.table1.Close;
     end;}
with form13 do
     begin
     table1.Open;
     table1.append;
     table1.FieldByName('regcode').asstring:=form8.table1.FieldByName('regcode').asstring;
     table1.FieldByName('pay').AsInteger:=Total;
     table1.FieldByName('membcode').asstring:=form8.table1.FieldByName('membcode').asstring;
     table1.FieldByName('retdate').asstring:=form1.label1.caption;
     table1.FieldByName('UserName').asstring:=Form1.User_Name;
     table1.post;
     end;
form8.table1.edit;
form8.table1.FieldByName('borodate').AsString:='';
form8.table1.FieldByName('membcode').AsString:='';
form8.table1.FieldByName('Gero').AsString:='';
form8.table1.post;
if Total-strtoint(Form14.txtPardakhti.text)<>0 then
  begin
  Form13.table1.Open;
  Form13.table1.append;
  if Total-strtoint(Form14.txtPardakhti.text)<0 then
      Form13.table1.FieldByName('regcode').asstring:='œ—Ì«›  ‰ﬁœ'
    else
      Form13.table1.FieldByName('regcode').asstring:=' Œ›Ì›';
  Form13.table1.FieldByName('pay').AsInteger:=strtoint(Form14.txtPardakhti.text)-Total;
  Form13.table1.FieldByName('membcode').asstring:=trim(form14.MembCode);
  Form13.table1.FieldByName('retdate').asstring:=form1.label1.caption;
  Form13.table1.FieldByName('UserName').asstring:=Form1.User_Name;
  Form13.table1.post;
  Form13.table1.Close;
  end;
close;
end;

procedure TForm16.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form8.table1.Close;
form13.table1.Close;
end;

procedure TForm16.FormShow(Sender: TObject);
begin
Edit1.Text:='';
form8.table1.open;
form13.table1.open;
Edit1.SetFocus;
OnvanCap.Caption:='';
capCon.Caption:='';
end;

procedure TForm16.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm16.Edit1Exit(Sender: TObject);
var
Str:string;
check:byte;
begin
Edit1.Text:=UpperCase(Edit1.text);
form8.table1.IndexFieldNames:='Regcode';
form8.table1.SetKey;
if not(form8.table1.FindKey([edit1.text])) then
       begin
        showmessage('ﬂœ „Ê—œ ‰Ÿ— ‘„« Ì«›  ‰‘œ');
        exit;
       end;
OnvanCap.Caption:=form8.table1.fieldbyname('Name').asstring;
Str:='';
if trim(form8.table1.FieldByName('Gero').asstring)<>'' then
   Str:=Str+(' ê—Ê '+form8.table1.FieldByName('Gero').asstring)+' '
  else
   Str:=Str+('ê—Ê ‰œ«—œ')+' ';
check:=form8.table1.FieldByName('kinddisk').AsInteger;
check:=check shr 1;
if check=1 then Str:=Str+('‰”ŒÂ òÅÌ «” ')+' ' else Str:=Str+('‰”ŒÂ òÅÌ ‰Ì” ')+' ';
check:=form8.table1.FieldByName('kinddisk').AsInteger;
check:=check shl 7;
check:=check shr 7;
if check=1 then Str:=Str+('ﬁ›· œ«—œ')+' ' else Str:=Str+('ﬁ›· ‰œ«—œ')+' ';
capCon.Caption:=str;
end;

procedure TForm16.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  if length(trim(edit1.Text))=0 then
    SpeedButton5Click(Nil)
    else
    BitBtn1.SetFocus;
end;

procedure TForm16.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Edit1.SetFocus;
end;

procedure TForm16.SpeedButton5Click(Sender: TObject);
begin
{form11.bitbtn2.visible:=false;
form11.bitbtn5.visible:=true;}
form11.showmodal;
edit1.OnExit(nil);
end;

procedure TForm16.Edit1Change(Sender: TObject);
begin
OnvanCap.Caption:='';
capCon.Caption:='';
end;

end.
