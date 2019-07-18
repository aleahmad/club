unit Enter_Code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TEnterCode = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RCode: TEdit;
    Button1: TButton;
    Button2: TButton;
    Code: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EnterCode: TEnterCode;

implementation

uses ideSN , CheckRegister;

{$R *.dfm}

procedure TEnterCode.Button2Click(Sender: TObject);
begin
Close;
end;

procedure TEnterCode.Button1Click(Sender: TObject);
var
tStr:String[20];
temp:int64;
t2:integer;
i,j:byte;
dataregister:recordregister;
begin
if RCode.Text='' then exit;
try
TStr:=RCode.Text;
TStr[1]:=chr(ord(TStr[1])-64);
TStr[2]:=chr(ord(TStr[2])-65);
TStr[5]:=chr(ord(TStr[5])-60);
TStr[6]:=chr(ord(TStr[6])-63);
TStr[7]:=chr(ord(TStr[7])-62);
Temp:=StrToInt64(TStr);
except
   Application.Terminate;
   exit;
end;
temp:=9004092925-temp;
temp:=temp div 110;
t2:=strtoint64(code.Caption) div 1000;
if (StrToInt64(Code.Caption) + abs(round(sin(t2-10)*1000)))=temp then begin
   try
    with dataregister do begin
      reset(recregister);
      registered:=True;
      Num:=temp;
      randomize;
      seek(recregister,0);
      for i:=1 to 4 do
        begin
        regStr:='';
        for j:=1 to 250 do
           begin
           regStr:=regStr+' ';
           regStr[j]:=chr(50+random(100));
           end;
        write(recregister,dataregister);
        end;
      closefile(recregister);
    end;
   except
     ShowMessage(' Œÿ«Ì ”Ì” „ œ— Â‰ê«„ À»  ‰—„ «›“«— ');
     Application.Terminate;
     exit;
   end;
   ShowMessage(' .⁄„·Ì«  À»  ‰—„ «›“«— »« „Ê›ﬁÌ  «‰Ã«„ ‘œ ');
   ShowMessage('.»—‰«„Â —« „Ãœœ« «Ã—« ‰„«∆Ìœ');
   Application.Terminate;
   exit;
end
else begin
   ShowMessage('òœ Ê«—œ ‘œÂ «‘ »«Â «” ');
end;

end;

end.
