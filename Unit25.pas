unit Unit25;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FileCtrl, Spin, Mask, ExtCtrls, ActnList;

type
  TForm25 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    DriveComboBox1: TDriveComboBox;
    Label8: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label9: TLabel;
    Bevel1: TBevel;
    SpinEdit4: TSpinEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Label1: TLabel;
    txtName: TEdit;
    chkCodeGozari: TCheckBox;
    txtNetPath: TEdit;
    Label4: TLabel;
    procedure SpinEdit2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit4Exit(Sender: TObject);
    procedure DriveComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpinEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpinEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure txtNameKeyPress(Sender: TObject; var Key: Char);
    procedure txtNetPathKeyPress(Sender: TObject; var Key: Char);
    procedure chkCodeGozariKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation

uses Unit1;

{$R *.DFM}

procedure TForm25.SpinEdit2Exit(Sender: TObject);
var
b:boolean;
i:word;
s:string;
begin
b:=false;
s:=copy(spinedit2.Text,1,length(spinedit2.Text)-1);
for i:=1 to length(s) do
 if (s[i]='+')or(s[i]='-')or(s[i]='.') then b:=true;
if b then
 begin
 messagedlg('⁄·«∆„ +Ê-Ê/ œ— «⁄œ«œ „Ã«“ ‰Ì” ‰œ.·ÿ›« «⁄œ«œ —«  ’ÕÌÕ ﬂ‰Ìœ',mterror,[mbok],0);
 spinedit2.SetFocus;
 spinedit2.SelectAll;
 end;
end;

procedure TForm25.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm25.BitBtn1Click(Sender: TObject);
var
tanzim:textfile;
begin
//form1.label1.Caption:=maskedit1.Text;
assignfile(tanzim,'control.dat');
rewrite(tanzim);
writeln(tanzim,spinedit2.Text);
writeln(tanzim,drivecombobox1.Drive);
writeln(tanzim,spinedit4.Text);
writeln(tanzim,txtName.Text);
if chkCodeGozari.Checked then
    writeln(tanzim,'1')
  else
    writeln(tanzim,'0');
writeln(tanzim,txtNetPath.Text);
closefile(tanzim);
//Showmessage('·ÿ›« ÃÂ  «⁄„«·  ‰ŸÌ„«  «“ »—‰«„Â Œ«—Ã ‘œÂ Ê œÊ»«—Â Ê«—œ ‘ÊÌœ');
form1.CTitle.Caption:=txtName.Text;
close;
end;

procedure TForm25.FormShow(Sender: TObject);
var
tanzim:textfile;
s:string;
ch:char;
begin
//MaskEdit1.Text:=form1.label1.caption;
//form1.label1.caption:=maskedit1.Text;
assignfile(tanzim,'control.dat');
reset(tanzim);
readln(tanzim,s);
form25.spinedit2.Text:=s;
readln(tanzim,ch);
form25.drivecombobox1.Drive:=ch;
readln(tanzim,s);
form25.spinedit4.Text:=s;
readln(tanzim,s);
form25.txtName.Text:=s;
readln(tanzim,s);
if trim(s)='1' then
  chkCodeGozari.Checked:=true
else
  chkCodeGozari.Checked:=false;
readln(tanzim,s);
form25.txtNetPath.Text:=s;
closefile(tanzim);
{SpinEdit5.SetFocus;
SpinEdit5.SelectAll;}
end;

procedure TForm25.SpinEdit4Exit(Sender: TObject);
var
b:boolean;
i:word;
s:string;
begin
b:=false;
s:=copy(spinedit4.Text,1,length(spinedit4.Text)-1);
for i:=1 to length(s) do
 if (s[i]='+')or(s[i]='-')or(s[i]='.') then b:=true;
if b then
 begin
 messagedlg('⁄·«∆„ +Ê-Ê/ œ— «⁄œ«œ „Ã«“ ‰Ì” ‰œ.·ÿ›« «⁄œ«œ —«  ’ÕÌÕ ﬂ‰Ìœ',mterror,[mbok],0);
 spinedit4.SetFocus;
 spinedit4.SelectAll;
 end;
end;

procedure TForm25.DriveComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then SpinEdit2.SetFocus;
end;

procedure TForm25.SpinEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then SpinEdit4.SetFocus;
end;

procedure TForm25.SpinEdit4KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtName.SetFocus;
end;

procedure TForm25.txtNameKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then chkCodeGozari.SetFocus;
end;

procedure TForm25.txtNetPathKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
end;

procedure TForm25.chkCodeGozariKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtNetPath.SetFocus;
end;

end.
