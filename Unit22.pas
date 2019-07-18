unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ActnList, DBCtrls, Grids, DBGrids;

type
  TForm22 = class(TForm)
    Bevel1: TBevel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    Edit4: TEdit;
    ActionList1: TActionList;
    Action1: TAction;
    CheckBox4: TCheckBox;
    DBGrid1: TDBGrid;
    SpeedButton5: TSpeedButton;
    Action2: TAction;
    FamilyCap: TLabel;
    rgSort: TRadioGroup;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    Action3: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2Enter(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

uses Unit18, Unit23, Unit1, Unit21, User_Main, Unit10, Unit9, KalaSabt,
  Unit3, adodb, KalaSearch;

{$R *.DFM}

procedure TForm22.FormShow(Sender: TObject);
begin
form18.QueryCDBank.Close;
CheckBox1.SetFocus;
MaskEdit1.Text:=Form1.Label1.Caption;
MaskEdit2.Text:=Form1.Label1.Caption;
end;

procedure TForm22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
form18.QueryCDBank.Close;
end;

procedure TForm22.MaskEdit1Exit(Sender: TObject);
var
s:string;
i:word;
b:boolean;
begin
b:=false;
s:=maskedit1.Text;
for i:=1 to 8 do
 if s[i]=' ' then b:=true;
if b then
 begin
 messagedlg('”«·°„«Â Ê —Ê“  «—ÌŒ »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
 maskedit1.SetFocus;
 maskedit1.SelectAll;
 end
else
 if (strtoint(copy(maskedit1.Text,4,2))=0)or(strtoint(copy(maskedit1.Text,7,2))=0)or(strtoint(copy(maskedit1.Text,1,2))=0) then
 begin
  messagedlg('”«·°„«Â Ê —Ê“ ’›— ÊÃÊœ ‰œ«—œ.·ÿ›«  «—ÌŒ —« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
  maskedit1.SetFocus;
  maskedit1.SelectAll;
 end
 else
  if strtoint(copy(maskedit1.Text,4,2))<7 then
   begin
    if strtoint(copy(maskedit1.Text,7,2))>31 then
       begin
        messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
        maskedit1.SetFocus;
        maskedit1.SelectAll;
       end;
   end
   else
    if strtoint(copy(maskedit1.Text,4,2))<12 then
       begin
        if strtoint(copy(maskedit1.Text,7,2))>30 then
           begin
            messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
            maskedit1.SetFocus;
            maskedit1.SelectAll;
           end;
       end
       else
        if strtoint(copy(maskedit1.Text,4,2))=12 then
           begin
            if strtoint(copy(maskedit1.Text,7,2))>29 then
               begin
                messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
                maskedit1.SetFocus;
                maskedit1.SelectAll;
               end;
           end
           else
            begin
             messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
             maskedit1.SetFocus;
             maskedit1.SelectAll;
            end;
end;

procedure TForm22.MaskEdit2Exit(Sender: TObject);
var
s:string;
i:word;
b:boolean;
begin
b:=false;
s:=maskedit2.Text;
for i:=1 to 8 do
 if s[i]=' ' then b:=true;
if b then
 begin
 messagedlg('”«·°„«Â Ê —Ê“  «—ÌŒ »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
 maskedit2.SetFocus;
 maskedit2.SelectAll;
 end
else
 if (strtoint(copy(maskedit2.Text,4,2))=0)or(strtoint(copy(maskedit2.Text,7,2))=0)or(strtoint(copy(maskedit2.Text,1,2))=0) then
 begin
  messagedlg('”«·°„«Â Ê —Ê“ ’›— ÊÃÊœ ‰œ«—œ.·ÿ›«  «—ÌŒ —« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
  maskedit2.SetFocus;
  maskedit2.SelectAll;
 end
 else
  if strtoint(copy(maskedit2.Text,4,2))<7 then
   begin
    if strtoint(copy(maskedit2.Text,7,2))>31 then
       begin
        messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
        maskedit2.SetFocus;
        maskedit2.SelectAll;
       end;
   end
   else
    if strtoint(copy(maskedit2.Text,4,2))<12 then
       begin
        if strtoint(copy(maskedit2.Text,7,2))>30 then
           begin
            messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
            maskedit2.SetFocus;
            maskedit2.SelectAll;
           end;
       end
       else
        if strtoint(copy(maskedit2.Text,4,2))=12 then
           begin
            if strtoint(copy(maskedit2.Text,7,2))>29 then
               begin
                messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
                maskedit2.SetFocus;
                maskedit2.SelectAll;
               end;
           end
           else
            begin
             messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
             maskedit2.SetFocus;
             maskedit2.SelectAll;
            end;
end;

procedure TForm22.MaskEdit2Enter(Sender: TObject);
begin
maskedit2.EditMask:='99/99/99';
end;

procedure TForm22.MaskEdit1Enter(Sender: TObject);
begin
maskedit1.EditMask:='99/99/99';
end;

procedure TForm22.CheckBox1Click(Sender: TObject);
begin
label3.Enabled:=checkbox1.Checked;
edit1.Enabled:=checkbox1.Checked;
if edit1.Enabled then edit1.SetFocus;
end;

procedure TForm22.CheckBox2Click(Sender: TObject);
begin
label1.Enabled:=checkbox2.Checked;
label2.Enabled:=checkbox2.Checked;
Edit3.Enabled:=checkbox2.Checked;
Edit4.Enabled:=checkbox2.Checked;
if edit3.Enabled then edit3.SetFocus;
end;

procedure TForm22.CheckBox3Click(Sender: TObject);
begin
label5.Enabled:=checkbox3.Checked;
label6.Enabled:=checkbox3.Checked;
maskedit1.Enabled:=checkbox3.Checked;
maskedit2.Enabled:=checkbox3.Checked;
if maskedit1.Enabled then maskedit1.SetFocus;
end;

procedure TForm22.BitBtn1Click(Sender: TObject);
var MCode,minRegCode,maxRegCode:string;
begin
MCode:=form9.ConvetCode(edit1.text,edit1.MaxLength);
minRegCode:=form9.ConvetCode(Edit3.text,edit3.MaxLength);
maxRegCode:=form9.ConvetCode(Edit4.text,edit4.MaxLength);
form18.QueryCDBank.ParamCheck:=true;
form18.QueryCDBank.Close;
form18.QueryCDBank.SQL.Clear;
form18.QueryCDBank.SQL.text:=('select sum(pay) as jam from payment');
if (checkbox1.Checked)or(checkbox2.checked)or(checkbox3.Checked) then
   begin
   if (checkbox1.Checked=true)and(checkbox2.checked=true)and(checkbox3.Checked=true) then
      begin
       form18.QueryCDBank.SQL.add('where (membcode=:codemin)and(RegCode>=:rcodmin and RegCode<=:rcodmax)and(retdate>=:tmin and retdate<=:tmax)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=MCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
       form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=true)and(checkbox3.Checked=false) then
      begin
       form18.QueryCDBank.SQL.add('where (membcode=:codemin)and(RegCode>=:rcodmin and RegCode<=:rcodmax)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=MCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=false)and(checkbox3.Checked=true) then
      begin
       form18.QueryCDBank.SQL.add('where (membcode=:codemin)and(retdate>=:tmin and retdate<=:tmax)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=MCode;
       form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
      begin
       form18.QueryCDBank.SQL.add('where (membcode=:codemin)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=MCode;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=true)and(checkbox3.Checked=true) then
      begin
       form18.QueryCDBank.SQL.add('where (RegCode>=:rcodmin and RegCode<=:rcodmax)and(retdate>=:tmin and retdate<=:tmax)');
       form18.QueryCDBank.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
       form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=true) then
      begin
       form18.QueryCDBank.SQL.add('where (retdate>=:tmin and retdate<=:tmax)');
       form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=true)and(checkbox3.Checked=false) then
      begin
       form18.QueryCDBank.SQL.add('where (RegCode>=:rcodmin and RegCode<=:rcodmax)');
       form18.QueryCDBank.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
      end;
   end;
if CheckBox4.Checked then
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
       form18.QueryCDBank.SQL.add(' where UserName='+QuotedStr(Users.Query.FieldByName('UName').Asstring))
       else
       form18.QueryCDBank.SQL.add(' and UserName='+QuotedStr(Users.Query.FieldByName('UName').Asstring));
if CheckBox5.Checked then
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false) then
       form18.QueryCDBank.SQL.add(' where (RegCode>=" " and RegCode<="ZZZZZZZZ") ')
       else
       form18.QueryCDBank.SQL.add(' and (RegCode>=" " and RegCode<="ZZZZZZZZ") ');
if (CheckBox6.Checked)or(CheckBox7.Checked) then
  begin
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false)and(checkbox5.Checked=false) then
       form18.QueryCDBank.SQL.add(' where ')
       else
       form18.QueryCDBank.SQL.add(' and ');
  if (CheckBox6.Checked)and(CheckBox7.Checked) then
       form18.QueryCDBank.SQL.add('((payment.RegCode like "Â“Ì‰Â:%") or (payment.KCode <> "")) ')
       else
         if (CheckBox6.Checked) then
         form18.QueryCDBank.SQL.add('(payment.RegCode like "Â“Ì‰Â:%") ')
         else
           if (CheckBox7.Checked) then
           form18.QueryCDBank.SQL.add('(payment.KCode <> "") ')
  end;

//form18.QueryCDBank.Prepare;
form18.QueryCDBank.Open;
if length(trim(form18.QueryCDBank.fieldbyname('jam').asstring))=0 then
    form23.lblMajmo.caption:='0'
  else
    form23.lblMajmo.caption:=form18.QueryCDBank.fieldbyname('jam').asstring;
form18.QueryCDBank.Close;
if length(form18.QueryCDBank.SQL.Text)>37 then
       form18.QueryCDBank.SQL.add(' and pay>0')
     else
       form18.QueryCDBank.SQL.add(' where pay>0');
form18.QueryCDBank.Open;
if length(trim(form18.QueryCDBank.fieldbyname('jam').asstring))=0 then
    form23.lblDariaft.caption:='0'
  else
    form23.lblDariaft.caption:=form18.QueryCDBank.fieldbyname('jam').asstring;
form23.lblKosorat.caption:=inttostr(strtoint64(form23.lblDariaft.caption)-strtoint64(form23.lblMajmo.caption));
form23.lblMajmo.caption:=formatFloat('#,##0',strtoint64(form23.lblMajmo.caption));
form23.lblKosorat.caption:=formatFloat('#,##0',abs(strtoint64(form23.lblKosorat.caption)));
form23.lblDariaft.caption:=formatFloat('#,##0',abs(strtoint64(form23.lblDariaft.caption)));
form18.QRLTotal.caption:=form23.lblMajmo.caption;
form18.QueryCDBank.Close;
form18.QueryCDBank.SQL.Clear;
//form18.QueryCDBank.SQL.text:='select payment.*,Kala.sharh,CDBank.Name,CDBank.Kind  from payment left join Kala on (payment.KCode=Kala.KCode) left join CDBank on (payment.RegCode=CDBank.RegCode) ';
form18.QueryCDBank.SQL.text:='SELECT Payment.*,Kala.Sharh,CDBank.Name,CDBank.Kind FROM (payment LEFT JOIN CDBank ON payment.RegCode = CDBank.Regcode) LEFT JOIN Kala ON payment.KCode = Kala.KCode';
if (checkbox1.Checked)or(checkbox2.checked)or(checkbox3.Checked) then
   begin
   if (checkbox1.Checked=true)and(checkbox2.checked=true)and(checkbox3.Checked=true) then
      begin
       form18.QueryCDBank.SQL.add('where (membcode=:codemin)and(Payment.RegCode>=:rcodmin and Payment.RegCode<=:rcodmax)and(retdate>=:tmin and retdate<=:tmax)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=MCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
       form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=true)and(checkbox3.Checked=false) then
      begin
       form18.QueryCDBank.SQL.add('where (membcode=:codemin)and(Payment.RegCode>=:rcodmin and Payment.RegCode<=:rcodmax)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=MCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=false)and(checkbox3.Checked=true) then
      begin
       form18.QueryCDBank.SQL.add('where (membcode=:codemin)and(retdate>=:tmin and retdate<=:tmax)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=MCode;
       form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
      begin
       form18.QueryCDBank.SQL.add('where (membcode=:codemin)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=MCode;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=true)and(checkbox3.Checked=true) then
      begin
       form18.QueryCDBank.SQL.add('where (Payment.RegCode>=:rcodmin and Payment.RegCode<=:rcodmax)and(retdate>=:tmin and retdate<=:tmax)');
       form18.QueryCDBank.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
       form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=true) then
      begin
       form18.QueryCDBank.SQL.add('where (retdate>=:tmin and retdate<=:tmax)');
       form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=true)and(checkbox3.Checked=false) then
      begin
       form18.QueryCDBank.SQL.add('where (Payment.RegCode>=:rcodmin and Payment.RegCode<=:rcodmax)');
       form18.QueryCDBank.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
      end;
   end;
if CheckBox4.Checked then
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
       form18.QueryCDBank.SQL.add(' where UserName='+QuotedStr(Users.Query.FieldByName('UName').Asstring))
       else
       form18.QueryCDBank.SQL.add(' and UserName='+QuotedStr(Users.Query.FieldByName('UName').Asstring));

if CheckBox5.Checked then
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false) then
       form18.QueryCDBank.SQL.add(' where  (Payment.RegCode>=" " and Payment.RegCode<="ZZZZZZZZ") ')
       else
       form18.QueryCDBank.SQL.add(' and (Payment.RegCode>=" " and Payment.RegCode<="ZZZZZZZZ") ');

if (CheckBox6.Checked)or(CheckBox7.Checked) then
  begin
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false)and(checkbox5.Checked=false) then
       form18.QueryCDBank.SQL.add(' where ')
       else
       form18.QueryCDBank.SQL.add(' and ');
  if (CheckBox6.Checked)and(CheckBox7.Checked) then
       form18.QueryCDBank.SQL.add('((payment.RegCode like "Â“Ì‰Â:%") or (payment.KCode <> "")) ')
       else
         if (CheckBox6.Checked) then
         form18.QueryCDBank.SQL.add('(payment.RegCode like "Â“Ì‰Â:%") ')
         else
           if (CheckBox7.Checked) then
           form18.QueryCDBank.SQL.add('(payment.KCode <> "") ')
  end;
       
if rgsort.ItemIndex=0 then
  form18.QueryCDBank.SQL.Add('order by CDBank.Name,Kala.sharh;')
  else
  if rgsort.ItemIndex=1 then
    form18.QueryCDBank.SQL.Add('order by payment.RegCode,CDBank.Name;')
    else
  if rgsort.ItemIndex=2 then
    form18.QueryCDBank.SQL.Add('order by payment.membCode,CDBank.Name;')
    else
  if rgsort.ItemIndex=3 then
    form18.QueryCDBank.SQL.Add('order by payment.RetDate,CDBank.Name;')
    else
  if rgsort.ItemIndex=4 then
    form18.QueryCDBank.SQL.Add('order by CDBank.Kind,CDBank.Name;')
    else
    form18.QueryCDBank.SQL.Add('order by payment.UserName,CDBank.Name;');
//form18.QueryCDBank.Prepare;
form18.QueryCDBank.Open;
form18.QRLabel50.Caption:=maskedit1.Text;
form18.QRLabel52.Caption:=maskedit2.Text;
form18.QRLabel50.Enabled:=form1.N14.Checked;
form18.QRLabel52.Enabled:=form1.N14.Checked;
form18.QRLabel48.Enabled:=form1.N14.Checked;
form18.QRLabel51.Enabled:=form1.N14.Checked;
form23.showmodal;
//close;
end;

procedure TForm22.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm22.Edit1Exit(Sender: TObject);
var MCode:string;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
MCode:=form9.ConvetCode(UpperCase(Edit1.text),edit1.MaxLength);
//form9.table1.Close;
form9.table1.Open;
form9.table1.IndexFieldNames:='membcode';
//form9.table1.SetKey;
if not(form9.table1.Seek(MCode,soFirstEQ)) then
    begin
    frmKalaSabt.table1.open;
    frmKalaSabt.table1.IndexFieldNames:='KCode';
    //frmKalaSabt.table1.SetKey;
    if not(frmKalaSabt.table1.Seek(MCode,soFirstEQ)) then
           begin
            showmessage('ﬂœ „Ê—œ ‰Ÿ— ‘„« Ì«›  ‰‘œ');
            frmKalaSabt.table1.close;
            exit;
           end;
    FamilyCap.Caption:=frmKalaSabt.table1.fieldbyname('Sharh').asstring;
    frmKalaSabt.table1.close;
    end
  else
     FamilyCap.Caption:=form9.table1.FieldByName('name').asstring + ' ' + form9.table1.FieldByName('family').asstring;
end;

procedure TForm22.Edit1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then BitBtn1.SetFocus;
key:=UpCase(Key);
end;

procedure TForm22.Edit4KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then BitBtn1.SetFocus;
key:=UpCase(Key);
end;

procedure TForm22.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm22.Edit3KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then Edit4.SetFocus;
key:=UpCase(Key);
end;

procedure TForm22.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then MaskEdit2.SetFocus;
end;

procedure TForm22.Edit3Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
Edit3.Text:=UpperCase(Edit3.text);
end;

procedure TForm22.Edit4Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
Edit4.Text:=UpperCase(Edit4.text);
end;

procedure TForm22.CheckBox4Click(Sender: TObject);
begin
DBGrid1.Visible:=checkbox4.Checked;
if DBGrid1.Visible then DBGrid1.SetFocus;
end;

procedure TForm22.SpeedButton5Click(Sender: TObject);
begin
form10.showmodal;
end;

procedure TForm22.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm22.Edit3Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm22.Edit4Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm22.CheckBox6Click(Sender: TObject);
begin
if (CheckBox6.Checked)or(CheckBox7.Checked) then
  CheckBox5.Checked := false;
end;

procedure TForm22.CheckBox5Click(Sender: TObject);
begin
if (CheckBox5.Checked) then
  begin
  CheckBox6.Checked := false;
  CheckBox7.Checked := false;
  end;
end;

procedure TForm22.SpeedButton1Click(Sender: TObject);
begin
frmKalaSearch.showmodal;
end;

end.
