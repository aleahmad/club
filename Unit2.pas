unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ComCtrls, ToolWin;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton14: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ActionList1: TActionList;
    Action1: TAction;
    ToolButton7: TToolButton;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    ToolButton15: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
uses unit1;

procedure TForm2.FormCreate(Sender: TObject);
begin
form2.Width:=125;
form2.Left:=Screen.Width-125;
form2.Top:=0;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Form1.n25.Enabled then
  if messagedlg('¬Ì« „Ì ŒÊ«ÂÌœ «“ «ÿ·«⁄«  Å‘ Ì»«‰  ÂÌÂ ò‰Ìœ',mtwarning,[mbYes,mbNo],0)=mrYes then Form1.N25Click(Nil);
Application.Terminate;  
end;

procedure TForm2.ToolButton1Click(Sender: TObject);
begin
ToolButton1.Down:=true;
form1.ToolButton1Click(Nil);
ToolButton1.Down:=false;
end;

procedure TForm2.ToolButton4Click(Sender: TObject);
begin
ToolButton4.Down:=true;
form1.ToolButton4Click(Nil);
ToolButton4.Down:=false;
end;

procedure TForm2.ToolButton5Click(Sender: TObject);
begin
ToolButton5.Down:=true;
form1.ToolButton5Click(Nil);
ToolButton5.Down:=false;
end;

procedure TForm2.ToolButton3Click(Sender: TObject);
begin
ToolButton3.Down:=true;
form1.ToolButton3Click(Nil);
ToolButton3.Down:=false;
end;

procedure TForm2.ToolButton2Click(Sender: TObject);
begin
ToolButton2.Down:=true;
form1.ToolButton2Click(Nil);
ToolButton2.Down:=false;
end;

procedure TForm2.ToolButton6Click(Sender: TObject);
begin
ToolButton6.Down:=true;
form1.ToolButton6Click(Nil);
ToolButton6.Down:=false;
end;

procedure TForm2.ToolButton8Click(Sender: TObject);
begin
ToolButton8.Down:=true;
form1.ToolButton8Click(Nil);
ToolButton8.Down:=false;
end;

procedure TForm2.ToolButton12Click(Sender: TObject);
begin
ToolButton12.Down:=true;
form1.N15Click(nil);
ToolButton12.Down:=false;
end;

procedure TForm2.ToolButton13Click(Sender: TObject);
begin
ToolButton13.Down:=true;
form1.N11Click(nil);
ToolButton13.Down:=false;
end;

procedure TForm2.ToolButton10Click(Sender: TObject);
begin
ToolButton10.Down:=true;
form1.ToolButton10Click(Nil);
ToolButton10.Down:=false;
end;

procedure TForm2.ToolButton7Click(Sender: TObject);
begin
Form2.Hide;
Form1.show;
end;

procedure TForm2.ToolButton15Click(Sender: TObject);
begin
winexec('calc',0);
end;

end.
