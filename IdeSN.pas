             // Extracting IDE(ATA) disk serial number.

// (c) 2000-2003 Alex Konshin mailto:akonshin@earthlink.net

// 30 Jul 2000 created
// 22 Oct 2003 refactoring

unit IdeSN;

interface
uses
  Windows, Dialogs,
  SysUtils; // only for Win32Platform, SysErrorMessage and class Exception
type
  recordregister=record
      regStr:String[250];
      registered:boolean;
      Num:int64;
end;
var 
    recregister:file of recordregister;
    dataregister:recordregister;
//-------------------------------------------------------------
// Tries to extract the serial number from the first IDE disk that is found in the system.
// Returns an empty string if IDE disk is not found.
  function GetIdeSN (DriveNumber : integer) : string;
  function GetHDDSerial : String;
//-------------------------------------------------------------
// Tries to extract the serial number from specified IDE disk.
//
// Parameters:
//   ControllerNumber - SCSI port number of the controller.
//   DriveNumber - SCSI port number of the controller.
//
// Raises OSError exception in case of any error during this operation.
//
// Notes:
//  1. The parameter ControllerNumber is ignored on Windows 9x/ME platforms and should be 0.
//  2. This function CAN NOT extract SCSI disk serial number.
//
//  function GetIdeDiskSerialNumber( ControllerNumber, DriveNumber : Integer ) : String;

//=============================================================
//function GetIDESerialNumber(DriveNumber: Byte ): PChar;stdcall; external 'HardwareIDExtractorPas.DLL';   { DriveNr is from 0 to 4 }

implementation


{$IFDEF VER150}
{$DEFINE VER140}
{$ENDIF}

{$IFNDEF VER140}
procedure RaiseLastOSError;
begin
  RaiseLastWin32Error;
end;
{$ENDIF}

//-------------------------------------------------------------
// Tries to extract the serial number from specified IDE disk.
//
// Parameters:
//   ControllerNumber - SCSI port number of the controller.
//   DriveNumber - SCSI port number of the controller.
// Notes:
//  1. The parameter ControllerNumber is ignored on Windows 9x/ME platforms and should be 0.
//  2. This function CAN NOT extract SCSI disk serial number.
//
function GetIdeDiskSerialNumber( ControllerNumber, DriveNumber : Integer ) : String;
type
  TSrbIoControl = packed record
    HeaderLength : ULONG;
    Signature    : Array[0..7] of Char;
    Timeout      : ULONG;
    ControlCode  : ULONG;
    ReturnCode   : ULONG;
    Length       : ULONG;
  end;
  SRB_IO_CONTROL = TSrbIoControl;
  PSrbIoControl = ^TSrbIoControl;

  TIDERegs = packed record
    bFeaturesReg     : Byte; // Used for specifying SMART "commands".
    bSectorCountReg  : Byte; // IDE sector count register
    bSectorNumberReg : Byte; // IDE sector number register
    bCylLowReg       : Byte; // IDE low order cylinder value
    bCylHighReg      : Byte; // IDE high order cylinder value
    bDriveHeadReg    : Byte; // IDE drive/head register
    bCommandReg      : Byte; // Actual IDE command.
    bReserved        : Byte; // reserved for future use.  Must be zero.
  end;
  IDEREGS   = TIDERegs;
  PIDERegs  = ^TIDERegs;

  TSendCmdInParams = packed record
    cBufferSize  : DWORD;                // Buffer size in bytes
    irDriveRegs  : TIDERegs;             // Structure with drive register values.
    bDriveNumber : Byte;                 // Physical drive number to send command to (0,1,2,3).
    bReserved    : Array[0..2] of Byte;  // Reserved for future expansion.
    dwReserved   : Array[0..3] of DWORD; // For future use.
    bBuffer      : Array[0..0] of Byte;  // Input buffer.
  end;
  SENDCMDINPARAMS   = TSendCmdInParams;
  PSendCmdInParams  = ^TSendCmdInParams;

  TIdSector = packed record
    wGenConfig                 : Word;
    wNumCyls                   : Word;
    wReserved                  : Word;
    wNumHeads                  : Word;
    wBytesPerTrack             : Word;
    wBytesPerSector            : Word;
    wSectorsPerTrack           : Word;
    wVendorUnique              : Array[0..2] of Word;
    sSerialNumber              : Array[0..19] of Char;
    wBufferType                : Word;
    wBufferSize                : Word;
    wECCSize                   : Word;
    sFirmwareRev               : Array[0..7] of Char;
    sModelNumber               : Array[0..39] of Char;
    wMoreVendorUnique          : Word;
    wDoubleWordIO              : Word;
    wCapabilities              : Word;
    wReserved1                 : Word;
    wPIOTiming                 : Word;
    wDMATiming                 : Word;
    wBS                        : Word;
    wNumCurrentCyls            : Word;
    wNumCurrentHeads           : Word;
    wNumCurrentSectorsPerTrack : Word;
    ulCurrentSectorCapacity    : ULONG;
    wMultSectorStuff           : Word;
    ulTotalAddressableSectors  : ULONG;
    wSingleWordDMA             : Word;
    wMultiWordDMA              : Word;
    bReserved                  : Array[0..127] of Byte;
  end;
  PIdSector = ^TIdSector;

const
  IDE_ID_FUNCTION = $EC;
  IDENTIFY_BUFFER_SIZE       = 512;
  DFP_RECEIVE_DRIVE_DATA        = $0007c088;
  IOCTL_SCSI_MINIPORT           = $0004d008;
  IOCTL_SCSI_MINIPORT_IDENTIFY  = $001b0501;
  DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
  BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
  W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;
var
  hDevice : THandle;
  cbBytesReturned : DWORD;
  s : String;
  pInData : PSendCmdInParams;
  pOutData : Pointer; // PSendCmdInParams;
  Buffer : Array[0..BufferSize-1] of Byte;
  srbControl : TSrbIoControl absolute Buffer;

  procedure ChangeByteOrder( var Data; Size : Integer );
  var ptr : PChar;
      i : Integer;
      c : Char;
  begin
    ptr := @Data;
    for i := 0 to (Size shr 1)-1 do
    begin
      c := ptr^;
      ptr^ := (ptr+1)^;
      (ptr+1)^ := c;
      Inc(ptr,2);
    end;
  end;

begin
  Result := '';
  FillChar(Buffer,BufferSize,#0);
  if Win32Platform=VER_PLATFORM_WIN32_NT then
    begin // Windows NT, Windows 2000
      Str(ControllerNumber,s);
      // Get SCSI port handle
      hDevice := CreateFile(
        PChar('\\.\Scsi'+s+':'),
        GENERIC_READ or GENERIC_WRITE,
        FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then RaiseLastOSError;
      try
        srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
        System.Move('SCSIDISK',srbControl.Signature,8);
        srbControl.Timeout      := 2;
        srbControl.Length       := DataSize;
        srbControl.ControlCode  := IOCTL_SCSI_MINIPORT_IDENTIFY;
        pInData := PSendCmdInParams(PChar(@Buffer)+SizeOf(SRB_IO_CONTROL));
        pOutData := pInData;
        with pInData^ do
        begin
          cBufferSize  := IDENTIFY_BUFFER_SIZE;
          bDriveNumber := DriveNumber;
          with irDriveRegs do
          begin
            bFeaturesReg     := 0;
            bSectorCountReg  := 1;
            bSectorNumberReg := 1;
            bCylLowReg       := 0;
            bCylHighReg      := 0;
            bDriveHeadReg    := $A0 or ((DriveNumber and 1) shl 4);
            bCommandReg      := IDE_ID_FUNCTION;
          end;
        end;
        if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil ) then RaiseLastOSError;
      finally
        CloseHandle(hDevice);
      end;
    end
  else
    begin // Windows 95 OSR2, Windows 98
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then RaiseLastOSError;
      try
        pInData := PSendCmdInParams(@Buffer);
        pOutData := PChar(@pInData^.bBuffer);
        with pInData^ do
        begin
          cBufferSize  := IDENTIFY_BUFFER_SIZE;
          bDriveNumber := DriveNumber;
          with irDriveRegs do
          begin
            bFeaturesReg     := 0;
            bSectorCountReg  := 1;
            bSectorNumberReg := 1;
            bCylLowReg       := 0;
            bCylHighReg      := 0;
            bDriveHeadReg    := $A0 or ((DriveNumber and 1) shl 4);
            bCommandReg      := IDE_ID_FUNCTION;
          end;
        end;
        if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, SizeOf(TSendCmdInParams)-1, pOutData, W9xBufferSize, cbBytesReturned, nil ) then RaiseLastOSError;
      finally
        CloseHandle(hDevice);
      end;
    end;

  with PIdSector(PChar(pOutData)+16)^ do
  begin
    ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
    SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
  end;

  Result := Trim(Result);

end;

//-------------------------------------------------------------
function GetIdeSN2 : String;
var
  iController, iDrive, maxController : Integer;
begin
  Result := '';
  maxController := 15;
  if Win32Platform<>VER_PLATFORM_WIN32_NT then maxController := 0;
  for iController := 0 to maxController do
  begin
    for iDrive := 0 to 4 do
    begin
      try
        Result := GetIdeDiskSerialNumber(iController,iDrive);
        if Result<>'' then Exit;
      except
        // ignore exceptions
      end;
    end;
  end;
end;


function GetIdeSN (DriveNumber : integer) : string;
const IDENTIFY_BUFFER_SIZE = 512;
type
 TIDERegs = packed record
   bFeaturesReg     : BYTE;
   bSectorCountReg  : BYTE;
   bSectorNumberReg : BYTE;
   bCylLowReg       : BYTE;
   bCylHighReg      : BYTE;
   bDriveHeadReg    : BYTE;
   bCommandReg      : BYTE;
   bReserved        : BYTE;
 end;
 TSendCmdInParams = packed record
   cBufferSize  : DWORD;
   irDriveRegs  : TIDERegs;
   bDriveNumber : BYTE;
   bReserved    : Array[0..2] of Byte;
   dwReserved   : Array[0..3] of DWORD;
   bBuffer      : Array[0..0] of Byte;
 end;
 TIdSector = packed record
   wGenConfig                 : Word;
   wNumCyls                   : Word;
   wReserved                  : Word;
   wNumHeads                  : Word;
   wBytesPerTrack             : Word;
   wBytesPerSector            : Word;
   wSectorsPerTrack           : Word;
   wVendorUnique              : Array[0..2] of Word;
   sSerialNumber              : Array[0..19] of CHAR;
   wBufferType                : Word;
   wBufferSize                : Word;
   wECCSize                   : Word;
   sFirmwareRev               : Array[0..7] of Char;
   sModelNumber               : Array[0..39] of Char;
   wMoreVendorUnique          : Word;
   wDoubleWordIO              : Word;
   wCapabilities              : Word;
   wReserved1                 : Word;
   wPIOTiming                 : Word;
   wDMATiming                 : Word;
   wBS                        : Word;
   wNumCurrentCyls            : Word;
   wNumCurrentHeads           : Word;
   wNumCurrentSectorsPerTrack : Word;
   ulCurrentSectorCapacity    : DWORD;
   wMultSectorStuff           : Word;
   ulTotalAddressableSectors  : DWORD;
   wSingleWordDMA             : Word;
   wMultiWordDMA              : Word;
   bReserved                  : Array[0..127] of BYTE;
 end;
 PIdSector = ^TIdSector;
 TDriverStatus = packed record
   bDriverError : Byte;
   bIDEStatus   : Byte;
   bReserved    : Array[0..1] of Byte;
   dwReserved   : Array[0..1] of DWORD;
 end;
 TSendCmdOutParams = packed record
   cBufferSize  : DWORD;
   DriverStatus : TDriverStatus;
   bBuffer      : Array[0..0] of BYTE;
 end;
 
var hDevice : THandle;
   cbBytesReturned : DWORD;
   //ptr : PChar;
   SCIP : TSendCmdInParams;
   aIdOutCmd : Array [0..(SizeOf(TSendCmdOutParams)+IDENTIFY_BUFFER_SIZE-1)-1] of Byte;
   IdOutCmd  : TSendCmdOutParams absolute aIdOutCmd;
 
 procedure ChangeByteOrder( var Data; Size : Integer );
 var ptr : PChar;
     i : Integer;
     c : Char;
 begin
   for i := 0 to (Size shr 1)-1 do
   begin
     c := ptr^;
     ptr^ := (ptr+1)^;
     (ptr+1)^ := c;
     Inc(ptr,2);
   end;
 end;
 
begin
 Result := '';
 if SysUtils.Win32Platform=VER_PLATFORM_WIN32_NT then
   begin
     // warning! change name for other drives: ex.: second drive '\\.\PhysicalDrive1\'
     hDevice := CreateFile( PChar(concat('\\.\PhysicalDrive',IntToStr(DriveNumber)))
//<-- Change  here the drive letter Example : PChar('\\.\PhysicalDrive1')....
, GENERIC_READ or GENERIC_WRITE,
       FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0 );
   end
 else
   hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );
 if hDevice=INVALID_HANDLE_VALUE then Exit;
 try
   FillChar(SCIP,SizeOf(TSendCmdInParams)-1,#0);
   FillChar(aIdOutCmd,SizeOf(aIdOutCmd),#0);
   cbBytesReturned := 0;
   with SCIP do
   begin
     cBufferSize  := IDENTIFY_BUFFER_SIZE;
     with irDriveRegs do
     begin
       bSectorCountReg  := 1;
       bSectorNumberReg := 1;
       bDriveHeadReg    := $A0;
       bCommandReg      := $EC;
     end;
   end;
   if not DeviceIoControl( hDevice, $0007c088, @SCIP, SizeOf(TSendCmdInParams)-1,
     @aIdOutCmd, SizeOf(aIdOutCmd), cbBytesReturned, nil ) then Exit;
 finally
   CloseHandle(hDevice);
 end;
 with PIdSector(@IdOutCmd.bBuffer)^ do
 begin
   ChangeByteOrder( sSerialNumber, SizeOf(sSerialNumber) );
   (PChar(@sSerialNumber)+SizeOf(sSerialNumber))^ := #0;
   Result := PChar(@sSerialNumber);
 end;
end;

function GetHDDSerial : String;
var
S: string;
iDrive: integer;
begin
try
 for iDrive := 0 to 4 do
  begin
    S:=Trim(GetIdeSN(iDrive));
    if (S<>'') then break;
  end;
//if (length(S)<>8) then S:='5LY0E13C';
S :=IntToStr(8825475215-((ord(S[1])*2+ord(S[2])*3+ord(S[3])+ord(S[4])+ord(S[5])*4+ord(S[6])+ord(S[7])+ord(S[8])+21)*115600) div 6);

Except
    On Exception do ShowMessage('œ— ŒÊ«‰œ‰ «ÿ·«⁄«  „ÕœÊœÌ  ÊÃÊœ œ«—œ. ·ÿ›« »—‰«„Â —« »« œ” —”Ì „œÌ— «Ã—« ò‰Ìœ');
end;

GetHDDSerial:=S;
end;

end.

