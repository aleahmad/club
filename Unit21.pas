unit Unit21;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, Buttons, ActnList, DBTables, ExtCtrls;

type
  TForm21 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    DirKerd:Boolean;
  end;

var
  Form21: TForm21;

implementation

uses Unit17, Unit18, Unit1, Unit19, Unit13;

{$R *.DFM}

procedure TForm21.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure TForm21.BitBtn2Click(Sender: TObject);
begin
if RadioButton3.checked then
   begin
   form18.QRLabel7.Caption:=form17.MaskEdit1.Text;
   form18.QRLabel10.Caption:=form17.maskedit2.Text;
   form18.QRLabel7.Enabled:=form1.N14.Checked;
   form18.QRLabel10.Enabled:=form1.N14.Checked;
   form18.QRLabel2.Enabled:=form1.N14.Checked;
   form18.QRLabel9.Enabled:=form1.N14.Checked;
   end
   else
   begin
    form18.QRLabel39.Caption:=form17.maskedit1.Text;
    form18.QRLabel41.Caption:=form17.maskedit2.Text;
    form18.QRLabel39.Enabled:=form1.N14.Checked;
    form18.QRLabel41.Enabled:=form1.N14.Checked;
    form18.QRLabel23.Enabled:=form1.N14.Checked;
    form18.QRLabel40.Enabled:=form1.N14.Checked;
   end;
if Dirkerd then
     form18.QuickRep2.Preview
   else
     if RadioButton3.checked then
        form18.QuickRep2.Preview
     else
        form18.QuickRep4.Preview;
end;

procedure TForm21.BitBtn1Click(Sender: TObject);
begin
if RadioButton3.checked then
   begin
   form18.QRLabel7.Caption:=form17.maskedit1.Text;
   form18.QRLabel10.Caption:=form17.maskedit2.Text;
   form18.QRLabel7.Enabled:=form1.N14.Checked;
   form18.QRLabel10.Enabled:=form1.N14.Checked;
   form18.QRLabel2.Enabled:=form1.N14.Checked;
   form18.QRLabel9.Enabled:=form1.N14.Checked;
   end
   else
   begin
    form18.QRLabel39.Caption:=form17.maskedit1.Text;
    form18.QRLabel41.Caption:=form17.maskedit2.Text;
    form18.QRLabel39.Enabled:=form1.N14.Checked;
    form18.QRLabel41.Enabled:=form1.N14.Checked;
    form18.QRLabel23.Enabled:=form1.N14.Checked;
    form18.QRLabel40.Enabled:=form1.N14.Checked;
   end;
if form1.PrinterSetupDialog1.Execute then
   if Dirkerd then
     form18.QuickRep2.Print
   else
     if RadioButton3.checked then form18.QuickRep2.Print else form18.QuickRep4.Print;
end;

procedure TForm21.FormShow(Sender: TObject);
begin
BitBtn2.SetFocus;
DataSource1.Enabled:=true;
end;

procedure TForm21.BitBtn4Click(Sender: TObject);
begin
Form19.BitBtn4Click(nil);
end;

procedure TForm21.BitBtn5Click(Sender: TObject);
begin
Form19.BitBtn5Click(nil);
end;

procedure TForm21.BitBtn6Click(Sender: TObject);
begin
form13.FromMainForm:=false;
form13.FormShow(nil);
Form13.Edit1.Text := form18.CodeTrimZero(form18.QueryMembers.FieldByName('membcode').AsString);
Form13.Edit1Exit(nil);
form13.ShowModal;
Form18.QueryMembers.Close;
Form18.QueryMembers.Open;
end;

procedure TForm21.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DataSource1.DataSet.RecNo > 0 then
  begin
    if Column.Title.Caption = 'ﬂœ „‘ —Ì' then
      DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top, form18.CodeTrimZero(DataSource1.DataSet.fieldbyname('MembCode').AsString));
  end;
end;

end.
