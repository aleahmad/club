unit CheckRegister;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Gauges, StdCtrls, ExtCtrls, Buttons, jpeg;

type
  TRegisterCheck = class(TForm)
    Label5: TLabel;
    Code: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    Label2: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterCheck: TRegisterCheck;

implementation

uses ideSN , Enter_Code;

var
 cclose:boolean;
 {$R *.DFM}

procedure TRegisterCheck.FormActivate(Sender: TObject);
begin
cclose:=false;
Code.Caption:=GetHDDSerial;
{reset(recregister);
read(recregister,dataregister);
with dataregister do begin
reset(recregister);
read(recregister,dataregister);
if registered=false then begin
registered:=false;
seek(recregister,0);
write(recregister,dataregister);
end;
end;}
end;

procedure TRegisterCheck.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=cclose;
end;

procedure TRegisterCheck.BitBtn1Click(Sender: TObject);
begin
cclose:=true;
registercheck.Close;

end;

procedure TRegisterCheck.BitBtn3Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TRegisterCheck.BitBtn2Click(Sender: TObject);
begin
EnterCode:=TEnterCode.Create(Self);
try
  EnterCode.Code.Caption:=Code.Caption;
  entercode.ShowModal;
finally
  EnterCode.Free;
end;

end;

end.
