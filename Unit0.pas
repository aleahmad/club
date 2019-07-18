unit Unit0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls;

type
  TForm0 = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form0: TForm0;

implementation

uses Unit1, Unit25;

{$R *.DFM}

procedure TForm0.MaskEdit1Exit(Sender: TObject);
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

procedure TForm0.FormClose(Sender: TObject; var Action: TCloseAction);
var
tanzim:textfile;
s:string;
ch:char;
begin
form1.label1.caption:=maskedit1.Text;
assignfile(tanzim,'control.dat');
reset(tanzim);
readln(tanzim,s);
form25.spinedit2.Text:=s;
readln(tanzim,ch);
form25.drivecombobox1.Drive:=ch;
readln(tanzim,s);
form25.spinedit4.Text:=s;
closefile(tanzim);
end;

procedure TForm0.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
