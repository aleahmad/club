unit conv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm1 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Table1: TTable;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
ADOQuery1.First;

table1.Open;

while not ADOQuery1.Eof do
begin
table1.append;
showmessage(ADOQuery1.FieldByName('Code').AsString);
table1.FieldByName('regcode').AsString:='C'+trim(ADOQuery1.FieldByName('Code').AsString);
table1.FieldByName('regdate').AsString:='84/05/23';
table1.FieldByName('name').AsString:=trim(ADOQuery1.FieldByName('name').AsString);
table1.FieldByName('gheimat').AsString:='0';
table1.FieldByName('Keraie').AsString:='0';
table1.FieldByName('buydate').AsString:='84/05/01';
table1.FieldByName('buyname').AsString:='';
table1.FieldByName('Kargardan').AsString:=trim(ADOQuery1.FieldByName('f3').AsString);
table1.FieldByName('Bazigar').AsString:='';
table1.FieldByName('Nevisande').AsString:=trim(ADOQuery1.FieldByName('f2').AsString);
table1.FieldByName('Kind').AsString:='';
table1.FieldByName('Mahsol').AsString:='';
table1.FieldByName('Keshvar').AsString:='';
table1.FieldByName('Rade1').AsString:='';
table1.FieldByName('Rade2').AsString:='˜ÊÇÈ';
table1.post;
ADOQuery1.Next;
end;
table1.Close;
end;
end.
