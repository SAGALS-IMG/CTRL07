unit Zyla;

interface
const
  AT_SUCCESS= 0;
  AT_ERR_NOTINITIALISED= 1;
  AT_ERR_NOTIMPLEMENTED= 2;
  AT_ERR_READONLY= 3;
  AT_ERR_NOTREADABLE= 4;
  AT_ERR_NOTWRITABLE= 5;
  AT_ERR_OUTOFRANGE= 6;
  AT_ERR_INDEXNOTAVAILABLE= 7;
  AT_ERR_INDEXNOTIMPLEMENTED= 8;
  AT_ERR_EXCEEDEDMAXSTRINGLENGTH= 9;
  AT_ERR_CONNECTION= 10;
  AT_ERR_NODATA= 11;
  AT_ERR_INVALIDHANDLE= 12;
  AT_ERR_TIMEDOUT= 13;
  AT_ERR_BUFFERFULL= 14;
  AT_ERR_INVALIDSIZE= 15;
  AT_ERR_INVALIDALIGNMENT= 16;
  AT_ERR_COMM= 17;
  AT_ERR_STRINGNOTAVAILABLE= 18;
  AT_ERR_STRINGNOTIMPLEMENTED= 19;

  AT_HANDLE_SYSTEM= 1;
  AT_INFINITE = 30000;

  AT_TRUE = 1;
  AT_FALSE = 0;

  // initialise camera
  function AT_InitialiseLibrary():longint;stdcall;external 'atcore.dll';
  function AT_FinaliseLibrary():longint;stdcall;external 'atcore.dll';

  function AT_Open(CameraIndex:longint;Hndl:pointer):longint;stdcall;external 'atcore.dll';
  function AT_Close(Hndl:longint):longint;stdcall;external 'atcore.dll';


  //コマンドはPCharを指定。PAnsiCharは認識されない。
  function AT_SetInt(Hndl:longint;AT_WC:PChar; Value:longint):longint;stdcall;external 'atcore.dll';
  function AT_GetInt(Hndl:longint;AT_WC:PChar; Value:pointer):longint;stdcall;external 'atcore.dll';

  function AT_SetString(Hndl:longint;AT_WC:PChar;StrData:PChar):longint;stdcall;external 'atcore.dll';
  function AT_GetString(Hndl:longint;AT_WC:PChar;StrData:PChar;StringLength:longint):longint;stdcall;external 'atcore.dll';

  function AT_SetFloat(Hndl:longint;AT_WC:PChar;Value:double):longint;stdcall;external 'atcore.dll';
  function AT_GetFloat(Hndl:longint;AT_WC:PChar; Value:pointer):longint;stdcall;external 'atcore.dll';

  function AT_GetFloatMin(Hndl:longint;AT_WC:PChar; Value:pointer):longint;stdcall;external 'atcore.dll';
  function AT_GetFloatMax(Hndl:longint;AT_WC:PChar; Value:pointer):longint;stdcall;external 'atcore.dll';

  function AT_SetBool(Hndl:longint;AT_WC:PChar;Value:integer):longint;stdcall;external 'atcore.dll';
  function AT_GetBool(Hndl:longint;AT_WC:PChar;Value:pointer):longint;stdcall;external 'atcore.dll';

  function AT_SetEnumIndex(Hndl:longint;AT_WC:PChar;Value:integer):longint;stdcall;external 'atcore.dll';
  function AT_SetEnumString(Hndl:longint;AT_WC:PChar;StrData:PChar):longint;stdcall;external 'atcore.dll';

  function AT_GetEnumIndex(Hndl:longint;AT_WC:PChar; Value:pointer):longint;stdcall;external 'atcore.dll';
  function AT_GetEnumCount(Hndl:longint;AT_WC:PChar; Count:pointer):longint;stdcall;external 'atcore.dll';

  function AT_IsEnumIndexAvailable(Hndl:longint;AT_WC:PChar; Index:integer;Available:pointer):longint;stdcall;external 'atcore.dll';
  function AT_IsEnumIndexImplemented(Hndl:longint;AT_WC:PChar;Index:integer;Implemented:pointer):longint;stdcall;external 'atcore.dll';

  function AT_GetEnumStringByIndex(Hndl:longint;AT_WC:PChar;Index:integer;StrData:PChar;StringLength:integer):longint;stdcall;external 'atcore.dll';

  function AT_Command(Hndl:longint;AT_WC:PChar):longint;stdcall;external 'atcore.dll';

  function AT_QueueBuffer(Hndl:longint;Data:Pointer; PtrSize:longint):longint;stdcall;external 'atcore.dll';
  function AT_WaitBuffer(Hndl:longint; Data:Pointer; PtrSize:pointer;Timeout:integer):longint;stdcall;external 'atcore.dll';
  function AT_Flush(Hndl:longint):longint;stdcall;external 'atcore.dll';

implementation

end.

