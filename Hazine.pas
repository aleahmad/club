unit Hazine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TfrmHazine = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel3: TBevel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Label1: TLabel;
    Label7: TLabel;
    txtGheimat: TEdit;
    Label6: TLabel;
    txtHazine: TComboBox;
    Button1: TButton;
    Button3: TButton;
    txtSharh: TEdit;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure txtGheimatKeyPress(Sender: TObject; var Key: Char);
    procedure txtHazineKeyPress(Sender: TObject; var Key: Char);
    procedure txtSharhKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Gheimat:integer;
  end;

var
  frmHazine: TfrmHazine;

implementation

uses Unit8, Unit1, Unit13, Unit25, Unit11, Unit9, Unit18, KalaSabt,
  KalaSearch;

{$R *.DFM}

procedure TfrmHazine.BitBtn1Click(Sender: TObject);
begin
if (length(trim(txtHazine.Text))=0) then
  begin
  messagedlg('‰Ê⁄ Â“Ì‰Â »«Ìœ Ê«—œ ‘Êœ',mtError,[mbOk],0);
  txtHazine.SetFocus;
  exit;
  end;
if (length(trim(txtGheimat.Text))=0)or(strtoint(txtGheimat.Text)=0) then
  begin
  messagedlg('„»·€ Å—œ«Œ Ì »«Ìœ Ê«—œ ‘Êœ',mtError,[mbOk],0);
  txtGheimat.SetFocus;
  exit;
  end;
with form13 do
     begin
     table1.Open;
     table1.append;
     table1.FieldByName('RegCode').asstring:='Â“Ì‰Â:'+txtSharh.Text;
     table1.FieldByName('pay').AsString:=inttostr(strtoint64(txtGheimat.text)*-1);
     table1.FieldByName('membcode').asstring:=txtHazine.Text;
     table1.FieldByName('retdate').asstring:=form1.label1.caption;
     table1.FieldByName('UserName').asstring:=Form1.User_Name;     
     table1.post;
     table1.Close;
     end;
close;
txtGheimat.Text:='0';
txtHazine.Text:='';
txtSharh.Text:='';
end;

procedure TfrmHazine.FormClose(Sender: TObject; var Action: TCloseAction);
begin
txtHazine.Items.SaveToFile('Hazine.txt');
end;

procedure TfrmHazine.FormShow(Sender: TObject);
begin
txtHazine.Items.LoadFromFile('Hazine.txt');
txtHazine.Text:='';
txtSharh.Text:='';
txtHazine.SetFocus;
Gheimat:=0;
end;

procedure TfrmHazine.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TfrmHazine.txtGheimatKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then BitBtn1.SetFocus;
if not (key in ['0'..'9',#13,#8]) then key:=#0;

end;

procedure TfrmHazine.txtHazineKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtSharh.SetFocus;

end;

procedure TfrmHazine.txtSharhKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then txtGheimat.SetFocus;
end;

procedure TfrmHazine.Button1Click(Sender: TObject);
begin
if length(trim(txtHazine.Text))=0 then exit;
if txtHazine.Items.IndexOf(txtHazine.Text)=-1 then
        txtHazine.Items.Add(txtHazine.Text)

end;

procedure TfrmHazine.Button3Click(Sender: TObject);
begin
txtHazine.Items.Delete(txtHazine.Items.IndexOf(txtHazine.Text));
end;

end.
