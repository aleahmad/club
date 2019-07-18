unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart, DB, DBTables,
  Series, TeeFunci, StdCtrls, Buttons, ActnList, Grids, DBGrids, ADODB;

type
  TForm3 = class(TForm)
    DBChart1: TDBChart;
    TeeFunction1: THighTeeFunction;
    Series1: TBarSeries;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    DBGrid1: TDBGrid;
    txtKind: TComboBox;
    Label13: TLabel;
    DataSource1: TDataSource;
    Query1: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure txtKindSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit18, Unit22, User_Main, Unit9, Unit1;

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
Panel1.Visible:=false;
//DBChart1.PrintLandscape;
form3.Print;
Panel1.Visible:=true;
end;

procedure TForm3.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DataSource1.DataSet.RecNo > 0 then
  begin
    if Column.Title.Caption <> ' ⁄œ«œ' then
    if Column.Title.Caption = '—œÌ›' then
      DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top, inttostr(DataSource1.DataSet.RecNo-1))
    else
      DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top,form18.CodeTrimZero(DataSource1.DataSet.fieldbyname('Code').AsString));
  end;

end;

procedure TForm3.txtKindSelect(Sender: TObject);
const FieldsStr: array [1..22] of string=('Payment.RegCode','Payment.MembCode','Payment.KCode','RetDate','Rade2','Name','Kind','CDBank.Tedad','Rade1','Bazigar','Keshvar','Regdate','Kargardan','Nevisande','Mahsol','Buydate','Buyname','CDBank.Gheimat','Keraie', 'Sharh', 'UserName','Payment.BoroDate');
var MCode,minRegCode,maxRegCode:string;
begin
DBGrid1.Columns[1].Title.Caption:=txtKind.Text;
////////////////////////
//defining sql for chart
////////////////////////
Query1.close;

form3.Query1.SQL.Text:='Select '+FieldsStr[txtKind.ItemIndex+1]+' as Code, Count(*) as FieldCount FROM (payment LEFT JOIN CDBank ON payment.RegCode = CDBank.Regcode) LEFT JOIN Kala ON payment.KCode = Kala.KCode';
//form3.Query1.SQL.Text:='select '+FieldsStr[txtKind.ItemIndex+1]+' as Code, Count(*) as FieldCount from payment left join Kala on (payment.KCode=Kala.KCode) left join CDBank on (payment.RegCode=CDBank.RegCode) ';
with (form22) do
begin
MCode:=form9.ConvetCode(edit1.text,edit1.MaxLength);
minRegCode:=form9.ConvetCode(Edit3.text,edit3.MaxLength);
maxRegCode:=form9.ConvetCode(Edit4.text,edit4.MaxLength);
if (checkbox1.Checked)or(checkbox2.checked)or(checkbox3.Checked) then
   begin
   if (checkbox1.Checked=true)and(checkbox2.checked=true)and(checkbox3.Checked=true) then
      begin
       form3.Query1.SQL.add('where (membcode=:codemin)and(Payment.RegCode>=:rcodmin and Payment.RegCode<=:rcodmax)and(retdate>=:tmin and retdate<=:tmax)');
       form3.Query1.Parameters.ParamByName('codemin').Value:=MCode;
       form3.Query1.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form3.Query1.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
       form3.Query1.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form3.Query1.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=true)and(checkbox3.Checked=false) then
      begin
       form3.Query1.SQL.add('where (membcode=:codemin)and(Payment.RegCode>=:rcodmin and Payment.RegCode<=:rcodmax)');
       form3.Query1.Parameters.ParamByName('codemin').Value:=MCode;
       form3.Query1.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form3.Query1.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=false)and(checkbox3.Checked=true) then
      begin
       form3.Query1.SQL.add('where (membcode=:codemin)and(retdate>=:tmin and retdate<=:tmax)');
       form3.Query1.Parameters.ParamByName('codemin').Value:=MCode;
       form3.Query1.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form3.Query1.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=true)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
      begin
       form3.Query1.SQL.add('where (membcode>=:codemin)');
       form3.Query1.Parameters.ParamByName('codemin').Value:=MCode;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=true)and(checkbox3.Checked=true) then
      begin
       form3.Query1.SQL.add('where (Payment.RegCode>=:rcodmin and Payment.RegCode<=:rcodmax)and(retdate>=:tmin and retdate<=:tmax)');
       form3.Query1.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form3.Query1.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
       form3.Query1.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form3.Query1.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=true) then
      begin
       form3.Query1.SQL.add('where (retdate>=:tmin and retdate<=:tmax)');
       form3.Query1.Parameters.ParamByName('tmin').Value:=maskedit1.text;
       form3.Query1.Parameters.ParamByName('tmax').Value:=maskedit2.text;
      end;
   if (checkbox1.Checked=false)and(checkbox2.checked=true)and(checkbox3.Checked=false) then
      begin
       form3.Query1.SQL.add('where (Payment.RegCode>=:rcodmin and Payment.RegCode<=:rcodmax)');
       form3.Query1.Parameters.ParamByName('rcodmin').Value:=minRegCode;
       form3.Query1.Parameters.ParamByName('rcodmax').Value:=maxRegCode;
      end;
   end;
if CheckBox4.Checked then
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false) then
       form3.Query1.SQL.add(' where UserName='+QuotedStr(Users.Query.FieldByName('UName').Asstring))
       else
       form3.Query1.SQL.add(' and UserName='+QuotedStr(Users.Query.FieldByName('UName').Asstring));
if CheckBox5.Checked then
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false) then
       form3.Query1.SQL.add(' where (Payment.RegCode>=" " and Payment.RegCode<="ZZZZZZZZ") ')
       else
       form3.Query1.SQL.add(' and (Payment.RegCode>=" " and Payment.RegCode<="ZZZZZZZZ") ');
if (CheckBox6.Checked)or(CheckBox7.Checked) then
  begin
  if (checkbox1.Checked=false)and(checkbox2.checked=false)and(checkbox3.Checked=false)and(checkbox4.Checked=false)and(checkbox5.Checked=false) then
       form18.QueryCDBank.SQL.add(' where ')
       else
       form18.QueryCDBank.SQL.add(' and ');
  if (CheckBox6.Checked)and(CheckBox7.Checked) then
       form18.QueryCDBank.SQL.add('((payment.RegCode like "Â“Ì‰Â:%") or (payment.KCode <> "")) ')
       else
         if (CheckBox6.Checked) then
         form18.QueryCDBank.SQL.add('(payment.RegCode like "Â“Ì‰Â:%") ')
         else
           if (CheckBox7.Checked) then
           form18.QueryCDBank.SQL.add('(payment.KCode <> "") ')
  end;
end;
form3.Query1.SQL.Add('group by '+FieldsStr[txtKind.ItemIndex+1]+' order by 2 desc');
Query1.Open;
end;

end.
 