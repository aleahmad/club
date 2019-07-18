{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, DBTables, ExtCtrls, ADODB, qrBarcode;

type
  TForm18 = class(TForm)
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QueryCDBank: TADOQuery;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRShape3: TQRShape;
    QuickRep1: TQuickRep;
    QRBand4: TQRBand;
    QRShape12: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape4: TQRShape;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    CTitle1: TQRLabel;
    QuickRep3: TQuickRep;
    QRBand5: TQRBand;
    QRBand7: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand8: TQRBand;
    QRDBText10: TQRDBText;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRExpr3: TQRExpr;
    QRShape16: TQRShape;
    QRDBText15: TQRDBText;
    QRBand10: TQRBand;
    CTitle2: TQRLabel;
    QRBand11: TQRBand;
    QRLabel30: TQRLabel;
    QRShape18: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel36: TQRLabel;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRExpr1: TQRExpr;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand6: TQRBand;
    CTitle3: TQRLabel;
    QRBand9: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape11: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape19: TQRShape;
    QuickRep4: TQuickRep;
    QRBand12: TQRBand;
    QRBand13: TQRBand;
    QRSysData4: TQRSysData;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRBand14: TQRBand;
    QRShape20: TQRShape;
    QRDBText19: TQRDBText;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRDBText20: TQRDBText;
    QRBand15: TQRBand;
    CTitle4: TQRLabel;
    QRBand16: TQRBand;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape24: TQRShape;
    QuickRep5: TQuickRep;
    QRBand17: TQRBand;
    QRBand18: TQRBand;
    QRSysData5: TQRSysData;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRBand19: TQRBand;
    QRShape25: TQRShape;
    QRDBText23: TQRDBText;
    QRShape27: TQRShape;
    QRExpr5: TQRExpr;
    QRShape28: TQRShape;
    QRDBText24: TQRDBText;
    QRBand20: TQRBand;
    CTitle5: TQRLabel;
    QRBand21: TQRBand;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel61: TQRLabel;
    QRDBText13: TQRDBText;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText25: TQRDBText;
    QRShape17: TQRShape;
    QRLTotal: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape15: TQRShape;
    QRLabel11: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRDBText29: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel32: TQRLabel;
    QRShape35: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape37: TQRShape;
    QRDBText31: TQRDBText;
    QueryMembers: TADOQuery;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel65: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape26: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QuickRep6: TQuickRep;
    QRBand22: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr6: TQRExpr;
    QRDBText11: TQRDBText;
    QRLabel29: TQRLabel;
    QRBand23: TQRBand;
    QRSysData6: TQRSysData;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRBand24: TQRBand;
    CTitle6: TQRLabel;
    QRBand25: TQRBand;
    QRLabel76: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel75: TQRLabel;
    QRImage1: TQRImage;
    QRDBText12: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel78: TQRLabel;
    QuickRep7: TQuickRep;
    QRBand26: TQRBand;
    QRBand27: TQRBand;
    QRSysData7: TQRSysData;
    QRBand28: TQRBand;
    CTitle7: TQRLabel;
    QRBand29: TQRBand;
    QRLabel79: TQRLabel;
    CTitle8: TQRLabel;
    QRAsBarcode1: TQRAsBarcode;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand14BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand19BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand22BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand26BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function CodeTrimZero(Code:string):string;
  end;

var
  Form18: TForm18;

implementation

{$R *.DFM}
uses Unit1;

function TForm18.CodeTrimZero(Code:string):string;
var
strcode:string;
i:integer;
begin
strcode:=Code;
for i:=1 to length(strcode) do
      if (strcode[i]<>'0') then
         break;
Result:=Copy(strcode,i,length(strcode));
end;


procedure TForm18.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLabel53.Caption:=CodeTrimZero(QueryCDBank.fieldbyname('Regcode').AsString);
end;

procedure TForm18.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLabel54.Caption:=CodeTrimZero(QueryCDBank.fieldbyname('Regcode').AsString);
end;

procedure TForm18.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLabel60.Caption:=CodeTrimZero(QueryMembers.fieldbyname('Membcode').AsString);
QRLabel66.Caption:=QueryMembers.fieldbyname('Name').AsString+' '+QueryMembers.fieldbyname('Family').AsString;
end;

procedure TForm18.QRBand14BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLabel62.Caption:=CodeTrimZero(QueryMembers.fieldbyname('Membcode').AsString);
QRLabel67.Caption:=QueryMembers.fieldbyname('Name').AsString+' '+QueryMembers.fieldbyname('Family').AsString;
end;

procedure TForm18.QRBand19BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Function Split(sSource, sDeli: String;sPart:Integer): String;
    var
    EndOfCurrentString: byte; //Keeps the position of the delimeter in the string
    Strings:Array of String; //Stores the Split Strings
    begin
    //Resize the array length
    SetLength(Strings,1);
    repeat
    //Get the Position of Deli
    EndOfCurrentString := Pos(sDeli, sSource);
    //Place the split text into the array
            if EndOfCurrentString = 0 then
    Begin
    //Rezise the array
    SetLength(Strings,High(Strings)+2);
    //Add the split text
    Strings[High(Strings)-1] := sSource;
    end
    else
    begin
    //Resize the array
    SetLength(Strings,High(Strings)+2);
    //Add the split text
    Strings[High(Strings)-1] := Copy(sSource, 1, EndOfCurrentString - 1);
    end;
    //Reset the sSource string
            sSource := Copy(sSource, EndOfCurrentString + length(sDeli), length(sSource) - EndOfCurrentString);
        until EndOfCurrentString = 0;
    //Give the result as a string
    Result := Strings[sPart];
    end;
begin
QRLabel63.Caption:=CodeTrimZero(QueryCDBank.fieldbyname('Membcode').AsString);
QRLabel64.Caption:=Split(QueryCDBank.fieldbyname('Regcode').AsString, ':', 0);
QRLabel21.Caption:=Split(QueryCDBank.fieldbyname('Regcode').AsString, ':', 1);
if (QRLabel21.Caption<>'') then
  begin

  end
  else
  begin
  QRLabel64.Caption:=CodeTrimZero(QueryCDBank.fieldbyname('Regcode').AsString);
  QRLabel21.Caption:=QueryCDBank.fieldbyname('Name').AsString+QueryCDBank.fieldbyname('Sharh').AsString;
  end;
  
end;


procedure TForm18.QRBand22BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLabel29.Caption:=CodeTrimZero(QueryCDBank.fieldbyname('Regcode').AsString);
if FileExists(GetCurrentDir+'\Images\'+QueryCDBank.fieldbyname('Regcode').AsString+'.jpg') then
    QRImage1.Picture.LoadFromFile(GetCurrentDir+'\Images\'+QueryCDBank.fieldbyname('Regcode').AsString+'.jpg')
    else
    QRImage1.Picture := nil;
end;

procedure TForm18.QRBand26BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLabel79.Caption:=CodeTrimZero(QueryCDBank.fieldbyname('Regcode').AsString);
QRAsBarcode1.Text:=uppercase(QRLabel79.Caption);
end;

end.
