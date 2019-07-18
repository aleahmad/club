unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Mask, ExtCtrls, Buttons, ActnList;

type
  TForm17 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label7: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    rgSort: TRadioGroup;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    procedure MaskEdit2Enter(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

uses unit1,Unit18, Unit19, Unit21, Unit9;
{$R *.DFM}

procedure TForm17.MaskEdit2Enter(Sender: TObject);
begin
maskedit2.EditMask:='99/99/99';
end;

procedure TForm17.MaskEdit1Enter(Sender: TObject);
begin
maskedit1.EditMask:='99/99/99';
end;

procedure TForm17.MaskEdit2Exit(Sender: TObject);
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

procedure TForm17.MaskEdit1Exit(Sender: TObject);
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
procedure TForm17.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm17.CheckBox1Click(Sender: TObject);
begin
label3.Enabled:=checkbox1.Checked;
label4.Enabled:=checkbox1.Checked;
edit1.Enabled:=checkbox1.Checked;
edit2.Enabled:=checkbox1.Checked;
if edit1.Enabled then edit1.SetFocus;
end;

procedure TForm17.CheckBox2Click(Sender: TObject);
begin
label1.Enabled:=checkbox2.Checked;
label2.Enabled:=checkbox2.Checked;
combobox1.Enabled:=checkbox2.Checked;
combobox2.Enabled:=checkbox2.Checked;
if combobox1.Enabled then combobox1.SetFocus;
end;

procedure TForm17.CheckBox3Click(Sender: TObject);
begin
label5.Enabled:=checkbox3.Checked;
label6.Enabled:=checkbox3.Checked;
maskedit1.Enabled:=checkbox3.Checked;
maskedit2.Enabled:=checkbox3.Checked;
if maskedit1.Enabled then maskedit1.SetFocus;
end;

procedure TForm17.BitBtn1Click(Sender: TObject);
var minMembCode,maxMembCode:string;
begin
minMembCode:=form9.ConvetCode(edit1.text,edit1.MaxLength);
maxMembCode:=form9.ConvetCode(edit2.text,edit1.MaxLength);
form18.QueryMembers.ParamCheck:=true;
form18.QueryMembers.Close;
form18.QueryMembers.SQL.Clear;
//if RadioButton3.checked then
form18.QueryMembers.SQL.text:=('select * from members');
//else
//form18.QueryMembers.SQL.text:=('select name,membcode,noshen,regdate from Members');
if (checkbox1.Checked)or(checkbox2.checked)or(checkbox3.Checked) then
   begin
   if (checkbox1.Checked=true)and(checkbox2.checked=true)and(checkbox3.Checked=true) then
      begin
       form18.QueryMembers.SQL.add('where (membcode>=:codemin and membcode<=:codemax)and(family>=:namemin and family<=:namemax)and(regdate>=:tmin and regdate<=:tmax)');
       form18.QueryMembers.Parameters.ParamByName('codemin').Value:=minMembCode;
       form18.QueryMembers.Parameters.ParamByName('codemax').Value:=maxMembCode;
       form18.QueryMembers.Parameters.ParamByName('namemin').Value:=combobox1.text;
       form18.QueryMembers.Parameters.ParamByName('namemax').Value:=combobox2.text;
       form18.QueryMembers.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryMembers.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=true)and(checkbox3.Checked=false) then
      begin
       form18.QueryMembers.SQL.add('where (membcode>=:codemin and membcode<=:codemax)and(family>=:namemin and family<=:namemax)');
       form18.QueryMembers.Parameters.ParamByName('codemin').Value:=minMembCode;
       form18.QueryMembers.Parameters.ParamByName('codemax').Value:=maxMembCode;
       form18.QueryMembers.Parameters.ParamByName('namemin').Value:=combobox1.text;
       form18.QueryMembers.Parameters.ParamByName('namemax').Value:=combobox2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=false)and(checkbox3.Checked=true) then
      begin
       form18.QueryMembers.SQL.add('where (membcode>=:codemin and membcode<=:codemax)and(regdate>=:tmin and regdate<=:tmax)');
       form18.QueryMembers.Parameters.ParamByName('codemin').Value:=minMembCode;
       form18.QueryMembers.Parameters.ParamByName('codemax').Value:=maxMembCode;
       form18.QueryMembers.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryMembers.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
      begin
       form18.QueryMembers.SQL.add('where (membcode>=:codemin and membcode<=:codemax)');
       form18.QueryMembers.Parameters.ParamByName('codemin').Value:=minMembCode;
       form18.QueryMembers.Parameters.ParamByName('codemax').Value:=maxMembCode;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=true)and(checkbox3.Checked=true) then
      begin
       form18.QueryMembers.SQL.add('where (family>=:namemin and family<:namemax)and(regdate>=:tmin and regdate<=:tmax)');
       form18.QueryMembers.Parameters.ParamByName('namemin').Value:=combobox1.text;
       form18.QueryMembers.Parameters.ParamByName('namemax').Value:=combobox2.text;
       form18.QueryMembers.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryMembers.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=true) then
      begin
       form18.QueryMembers.SQL.add('where (regdate>=:tmin and regdate<=:tmax)');
       form18.QueryMembers.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form18.QueryMembers.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=true)and(checkbox3.Checked=false) then
      begin
       form18.QueryMembers.SQL.add('where (family>=:namemin and family<=:namemax)');
       form18.QueryMembers.Parameters.ParamByName('namemin').Value:=combobox1.text;
       form18.QueryMembers.Parameters.ParamByName('namemax').Value:=combobox2.text;
      end;
   end;

if(checkbox4.Checked=true) then
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
    form18.QueryMembers.SQL.add(' where (IsSub="*")')
    else
    form18.QueryMembers.SQL.add(' and (IsSub="*")');

if (checkbox5.Checked=true) then
 if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false) then
   begin
    form18.QueryMembers.SQL.add('where (MembCode in (select MembCode from borrow)) ');
   end
   else
   begin
    form18.QueryMembers.SQL.add(' and (MembCode in (select MembCode from borrow)) ');
   end;

if rgsort.ItemIndex=0 then
  form18.QueryMembers.SQL.Add('order by family;')
  else
  if rgsort.ItemIndex=1 then
    form18.QueryMembers.SQL.Add('order by membcode;')
    else
    if rgsort.ItemIndex=2 then
    form18.QueryMembers.SQL.Add('order by regdate;')
    else
    form18.QueryMembers.SQL.Add('order by bedeh;');

//form18.QueryMembers.Prepare;
form18.QueryMembers.Open;
form21.bitbtn1.visible:=true;
form21.bitbtn2.visible:=true;
form21.showmodal;
//close;
end;

procedure TForm17.FormShow(Sender: TObject);
var i:word;
begin
form18.QueryMembers.Close;
CheckBox1.SetFocus;
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
form18.QueryMembers.Close;
end;

procedure TForm17.Edit1Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
end;

procedure TForm17.Edit2Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
end;

procedure TForm17.Edit1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then Edit2.SetFocus;
key:=UpCase(Key);
end;

procedure TForm17.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then ComboBox2.SetFocus;
end;

procedure TForm17.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then MaskEdit2.SetFocus;
end;

procedure TForm17.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm17.Edit2KeyPress(Sender: TObject; var Key: Char);
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

procedure TForm17.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm17.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm17.Edit2Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

end.
