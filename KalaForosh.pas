unit KalaForosh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfrmKalaForosh = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    GroupBox1: TGroupBox;
    FamilyCap: TLabel;
    SpeedButton6: TSpeedButton;
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Panel5: TPanel;
    Shape1: TShape;
    Label14: TLabel;
    capMojodi: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    txtGheimat: TEdit;
    Label7: TLabel;
    txtTedad: TEdit;
    Label4: TLabel;
    OnvanCap: TLabel;
    Label1: TLabel;
    txtKCode: TEdit;
    SpeedButton5: TSpeedButton;
    Action3: TAction;
    Action4: TAction;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    txtBedeh: TEdit;
    Label5: TLabel;
    Label8: TLabel;
    txtBestan: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    txtBedehTozih: TEdit;
    Label11: TLabel;
    txtBestanTozih: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure txtKCodeExit(Sender: TObject);
    procedure txtKCodeKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure txtTedadKeyPress(Sender: TObject; var Key: Char);
    procedure txtGheimatKeyPress(Sender: TObject; var Key: Char);
    procedure txtKCodeChange(Sender: TObject);
    procedure txtTedadChange(Sender: TObject);
    procedure txtKCodeEnter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure RadioGroup1Click(Sender: TObject);
    procedure txtBedehKeyPress(Sender: TObject; var Key: Char);
    procedure txtBestanKeyPress(Sender: TObject; var Key: Char);
    procedure txtBedehTozihKeyPress(Sender: TObject; var Key: Char);
    procedure txtBestanTozihKeyPress(Sender: TObject; var Key: Char);
    procedure txtBedehExit(Sender: TObject);
    procedure txtBestanExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Gheimat:integer;
  end;

var
  frmKalaForosh: TfrmKalaForosh;

implementation

uses Unit8, Unit1, Unit13, Unit25, Unit11, Unit9, Unit18, KalaSabt,
  KalaSearch, DB, adodb, Unit10;

{$R *.DFM}

procedure TfrmKalaForosh.BitBtn1Click(Sender: TObject);
var
KCode:string;
MemberCode:string;
begin
if (length(trim(Edit1.Text))=0)and((txtBedeh.Text<>'0')or(txtBestan.Text<>'0')) then
  begin
    messagedlg('œ— ’Ê— Ì ﬂÂ „Ì ŒÊ«ÂÌœ „»·€ »œÂÌ Ì« »” «‰ﬂ«—Ì »—«Ì „‘ —Ì À»  ‘Êœ »«Ìœ ﬂœ „‘ —Ì —« Ê«—œ ﬂ‰Ìœ. œ— €Ì— «Ì‰ ’Ê—  «Ì‰ „»«·€ —« ’›— ﬂ‰Ìœ',mterror,[mbok],0);
    exit;
  end;

MemberCode:=form9.ConvetCode(edit1.text,edit1.MaxLength);
if (length(trim(Edit1.Text))<>0) then
  begin
  form9.Table1.Close;
  form9.Table1.Open;
  form9.table1.IndexFieldNames:='membcode';
  if not(form9.table1.Seek(MemberCode,soFirstEQ)) then
   begin
   messagedlg('ﬂœ „‘ —Ì „Ê—œ ‰Ÿ— ‘„« ÊÃÊœ ‰œ«—œ',mterror,[mbok],0);
   edit1.SetFocus;
   exit;
   end
   else
    if form9.table1.FieldByName('IsActive').asstring='*' then
      begin
      Messagedlg('«Ì‰ „‘ —Ì €Ì—›⁄«· ‘œÂ «”  Ê ‰„Ì  Ê«‰Ìœ »Â «Ê »›—Ê‘Ìœ',mterror,[mbok],0);
      exit;
      end;
  end;
if (length(trim(txtKCode.Text))=0) then
  begin
  messagedlg('òœ ò«·« »«Ìœ Ê«—œ ‘Êœ',mtError,[mbOk],0);
  txtKCode.SetFocus;
  exit;
  end;
if txtTedad.Visible then
 if (length(trim(txtTedad.Text))=0)or(strtoint(txtTedad.Text)=0) then
  begin
  messagedlg(' ⁄œ«œ »«Ìœ Ê«—œ ‘Êœ',mtError,[mbOk],0);
  txtTedad.SetFocus;
  exit;
  end;
if (length(trim(txtGheimat.Text))=0) then
  if messagedlg('„»·€ Å—œ«Œ Ì Ê«—œ ‰‘œÂ «” . ¬Ì« „«Ì·Ìœ «ÿ·«⁄«  ›—Ê‘ À»  ‘Êœ',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    begin
    txtGheimat.SetFocus;
    exit;
    end;

if RadioGroup1.ItemIndex=0 then
begin
  KCode:=Form9.ConvetCode(txtKCode.Text,txtKCode.MaxLength);
  frmKalaSabt.table1.IndexFieldNames:='KCode';
  if not(frmKalaSabt.table1.Seek(KCode,soFirstEQ)) then
     begin
        showmessage('ﬂœ ﬂ«·« „Ê—œ ‰Ÿ— ‘„« Ì«›  ‰‘œ');
        txtKCode.SetFocus;
        exit;
     end;
  if txtTedad.Visible then
   if frmKalaSabt.table1.FieldByName('tedad').AsInteger<strtoint(txtTedad.Text) then
    begin
        showmessage('„ÊÃÊœÌ ò«·« ò„ — «“ „ﬁœ«— œ—ŒÊ«” Ì ‘„« «” ');
        txttedad.SetFocus;
        exit;
    end;

  with form13 do
    begin
    table1.append;
    if txtTedad.Visible=false then
      table1.FieldByName('RegCode').asstring:='›—Ê‘-Œœ„« '
      else
      table1.FieldByName('RegCode').asstring:='›—Ê‘ ò«·«- ⁄œ«œ='+ txtTedad.Text;
    table1.FieldByName('pay').AsString:=txtGheimat.text;
    table1.FieldByName('membcode').asstring:=MemberCode;
    table1.FieldByName('retdate').asstring:=form1.label1.caption;
    table1.FieldByName('KCode').asstring:=KCode;
    table1.FieldByName('UserName').asstring:=Form1.User_Name;
    table1.post;
    end;
  if txtTedad.Visible then
    begin
    frmKalaSabt.table1.edit;
    frmKalaSabt.table1.FieldByName('tedad').AsInteger:=frmKalaSabt.table1.FieldByName('tedad').AsInteger-strtoint(txtTedad.Text);
    frmKalaSabt.table1.post;
    end;
end
else
begin
  KCode:=Form9.ConvetCode(txtKCode.Text,form8.txtRegCode.MaxLength);
  form8.table1.IndexFieldNames:='Regcode';
  if not(form8.table1.Seek(KCode,soFirstEQ)) then
     begin
        showmessage('ﬂœ ›Ì·„ Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ');
        txtKCode.SetFocus;
        exit;
     end;
  if form8.table1.FieldByName('RemTedad').AsInteger<strtoint(txtTedad.Text) then
    begin
        showmessage('„ÊÃÊœÌ ›Ì·„ ò„ — «“ „ﬁœ«— œ—ŒÊ«” Ì ‘„« «” ');
        txtTedad.SetFocus;
        exit;
    end;

  with form13 do
    begin
    table1.append;
    table1.FieldByName('pay').AsString:=txtGheimat.text;
    table1.FieldByName('membcode').asstring:=MemberCode;
    table1.FieldByName('retdate').asstring:=form1.label1.caption;
    table1.FieldByName('RegCode').asstring:=KCode;
    table1.FieldByName('UserName').asstring:=Form1.User_Name;
    table1.FieldByName('KCode').asstring:='›—Ê‘:›Ì·„- ⁄œ«œ='+ txtTedad.Text;
    table1.post;
    end;
  if txtTedad.Visible then
    begin
    form8.table1.edit;
    form8.table1.FieldByName('tedad').AsInteger:=form8.table1.FieldByName('tedad').AsInteger-strtoint(txtTedad.Text);
    form8.table1.FieldByName('RemTedad').AsInteger:=form8.table1.FieldByName('RemTedad').AsInteger-strtoint(txtTedad.Text);
    form8.table1.post;
    end;
end;

if (length(trim(Edit1.Text))<>0) then
  begin
  if (txtBedeh.Text<>'0') then
    form10.HesabMoshtari(txtBedeh.Text,txtBedehTozih.Text,-1);
  if (txtBestan.Text<>'0') then
    form10.HesabMoshtari(txtBestan.Text,txtBestanTozih.Text,1);
  end;

form8.table1.Close;
frmKalaSabt.table1.Close;
form13.table1.Close;
//frmKalaSabt.table1.Open;
//form13.table1.Open;
txtKCode.Text:='';
txtTedad.Text:='0';
txtGheimat.Text:='0';
close;
end;

procedure TfrmKalaForosh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
//frmKalaSabt.table1.Close;
//form13.table1.Close;
end;

procedure TfrmKalaForosh.FormShow(Sender: TObject);
begin
txtKCode.Text:='';
Edit1.Text:='';
FamilyCap.Caption:='';
frmKalaSabt.table1.Close;
form13.table1.Close;
frmKalaSabt.table1.open;
form13.table1.open;
txtKCode.SetFocus;
OnvanCap.Caption:='-';
Gheimat:=0;
capMojodi.Caption:='0';
Shape1.Brush.Color:=clWhite;
txtBedeh.Text:='0';
txtBedehTozih.Text:='';
txtBestan.Text:='0';
txtBestanTozih.Text:='';
end;

procedure TfrmKalaForosh.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TfrmKalaForosh.txtKCodeExit(Sender: TObject);
var Code:string;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
if (length(trim(txtKCode.Text))=0) then
  exit;
txtKCode.Text:=UpperCase(txtKCode.text);
if RadioGroup1.ItemIndex=0 then
  begin
  frmKalaSabt.table1.Close;
  frmKalaSabt.table1.Open;
  frmKalaSabt.table1.IndexFieldNames:='KCode';
  if not(frmKalaSabt.table1.Seek(form9.ConvetCode(txtKCode.text,txtKCode.MaxLength),soFirstEQ)) then
       begin
        showmessage('ﬂœ ﬂ«·« „Ê—œ ‰Ÿ— ‘„« Ì«›  ‰‘œ');
        exit;
       end;
  OnvanCap.Caption:=frmKalaSabt.table1.fieldbyname('Sharh').asstring;
  Gheimat:=frmKalaSabt.table1.fieldbyname('Gheimat').asinteger;
  txtGheimat.Text:=frmKalaSabt.table1.fieldbyname('Gheimat').AsString;
  if frmKalaSabt.table1.fieldbyname('tedad').asinteger=-1 then
    txtTedad.Visible:=false
    else
    txtTedad.Visible:=true;
  end
  else
  begin
  Code:=form9.ConvetCode(UpperCase(txtKCode.text),form8.txtRegCode.MaxLength);
  form8.table1.Close;
  form8.table1.Open;
    form8.table1.IndexFieldNames:='Regcode';
    if not(form8.table1.Seek(Code,soFirstEQ)) then
       begin
        messagedlg('ﬂœ ›Ì·„ Ê«—œ ‘œÂ ÊÃÊœ ‰œ«—œ',mterror,[mbok],0);
        exit;
       end;
  OnvanCap.caption:=form8.table1['Name'];
  Gheimat:=form8.table1.fieldbyname('Gheimat').asinteger;
  txtGheimat.Text:=form8.table1.fieldbyname('Gheimat').AsString;
  txtTedad.Visible:=true;
  end;
label4.Visible:=txtTedad.Visible;
if txtTedad.Visible then
        txtTedad.SetFocus
      else
        txtGheimat.SetFocus
end;

procedure TfrmKalaForosh.txtKCodeKeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='çÃÕŒÂ⁄€›ﬁÀ’÷ò„‰ «·»Ì”‘/.Ê∆œ–—“ÿŸ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
if key=#13 then
  if length(trim(txtKCode.Text))=0 then
    SpeedButton5Click(Nil)
    else
    if txtTedad.Visible then
        txtTedad.SetFocus
      else
        txtGheimat.SetFocus;
key:=UpCase(Key);              
end;

procedure TfrmKalaForosh.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtKCode.SetFocus;
end;

procedure TfrmKalaForosh.SpeedButton5Click(Sender: TObject);
begin
{frmKalaSearch.bitbtn2.visible:=false;
frmKalaSearch.bitbtn5.visible:=true;}
if RadioGroup1.ItemIndex=0 then
  begin
  frmKalaSearch.showmodal;
  txtKCode.OnExit(nil);
  end
  else
  begin
  form11.Label2.Caption:='6';
  form11.showmodal;
  txtKCode.OnExit(nil);
  end;
end;

procedure TfrmKalaForosh.txtTedadKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtGheimat.Setfocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TfrmKalaForosh.txtGheimatKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then txtBedeh.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TfrmKalaForosh.txtKCodeChange(Sender: TObject);
begin
Gheimat:=0;
end;

procedure TfrmKalaForosh.txtTedadChange(Sender: TObject);
begin
if length(trim(txtTedad.Text))<>0 then
txtGheimat.Text:=inttostr(Gheimat*strtoint(txtTedad.Text));
end;

procedure TfrmKalaForosh.txtKCodeEnter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TfrmKalaForosh.Edit1Change(Sender: TObject);
begin
FamilyCap.Caption:='';
capMojodi.Caption:='0';

end;

procedure TfrmKalaForosh.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
end;

procedure TfrmKalaForosh.Edit1Exit(Sender: TObject);
var Code:String;
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
form9.table1.Open;
Code:=form9.ConvetCode(UpperCase(Edit1.text),edit1.MaxLength);
if length(Code)=0 then
    exit
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
         end;
   end;
form9.table1.Close;
end;
procedure TfrmKalaForosh.SpeedButton6Click(Sender: TObject);
begin
form10.showmodal;
edit1.OnExit(nil);
end;

procedure TfrmKalaForosh.BitBtn4Click(Sender: TObject);
begin
form9.bitbtn1.Visible:=true;
form9.bitbtn3.Visible:=false;
form9.showmodal;
Edit1Exit(nil);
BitBtn1.SetFocus;

end;

procedure TfrmKalaForosh.Edit1KeyPress(Sender: TObject; var Key: Char);
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
    BitBtn1.SetFocus;
key:=UpCase(Key);    
end;

procedure TfrmKalaForosh.RadioGroup1Click(Sender: TObject);
begin
txtKCode.SetFocus;
txtKCode.SelectAll;
end;

procedure TfrmKalaForosh.txtBedehKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBedehTozih.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TfrmKalaForosh.txtBestanKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtBestanTozih.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TfrmKalaForosh.txtBedehTozihKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then txtBestan.SetFocus;
end;

procedure TfrmKalaForosh.txtBestanTozihKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then Edit1.SetFocus;
end;

procedure TfrmKalaForosh.txtBedehExit(Sender: TObject);
begin
if Length(trim(txtBedeh.Text))=0 then txtBedeh.Text:='0';
if (Length(txtBedehTozih.Text)=0)and(txtBedeh.Text<>'0') then txtBedehTozih.Text:='»œÂÌ ›—Ê‘ '+OnvanCap.Caption;

end;

procedure TfrmKalaForosh.txtBestanExit(Sender: TObject);
begin
if Length(trim(txtBestan.Text))=0 then txtBestan.Text:='0';
if (Length(txtBestanTozih.Text)=0)and(txtBestan.Text<>'0') then txtBestanTozih.Text:='»” «‰ﬂ«—Ì ›—Ê‘ '+OnvanCap.Caption;
end;

end.
