unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons,
  ActnList;

type
  TForm11 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Action2: TAction;
    BitBtn1: TBitBtn;
    Action3: TAction;
    Action4: TAction;
    BitBtn6: TBitBtn;
    Action5: TAction;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
       { Public declarations }
       procedure ListAmanatGir(RegCode:string);
  end;

var
  Form11: TForm11;

implementation

uses Unit9, Unit8, Unit12, Unit1, Unit13, Unit18, Unit17, Unit21, adodb,
  KalaForosh;

{$R *.DFM}

procedure TForm11.ListAmanatGir(RegCode:string);
begin
form18.QueryMembers.Close;
form18.QueryMembers.SQL.Clear;
//form18.QueryMembers.SQL.text:=('select * from members where membcode in (select membcode from borrow where (regcode=:rcode))');
form18.QueryMembers.SQL.text:=('SELECT members.*,borrow.borodate FROM members LEFT JOIN borrow ON members.membcode = borrow.membcode where borrow.regcode=:rcode');

form18.QueryMembers.Parameters.ParamByName('rcode').Value:=RegCode;
//form18.QueryMembers.Prepare;
form18.QueryMembers.Open;

form18.QRLabel7.Enabled:=false;
form18.QRLabel10.Enabled:=false;
form18.QRLabel2.Enabled:=false;
form18.QRLabel9.Enabled:=false;
form18.QRLabel39.Enabled:=false;
form18.QRLabel41.Enabled:=false;
form18.QRLabel23.Enabled:=false;
form18.QRLabel40.Enabled:=false;

//if messagedlg('ÂíÇ äíÇÒ Èå ÒÇÑÔ ˜Çãá ÈÇ ˜áíå ÇØáÇÚÇÊ ÝíáãåÇ ÏÇÑíÏ',mtInformation,[mbYes,mbNo],0)=mrYes then
//     form17.RadioButton3.checked:=true
//   else
//     form17.RadioButton4.checked:=true;
form21.DBGrid1.Columns[4].Title.Caption:='ÊÇÑíÎ ÇãÇäÊ';
form21.DBGrid1.Columns[4].FieldName:='borodate';
form21.DBGrid1.Refresh;
form21.showmodal;
form21.DBGrid1.Columns[4].Title.Caption:='ÊÇÑíÎ ËÈÊ äÇã';
form21.DBGrid1.Columns[4].FieldName:='regdate';
form21.DBGrid1.Refresh;
form18.QueryMembers.Close;
end;

procedure TForm11.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TForm11.BitBtn3Click(Sender: TObject);
begin
if form8.table1.IsEmpty then
      begin
      showmessage('Çí æÌæÏ äÏÇÑÏCD åí');
      exit;
      end;
form8.txtRegCode.Text:=form18.CodeTrimZero(form8.table1.fieldbyname('regcode').AsString);
form8.maskedit1.Text:=form8.table1.fieldbyname('regdate').AsString;
form8.edit2.text:=form8.table1.fieldbyname('name').AsString;
form8.txtGheimat.Text:=form8.table1.fieldbyname('gheimat').AsString;
form8.txtKeraie.Text:=form8.table1.fieldbyname('Keraie').AsString;
form8.txtDirKerd.Text:=form8.table1.fieldbyname('DirKerd').AsString;
form8.maskedit2.text:=form8.table1.fieldbyname('buydate').AsString;
form8.edit3.text:=form8.table1.fieldbyname('buyname').AsString;
form8.txtKargardan.text:=form8.table1.fieldbyname('Kargardan').AsString;
form8.txtNevisande.text:=form8.table1.fieldbyname('Nevisande').AsString;
form8.txtBazigar.text:=form8.table1.fieldbyname('Bazigar').AsString;
form8.txtMahsol.text:=form8.table1.fieldbyname('Mahsol').AsString;
form8.txtKind.text:=form8.table1.fieldbyname('Kind').AsString;
form8.txtKeshvar.text:=form8.table1.fieldbyname('Keshvar').AsString;
form8.txtRade1.text:=form8.table1.fieldbyname('Rade1').AsString;
form8.txtRade2.text:=form8.table1.fieldbyname('Rade2').AsString;
form8.txtTedad.text:=form8.table1.fieldbyname('Tedad').AsString;
{check:=form8.table1['kinddisk'];
check:=check shr 1;
if check=1 then form8.checkbox2.Checked:=true else form8.checkbox2.Checked:=false;
check:=form8.table1['kinddisk'];
check:=check shl 7;
check:=check shr 7;
if check=1 then form8.checkbox1.Checked:=true else form8.checkbox1.Checked:=false;}
form8.bitbtn1.Visible:=false;
form8.bitbtn3.Visible:=true;
label1.caption:=form8.table1.fieldbyname('regcode').AsString;
form8.RegCodeEntered:=true;
if FileExists(GetCurrentDir+'\Images\'+form8.table1.fieldbyname('regcode').AsString+'.jpg') then
    begin
    form8.Image1.Picture.LoadFromFile(GetCurrentDir+'\Images\'+form8.table1.fieldbyname('regcode').AsString+'.jpg');
    form8.Image1.Visible:=true;
    end
    else
    form8.Image1.Picture := nil;
form8.showmodal;
//form8.table1.IndexFieldNames:='';
form8.table1.open;
form8.table1.IndexFieldNames:='Regcode';
Form8.Table1.Locate('regcode',label1.caption,[loPartialKey]);
label1.caption:='';
end;

procedure TForm11.RadioButton2Click(Sender: TObject);
begin
RadioButton2.Checked:=true;
form8.table1.IndexFieldNames:='name';
edit2.SetFocus;
edit2.SelectAll;
end;

procedure TForm11.RadioButton1Click(Sender: TObject);
begin
RadioButton1.Checked:=true;
form8.table1.IndexFieldNames:='Regcode';
edit1.SetFocus;
edit1.SelectAll;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
Form8.table1.Close;
//Form8.table1.IndexFieldNames:='';
Form8.table1.open;
//Form12.table1.IndexFieldNames:='';
Form12.table1.Close;
Form12.table1.open;
//form8.Table1.Refresh;
form8.DataSource1.DataSet:=form8.Table1;
form8.DataSource1.Enabled:=true;
dbgrid1.DataSource:=form8.DataSource1;
//dbgrid1.Refresh;
//if Radiobutton1.Checked then Edit1.SetFocus else Edit2.SetFocus;
Edit1.SetFocus;
end;

procedure TForm11.BitBtn5Click(Sender: TObject);
begin
IF BITBTN5.Visible = FALSE THEN EXIT;
form13.edit2.text:=form18.CodeTrimZero(form8.table1.fieldbyname('regcode').asstring);
form13.OnvanCap.Caption:=form8.table1.fieldbyname('name').asstring;
  if Label2.Caption='1' then
        begin
        form12.txtCode1.text:=form18.CodeTrimZero(form8.table1.fieldbyname('regcode').asstring);
        form12.OnvanCap1.Caption:=form8.table1.fieldbyname('name').asstring;
        end;
  if Label2.Caption='2' then
        begin
        form12.txtCode2.text:=form18.CodeTrimZero(form8.table1.fieldbyname('regcode').asstring);
        form12.OnvanCap2.Caption:=form8.table1.fieldbyname('name').asstring;
        end;
  if Label2.Caption='3' then
        begin
        form12.txtCode3.text:=form18.CodeTrimZero(form8.table1.fieldbyname('regcode').asstring);
        form12.OnvanCap3.Caption:=form8.table1.fieldbyname('name').asstring;
        end;
  if Label2.Caption='4' then
        begin
        form12.txtCode4.text:=form18.CodeTrimZero(form8.table1.fieldbyname('regcode').asstring);
        form12.OnvanCap4.Caption:=form8.table1.fieldbyname('name').asstring;
        end;
  if Label2.Caption='5' then
        begin
        form12.txtCode5.text:=form18.CodeTrimZero(form8.table1.fieldbyname('regcode').asstring);
        form12.OnvanCap5.Caption:=form8.table1.fieldbyname('name').asstring;
        end;
  if Label2.Caption='6' then
        begin
        frmKalaForosh.txtKCode.text:=form18.CodeTrimZero(form8.table1.fieldbyname('regcode').asstring);
        frmKalaForosh.OnvanCap.Caption:=form8.table1.fieldbyname('name').asstring;
        end;
close;
end;

procedure TForm11.BitBtn4Click(Sender: TObject);
begin
if form8.table1.IsEmpty then
      begin
      showmessage('Çí æÌæÏ äÏÇÑÏCD åí');
      exit;
      end;
form12.table1.IndexFieldNames:='Regcode';
//form12.table1.SetKey;
if (form12.table1.Seek(form8.table1.fieldbyname('regcode').asstring,soFirstEQ)) then
      messagedlg('ÏÑ ÇãÇäÊ ÇÓÊ.ÇÈÊÏÇ Çä ÑÇ ÈÑÔÊ ÏåíÏ CD',mterror,[mbok],0)
      else
       if messagedlg('ÊãÇãí ÇØáÇÚÇÊ ãÑÈæØ Èå Çíä Ýíáã ÇÒ Èíä ãí ÑæÏ.ÂíÇ ÇÒ Çíä ßÇÑ ÇØãíäÇä ÏÇÑíÏ',mtconfirmation,[mbyes,mbno],0)=mryes then
          begin
          Form18.QueryCDBank.Active:=false;
          Form18.QueryCDBank.SQL.Text:='Update Payment Set RegCode='+QuotedStr('ÍÐÝ ÔÏå')+' where RegCode='+QuotedStr(form18.CodeTrimZero(form8.table1['regcode']));
          Form18.QueryCDBank.ExecSQL;
          if FileExists('Images\'+form8.table1.fieldbyname('regcode').asstring+'.jpg') then
             Form1.DeleteAllFiles('Images\'+form8.table1.fieldbyname('regcode').asstring+'.jpg');          
          form8.table1.Delete;
          end;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BitBtn2.SetFocus;
label1.caption:='-200';
Form8.txtRegCode.Text:='';
Form8.edit2.Text:='';
Form8.txtGheimat.Text:='0';
Form8.txtKeraie.text:='0';
Form8.maskedit2.Text:='';
Form8.edit3.Text:='';
Form8.txtKargardan.Text:='';
Form8.txtBazigar.Text:='';
Form8.txtNevisande.Text:='';
Form8.txtKind.Text:='';
Form8.txtMahsol.Text:='';
Form8.txtKeshvar.Text:='';
//form9.table1.Close;
//form8.table1.Close;
//form12.table1.Close;
end;

procedure TForm11.Edit1Exit(Sender: TObject);
begin
ActivateKeyboardLayout($00000429,KLF_REORDER);
//Edit1.Text:=Form9.ConvetCode(UpperCase(Edit1.text),edit1.MaxLength);
end;

procedure TForm11.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then if radiobutton1.Checked then Edit1.SetFocus else Edit2.SetFocus;
end;

procedure TForm11.Edit2Change(Sender: TObject);
begin
Form8.Table1.Locate('Name',Edit2.Text,[loPartialKey]);
end;

procedure TForm11.Edit1Change(Sender: TObject);
begin
Form8.Table1.Locate('regcode',Form9.ConvetCode(Uppercase(Edit1.Text),edit1.MaxLength),[loPartialKey]);
end;

procedure TForm11.DBGrid1DblClick(Sender: TObject);
begin
if BitBtn5.Visible then
  BitBtn5Click(Nil)
  else
  BitBtn3Click(Nil);
end;

procedure TForm11.BitBtn1Click(Sender: TObject);
begin
form8.bitbtn1.Visible:=true;
form8.bitbtn3.Visible:=false;
form8.txtKind.Text:='';
form8.RegCodeEntered:=false;
form8.Image1.Picture := nil;
form8.showmodal;
//form8.table1.IndexFieldNames:='';
form8.Table1.Open;
end;

procedure TForm11.Edit1KeyPress(Sender: TObject; var Key: Char);
var
FarStr,EngStr:string;
i:byte;
begin
FarStr:='ÌÍÎåÚÛÝÞËÕÖ˜ãäÊÇáÈíÓÔ/.æÆÏÐÑÒØÙ';
EngStr:='][POIUYTREWQ;LKJHGFDSA/.,MNBVCXZ';
for i:=1 to length(FarStr) do
  if key=FarStr[i] then key:=EngStr[i];
key:=UpCase(Key);  
end;

procedure TForm11.Edit1Enter(Sender: TObject);
begin
ActivateKeyboardLayout($00000409,KLF_REORDER);
RadioButton1Click(nil);
edit2.Text:='';
end;

procedure TForm11.Edit2Enter(Sender: TObject);
begin
RadioButton2Click(nil);
edit1.Text:='';
end;

procedure TForm11.BitBtn6Click(Sender: TObject);
begin
ListAmanatGir(form8.Table1.FieldByName('regcode').AsString);
end;

procedure TForm11.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if DBGrid1.DataSource.DataSet.RecNo > 0 then
  begin
  if (form8.Table1.FieldByName('remtedad').AsInteger<form8.Table1.FieldByName('tedad').AsInteger) then
       DBGrid1.Canvas.Brush.Color:=RGB(200,200,255);
  if (form8.Table1.FieldByName('remtedad').AsInteger<1) then
       DBGrid1.Canvas.Brush.Color:=RGB(255,200,200);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
       
    if Column.Title.Caption = 'ßÏ Ýíáã' then
      DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top, form18.CodeTrimZero(DBGrid1.DataSource.DataSet.fieldbyname('RegCode').AsString));
  end;
end;

end.
