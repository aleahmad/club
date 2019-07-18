unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ActnList;

type
  TForm20 = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    CheckBox4: TCheckBox;
    txtKargardan: TEdit;
    txtBazigar: TEdit;
    CheckBox5: TCheckBox;
    ActionList1: TActionList;
    Action1: TAction;
    rgSort: TRadioGroup;
    txtKind: TComboBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    txtKeshvar: TComboBox;
    CheckBox8: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox16: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure MaskEdit2Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure txtBazigarKeyPress(Sender: TObject; var Key: Char);
    procedure txtKargardanKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure txtKindKeyPress(Sender: TObject; var Key: Char);
    procedure txtKeshvarKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

uses Unit18, Unit1, Unit19, Unit23, Unit21, Unit9;

{$R *.DFM}

procedure TForm20.BitBtn1Click(Sender: TObject);
var minRegCode,maxRegCode:string;
begin
minRegCode:=form9.ConvetCode(edit1.text,edit1.MaxLength);
maxRegCode:=form9.ConvetCode(edit2.text,edit2.MaxLength);
form18.QueryCDBank.ParamCheck:=true;
form18.QueryCDBank.Close;
form18.QueryCDBank.SQL.Clear;
//if RadioButton3.checked then
if (checkbox7.Checked=true) then
  form18.QueryCDBank.SQL.text:=('SELECT cdbank.*,borrow.borodate FROM cdbank LEFT JOIN borrow ON cdbank.Regcode = borrow.RegCode ')
  else
  form18.QueryCDBank.SQL.text:=('SELECT * FROM cdbank ');

if (checkbox1.Checked) then
      begin
       form18.QueryCDBank.SQL.add('where ');
       if (checkbox10.Checked) then form18.QueryCDBank.SQL.add(' not ');
       form18.QueryCDBank.SQL.add(' (CDBank.Regcode>=:codemin and CDBank.Regcode<=:codemax)');
       form18.QueryCDBank.Parameters.ParamByName('codemin').Value:=minRegCode;
       form18.QueryCDBank.Parameters.ParamByName('codemax').Value:=maxRegCode;
      end;

if (checkbox2.checked) then
   begin
   if (checkbox1.Checked=false) then
      form18.QueryCDBank.SQL.add(' where ')
      else
      form18.QueryCDBank.SQL.add(' and ');
   if (checkbox11.Checked) then form18.QueryCDBank.SQL.add(' not ');
   form18.QueryCDBank.SQL.add(' (name>=:namemin and name<=:namemax) ');
   form18.QueryCDBank.Parameters.ParamByName('namemin').Value:=combobox1.text;
   form18.QueryCDBank.Parameters.ParamByName('namemax').Value:=combobox2.text;
   end;

if (checkbox3.Checked=true) then
   begin
   if (checkbox1.Checked=false)and(checkbox2.checked=false) then
      form18.QueryCDBank.SQL.add(' where ')
      else
      form18.QueryCDBank.SQL.add(' and ');
   if (checkbox12.Checked) then form18.QueryCDBank.SQL.add(' not ');
   form18.QueryCDBank.SQL.add(' (buydate>=:tmin and buydate<=:tmax) ');
   form18.QueryCDBank.Parameters.ParamByName('tmin').Value:=maskedit1.text;
   form18.QueryCDBank.Parameters.ParamByName('tmax').Value:=maskedit2.text;
   end;

if (checkbox4.Checked=true) then
   begin
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
      form18.QueryCDBank.SQL.add(' where ')
      else
      form18.QueryCDBank.SQL.add(' and ');
   if (checkbox13.Checked) then form18.QueryCDBank.SQL.add(' not ');
   form18.QueryCDBank.SQL.add(' (Kargardan like :Kargardan) ');
   form18.QueryCDBank.Parameters.ParamByName('Kargardan').Value:='%'+txtKargardan.text+'%';
   end;

if (checkbox5.Checked=true) then
   begin
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false) then
      form18.QueryCDBank.SQL.add(' where ')
      else
      form18.QueryCDBank.SQL.add(' and ');
   if (checkbox14.Checked) then form18.QueryCDBank.SQL.add(' not ');
   form18.QueryCDBank.SQL.add(' (Bazigar like :Bazigar) ');
   form18.QueryCDBank.Parameters.ParamByName('Bazigar').Value:='%'+txtBazigar.text+'%';
   end;

if (checkbox6.Checked=true) then
   begin
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false)and(checkbox5.Checked=false) then
      form18.QueryCDBank.SQL.add(' where ')
      else
      form18.QueryCDBank.SQL.add(' and ');
   if (checkbox15.Checked) then form18.QueryCDBank.SQL.add(' not ');
   form18.QueryCDBank.SQL.add(' (kind=:Kind) ');
   form18.QueryCDBank.Parameters.ParamByName('Kind').Value:=txtKind.text;
   end;

if (checkbox7.Checked=true) then
   begin
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false)and(checkbox5.Checked=false)and(checkbox6.Checked=false) then
      form18.QueryCDBank.SQL.add(' where ')
      else
      form18.QueryCDBank.SQL.add(' and ');
   if (checkbox16.Checked) then form18.QueryCDBank.SQL.add(' not ');
   form18.QueryCDBank.SQL.add(' (CDBank.Regcode in (select RegCode from borrow)) ');
   end;

if (checkbox8.Checked=true) then
   begin
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false)and(checkbox5.Checked=false)and(checkbox6.Checked=false)and(checkbox7.Checked=false) then
      form18.QueryCDBank.SQL.add(' where ')
      else
      form18.QueryCDBank.SQL.add(' and ');
   if (checkbox17.Checked) then form18.QueryCDBank.SQL.add(' not ');
   form18.QueryCDBank.SQL.add(' (Keshvar=:Keshvar) ');
   form18.QueryCDBank.Parameters.ParamByName('Keshvar').Value:=txtKeshvar.text;
   end;

if rgsort.ItemIndex=0 then
  form18.QueryCDBank.SQL.Add('order by cdbank.regcode;')
  else
  if rgsort.ItemIndex=1 then
    form18.QueryCDBank.SQL.Add('order by name;')
    else
    if rgsort.ItemIndex=2 then
       form18.QueryCDBank.SQL.Add('order by buydate;')
      else
      if rgsort.ItemIndex=3 then
         form18.QueryCDBank.SQL.Add('order by Keshvar;')
        else
        if rgsort.ItemIndex=4 then
           form18.QueryCDBank.SQL.Add('order by Bazigar;')
          else
          if rgsort.ItemIndex=5 then
             form18.QueryCDBank.SQL.Add('order by Rade2;')
              else
              if rgsort.ItemIndex=6 then
                 form18.QueryCDBank.SQL.Add('order by Kind;')
                 else
                 if (checkbox7.Checked=true) then
                   form18.QueryCDBank.SQL.Add('order by borrow.borodate desc;')
                   else
                   form18.QueryCDBank.SQL.Add('order by Rade1;');
//form18.QueryCDBank.Prepare;
form18.QueryCDBank.Open;
if (checkbox7.Checked=true) then
begin
form18.QRLabel36.Caption:='ÊÇÑíÎ ÇãÇäÊ';
form18.QRDBText15.DataField:='borodate';
form19.DBGrid1.Columns[5].Title.Caption:='ÊÇÑíÎ ÇãÇäÊ';
form19.DBGrid1.Columns[5].FieldName:='borodate';
form19.DBGrid1.Refresh;
end;
form19.showmodal;
if (checkbox7.Checked=true) then
begin
form19.DBGrid1.Columns[5].Title.Caption:='ÊÇÑíÎ ËÈÊ';
form19.DBGrid1.Columns[5].FieldName:='regdate';
form19.DBGrid1.Refresh;
form18.QRLabel36.Caption:='ÊÇÑíÎ ÎÑíÏ';
form18.QRDBText15.DataField:='buydate';
end;
//close;
end;

procedure TForm20.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm20.FormShow(Sender: TObject);
{var i:word;}
begin
{for i :=48 to 250 do
 begin
  combobox1.Items.Add(chr(i));
  combobox2.Items.Add(chr(i));
 end;}
form18.QueryCDBank.Close;
CheckBox1.SetFocus;
txtKind.Items.LoadFromFile('Kind.txt');
txtKeshvar.Items.LoadFromFile('Keshvar.txt');
end;

procedure TForm20.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
form18.QueryCDBank.Close;
end;

procedure TForm20.CheckBox1Click(Sender: TObject);
begin
label3.Enabled:=checkbox1.Checked;
label4.Enabled:=checkbox1.Checked;
edit1.Enabled:=checkbox1.Checked;
edit2.Enabled:=checkbox1.Checked;
checkbox10.Enabled:=checkbox1.Checked;
if edit1.Enabled then edit1.SetFocus;
end;

procedure TForm20.CheckBox2Click(Sender: TObject);
begin
checkbox11.Enabled:=checkbox2.Checked;
label1.Enabled:=checkbox2.Checked;
label2.Enabled:=checkbox2.Checked;
combobox1.Enabled:=checkbox2.Checked;
combobox2.Enabled:=checkbox2.Checked;
if combobox1.Enabled then combobox1.SetFocus;
end;

procedure TForm20.CheckBox3Click(Sender: TObject);
begin
checkbox12.Enabled:=checkbox3.Checked;
label5.Enabled:=checkbox3.Checked;
label6.Enabled:=checkbox3.Checked;
maskedit1.Enabled:=checkbox3.Checked;
maskedit2.Enabled:=checkbox3.Checked;
if maskedit1.Enabled then maskedit1.SetFocus;
end;

procedure TForm20.MaskEdit1Exit(Sender: TObject);
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
 messagedlg('ÓÇá¡ãÇå æ ÑæÒ ÊÇÑíÎ ÈÇíÏ æÇÑÏ ÔæÏ',mterror,[mbok],0);
 maskedit1.SetFocus;
 maskedit1.SelectAll;
 end
else
 if (strtoint(copy(maskedit1.Text,4,2))=0)or(strtoint(copy(maskedit1.Text,7,2))=0)or(strtoint(copy(maskedit1.Text,1,2))=0) then
 begin
  messagedlg('ÓÇá¡ãÇå æ ÑæÒ ÕİÑ æÌæÏ äÏÇÑÏ.áØİÇ ÊÇÑíÎ ÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
  maskedit1.SetFocus;
  maskedit1.SelectAll;
 end
 else
  if strtoint(copy(maskedit1.Text,4,2))<7 then
   begin
    if strtoint(copy(maskedit1.Text,7,2))>31 then
       begin
        messagedlg('ÊÇÑíÎ æÇÑÏ ÔÏå ÎÇÑÌ ÇÒ ãÍÏæÏå ÇÓÊ.áØİÇ ÇäÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
        maskedit1.SetFocus;
        maskedit1.SelectAll;
       end;
   end
   else
    if strtoint(copy(maskedit1.Text,4,2))<12 then
       begin
        if strtoint(copy(maskedit1.Text,7,2))>30 then
           begin
            messagedlg('ÊÇÑíÎ æÇÑÏ ÔÏå ÎÇÑÌ ÇÒ ãÍÏæÏå ÇÓÊ.áØİÇ ÇäÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
            maskedit1.SetFocus;
            maskedit1.SelectAll;
           end;
       end
       else
        if strtoint(copy(maskedit1.Text,4,2))=12 then
           begin
            if strtoint(copy(maskedit1.Text,7,2))>29 then
               begin
                messagedlg('ÊÇÑíÎ æÇÑÏ ÔÏå ÎÇÑÌ ÇÒ ãÍÏæÏå ÇÓÊ.áØİÇ ÇäÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
                maskedit1.SetFocus;
                maskedit1.SelectAll;
               end;
           end
           else
            begin
             messagedlg('ÊÇÑíÎ æÇÑÏ ÔÏå ÎÇÑÌ ÇÒ ãÍÏæÏå ÇÓÊ.áØİÇ ÇäÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
             maskedit1.SetFocus;
             maskedit1.SelectAll;
            end;

end;

procedure TForm20.MaskEdit2Exit(Sender: TObject);
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
 messagedlg('ÓÇá¡ãÇå æ ÑæÒ ÊÇÑíÎ ÈÇíÏ æÇÑÏ ÔæÏ',mterror,[mbok],0);
 maskedit2.SetFocus;
 maskedit2.SelectAll;
 end
else
 if (strtoint(copy(maskedit2.Text,4,2))=0)or(strtoint(copy(maskedit2.Text,7,2))=0)or(strtoint(copy(maskedit2.Text,1,2))=0) then
 begin
  messagedlg('ÓÇá¡ãÇå æ ÑæÒ ÕİÑ æÌæÏ äÏÇÑÏ.áØİÇ ÊÇÑíÎ ÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
  maskedit2.SetFocus;
  maskedit2.SelectAll;
 end
 else
  if strtoint(copy(maskedit2.Text,4,2))<7 then
   begin
    if strtoint(copy(maskedit2.Text,7,2))>31 then
       begin
        messagedlg('ÊÇÑíÎ æÇÑÏ ÔÏå ÎÇÑÌ ÇÒ ãÍÏæÏå ÇÓÊ.áØİÇ ÇäÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
        maskedit2.SetFocus;
        maskedit2.SelectAll;
       end;
   end
   else
    if strtoint(copy(maskedit2.Text,4,2))<12 then
       begin
        if strtoint(copy(maskedit2.Text,7,2))>30 then
           begin
            messagedlg('ÊÇÑíÎ æÇÑÏ ÔÏå ÎÇÑÌ ÇÒ ãÍÏæÏå ÇÓÊ.áØİÇ ÇäÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
            maskedit2.SetFocus;
            maskedit2.SelectAll;
           end;
       end
       else
        if strtoint(copy(maskedit2.Text,4,2))=12 then
           begin
            if strtoint(copy(maskedit2.Text,7,2))>29 then
               begin
                messagedlg('ÊÇÑíÎ æÇÑÏ ÔÏå ÎÇÑÌ ÇÒ ãÍÏæÏå ÇÓÊ.áØİÇ ÇäÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
                maskedit2.SetFocus;
                maskedit2.SelectAll;
               end;
           end
           else
            begin
             messagedlg('ÊÇÑíÎ æÇÑÏ ÔÏå ÎÇÑÌ ÇÒ ãÍÏæÏå ÇÓÊ.áØİÇ ÇäÑÇ ÏæÈÇÑå æÇÑÏ ßäíÏ',mterror,[mbok],0);
             maskedit2.SetFocus;
             maskedit2.SelectAll;
            end;
end;

procedure TForm20.MaskEdit1Enter(Sender: TObject);
begin
maskedit1.EditMask:='99/99/99';
end;

procedure TForm20.MaskEdit2Enter(Sender: TObject);
begin
maskedit2.EditMask:='99/99/99';
end;

procedure TForm20.Edit1Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
end;

procedure TForm20.Edit2Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
end;

procedure TForm20.CheckBox4Click(Sender: TObject);
begin
checkbox13.Enabled:=checkbox4.Checked;
txtKargardan.Enabled:=checkbox4.Checked;
if txtKargardan.Enabled then txtKargardan.SetFocus;
end;

procedure TForm20.CheckBox5Click(Sender: TObject);
begin
checkbox14.Enabled:=checkbox5.Checked;
txtBazigar.Enabled:=checkbox5.Checked;
if txtBazigar.Enabled then txtBazigar.SetFocus;
end;

procedure TForm20.Edit1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='ÌÍÎåÚÛİŞËÕÖ˜ãäÊÇáÈíÓÔ/.æÆÏĞÑÒØÙ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then Edit2.SetFocus;
key:=UpCase(Key);
end;

procedure TForm20.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then ComboBox2.SetFocus;
end;

procedure TForm20.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then MaskEdit2.SetFocus;
end;

procedure TForm20.txtBazigarKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm20.txtKargardanKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm20.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm20.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm20.Edit2KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='ÌÍÎåÚÛİŞËÕÖ˜ãäÊÇáÈíÓÔ/.æÆÏĞÑÒØÙ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then BitBtn1.SetFocus;
key:=UpCase(Key);
end;

procedure TForm20.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm20.Edit2Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm20.CheckBox6Click(Sender: TObject);
begin
checkbox15.Enabled:=checkbox6.Checked;
txtKind.Enabled:=checkbox6.Checked;
if txtKind.Enabled then txtKind.SetFocus;
end;

procedure TForm20.CheckBox8Click(Sender: TObject);
begin
checkbox17.Enabled:=checkbox8.Checked;
txtKeshvar.Enabled:=checkbox8.Checked;
if txtKeshvar.Enabled then txtKeshvar.SetFocus;
end;

procedure TForm20.txtKindKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm20.txtKeshvarKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm20.CheckBox7Click(Sender: TObject);
begin
checkbox16.Enabled:=checkbox7.Checked;
end;

end.
