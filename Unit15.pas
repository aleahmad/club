unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, Series, jpeg,
  StdCtrls, Buttons, Menus, ImgList;

type
  TForm15 = class(TForm)
    DBChart1: TDBChart;
    Series1: TPieSeries;
    Query1: TQuery;
    Series2: TBarSeries;
    Series3: TLineSeries;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.DFM}

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
query1.Close;
end;

procedure TForm15.FormShow(Sender: TObject);
begin
query1.open;
end;

procedure TForm15.N4Click(Sender: TObject);
begin
series1.Active:=false;
series2.Active:=false;
series3.Active:=true;

end;

procedure TForm15.N3Click(Sender: TObject);
begin
series1.Active:=false;
series2.Active:=true;
series3.Active:=false;
end;

procedure TForm15.N2Click(Sender: TObject);
begin
series1.Active:=true;
series2.Active:=false;
series3.Active:=false;
end;

procedure TForm15.N6Click(Sender: TObject);
begin
if N6.ImageIndex=4 then
     begin
        N6.ImageIndex:=0;
        N6.Caption:='Ïæ ÈÚÏí';
        dbchart1.View3D:=true;
     end
  else
     begin
        N6.ImageIndex:=4;
        N6.Caption:='Óå ÈÚÏí';
        dbchart1.View3D:=false;
     end;

end;

procedure TForm15.N10Click(Sender: TObject);
begin
close;
end;

procedure TForm15.N8Click(Sender: TObject);
begin
dbchart1.Print;
end;

end.
