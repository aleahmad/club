unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Spin, Db, Grids, DBGrids, Buttons, ActnList, DBTables;

type
  TForm19 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    FontDialogTitle: TFontDialog;
    FontDialogCnt: TFontDialog;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
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
  end;

var
  Form19: TForm19;

implementation

uses Unit18, Unit1, Unit17, Unit20, Unit13, Unit8;

{$R *.DFM}

procedure TForm19.BitBtn1Click(Sender: TObject);
begin
if RadioButton3.checked then
   begin
    form18.QRLabel17.Caption:=form20.maskedit1.Text;
    form18.QRLabel19.Caption:=form20.maskedit2.Text;
    form18.QRLabel18.Enabled:=form1.N14.Checked;
    form18.QRLabel14.Enabled:=form1.N14.Checked;
    form18.QRLabel17.Enabled:=form1.N14.Checked;
    form18.QRLabel19.Enabled:=form1.N14.Checked;
   end
   else
   if RadioButton4.checked then
   begin
    form18.QRLabel4.Caption:=form20.maskedit1.Text;
    form18.QRLabel6.Caption:=form20.maskedit2.Text;
    form18.QRLabel3.Enabled:=form1.N14.Checked;
    form18.QRLabel4.Enabled:=form1.N14.Checked;
    form18.QRLabel5.Enabled:=form1.N14.Checked;
    form18.QRLabel6.Enabled:=form1.N14.Checked;
   end
   else
   begin
    form18.QRLabel69.Caption:=form20.maskedit1.Text;
    form18.QRLabel71.Caption:=form20.maskedit2.Text;
    form18.QRLabel68.Enabled:=form1.N14.Checked;
    form18.QRLabel69.Enabled:=form1.N14.Checked;
    form18.QRLabel70.Enabled:=form1.N14.Checked;
    form18.QRLabel71.Enabled:=form1.N14.Checked;
   end;
if form1.PrinterSetupDialog1.Execute then
  if RadioButton3.checked then
    form18.QuickRep3.Print
    else
    if RadioButton4.checked then
        form18.QuickRep1.Print
        else
        form18.QuickRep6.Print;
end;

procedure TForm19.BitBtn2Click(Sender: TObject);
begin
if RadioButton3.checked then
   begin
    form18.QRLabel17.Caption:=form20.maskedit1.Text;
    form18.QRLabel19.Caption:=form20.maskedit2.Text;
    form18.QRLabel18.Enabled:=form1.N14.Checked;
    form18.QRLabel14.Enabled:=form1.N14.Checked;
    form18.QRLabel17.Enabled:=form1.N14.Checked;
    form18.QRLabel19.Enabled:=form1.N14.Checked;
   end
   else
   if RadioButton4.checked then
   begin
    form18.QRLabel4.Caption:=form20.maskedit1.Text;
    form18.QRLabel6.Caption:=form20.maskedit2.Text;
    form18.QRLabel3.Enabled:=form1.N14.Checked;
    form18.QRLabel4.Enabled:=form1.N14.Checked;
    form18.QRLabel5.Enabled:=form1.N14.Checked;
    form18.QRLabel6.Enabled:=form1.N14.Checked;
   end
   else
   begin
    form18.QRLabel69.Caption:=form20.maskedit1.Text;
    form18.QRLabel71.Caption:=form20.maskedit2.Text;
    form18.QRLabel68.Enabled:=form1.N14.Checked;
    form18.QRLabel69.Enabled:=form1.N14.Checked;
    form18.QRLabel70.Enabled:=form1.N14.Checked;
    form18.QRLabel71.Enabled:=form1.N14.Checked;
   end;
if RadioButton3.checked then form18.QuickRep3.Preview
  else
    if RadioButton4.checked then form18.QuickRep1.Preview
  else
    if RadioButton1.checked then form18.QuickRep6.Preview
  else
    form18.QuickRep7.Preview;
end;

procedure TForm19.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure TForm19.FormShow(Sender: TObject);
begin
BitBtn2.SetFocus;
end;

procedure TForm19.BitBtn4Click(Sender: TObject);
begin
if FontDialogTitle.Execute then
begin
form18.CTitle1.Font := FontDialogTitle.Font;
form18.CTitle1.Font.Size:=form18.CTitle1.Font.Size+3;
form18.CTitle2.Font := FontDialogTitle.Font;
form18.CTitle2.Font.Size:=form18.CTitle2.Font.Size+3;
form18.CTitle3.Font := FontDialogTitle.Font;
form18.CTitle3.Font.Size:=form18.CTitle3.Font.Size+3;
form18.CTitle4.Font := FontDialogTitle.Font;
form18.CTitle4.Font.Size:=form18.CTitle4.Font.Size+3;
form18.CTitle5.Font := FontDialogTitle.Font;
form18.CTitle5.Font.Size:=form18.CTitle5.Font.Size+3;
form18.CTitle6.Font := FontDialogTitle.Font;
form18.CTitle6.Font.Size:=form18.CTitle6.Font.Size+3;
form18.QRLabel1.Font := FontDialogTitle.Font;
form18.QRLabel8.Font := FontDialogTitle.Font;
form18.QRLabel11.Font := FontDialogTitle.Font;
form18.QRLabel13.Font := FontDialogTitle.Font;
form18.QRLabel15.Font := FontDialogTitle.Font;
form18.QRLabel16.Font := FontDialogTitle.Font;
form18.QRLabel21.Font := FontDialogTitle.Font;
form18.QRLabel22.Font := FontDialogTitle.Font;
form18.QRLabel24.Font := FontDialogTitle.Font;
form18.QRLabel25.Font := FontDialogTitle.Font;
form18.QRLabel26.Font := FontDialogTitle.Font;
form18.QRLabel27.Font := FontDialogTitle.Font;
form18.QRLabel28.Font := FontDialogTitle.Font;
//form18.QRLabel29.Font := FontDialogTitle.Font;
form18.QRLabel30.Font := FontDialogTitle.Font;
form18.QRLabel31.Font := FontDialogTitle.Font;
form18.QRLabel32.Font := FontDialogTitle.Font;
form18.QRLabel33.Font := FontDialogTitle.Font;
form18.QRLabel34.Font := FontDialogTitle.Font;
form18.QRLabel35.Font := FontDialogTitle.Font;
form18.QRLabel36.Font := FontDialogTitle.Font;
form18.QRLabel37.Font := FontDialogTitle.Font;
form18.QRLabel38.Font := FontDialogTitle.Font;
form18.QRLabel42.Font := FontDialogTitle.Font;
form18.QRLabel43.Font := FontDialogTitle.Font;
form18.QRLabel44.Font := FontDialogTitle.Font;
form18.QRLabel45.Font := FontDialogTitle.Font;
form18.QRLabel46.Font := FontDialogTitle.Font;
form18.QRLabel47.Font := FontDialogTitle.Font;
form18.QRLabel48.Font := FontDialogTitle.Font;
form18.QRLabel49.Font := FontDialogTitle.Font;
form18.QRLabel50.Font := FontDialogTitle.Font;
form18.QRLabel51.Font := FontDialogTitle.Font;
form18.QRLabel52.Font := FontDialogTitle.Font;
//form18.QRLabel53.Font := FontDialogTitle.Font;
//form18.QRLabel54.Font := FontDialogTitle.Font;
form18.QRLabel55.Font := FontDialogTitle.Font;
form18.QRLabel55.Font.Size:=form18.QRLabel55.Font.Size-2;
form18.QRLabel56.Font := FontDialogTitle.Font;
form18.QRLabel57.Font := FontDialogTitle.Font;
form18.QRLabel58.Font := FontDialogTitle.Font;
form18.QRLabel59.Font := FontDialogTitle.Font;
form18.QRLabel61.Font := FontDialogTitle.Font;
form18.QRLabel65.Font := FontDialogTitle.Font;

form18.QRLabel72.Font := FontDialogTitle.Font;
form18.QRLabel73.Font := FontDialogTitle.Font;
form18.QRLabel74.Font := FontDialogTitle.Font;
form18.QRLabel75.Font := FontDialogTitle.Font;
form18.QRLabel76.Font := FontDialogTitle.Font;
form18.QRLabel77.Font := FontDialogTitle.Font;
form18.QRLabel78.Font := FontDialogTitle.Font;
form18.CTitle7.Font := FontDialogTitle.Font;
end;
end;

procedure TForm19.BitBtn5Click(Sender: TObject);
begin
if FontDialogCnt.Execute then
begin
form18.QRLabel3.Font := FontDialogCnt.Font;
form18.QRLabel4.Font := FontDialogCnt.Font;
form18.QRLabel5.Font := FontDialogCnt.Font;
form18.QRLabel6.Font := FontDialogCnt.Font;
form18.QRLabel2.Font := FontDialogCnt.Font;
form18.QRLabel7.Font := FontDialogCnt.Font;
form18.QRLabel9.Font := FontDialogCnt.Font;
form18.QRLabel10.Font := FontDialogCnt.Font;
form18.QRLabel14.Font := FontDialogCnt.Font;
form18.QRLabel17.Font := FontDialogCnt.Font;
form18.QRLabel18.Font := FontDialogCnt.Font;
form18.QRLabel19.Font := FontDialogCnt.Font;
form18.QRLabel23.Font := FontDialogCnt.Font;
form18.QRLabel39.Font := FontDialogCnt.Font;
form18.QRLabel40.Font := FontDialogCnt.Font;
form18.QRLabel41.Font := FontDialogCnt.Font;
form18.QRExpr1.Font := FontDialogCnt.Font;
form18.QRExpr2.Font := FontDialogCnt.Font;
form18.QRExpr3.Font := FontDialogCnt.Font;
form18.QRExpr4.Font := FontDialogCnt.Font;
form18.QRExpr5.Font := FontDialogCnt.Font;
form18.QRSysData1.Font := FontDialogCnt.Font;
form18.QRSysData2.Font := FontDialogCnt.Font;
form18.QRSysData3.Font := FontDialogCnt.Font;
form18.QRSysData4.Font := FontDialogCnt.Font;
form18.QRSysData5.Font := FontDialogCnt.Font;
form18.QRSysData6.Font := FontDialogCnt.Font;
form18.QRLTotal.Font := FontDialogCnt.Font;
form18.QRLabel12.Font := FontDialogCnt.Font;
form18.QRLabel20.Font := FontDialogCnt.Font;

form18.QRDBText2.Font := FontDialogCnt.Font;
form18.QRDBText1.Font := FontDialogCnt.Font;
form18.QRLabel53.Font := FontDialogCnt.Font;
form18.QRDBText3.Font := FontDialogCnt.Font;
form18.QRLabel66.Font := FontDialogCnt.Font;
form18.QRLabel54.Font := FontDialogCnt.Font;
form18.QRDBText6.Font := FontDialogCnt.Font;
form18.QRDBText7.Font := FontDialogCnt.Font;
form18.QRDBText8.Font := FontDialogCnt.Font;
form18.QRDBText8.Font.Size := FontDialogCnt.Font.Size-2;
form18.QRDBText9.Font := FontDialogCnt.Font;
form18.QRDBText10.Font := FontDialogCnt.Font;
form18.QRLabel60.Font := FontDialogCnt.Font;
form18.QRLabel21.Font := FontDialogCnt.Font;
form18.QRDBText13.Font := FontDialogCnt.Font;
form18.QRDBText14.Font := FontDialogCnt.Font;
form18.QRDBText15.Font := FontDialogCnt.Font;
form18.QRDBText15.Font.Size := FontDialogCnt.Font.Size-2;
form18.QRDBText16.Font := FontDialogCnt.Font;
form18.QRLabel67.Font := FontDialogCnt.Font;
form18.QRLabel62.Font := FontDialogCnt.Font;
form18.QRDBText19.Font := FontDialogCnt.Font;
form18.QRDBText20.Font := FontDialogCnt.Font;
form18.QRLabel63.Font := FontDialogCnt.Font;
form18.QRLabel64.Font := FontDialogCnt.Font;
form18.QRDBText23.Font := FontDialogCnt.Font;
form18.QRDBText24.Font := FontDialogCnt.Font;
form18.QRDBText25.Font := FontDialogCnt.Font;
form18.QRDBText26.Font := FontDialogCnt.Font;
form18.QRDBText28.Font := FontDialogCnt.Font;
form18.QRDBText29.Font := FontDialogCnt.Font;
//form18.QRDBText30.Font := FontDialogCnt.Font;
form18.QRDBText31.Font := FontDialogCnt.Font;

form18.QRLabel68.Font := FontDialogCnt.Font;
form18.QRLabel69.Font := FontDialogCnt.Font;
form18.QRLabel70.Font := FontDialogCnt.Font;
form18.QRLabel71.Font := FontDialogCnt.Font;
form18.QRLabel29.Font := FontDialogCnt.Font;
form18.QRExpr6.Font := FontDialogCnt.Font;
form18.QRDBText4.Font := FontDialogCnt.Font;
form18.QRDBText5.Font := FontDialogCnt.Font;
form18.QRDBText11.Font := FontDialogCnt.Font;
form18.QRDBText12.Font := FontDialogCnt.Font;
form18.QRDBText17.Font := FontDialogCnt.Font;

form18.QRSysData7.Font := FontDialogCnt.Font;
form18.CTitle8.Font := FontDialogCnt.Font;
form18.QRLabel79.Font := FontDialogCnt.Font;

end;
end;

procedure TForm19.BitBtn6Click(Sender: TObject);
begin
form13.FromMainForm:=false;
form13.FormShow(nil);
Form13.Edit2.Text := form18.CodeTrimZero(form18.QueryCDBank.FieldByName('regcode').AsString);
Form13.Edit2Exit(nil);
form13.ShowModal;
Form18.QueryCDBank.Close;
Form18.QueryCDBank.Open;
end;

procedure TForm19.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DataSource1.DataSet.RecNo > 0 then
  begin
  if (Form18.QueryCDBank.FieldByName('remtedad').AsInteger<Form18.QueryCDBank.FieldByName('tedad').AsInteger) then
       DBGrid1.Canvas.Brush.Color:=RGB(200,200,255);
  if (Form18.QueryCDBank.FieldByName('remtedad').AsInteger<1) then
       DBGrid1.Canvas.Brush.Color:=RGB(255,200,200);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    if Column.Title.Caption = 'ίΟ έναγ' then
      DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top, form18.CodeTrimZero(DataSource1.DataSet.fieldbyname('RegCode').AsString));
  end;
end;

end.
