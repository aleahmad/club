unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, jpeg, ExtCtrls, ComCtrls, Buttons, ToolWin, ImgList, StdCtrls, FileCtrl,
  ExtDlgs, XPMan, ActnList, Registry, DB, ADODB;

Const
//CName: String = 'ÊÌœ∆Ê ﬂ·ÊÅ «„Ì— »Ì «';//Address:¬»œ«‰«‰-ŒÌ«»«‰ Ê·Ì⁄’—-Å«”«é«Ì—«‰  ﬂ- ·›‰6225823
//Const CName: String = 'ÊÌœ∆Ê ﬂ·ÊÅ «—‘«œ';//Address:¬»œ«‰«‰-ŒÌ«»«‰ Ê·Ì⁄’—-»«·« — «“ ”Ì‰„«Â‰—-„€«“Â ¬ﬁ«Ì ê‰œ„Ì- ·›‰6223865Ê6224095
//Const CName: String = 'ÊÌœ∆Ê ﬂ·ÊÅ ‘Â—Ê‰œ';//Address:Â„  Ã‰Ê»Ì- »Ì”  Ê Å‰Ã „ —Ì ‘ÌŒÌ-Ã‰» „Œ«»—«  ⁄·Ê ⁄·Ê- ·›‰8237273-091718113441—«„Ì‰ Œ·Ì›Â
//Const CName: String = 'ÊÌœ∆Ê ﬂ·ÊÅ « Ê›Ì·„';//Address:çÂ«——«Â Œ«ò ‘‰«”Ì - ÊÌœ∆Êò·ÊÅ -  ·›‰:09171116877-2296460
Threshold=200;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    Image1: TImage;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    PrinterSetupDialog1: TPrinterSetupDialog;
    N18: TMenuItem;
    CD1: TMenuItem;
    CD2: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    CD4: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    CTitle: TLabel;
    N25: TMenuItem;
    N26: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    ToolButton9: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    TimeCap: TLabel;
    Timer1: TTimer;
    ToolButton14: TToolButton;
    XPManifest1: TXPManifest;
    ToolButton15: TToolButton;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    ToolButton3: TToolButton;
    N19: TMenuItem;
    StatusBar: TStatusBar;
    ToolButton7: TToolButton;
    N20: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N32: TMenuItem;
    ToolButton16: TToolButton;
    ADOConnection1: TADOConnection;
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure CD4Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure Getsystemsdate;
    function is_kabis(sal: integer): Boolean;
    procedure LoadBG;
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N27Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpdateDate;
    procedure N20Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    L: Boolean;
    User_Name:String;
    Reg:TRegistry;
    function CopyAllFiles(sFrom, sTo: string; Protect: boolean): boolean;
    function DeleteAllFiles(FilesOrDir: string): boolean;
  end;

var
  Form1: TForm1;
  roz,beginroz,flag,m,n:integer;
  dat:  array [1..3]  of integer;
  kabis:array [1..30]  of integer;
  date:TSYSTEMTIME;
  milad:array [1..12] of integer;
  shams:array [1..12] of integer;

implementation

uses Unit0, Unit8, Unit9, Unit11, Unit10, Unit12, Unit13, Unit15,
  Unit17, Unit20, Unit21, Unit22, Unit18, Unit24, Unit25, KalaSabt,
  KalaSearch, KalaForosh, Hazine, User_Main, EnterUser, CheckRegister, ideSN,
  Unit2,ShellAPI;


{$R *.DFM}
procedure TForm1.UpdateDate;
var sal,mah,roz:string[2];
begin
milad[1]:=31;
milad[2]:=28;
milad[3]:=31;
milad[4]:=30;
milad[5]:=31;
milad[6]:=30;
milad[7]:=31;
milad[8]:=31;
milad[9]:=30;
milad[10]:=31;
milad[11]:=30;
milad[12]:=31;
shams[1]:=31;
shams[2]:=31;
shams[3]:=31;
shams[4]:=31;
shams[5]:=31;
shams[6]:=31;
shams[7]:=30;
shams[8]:=30;
shams[9]:=30;
shams[10]:=30;
shams[11]:=30;
shams[12]:=29;
 kabis[1]:=1358;
 kabis[2]:=1362;
 kabis[3]:=1366;
 kabis[4]:=1370;
 kabis[5]:=1375;
 kabis[6]:=1379;
 kabis[7]:=1383;
 kabis[8]:=1387;
 kabis[9]:=1391;
kabis[10]:=1395;
kabis[11]:=1399;
kabis[12]:=1403;
kabis[13]:=1408;
kabis[14]:=1412;
kabis[15]:=1416;
kabis[16]:=1420;
kabis[17]:=1424;
kabis[18]:=1428;
kabis[19]:=1432;
kabis[20]:=1436;
kabis[21]:=1440;
kabis[22]:=1444;
kabis[23]:=1448;
kabis[24]:=1452;
kabis[25]:=1456;
kabis[26]:=1460;
kabis[27]:=1464;
kabis[28]:=1468;
kabis[29]:=1472;
kabis[30]:=1476;
getsystemsdate;
sal:=inttostr(dat[1]-1300);
mah:=inttostr(dat[2]);
roz:=inttostr(dat[3]);
if length(sal)=1 then sal:='0'+sal;
if length(mah)=1 then mah:='0'+mah;
if length(roz)=1 then roz:='0'+roz;
label1.Caption:=sal+'/'+mah+'/'+roz;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if n25.Enabled then
  if messagedlg('¬Ì« „Ì ŒÊ«ÂÌœ «“ «ÿ·«⁄«  Å‘ Ì»«‰  ÂÌÂ ò‰Ìœ',mtwarning,[mbYes,mbNo],0)=mrYes then N25Click(Nil); 
application.Terminate;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
printersetupdialog1.Execute;
end;

procedure TForm1.LoadBG;
var
tanzim:textfile;
s:string;
CDir:String;
begin
Try
if Not FileExists('BackG.dat') then exit;
assignfile(tanzim,'BackG.dat');
reset(tanzim);
read(tanzim,s);
closefile(tanzim);
{if (trim(s)='') or (Not FileExists(s)) then
begin
  Showmessage('·ÿ›« ÅÌ‘ “„Ì‰Â »—‰«„Â —« „‘Œ’ ò‰Ìœ');
  CDir:=GetCurrentDir;
  if OpenPictureDialog1.Execute then
        begin
        SetCurrentDir(CDir);
        assignfile(tanzim,'BackG.dat');
        rewrite(tanzim);
        s:=OpenPictureDialog1.FileName;
        write(tanzim,s);
        closefile(tanzim);
        end
        else
        begin
        Showmessage('ÂÌç ÅÌ‘ “„Ì‰Â «Ì »—«Ì »—‰«„Â  ⁄ÌÌ‰ ‰‘œÂ «” . ·ÿ›« «“ „‰ÊÌ ò·ÊÅ°  ‰ŸÌ„ ÅÌ‘ “„Ì‰Â —« «‰ Œ«» Ê ÅÌ‘ “„Ì‰Â »—‰«„Â —« „‘Œ’ ò‰Ìœ');
        exit;
        end;
end;
if Not FileExists(s) then
  begin
  MessageDlg('›«Ì· ÅÌ‘ “„Ì‰Â »—‰«„Â Ì«›  ‰‘œ',mtError,[mbOk],0);
  exit;
  end;}
        Image1.Picture.LoadFromFile(s);
Except
        //On Exception do ShowMessage('œ— »«—ê“«—Ì  ’ÊÌ— ÅÌ‘ “„Ì‰Â „‘ﬂ· »ÊÃÊœ ¬„œ');
end;
end;

procedure TForm1.CD4Click(Sender: TObject);
var
s:pchar;
begin
getmem(s,13);
strcopy(s,'Explorer ');
strcat(s,' ');
s[9]:=form25.drivecombobox1.Drive;
strcat(s,':\');
s[12]:=chr(0);
winexec(s,SW_SHOWMAXIMIZED);
freemem(s);
end;

procedure TForm1.N11Click(Sender: TObject);
begin
ToolButton13.Down:=true;
form20.showmodal;
ToolButton13.Down:=false;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
n14.Checked:=not(n14.Checked);
end;

procedure TForm1.N15Click(Sender: TObject);
begin
ToolButton12.Down:=true;
form22.showmodal;
ToolButton12.Down:=false;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
form21.DirKerd:=false;
form17.showmodal;
end;

procedure TForm1.N17Click(Sender: TObject);
var day,month,year:integer;
    dat:string[8];
begin
form18.QueryMembers.ParamCheck:=true;
form18.QueryMembers.Close;
form18.QueryMembers.SQL.Clear;
//form18.QueryMembers.SQL.text:=('select * from members  where membcode in (select membcode from borrow  where borodate <= :date) order by name');
form18.QueryMembers.SQL.text:='SELECT members.*,borrow.borodate FROM members LEFT JOIN borrow ON members.membcode = borrow.membcode where borodate <= :date order by borodate';
year:=strtoint(form1.label1.Caption[1]+form1.label1.Caption[2]);
month:=strtoint(form1.label1.Caption[4]+form1.label1.Caption[5]);
day:=strtoint(form1.label1.Caption[7]+form1.label1.Caption[8]);
day:=day-form25.spinedit2.value;
if day<1 then
   case month of
   1:begin
      dec(year);
      month:=12;
      day:=29+day;
     end;
   2..7:begin
         dec(month);
         day:=31+day;
        end;
   8..12:begin
          dec(month);
          day:=30+day;
         end;
   end;
dat[0]:=#8;
dat[7]:=chr(48+(day div 10));
dat[8]:=chr(48+(day mod 10));
dat[3]:='/';
dat[4]:=chr(48+(month div 10));
dat[5]:=chr(48+(month mod 10));
dat[6]:='/';
dat[1]:=chr(48+(year div 10));
dat[2]:=chr(48+(year mod 10));
form18.QueryMembers.Parameters.ParamByName('date').Value:=dat;
//form18.QueryMembers.Prepare;
form18.QueryMembers.Open;
form18.QRLabel7.Enabled:=form1.N14.Checked;
form18.QRLabel10.Enabled:=form1.N14.Checked;
form18.QRLabel2.Enabled:=form1.N14.Checked;
form18.QRLabel9.Enabled:=form1.N14.Checked;
form21.DirKerd:=true;
form21.DBGrid1.Columns[4].Title.Caption:=' «—ÌŒ «„«‰ ';
form21.DBGrid1.Columns[4].FieldName:='borodate';
form21.DBGrid1.Refresh;
form21.showmodal;
form21.DBGrid1.Columns[4].Title.Caption:=' «—ÌŒ À»  ‰«„';
form21.DBGrid1.Columns[4].FieldName:='regdate';
form21.DBGrid1.Refresh;
form18.QueryMembers.Close;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
form24.showmodal;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
form25.showmodal;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
ToolButton1.Down:=true;
frmKalaSearch.bitbtn2.Visible:=true;
frmKalaSearch.bitbtn5.Visible:=false;
frmKalaSearch.showmodal;
frmKalaSearch.bitbtn5.Visible:=true;
ToolButton1.Down:=false;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
ToolButton2.Down:=true;
frmKalaForosh.showmodal;
ToolButton2.Down:=false;

end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
ToolButton4.Down:=true;
form11.bitbtn2.visible:=true;
form11.bitbtn5.visible:=false;
Form8.table1.Close;
Form8.table1.open;
form11.showmodal;
form11.bitbtn5.visible:=true;
Form8.table1.close;
ToolButton4.Down:=false;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
ToolButton5.Down:=true;
form10.bitbtn2.visible:=true;
form10.bitbtn5.visible:=false;
form10.showmodal;
form10.bitbtn5.visible:=true;
form9.table1.close;
form8.table1.close;
ToolButton5.Down:=false;
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
ToolButton6.Down:=true;
form12.showmodal;
ToolButton6.Down:=false;
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
ToolButton8.Down:=true;
form13.FromMainForm:=true;
form13.showmodal;
ToolButton8.Down:=false;
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
N17Click(Nil);
end;

procedure TForm1.Getsystemsdate;
var
    i:integer;
begin
GetlocalTime(date);
dat[1]:=date.wYear;
dat[2]:=date.wMonth;
dat[3]:=date.wDay;
milad[2]:=28;
shams[12]:=29;
if ((dat[1] mod 4)=0) then
  begin
   milad[2]:=29;
 end;
 for i:=1 to dat[2]-1 do
    dat[3]:=dat[3]+milad[i];
 dat[1]:=dat[1]-621;

 if (  ( dat[3]<=80 ) and  ( milad[2]=29 ) and  ( is_kabis(dat[1]-1) )  ) or
    (  ( dat[3]<=79 ) and  ( milad[2]=28 ) and  ( NOT(is_kabis(dat[1]-1) ))  )or
    (  ( dat[3]<=79 ) and  ( milad[2]=29 ) and  ( NOT(is_kabis(dat[1]-1) ))  )
              then
   begin
     dat[3]:=dat[3]+286;
     dat[1]:=dat[1]-1;
   end

 else
 if  ( dat[3]<=80 ) and  ( milad[2]=28 ) and  ( is_kabis(dat[1]-1) )  then
   begin
     dat[3]:=dat[3]+287;
     dat[1]:=dat[1]-1;
   end
 else
      if (milad[2]=29) and ( NOT(is_kabis(dat[1])) ) then
       dat[3]:=dat[3]-80
      else
       dat[3]:=dat[3]-79;

if  (is_kabis(dat[1]))  then
        shams[12]:=30;
i:=1;
while(dat[3]>shams[i]) do
  begin
    dat[3]:=dat[3]-shams[i];
    inc(i);
  end;
dat[2]:=i;
roz:=date.wDayOfWeek;
 if  roz<6 then
    roz:=roz+1
 else
   roz:=0;
end;

function TForm1.is_kabis(sal: integer): Boolean;
var
      i:integer;
      index:Boolean;
begin

 index:=False;
 for i:=1 to 30 do
    begin
      if sal=kabis[i]  then
         begin
           index:=True;
           Break;
         end;
       if sal<kabis[i] then
           Break;
    end;
is_kabis:=index;
end;


function TForm1.DeleteAllFiles(FilesOrDir: string): boolean;
{ Sends files or directory to the recycle bin. }
var
F: TSHFileOpStruct;
From: string;
Resultval: integer;
begin
FillChar(F, SizeOf(F), #0);
From := FilesOrDir + #0;
Screen.Cursor := crHourGlass;
try
F.wnd := 0;
F.wFunc := FO_DELETE;
F.pFrom := PChar(From);
F.pTo := nil;

F.fFlags := FOF_ALLOWUNDO or
FOF_NOCONFIRMATION or
FOF_SIMPLEPROGRESS or
FOF_FILESONLY;

F.fAnyOperationsAborted := False;
F.hNameMappings := nil;
Resultval := ShFileOperation(F);
Result := (ResultVal = 0);
finally
Screen.Cursor := crDefault;
end;
end;

function TForm1.CopyAllFiles(sFrom, sTo: string; Protect: boolean): boolean;
{ Copies files or directory to another directory. }
var
F: TShFileOpStruct;
ResultVal: integer;
tmp1, tmp2: string;
begin
FillChar(F, SizeOf(F), #0);
Screen.Cursor := crHourGlass;
try
F.Wnd := 0;
F.wFunc := FO_COPY;
{ Add an extra null char }
tmp1 := sFrom + #0;
tmp2 := sTo + #0;
F.pFrom := PChar(tmp1);
F.pTo := PChar(tmp2);

if Protect then
F.fFlags := FOF_RENAMEONCOLLISION or FOF_SIMPLEPROGRESS
else
F.fFlags := FOF_SIMPLEPROGRESS;

F.fAnyOperationsAborted := False;
F.hNameMappings := nil;
Resultval := ShFileOperation(F);
Result := (ResultVal = 0);
finally
Screen.Cursor := crDefault;
end;
end;

procedure TForm1.N25Click(Sender: TObject);
var
ps: pchar;
s:string;
begin
if length(trim(form25.txtNetPath.Text))<>0 then Showmessage('»«  ÊÃÂ »Â «Ì‰òÂ «Ì‰ ò«„ÅÌÊ — «“ «ÿ·«⁄«  „ÊÃÊœ œ— ”—Ê— «” ›«œÂ „Ì ò‰œ° ·ÿ›« «“ —ÊÌ ”—Ê— «ﬁœ«„ »Â  ÂÌÂ Å‘ Ì»«‰ ò‰Ìœ. Å‘ Ì»«‰ «“ œ«œÂ Â«Ì «Ì‰ ò«„ÅÌÊ — Ê »’Ê—  ‰«ﬁ’ «‰Ã«„ ŒÊ«Âœ ‘œ');
if not SelectDirectory('„”Ì— Å‘ Ì»«‰ êÌ—Ì —« «‰ Œ«» ﬂ‰Ìœ','',S)then exit;
S:=S+'\'+copy(form1.Label1.Caption,1,2)+'_'+copy(form1.Label1.Caption,4,2)+'_'+copy(form1.Label1.Caption,7,2)+'_'+copy(form1.Caption,33,5);
if   not  DirectoryExists(S)  then
  if   not  CreateDir(S)  then
    begin
    raise  Exception.Create('œ— «ÌÃ«œ „”Ì— Å‘ Ì»«‰ êÌ—Ì „‘ﬂ·Ì »ÊÃÊœ ¬„œ. Å‘ Ì»«‰  ÂÌÂ ‰‘œ');
    exit;
    end;
getmem(ps,200);
// Now copying files
// First Deleting older files
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\BackG.dat'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\control.dat'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Gero.txt'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Keshvar.txt'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Kind.txt'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Hazine.txt'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Sherkat.txt'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Kharidar.txt'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Rade1.txt'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Rade2.txt'));
StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\QRT70.BPL'));

StrplCopy(Ps,s,length(s));
DeleteFile(strcat(ps,'\Club.mdb'));

// Now copying files
StrplCopy(Ps,s,length(s));
CopyFile('BackG.dat',strcat(ps,'\BackG.dat'),True);
StrplCopy(Ps,s,length(s));
CopyFile('control.dat',strcat(ps,'\control.dat'),True);
StrplCopy(Ps,s,length(s));
CopyFile('Gero.txt',strcat(ps,'\Gero.txt'),True);
StrplCopy(Ps,s,length(s));
CopyFile('Keshvar.txt',strcat(ps,'\Keshvar.txt'),True);
StrplCopy(Ps,s,length(s));
CopyFile('Kind.txt',strcat(ps,'\Kind.txt'),True);
StrplCopy(Ps,s,length(s));
CopyFile('Hazine.txt',strcat(ps,'\Hazine.txt'),True);
StrplCopy(Ps,s,length(s));
CopyFile('Sherkat.txt',strcat(ps,'\Sherkat.txt'),True);
StrplCopy(Ps,s,length(s));
CopyFile('Kharidar.txt',strcat(ps,'\Kharidar.txt'),True);
StrplCopy(Ps,s,length(s));
CopyFile('Rade1.txt',strcat(ps,'\Rade1.txt'),True);
StrplCopy(Ps,s,length(s));
CopyFile('Rade2.txt',strcat(ps,'\Rade2.txt'),True);
StrplCopy(Ps,s,length(s));
CopyFile('QRT70.BPL',strcat(ps,'\QRT70.BPL'),True);

StrplCopy(Ps,s,length(s));
CopyFile('Club.mdb',strcat(ps,'\Club.mdb'),True);
freemem(ps,200);

if DirectoryExists(s+'\Images') then DeleteAllFiles(s+'\Images');
CopyAllFiles('Images',s+'\Images',false);

Showmessage('Å‘ Ì»«‰ êÌ—Ì »« „Ê›ﬁÌ  «‰Ã«„ ‘œ');
end;

procedure TForm1.N26Click(Sender: TObject);
var
tanzim:textfile;
CDir:String;
begin
CDir:=GetCurrentDir;
if OpenPictureDialog1.Execute then
        begin
        SetCurrentDir(CDir);
        assignfile(tanzim,'BackG.dat');
        rewrite(tanzim);
        write(tanzim,OpenPictureDialog1.FileName);
        closefile(tanzim);
        Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
        end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
UpdateDate;
TimeCap.Caption:=Copy(TimeToStr(Time),0,Length(TimeToStr(Time)));
form2.Caption:=TimeCap.Caption;
end;

procedure TForm1.Edit1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var a: tpoint;
begin

end;

procedure TForm1.N27Click(Sender: TObject);
begin
ToolButton1.Down:=true;
frmKalaSabt.bitbtn1.Visible:=true;
frmKalaSabt.bitbtn3.Visible:=false;
frmKalaSabt.showmodal;
ToolButton1.Down:=false;

end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
ToolButton3.Down:=true;
frmHazine.Showmodal;
ToolButton3.Down:=false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
form9.fromMainForm:=true;
form9.bitbtn1.Visible:=true;
form9.bitbtn3.Visible:=false;
form9.showmodal;
form9.fromMainForm:=false;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
form8.bitbtn1.Visible:=true;
form8.bitbtn3.Visible:=false;
form8.showmodal;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
Users.Showmodal;
end;

procedure TForm1.FormCreate(Sender: TObject);
var t2:integer;
begin
{iLength := 255;
setLength(sWinDir, iLength);
iLength := GetWindowsDirectory(PChar(sWinDir), iLength);
setLength(sWinDir, iLength);}
L:=true;
if not DirectoryExists(GetCurrentDir+'\Images') then
    MkDir(GetCurrentDir+'\Images');

assignfile(recregister,'QRT70.BPL');
if not fileexists('QRT70.BPL') then
  begin
  rewrite(recregister);
  dataregister.registered:=false;
  dataregister.Num:=-1;
  write(recregister,dataregister);
  end;
reset(recregister);
read(recregister,dataregister);
CloseFile(recregister);
try
if dataregister.registered=true then
    begin
    t2:=(StrToInt64(GetHDDSerial) div 1000)-10;
    if dataregister.Num<>(StrToInt64(GetHDDSerial)+abs(round(sin(t2)*1000))) then
        begin
        RegisterCheck:=TRegisterCheck.Create(Self);
        RegisterCheck.ShowModal;
        end
      else
        L:=false;
    end
  else
    begin
    RegisterCheck:=TRegisterCheck.Create(Self);
    RegisterCheck.ShowModal;
    end

except
    on E : Exception do
    ShowMessage(E.ClassName+' error raised, with message : '+E.Message);

{finally
    RegisterCheck.Free;}
end;
//ActivateKeyboardLayout(HKL_NEXT,KLF_REORDER);
ActivateKeyboardLayout($00000429,KLF_REORDER);
//reading settings
Form25.FormShow(nil);
if (form25.txtName.Text='⁄‰Ê«‰ ›—Ê‘ê«Â —« œ— ﬁ”„   ‰ŸÌ„«  »—‰«„Â „‘Œ’ ò‰Ìœ') then
  begin
  showmessage('·ÿ›«  ‰ŸÌ„«  »—‰«„Â —« „‘Œ’ ò‰Ìœ');
  form25.ShowModal;
  end;
form1.LoadBG;
UpdateDate;

Form18.CTitle1.Caption:=trim(Form25.txtName.Text);
Form18.CTitle2.Caption:=trim(Form25.txtName.Text);
Form18.CTitle3.Caption:=trim(Form25.txtName.Text);
Form18.CTitle4.Caption:=trim(Form25.txtName.Text);
Form18.CTitle5.Caption:=trim(Form25.txtName.Text);
Form18.CTitle6.Caption:=trim(Form25.txtName.Text);
Form18.CTitle7.Caption:=trim(Form25.txtName.Text);
Form18.CTitle8.Caption:=trim(Form25.txtName.Text);
Form24.CTitle.Caption:=trim(Form25.txtName.Text);
Form1.CTitle.Caption:=trim(Form25.txtName.Text);
try
  if length(trim(form25.txtNetPath.Text))=0 then
    ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=club.mdb;Persist Security Info=False;Jet OLEDB:Database Password=13611361'
    else
    ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+trim(form25.txtNetPath.Text)+'\club.mdb;Persist Security Info=False;Jet OLEDB:Database Password=13611361';
  ADOConnection1.Connected:=true;
  Users.Query.Open;
Except
  On Exception do
    begin
    ShowMessage('œ— »«—ê“«—Ì »«‰ﬂ «ÿ·«⁄« Ì »—‰«„Â „‘ﬂ·Ì »ÊÃÊœ ¬„œ. ·ÿ›« „”Ì— ‘»òÂ œ—  ‰ŸÌ„«  »—‰«„Â —« »——”Ì ò‰Ìœ');
    form25.ShowModal;
    end;
end;
UserChange.ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form8.Table1.Close;
form9.Table1.Close;
form13.Table1.Close;
form12.Table1.Close;
frmKalaSabt.Table1.Close;
ADOConnection1.Close;
if n25.Enabled then
  if messagedlg('¬Ì« „Ì ŒÊ«ÂÌœ «“ «ÿ·«⁄«  Å‘ Ì»«‰  ÂÌÂ ò‰Ìœ',mtwarning,[mbYes,mbNo],0)=mrYes then N25Click(Nil);
Application.Terminate;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
N20.Checked:=not(N20.Checked);
toolbar1.Visible:=N20.Checked;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
Form1.Hide;
Form2.Show;
end;

procedure TForm1.N24Click(Sender: TObject);
var
ps: pchar;
s:string;
begin
if messagedlg('ﬂ·ÌÂ «ÿ·«⁄«  »—‰«„Â «“ »Ì‰ —› Â Ê «ÿ·«⁄«  ÃœÌœ Ã«Ìê“Ì‰ ŒÊ«Âœ ‘œ. ÅÌ‘‰Â«œ „Ì ‘Êœ ﬁ»· «“ »«“Ì«»Ì «ÿ·«⁄« ° «“ «ÿ·«⁄«  Ã«—Ì Å‘ Ì»«‰  ÂÌÂ ﬂ‰Ìœ.«Ì« «“ «Ì‰ ﬂ«— «ÿ„Ì‰«‰ œ«—Ìœ',mtconfirmation,[mbyes,mbno],0)=mrno then exit;

if not SelectDirectory('„”Ì—Ì ﬂÂ Å‘ Ì»«‰ œ— ¬‰ ﬁ—«— œ«—œ —« «‰ Œ«» ﬂ‰Ìœ','',S)then exit;
getmem(ps,200);
if not(FileExists(s+'\BackG.dat')) or not(FileExists(s+'\control.dat')) or not(FileExists(s+'\Gero.txt')) or not(FileExists(s+'\Keshvar.txt')) or not(FileExists(s+'\Kind.txt')) or not(FileExists(s+'\Hazine.txt')) or not(FileExists(s+'\Sherkat.txt')) or not(FileExists(s+'\Kharidar.txt')) or not(FileExists(s+'\Rade1.txt')) or not(FileExists(s+'\Rade2.txt')) or not(FileExists(s+'\QRT70.BPL')) or not(FileExists(s+'\Club.mdb')) then
 begin
 messagedlg('Å‘ Ì»«‰ «‰ Œ«» ‘œÂ ﬂ«„· ‰Ì”  Ê ‰„Ì  Ê«‰Ìœ «“ ¬‰ «ÿ·«⁄«  —« »«“Ì«»Ì ﬂ‰Ìœ. ⁄„·Ì«  »«“Ì«»Ì «‰Ã«„ ‰‘œ',mterror,[mbok],0);
 exit;
 end;
// Now copying files
// First Deleting older files
form8.Table1.close;
form9.Table1.close;
form12.Table1.close;
form13.Table1.close;
form18.QueryMembers.Close;
form18.QueryCDBank.Close;

DeleteFile('BackG.dat');
DeleteFile('control.dat');
DeleteFile('Gero.txt');
DeleteFile('Keshvar.txt');
DeleteFile('Kind.txt');
DeleteFile('Hazine.txt');
DeleteFile('Sherkat.txt');
DeleteFile('Kharidar.txt');
DeleteFile('Rade1.txt');
DeleteFile('Rade2.txt');
DeleteFile('QRT70.BPL');
ADOConnection1.Connected:=false;
DeleteFile('Club.mdb');

// Now copying files
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\BackG.dat'),'BackG.dat',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\control.dat'),'control.dat',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Gero.txt'),'Gero.txt',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Keshvar.txt'),'Keshvar.txt',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Kind.txt'),'Kind.txt',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Hazine.txt'),'Hazine.txt',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Sherkat.txt'),'Sherkat.txt',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Kharidar.txt'),'Kharidar.txt',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Rade1.txt'),'Rade1.txt',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Rade2.txt'),'Rade2.txt',True);
StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\QRT70.BPL'),'QRT70.BPL',True);

StrplCopy(Ps,s,length(s));
CopyFile(strcat(ps,'\Club.mdb'),'Club.mdb',True);
try
  ADOConnection1.Connected:=true;
Except
  On Exception do ShowMessage('œ— »«—ê“«—Ì »«‰ﬂ «ÿ·«⁄« Ì »—‰«„Â „‘ﬂ·Ì »ÊÃÊœ ¬„œ');
end;

freemem(ps,200);

if DirectoryExists('Images') then DeleteAllFiles('Images');
//MkDir(GetCurrentDir+'\Images');
CopyAllFiles(s+'\Images',GetCurrentDir,false);

Showmessage('⁄„·Ì«  »«“Ì«»Ì «ÿ·«⁄«  »« „Ê›ﬁÌ  «‰Ã«„ ‘œ');
end;

procedure TForm1.ToolButton16Click(Sender: TObject);
begin
winexec('calc',0);
end;

end.
