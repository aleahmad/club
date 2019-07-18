unit Decode;
interface

uses
  SysUtils;

type
  TPass = class
    Procedure Encode(Text:String;var T1,T2,T3:String);
    function  Decode(Txt1,Txt2,Txt3:String):String;
  end;

implementation
function TPass.Decode(Txt1,Txt2,Txt3:String):String;
Const Key=$1362513;
var i:integer;
    P,Text:String;
begin
  Text:=inttostr(length(Txt3))+Txt1+Txt2+Txt3+inttostr(length(Txt1));
  SetLength(P,Length(Text));
  for i:=1 to Length(Text) do P[i]:=Chr(Ord(Text[i]) xor Key);
  Result:=P;
end;

procedure TPass.Encode(Text:String;var T1,T2,T3:String);
Const Key=$1362513;
var i,LenT1,LenT3:integer;
    P,Tmp1,Tmp2,Tmp3:String;
begin
  if Length(Text)=0 then
    begin
       T1:='';
       T2:='';
       T3:='';
       exit;
    end;
  SetLength(P,Length(Text));
  for i:=1 to Length(Text) do P[i]:=Chr(Ord(Text[i]) xor Key);
  LenT1:=StrtoInt(P[Length(P)]);
  LenT3:=StrtoInt(P[1]);

  SetLength(Tmp1,LenT1);
  for i:=1 to LenT1 do Tmp1[i]:=P[i+1];

  SetLength(Tmp2,Length(P)-LenT1-LenT3-2);
  for i:=LenT1+2 to Length(P)-LenT3-1 do Tmp2[I-LenT1-1]:=P[i];

  SetLength(Tmp3,LenT3);
  for i:=Length(P)-LenT3 to Length(P)-1 do Tmp3[I-Length(P)+LenT3+1]:=P[i];

  T1:=Tmp1;
  T2:=Tmp2;
  T3:=Tmp3;
end;

end.
 