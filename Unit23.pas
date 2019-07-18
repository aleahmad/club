unit Unit23;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Db, Grids, DBGrids, StdCtrls, Buttons, ActnList;

type
  TForm23 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    lblMajmo: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Label3: TLabel;
    lblKosorat: TLabel;
    Label5: TLabel;
    lblDariaft: TLabel;
    Action3: TAction;
    Action4: TAction;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;

implementation

uses Unit18, Unit1, Unit19, Unit2, Unit3, StrUtils;

{$R *.DFM}

procedure TForm23.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure TForm23.BitBtn2Click(Sender: TObject);
begin
form18.QuickRep5.Preview;
end;

procedure TForm23.BitBtn1Click(Sender: TObject);
begin
if form1.PrinterSetupDialog1.Execute then form18.QuickRep5.Print;
end;

procedure TForm23.FormShow(Sender: TObject);
begin
BitBtn2.SetFocus;
end;

procedure TForm23.BitBtn4Click(Sender: TObject);
begin
Form19.BitBtn4Click(nil);
end;

procedure TForm23.BitBtn5Click(Sender: TObject);
begin
Form19.BitBtn5Click(nil);
end;

procedure TForm23.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DataSource1.DataSet.RecNo > 0 then
  begin
    if Column.Title.Caption = 'ﬂœ „‘ —ÌÛ' then
      DBGrid1.Canvas.TextOut(Rect.Left + 1, Rect.Top, form18.CodeTrimZero(DataSource1.DataSet.fieldbyname('MembCode').AsString));
    if Column.Title.Caption = 'ﬂœ ò«·«/Â“Ì‰ÂÛ' then
      DBGrid1.Canvas.TextOut(Rect.Left + 1, Rect.Top,form18.CodeTrimZero(DataSource1.DataSet.fieldbyname('KCode').AsString));
    if Column.Title.Caption = 'ﬂœ ›Ì·„/CD (‘—Õ œ—Ì«› )' then
      DBGrid1.Canvas.TextOut(Rect.Left + 1, Rect.Top, form18.CodeTrimZero(DataSource1.DataSet.fieldbyname('RegCode').AsString));
  end;

end;

procedure TForm23.BitBtn6Click(Sender: TObject);
begin
form3.txtKind.ItemIndex:=5;
form3.txtKindSelect(nil);
form3.ShowModal;
end;

end.
