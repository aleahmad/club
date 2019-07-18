unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Mask, DBCtrls, StdCtrls, Spin, Buttons, Grids, DBGrids,
  ExtCtrls, ComCtrls, ActnList, ADODB, ExtDlgs, jpeg;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    MaskEdit1: TMaskEdit;
    Edit2: TEdit;
    MaskEdit2: TMaskEdit;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    txtRegCode: TEdit;
    Label8: TLabel;
    txtBazigar: TEdit;
    Label9: TLabel;
    txtKargardan: TEdit;
    Label10: TLabel;
    txtNevisande: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    txtKind: TComboBox;
    txtKeshvar: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    Button3: TButton;
    Button4: TButton;
    txtKeraie: TEdit;
    txtGheimat: TEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    txtMahsol: TComboBox;
    Button5: TButton;
    Button6: TButton;
    Edit3: TComboBox;
    Button7: TButton;
    Button8: TButton;
    Label16: TLabel;
    txtRade1: TComboBox;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    txtRade2: TComboBox;
    txtTedad: TEdit;
    Label17: TLabel;
    Label18: TMemo;
    Query1: TADOQuery;
    Table1: TADOTable;
    Label19: TLabel;
    txtDirKerd: TEdit;
    Label20: TLabel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    BitBtn4: TBitBtn;
    Action3: TAction;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure txtKeraieExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit2Enter(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtRegCodeExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox2KeyPress(Sender: TObject; var Key: Char);
    procedure asdfsdfKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure txtBazigarKeyPress(Sender: TObject; var Key: Char);
    procedure txtKargardanKeyPress(Sender: TObject; var Key: Char);
    procedure txtNevisandeKeyPress(Sender: TObject; var Key: Char);
    procedure txtMahsolsdKeyPress(Sender: TObject; var Key: Char);
    procedure txtKindKeyPress(Sender: TObject; var Key: Char);
    procedure txtKeshvarKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure txtMoneyKeyPress(Sender: TObject; var Key: Char);
    procedure txtGheimatKeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure txtMahsolKeyPress(Sender: TObject; var Key: Char);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure txtRade2KeyPress(Sender: TObject; var Key: Char);
    procedure txtRade1KeyPress(Sender: TObject; var Key: Char);
    procedure txtRegCodeEnter(Sender: TObject);
    procedure txtRegCodeKeyPress(Sender: TObject; var Key: Char);
    procedure txtRade2Enter(Sender: TObject);
    procedure txtRade2Exit(Sender: TObject);
    procedure txtTedadKeyPress(Sender: TObject; var Key: Char);
    procedure txtKindSelect(Sender: TObject);
    procedure Table1BeforeOpen(DataSet: TDataSet);
    procedure txtDirKerdKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RegCodeEntered: Boolean;
  end;

var
  Form8: TForm8;

implementation

uses Unit11, Unit1, StrUtils, Unit25, Unit9, Unit18;

{$R *.DFM}

procedure TForm8.BitBtn1Click(Sender: TObject);
var
b:boolean;
s:string[8];
i:byte;
RegCode:string;
tmp:string;
P1,P2: pchar;
begin
b:=false;
s:=maskedit1.Text;
RegCode:=Form9.ConvetCode(txtRegCode.Text,txtRegCode.MaxLength);
for i:=1 to 8 do
 if s[i]=' ' then b:=true;
if b then
   begin
    messagedlg('”«·°„«Â Ê —Ê“  «—ÌŒ À»  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    maskedit1.SetFocus;
    maskedit1.SelectAll;
    exit;
   end;
if length(txtTedad.Text)=0 then
   begin
    messagedlg('»«Ìœ Ê«—œ ‘Êœ CD  ⁄œ«œ „ÊÃÊœÌ',mterror,[mbok],0);
    txtTedad.SetFocus;
    txtTedad.SelectAll;
    exit;
   end;
if length(txtRegCode.Text)=0 then
   begin
    messagedlg('»«Ìœ Ê«—œ ‘Êœ CD ﬂœ',mterror,[mbok],0);
    txtRegCode.SetFocus;
    txtRegCode.SelectAll;
    exit;
   end;
if length(edit2.text)=0 then
   begin
    messagedlg('»«Ìœ Ê«—œ ‘Êœ CD ⁄‰Ê«‰',mterror,[mbok],0);
    edit2.SetFocus;
    edit2.SelectAll;
    exit;
   end;
if (length(trim(txtKeraie.text))=0)or(strtoint(trim(txtKeraie.text))=0) then
   begin
    messagedlg('ò—«ÌÂ Â— —Ê“ «„«‰  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    txtKeraie.SetFocus;
    txtKeraie.SelectAll;
    exit;
   end;
if Form1.L then
 if table1.RecordCount > Threshold then
   begin
     Messagedlg('«Ì‰ ‰”ŒÂ «“ »—‰«„Â „ÕœÊœ „Ì »«‘œ Ê »Ì‘ — «“ 200 „Ê—œ ›Ì·„ ‰„Ì  Ê«‰Ìœ œ— ¬‰ –ŒÌ—Â ò‰Ìœ. ·ÿ›« ÃÂ  Œ—Ìœ ¬‰ «ﬁœ«„ ò‰Ìœ',mterror,[mbOk],0);
     exit;
   end;
table1.Cancel;
table1.IndexFieldNames:='Regcode';
if table1.Seek(RegCode,soFirstEQ) then
   begin
    messagedlg('œÌê—Ì «Œ ’«’ Ì«› Â «” .·ÿ›« ﬂœ œÌê—Ì —« Ê«—œ ﬂ‰Ìœ CD ﬂœ À»  ﬁ»·« »Â ›Ì·„ Ì« ',mterror,[mbok],0);
    txtRegCode.SetFocus;
    txtRegCode.SelectAll;
    exit;
    end;
table1.append;
table1.FieldByName('regcode').AsString:=RegCode;
table1.FieldByName('regdate').AsString:=maskedit1.Text;
table1.FieldByName('name').AsString:=edit2.text;
table1.FieldByName('gheimat').AsString:=txtGheimat.Text;
table1.FieldByName('Keraie').AsString:=txtKeraie.Text;
table1.FieldByName('DirKerd').AsString:=txtDirKerd.text;
table1.FieldByName('buydate').AsString:=maskedit2.text;
table1.FieldByName('buyname').AsString:=edit3.Text;
table1.FieldByName('Kargardan').AsString:=txtKargardan.Text;
table1.FieldByName('Bazigar').AsString:=txtBazigar.Text;
table1.FieldByName('Nevisande').AsString:=txtNevisande.Text;
table1.FieldByName('Kind').AsString:=txtKind.Text;
table1.FieldByName('Mahsol').AsString:=txtMahsol.Text;
table1.FieldByName('Keshvar').AsString:=txtKeshvar.Text;
table1.FieldByName('Rade1').AsString:=txtRade1.Text;
table1.FieldByName('Rade2').AsString:=txtRade2.Text;
table1.FieldByName('Tedad').AsString:=txtTedad.Text;
table1.FieldByName('RemTedad').AsString:=txtTedad.Text;
{i:=0;
if checkbox1.Checked then i:=1;
if checkbox2.checked then i:=i+2;
table1.FieldByName('kinddisk').AsInteger:=i;}
table1.post;

if length(OpenPictureDialog1.FileName) <> 0 then
begin
tmp:= GetCurrentDir + '\Images\'+RegCode+'.jpg';
getmem(P1,200);
StrplCopy(P1,OpenPictureDialog1.FileName,length(OpenPictureDialog1.FileName));
getmem(P2,200);
StrplCopy(P2,tmp,length(tmp));
if FileExists(tmp) then DeleteFile(P2);
CopyFile(P1,P2,True);
Image1.Visible:=false;
OpenPictureDialog1.FileName := '';
freemem(P1,200);
freemem(P2,200);
Image1.Picture := nil;
end;

showmessage('„‘Œ’«  À»  ‘œ');
txtRegCode.Text:='';
edit2.Text:='';
txtGheimat.Text:='0';
maskedit2.Text:='';
edit3.Text:='';
txtKargardan.Text:='';
txtBazigar.Text:='';
txtNevisande.Text:='';
txtKind.Text:='';
txtMahsol.Text:='';
txtKeshvar.Text:='';
txtRade1.Text:='';
txtRade2.Text:='';
{CheckBox1.Checked:=false;
CheckBox2.Checked:=false;}
txtKind.SetFocus;
txtKind.SelectAll;
table1.Close;
//table1.IndexFieldNames:='';
table1.Open;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
close;
end;



procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
table1.cancel;
//table1.FlushBuffers;
//table1.Close;
txtRade1.Items.SaveToFile('Rade1.txt');
txtRade2.Items.SaveToFile('Rade2.txt');
txtKeshvar.Items.SaveToFile('Keshvar.txt');
txtKind.Items.SaveToFile('Kind.txt');
txtMahsol.Items.SaveToFile('Sherkat.txt');
Edit3.Items.SaveToFile('Kharidar.txt');
end;

procedure TForm8.txtKeraieExit(Sender: TObject);
var
b:boolean;
i:word;
s:string;
begin
b:=false;
s:=copy(txtKeraie.Text,1,length(txtKeraie.Text)-1);
for i:=1 to length(s) do
 if (s[i]='+')or(s[i]='-')or(s[i]='.') then b:=true;
if b then
 begin
 messagedlg('⁄·«∆„ +Ê-Ê/ œ— «⁄œ«œ „Ã«“ ‰Ì” ‰œ.·ÿ›« «⁄œ«œ —«  ’ÕÌÕ ﬂ‰Ìœ',mterror,[mbok],0);
 txtKeraie.SetFocus;
 txtKeraie.SelectAll;
 end;
end;

procedure TForm8.MaskEdit2Enter(Sender: TObject);
begin
maskedit2.EditMask:='99/99/99';
maskedit2.Text:=MaskEdit1.Text;
end;

procedure TForm8.MaskEdit1Exit(Sender: TObject);
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
  messagedlg('”«·°„«Â Ê —Ê“ ’›— ÊÃÊœ ‰œ«—œ.·ÿ›«  «—ÌŒ —« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
  MaskEdit1.SetFocus;
  MaskEdit1.SelectAll;
 end
 else
  if strtoint(copy(MaskEdit1.Text,4,2))<7 then
   begin
    if strtoint(copy(MaskEdit1.Text,7,2))>31 then
       begin
        messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
        MaskEdit1.SetFocus;
        MaskEdit1.SelectAll;
       end;
   end
   else
    if strtoint(copy(MaskEdit1.Text,4,2))<12 then
       begin
        if strtoint(copy(MaskEdit1.Text,7,2))>30 then
           begin
            messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
            MaskEdit1.SetFocus;
            MaskEdit1.SelectAll;
           end;
       end
       else
        if strtoint(copy(MaskEdit1.Text,4,2))=12 then
           begin
            if strtoint(copy(MaskEdit1.Text,7,2))>29 then
               begin
                messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
                MaskEdit1.SetFocus;
                MaskEdit1.SelectAll;
               end;
           end
           else
            begin
             messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
             MaskEdit1.SetFocus;
             MaskEdit1.SelectAll;
            end;
end;

procedure TForm8.MaskEdit2Exit(Sender: TObject);
var
s:string[8];
i:word;
b:boolean;
begin
b:=false;
s:=MaskEdit2.Text;
for i:=1 to 8 do
 if s[i]=' ' then b:=true;
if b then
 begin
 messagedlg('”«·°„«Â Ê —Ê“  «—ÌŒ »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
 MaskEdit2.SetFocus;
 MaskEdit2.SelectAll;
 end
else
 if (strtoint(copy(MaskEdit2.Text,4,2))=0)or(strtoint(copy(MaskEdit2.Text,7,2))=0)or(strtoint(copy(MaskEdit2.Text,1,2))=0) then
 begin
  messagedlg('”«·°„«Â Ê —Ê“ ’›— ÊÃÊœ ‰œ«—œ.·ÿ›«  «—ÌŒ —« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
  MaskEdit2.SetFocus;
  MaskEdit2.SelectAll;
 end
 else
  if strtoint(copy(MaskEdit2.Text,4,2))<7 then
   begin
    if strtoint(copy(MaskEdit2.Text,7,2))>31 then
       begin
        messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
        MaskEdit2.SetFocus;
        MaskEdit2.SelectAll;
       end;
   end
   else
    if strtoint(copy(MaskEdit2.Text,4,2))<12 then
       begin
        if strtoint(copy(MaskEdit2.Text,7,2))>30 then
           begin
            messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
            MaskEdit2.SetFocus;
            MaskEdit2.SelectAll;
           end;
       end
       else
        if strtoint(copy(MaskEdit2.Text,4,2))=12 then
           begin
            if strtoint(copy(MaskEdit2.Text,7,2))>29 then
               begin
                messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
                MaskEdit2.SetFocus;
                MaskEdit2.SelectAll;
               end;
           end
           else
            begin
             messagedlg(' «—ÌŒ Ê«—œ ‘œÂ Œ«—Ã «“ „ÕœÊœÂ «” .·ÿ›« «‰—« œÊ»«—Â Ê«—œ ﬂ‰Ìœ',mterror,[mbok],0);
             MaskEdit2.SetFocus;
             MaskEdit2.SelectAll;
            end;
end;

procedure TForm8.BitBtn3Click(Sender: TObject);
var
b:boolean;
s:string[8];
i:byte;
RegCode:string;
RemTedad:integer;
tmp:string;
P1,P2: pchar;
begin
RegCode:=Form9.ConvetCode(txtRegCode.Text,txtRegCode.MaxLength);
b:=false;
s:=maskedit1.Text;
for i:=1 to 8 do
 if s[i]=' ' then b:=true;
if b then
   begin
    messagedlg('”«·°„«Â Ê —Ê“  «—ÌŒ À»  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    maskedit1.SetFocus;
    maskedit1.SelectAll;
    exit;
   end;
if length(txtRegCode.Text)=0 then
   begin
    messagedlg('»«Ìœ Ê«—œ ‘Êœ CD ﬂœ',mterror,[mbok],0);
    txtRegCode.SetFocus;
    txtRegCode.SelectAll;
    exit;
   end;
if length(edit2.text)=0 then
   begin
    messagedlg('»«Ìœ Ê«—œ ‘Êœ CD ⁄‰Ê«‰',mterror,[mbok],0);
    edit2.SetFocus;
    edit2.SelectAll;
    exit;
   end;
if length(txtTedad.Text)=0 then
   begin
    messagedlg('»«Ìœ Ê«—œ ‘Êœ CD  ⁄œ«œ „ÊÃÊœÌ',mterror,[mbok],0);
    txtTedad.SetFocus;
    txtTedad.SelectAll;
    exit;
   end;
if (length(trim(txtKeraie.text))=0)or(strtoint(trim(txtKeraie.text))=0) then
   begin
    messagedlg('ò—«ÌÂ Â— —Ê“ «„«‰  »«Ìœ Ê«—œ ‘Êœ',mterror,[mbok],0);
    txtKeraie.SetFocus;
    txtKeraie.SelectAll;
    exit;
   end;
table1.IndexFieldNames:='Regcode';
if table1.Seek(RegCode,soFirstEQ) then
  if RegCode<>form11.label1.caption then
   begin
    messagedlg('œÌê—Ì «Œ ’«’ Ì«› Â «” .·ÿ›« ﬂœ œÌê—Ì —« Ê«—œ ﬂ‰Ìœ CD ﬂœ À»  ﬁ»·« »Â ›Ì·„ Ì« ',mterror,[mbok],0);
    txtRegCode.SetFocus;
    txtRegCode.SelectAll;
    exit;
    end;

if strtoint(trim(txtTedad.Text))<(table1.FieldByName('Tedad').AsInteger-table1.FieldByName('RemTedad').AsInteger) then
   begin
    messagedlg('‰„Ì  Ê«‰œ ò„ — «“  ⁄œ«œ «„«‰  Â«Ì ¬‰ »«‘œ. œ— ’Ê—  ‰Ì«“ Å” «“ »—ê‘  ›Ì·„ „Ì Ê«‰Ìœ  ⁄œ«œ ¬‰ —« ò„ ò‰Ìœ CD  ⁄œ«œ',mterror,[mbok],0);
    txtTedad.SetFocus;
    txtTedad.SelectAll;
    exit;
   end;
RemTedad := table1.FieldByName('RemTedad').AsInteger + strtoint(trim(txtTedad.Text)) - table1.FieldByName('Tedad').AsInteger;

//table1.FindKey([form11.table1['regcode']]);
table1.edit;
table1.FieldByName('regcode').AsString:=RegCode;
table1.FieldByName('regdate').AsString:=maskedit1.Text;
table1.FieldByName('name').AsString:=edit2.text;
table1.FieldByName('gheimat').AsString:=txtGheimat.text;
table1.FieldByName('Keraie').AsString:=txtKeraie.text;
table1.FieldByName('DirKerd').AsString:=txtDirKerd.text;
table1.FieldByName('buydate').AsString:=maskedit2.text;
table1.FieldByName('buyname').AsString:=edit3.Text;
table1.FieldByName('Kargardan').AsString:=txtKargardan.Text;
table1.FieldByName('Bazigar').AsString:=txtBazigar.Text;
table1.FieldByName('Nevisande').AsString:=txtNevisande.Text;
table1.FieldByName('Kind').AsString:=txtKind.Text;
table1.FieldByName('Mahsol').AsString:=txtMahsol.Text;
table1.FieldByName('Keshvar').AsString:=txtKeshvar.Text;
table1.FieldByName('Rade1').AsString:=txtRade1.Text;
table1.FieldByName('Rade2').AsString:=txtRade2.Text;
table1.FieldByName('Tedad').AsString:=txtTedad.Text;
table1.FieldByName('RemTedad').AsInteger:=RemTedad;
{i:=0;
if checkbox1.Checked then i:=1;
if checkbox2.checked then i:=i+2;
table1.FieldByName('kinddisk').AsInteger:=i;}
table1.post;

if length(OpenPictureDialog1.FileName) <> 0 then
begin
tmp:= GetCurrentDir + '\Images\'+RegCode+'.jpg';
getmem(P1,200);
StrplCopy(P1,OpenPictureDialog1.FileName,length(OpenPictureDialog1.FileName));
getmem(P2,200);
StrplCopy(P2,tmp,length(tmp));
if FileExists(tmp) then DeleteFile(P2);
CopyFile(P1,P2,True);
Image1.Picture := nil;
OpenPictureDialog1.FileName := '';
freemem(P1,200);
freemem(P2,200);
end;
//showmessage('„‘Œ’«  À»  ‘œ');

txtRegCode.Text:='';
edit2.Text:='';
txtGheimat.text:='0';
maskedit2.Text:='';
edit3.Text:='';
txtKargardan.Text:='';
txtBazigar.Text:='';
txtNevisande.Text:='';
txtKind.Text:='';
txtMahsol.Text:='';
txtKeshvar.Text:='';
txtKeraie.Text:='0';
txtRade1.Text:='';
txtRade2.Text:='';
{CheckBox1.Checked:=false;
CheckBox2.Checked:=false;}
table1.Close;
//table1.IndexFieldNames:='';
table1.Open;
Close;
end;

procedure TForm8.FormShow(Sender: TObject);
begin
txtRade1.Items.LoadFromFile('Rade1.txt');
txtRade2.Items.LoadFromFile('Rade2.txt');
txtKeshvar.Items.LoadFromFile('Keshvar.txt');
txtKind.Items.LoadFromFile('Kind.txt');
txtMahsol.Items.LoadFromFile('Sherkat.txt');
Edit3.Items.LoadFromFile('Kharidar.txt');
txtKind.SetFocus;
Maskedit1.text:=form1.label1.Caption;
//table1.IndexFieldNames:='';
table1.Close;
table1.Open;
end;

procedure TForm8.txtRegCodeExit(Sender: TObject);
begin
txtRegCode.text:=UpperCase(txtRegCode.text);
ActivateKeyboardLayout($00000429,KLF_REORDER);
label18.Visible:=false;
if (BitBtn3.Visible)and(txtRegCode.text=form18.CodeTrimZero(form11.label1.caption)) then exit;
if Length(txtRegCode.Text)=0 then exit;
//txtRegCode.Text:=Form9.ConvetCode(UpperCase(txtRegCode.text),txtRegCode.MaxLength);
table1.Cancel;
table1.IndexFieldNames:='Regcode';
if table1.Seek(form9.ConvetCode(txtRegCode.text,txtRegCode.MaxLength),soFirstEQ) then
    messagedlg('œÌê—Ì «Œ ’«’ Ì«› Â «” .·ÿ›« ﬂœ œÌê—Ì —« Ê«—œ ﬂ‰Ìœ CD ﬂœ À»  ﬁ»·« »Â ›Ì·„ Ì« ',mterror,[mbok],0);
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
if length(trim(txtKind.Text))=0 then exit;
if txtKind.Items.IndexOf(txtKind.Text)=-1 then
        txtKind.Items.Add(txtKind.Text)
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
if length(trim(txtKeshvar.Text))=0 then exit;
if txtKeshvar.Items.IndexOf(txtKeshvar.Text)=-1 then
txtKeshvar.Items.Add(txtKeshvar.Text)
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
txtKind.Items.Delete(txtKind.Items.IndexOf(txtKind.Text));
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
txtKeshvar.Items.Delete(txtKeshvar.Items.IndexOf(txtKeshvar.Text));
end;

procedure TForm8.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtKeraie.SetFocus;
end;

procedure TForm8.CheckBox2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Edit3.SetFocus;
end;

procedure TForm8.asdfsdfKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then MaskEdit2.SetFocus;
end;

procedure TForm8.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtGheimat.SetFocus;
end;

procedure TForm8.txtBazigarKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtKargardan.SetFocus;
end;

procedure TForm8.txtKargardanKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtNevisande.SetFocus;
end;

procedure TForm8.txtNevisandeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtMahsol.SetFocus;
end;

procedure TForm8.txtMahsolsdKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtKind.SetFocus;
end;

procedure TForm8.txtKindKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then Edit2.SetFocus;
end;

procedure TForm8.txtKeshvarKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtRegCode.SetFocus;
end;

procedure TForm8.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtRegCode.SetFocus;
end;

procedure TForm8.txtMoneyKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtDirKerd.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TForm8.txtGheimatKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBazigar.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TForm8.Button5Click(Sender: TObject);
begin
if length(trim(txtMahsol.Text))=0 then exit;
if txtMahsol.Items.IndexOf(txtMahsol.Text)=-1 then
        txtMahsol.Items.Add(txtMahsol.Text)

end;

procedure TForm8.Button6Click(Sender: TObject);
begin
txtMahsol.Items.Delete(txtMahsol.Items.IndexOf(txtMahsol.Text));
end;

procedure TForm8.txtMahsolKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtRade1.SetFocus;
end;

procedure TForm8.Button7Click(Sender: TObject);
begin
if length(trim(Edit3.Text))=0 then exit;
if Edit3.Items.IndexOf(Edit3.Text)=-1 then
        Edit3.Items.Add(Edit3.Text)

end;

procedure TForm8.Button8Click(Sender: TObject);
begin
Edit3.Items.Delete(Edit3.Items.IndexOf(Edit3.Text));
end;

procedure TForm8.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then MaskEdit2.SetFocus;
end;

procedure TForm8.Button9Click(Sender: TObject);
begin
if length(trim(txtRade1.Text))=0 then exit;
if txtRade1.Items.IndexOf(txtRade1.Text)=-1 then
txtRade1.Items.Add(txtRade1.Text)

end;

procedure TForm8.Button12Click(Sender: TObject);
begin
if length(trim(txtRade2.Text))=0 then exit;
if txtRade2.Items.IndexOf(txtRade2.Text)=-1 then
txtRade2.Items.Add(txtRade2.Text)

end;

procedure TForm8.Button10Click(Sender: TObject);
begin
txtRade1.Items.Delete(txtRade1.Items.IndexOf(txtRade1.Text));
end;

procedure TForm8.Button11Click(Sender: TObject);
begin
txtRade2.Items.Delete(txtRade2.Items.IndexOf(txtRade2.Text));
end;

procedure TForm8.txtRade2KeyPress(Sender: TObject; var Key: Char);
begin
key:=UpCase(Key);
if key=#13 then
  if bitbtn3.Visible then
    BitBtn3.SetFocus
   else
    BitBtn1.SetFocus;
end;

procedure TForm8.txtRade1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtKeshvar.SetFocus;
end;

procedure TForm8.txtRegCodeEnter(Sender: TObject);
procedure DoHint(AControl: TControl) ;
var
pt: TPoint;
begin
pt := AControl.ClientToScreen(Point(1,1)) ;
SetCursorPos(pt.x, pt.y) ;
Application.ActivateHint(pt) ;
end;
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
if Length(txtRegcode.Text)=0 then
  label18.Visible:=true
  else
  label18.Visible:=false;

end;

procedure TForm8.txtRegCodeKeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
key:=UpCase(Key);
RegCodeEntered:=True;
if key=#13 then txtRade2.SetFocus;
end;

procedure TForm8.txtRade2Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TForm8.txtRade2Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
txtRade2.Text:=UpperCase(txtRade2.text);
end;

procedure TForm8.txtTedadKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then edit3.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TForm8.txtKindSelect(Sender: TObject);
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
if (RegCodeEntered=false)or(length(txtRegcode.Text)=0) then
  begin
  RegCodeEntered:=false;
  Query1.Close;
  if (form25.chkCodeGozari.Checked) then
    begin
    Query1.SQL.Text := 'select max(regcode) as maxcode from cdbank where Kind=:kind';
    Query1.ParamCheck:=true;
    Query1.Parameters.ParamByName('kind').Value:=txtKind.Text;
    end
    else
    Query1.SQL.Text := 'select max(regcode) as maxcode from cdbank';
  Query1.Open;
  strcode:=Query1.fieldbyname('maxcode').asstring;
  Query1.Close;

  for i:=1 to length(strcode) do
      if (strcode[i]<>'0') then
         break;
  strcode:=Copy(strcode,i,length(strcode));

  if length(trim(strcode))=0 then
    txtRegcode.Text:='1'
    else
    begin
    for i:=1 to length(strcode) do
      if not (strcode[i] in ['0'..'9']) then
        break;
    if i>length(strcode) then i:=0;
    if (SafeConvert(RightStr(strcode,length(strcode)-i),rcode)) then
      txtRegcode.Text:=LeftStr(strcode,i)+IntToStr(rcode+1)
      else
      txtRegcode.Text:=strcode;
    end;
  end;
//txtRegcode.Text:=form9.ConvetCode(txtRegcode.Text,txtRegcode.MaxLength);
end;

procedure TForm8.Table1BeforeOpen(DataSet: TDataSet);
begin
table1.IndexFieldNames:='';
end;

procedure TForm8.txtDirKerdKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtTedad.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;
end;

procedure TForm8.BitBtn4Click(Sender: TObject);
var
tmp:string;
begin
tmp := GetCurrentDir;
if OpenPictureDialog1.Execute then
  begin
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  Image1.Visible:=true;
  end;
SetCurrentDir(tmp);
end;

end.
