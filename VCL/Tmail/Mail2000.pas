(*

Component name...................: Mail2000 (Mail2000.pas)
Classes implemented..............: TPOP2000, TSMTP2000, TMailMessage2000
Version..........................: 1.10.3
Status...........................: Beta
Last update......................: 2002-03-25
Author...........................: Marcello Tavares
Website..........................: http://groups.yahoo.com/group/tmail2000
Comments, bugs, suggestions to...: tmail2000@yahoogroups.com
Language.........................: English
Platform (tested)................: Windows 95/98/98SE/2000/XP
Requires.........................: Borland Delphi 5 Professional or better


Features
--------

1. Retrieve and delete messages from POP3 servers;

2. Send messages through SMTP servers;

3. Parse MIME or UUCODE messages in header, body, alternative texts and
   attachments;

4. Create or modify MIME messages on-the-fly;

5. HTML and embedded graphics support;

6. Save or retrieve messages or attachments from files or streams;

7. Ideal for automated e-mail processing.


Know limitations
----------------

1. Does not build UUCODE messages;

2. Some problems when running on Windows ME (worth a try);

3. Unexpected behavior when netlink not present;

4. Some troubles when handling very big messages;

5. Some bugs and memory leaks;


How to install
--------------

Create a directory;
Extract archive contents on it;
Open Delphi;
Click File/Close All;
Click File/Open;
Select TMail2000.dpk;
Compile the Package;
Install the Package;
Click File/Close All;
Click Tools/Environment/Library and add the path to where you extracted the components;
Now try to build and run Demo.dpr


How to use
----------

1. The better way to learn is play with the demo application;

2. I'm not planning to type a help file;

3. Fell free to mail your questions to me, expect aswer for 1-2 weeks;

4. See 'Discussion Group' section below;

5. Always check for the newest version at component website;

6. When upgrading, always check out 'What's New' section;

7. Good luck!


License stuff
-------------

Mail2000 Copyleft 1999-2002

This software is provided as-is, without any express or implied
warranty. In no event will the author be held liable for any damages
arising from the use of this software.

As a freeware, the author reserve your rights to not provide support,
requested changes in the code, specific versions, improvements of any
kind and bug fixes. The main purpose is to help a little the programmers
community over the world as a whole, not just one person or organization.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented, you must not
   claim that you wrote the original software.

2. If you use this software in a product, the author must known all details
   about its release, including objectives, availability and contact info. An
   acknowledgment in the product documentation is required.

3. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being an original software. When redistributed, a copy
   must always be sent to the author.

Please, consider my hard work.


Thanks to
---------

Mariano D. Podesta (marianopodesta@usa.net) - The author of wlPop3
component, from where I copied some decoding routines;

Sergio Kessler (sergio@perio.unlp.edu.ar) - The author of SakEmail
component, from where I based my encoding and SMTP algorithms;

Delphi Super Page (http://delphi.icm.edu.pl) and Torry Delphi Page
(http://www.torry.ru) - For providing the best way to find great libraries
and to join the Delphi community;

Yunarso Anang (yasx@hotmail.com) - For providing some functions for
correct treatment of oriental charsets;

Christian Bormann (chris@xynx.de) - For giving a lot of suggestions
and hard testing;

Tommy Andersen (sorry, I lost his address) - For warning about some
bugs in code;

Kunikazu Okada (kunikazu@okada.cc) - For detailed and careful suggestions
to help mail composition;

Anderson (andermuller@conex.com.br) - Advices;

Rene de Jong (rmdejong@ism.nl) - Extensive bugfixes;

Hou Yg (yghou@yahoo.com) - Improvements;

Peter Baars (peter.baars@elburg.nl) - Bugfixes;

Giuseppe Mingolla (gmingolla@criptanet.it) - AttachStream method;

Milkopb (milkopb@yahoo.com) - Bugfixes;

David P. Schwartz (davids@desertigloo.com) - Suggestions and bugfixes;

John GBA (john@gbasolutions.co.uk) - Testing;

Mike (michaeldmount@yahoo.com) - Return-Receipt support and bugfixes;

Mabiao Michael (mabiao_michael@yahoo.com) - SMTP authentication code;

Anyone interested in helping me to improve this component, including you,
just by downloading it.


What's new in 1.1 version
-------------------------

1.  Fixed the threatment of encoded fields in header;
2.  Fixed some fake attachments found in message;
3.  Included a string property "LastMessage" containing the source of
    last message retrieved;
4.  Now decoding file names;
5.  Fixed way to identify kind of host address;
6.  Added support for some tunnel proxy servers (eg via telnet port);
7.  Socket changed to non-blocking to improve communication;
8.  Fixed crashes when decoding encoded labels;
9.  Fixed header decoding with ansi charsets;
10. Fixed crashes when there are deleted messages on server;
11. Now recognizing text/??? file attachments;
12. Added Content-ID label at attachment header, now you can reference
    attached files on HTML code as <img src=cid:file.ext>;
13. Improved a lot the speed when decoding messages;
14. Thousands of minor bug fixes.


What's new in 1.2 version
-------------------------

1.  Added HELO command when talking to SMTP server;
2.  Changed CCO: fields (in portuguese) to BCC:
3.  It doesn't remove BCC: field after SMTP send anymore;
4.  Some random bugs fixed.


What's new in 1.3 version
-------------------------

1.  POP and SMTP routines discontinued, but they will remain in the code;
2.  Some suggestions added.


What's new in 1.4 version
-------------------------

1.  Improved UUCODE decoding;
2.  Range overflow bugs fixed;
3.  Changed MailMessage to MailMessage2000 to avoid class name conflicts.


What's new in 1.5 version
-------------------------

1.  I decided to improve POP and SMTP, but still aren't reliable;
2.  Another sort of bug fixes;
3.  TPOP2000.RetrieveHeader procedure added;
4.  TPOP2000.DeleteAfterRetrieve property added;
5.  Improved threatment of messages with no text parts;
6.  Proxy support will remain, but has been discontinued;
7.  TMailMessage2000.LoadFromFile procedure added;
8.  TMailMessage2000.SaveToFile procedure added.


What's new in 1.6 version
-------------------------

1.  Fixed expecting '+OK ' instead of '+OK' from SMTP;
2.  Stopped using TClientSocket.ReceiveLength, which is innacurate.


What's new in 1.7 version
-------------------------

1.  Handling of 'Received' (hop) headers. Now it is possible to trace the
    path e-mail went on;
2.  Again, bug fixes;
3.  Added properties to read (and just to read) 'To:' information and 'Cc:'
    information using TStringList;
4.  Added procedures to set destinations in comma-delimited format;
5.  Removed text/rtf handling.


What's new in 1.8 version
-------------------------

1.  Guess what? Bug fixes;
2.  Some memory leaks identified and fixed;
3.  Improved SMTP processing;
4.  Exception fixed in function 'Fill';
5.  Added 'AttachStream' method.


What's new in 1.9 version
-------------------------

1.  Exceptions fixed on date handling;
2.  Improved 'Received' header handling;
3.  Added 'Mime-Version' field;
4.  Added 'Content-Length' field;
5.  Fixed bug when there is comma on sender/recipient name;
6.  Several compatibility improvements;
7.  Several redundancies removed;
8.  Added 'Embedded' option for attachments;
9.  Improved mail bulding structure and algorithm;
10. Added 'FindParts' to identify texts and attachments of foreing messages;
11. Removed 'GetAttachList' (replaced by 'FindParts');
12. Added 'Normalize' to reformat foreing messages on Mail2000 standards;
13. Changed 'SetTextPlain' and 'SetTextHTML' to work with String type;
14. Added 'LoadFromStream' and 'SaveToStream';
15. Added 'MessageSource' read/write String property;
16. Added 'GetUIDL' method to POP component;
17. Added 'DetachFile' method;
18. Added 'Abort' method to POP and SMTP components;
19. Better handling of recipient fields (TMailRecipients);
20. Added 'AttachString' method;
21. Added 'AddHop' method;
22. Added 'SendMessageTo' method to SMTP component;
23. Added 'SendStringTo' method to SMTP component;
24. POP and SMTP components hard-tested;
25. POP and SMTP doesn't require MailMessage to work anymore;
26. Removed proxy support (but still working with ordinary proxy redirection);
27. Fixed one dot line causing SMTP to truncate the message;
28. Long lines on header now being wrapped;
29. Added 'TextEncoding' published property;
30. SendMessage will abort on first recipient rejected;
31. Treatment of date/time without seconds;
32. Better progress events behavior (but still sloppy);


What's new in 1.10.x version
----------------------------

1.  Now mail will be multipart only when needed;
2.  Fixed empty attachments issues;
3.  Fixed exceptions when handing text parts;
4.  Fixed exceptions when message has empty body;
5.  Now 'Normalize' is only needed when modifying a foreing message;
6.  Now recognizing 'text' content-type;
7.  Control characters discarded in 'MailDateToDelphiDate';
8.  Repeated recipient fields now supported;
9.  Fixed Memory leak in RetrieveHeader;
10. Fixed GetTimeZoneBias problem for countries with no daylight saving;
11. Now text parts will always be in top of the section;
12. Now ignoring the charcase of encoding type descriptor;
13. Added support for 'x-uuencode' encoding type;
14. Added 'EmbedMethod' published property;
15. Added 'ContentLocationBase' published property;
16. Added Content-Location embedded file attachment method (like .mht files);
17. Attachment encoding now defined by 'AttachEncoding' published property;
18. Address fields with parenthesis now supported;
19. Added mail priority support;
20. Added return-receipt support;
21. Added SMTP authentication support;
22. Header wrapping with #32 char now supported;
23. Fixed zero-length embedded attachment;
24. Added UserName and Password published properties for SMTP;
25. Added Handshaking property to control auto-authentication of SMTP;
26. Encode trailing spaces/tabs ín quoted-printable process;
27. Correct treatment of 7bit encoded data (just copy...);
28. Removed 7bit encoding (never really implemented);
29. Faster quoted-printable decoding.


Author data
-----------

Marcello Roberto Tavares Pereira
mycelo@yahoo.com
ICQ 5831833
Sorocaba/SP - BRAZIL
Spoken languages: Portuguese, English, Spanish


Discussion Group
----------------

Please join TMail2000 group, exchange information about mailing
application development with other power programmers, and receive
suggestions, advices, bugfixes and updates about this component.

http://groups.yahoo.com/group/tmail2000
tmail2000-subscribe@yahoogroups.com

This site stores all previous messages, you can find valuable
information about this component there. If you have a question,
please search this site before asking me, I will not post the
same answer twice.

*)

unit Mail2000;

{Please don't remove the following line}
{$BOOLEVAL OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  WinSock, ScktComp, Math, Registry, ExtCtrls;

type

  TMailPartList = class;
  TMailMessage2000 = class;
  TSocketTalk = class;

  TMessageSize = array of Integer;

  TSessionState = (stNone, stConnect, stUser, stPass, stStat, stList, stRetr, stDele, stUIDL, stHelo, stMail, stRcpt, stEhlo, stSMTPUser, stSMTPPass, stAuthLogin, stNoop, stData, stSendData, stQuit);
  TTalkError = (teGeneral, teSend, teReceive, teConnect, teDisconnect, teAccept, teTimeout, teNoError);
  TEncodingType = (etBase64, etQuotedPrintable, etNoEncoding);
  TNormalizer = (nrFirst, nrForce, nrAddText, nrAddAttach, nrAddEmbedded);
  TEmbedMethod = (emContentID, emContentLocation);
  TMailPriority = (mpHighest, mpHigh, mpNormal, mpLow, mpLowest);
  THandshaking = (hsAuto, hsManual); 

  TProgressEvent = procedure(Sender: TObject; Total, Current: Integer) of object;
  TEndOfDataEvent = procedure(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean) of object;
  TSocketTalkErrorEvent = procedure(Sender: TObject; SessionState: TSessionState; TalkError: TTalkError) of object;
  TReceiveDataEvent = procedure(Sender: TObject; Sessionstate: TSessionState; Data: String; var ServerResult: Boolean) of object;

  TReceivedField = (reFrom, reBy, reFor, reDate, reNone);

  TReceived = record
    From: String;
    By: String;
    Address: String;
    Date: TDateTime;
  end;

  { TMailPart - A recursive class to handle parts, subparts, and the mail by itself }

  TMailPart = class(TComponent)
  private

    FHeader: TStringList {TMailText};
    FBody: TMemoryStream;
    FDecoded: TMemoryStream;
    FParentBoundary: String;
    FOwnerMessage: TMailMessage2000;
    FSubPartList: TMailPartList;
    FOwnerPart: TMailPart;
    FIsDecoded: Boolean;
    FEmbedded: Boolean;

    function GetAttachInfo: String;
    function GetFileName: String;
    function GetBoundary: String;
    function GetSource: String;

    procedure Fill(Data: PChar; HasHeader: Boolean);
    procedure SetSource(Text: String);

  public

    constructor Create(AOwner: TComponent); override;
		destructor Destroy; override;

    function GetLabelValue(const cLabel: String): String;                     // Get the value of a label. e.g. Label: value
    function GetLabelParamValue(const cLabel, Param: String): String;         // Get the value of a label parameter. e.g. Label: xxx; param=value
    function LabelExists(const cLabel: String): Boolean;                      // Determine if a label exists
    function LabelParamExists(const cLabel, Param: String): Boolean;          // Determine if a label parameter exists

    function Decode: Boolean;                                                 // Decode Body stream into Decoded stream and result true if successful

    procedure Encode(const ET: TEncodingType);
    procedure EncodeText;                                                     // Encode Decoded stream into Body stream using quoted-printable
    procedure EncodeBinary;                                                   // Encode Decoded stream into Body stream using Base64

    procedure SetLabelValue(const cLabel, cValue: String);                    // Set the value of a label
    procedure SetLabelParamValue(const cLabel, cParam, cValue: String);       // Set the value of a label parameter

    procedure Remove;                                                         // Delete this mailpart from message

    procedure LoadFromFile(FileName: String);                                 // Load the data from a file
    procedure SaveToFile(FileName: String);                                   // Save the data to a file
    procedure LoadFromStream(Stream: TStream);                                // Load the data from a stream
    procedure SaveToStream(Stream: TStream);                                  // Save the data to a stream

    property PartSource: String read GetSource write SetSource;
    property Header: TStringList read FHeader;                                // The header text
    property Body: TMemoryStream read FBody;                                  // The original body
    property Decoded: TMemoryStream read FDecoded;                            // Stream with the body decoded
    property SubPartList: TMailPartList read FSubPartList;                    // List of subparts of this mail part
    property FileName: String read GetFileName;                               // Name of file when this mail part is an attached file
    property AttachInfo: String read GetAttachInfo;                           // E.g. application/octet-stream
    property OwnerMessage: TMailMessage2000 read FOwnerMessage;               // Main message that owns this mail part
    property OwnerPart: TMailPart read FOwnerPart;                            // Father part of this part (can be the main message too)
    property IsDecoded: Boolean read FIsDecoded;                              // If this part is decoded
    property Embedded: Boolean read FEmbedded write FEmbedded;                // E.g. if is a picture inside HTML text
  end;

  { TMailPartList - Just a collection of TMailPart's }

	TMailPartList = class(TList)
	private

		function Get(const Index: Integer): TMailPart;

	public

		destructor Destroy; override;

		property Items[const Index: Integer]: TMailPart read Get; default;
	end;

  { TMailRecipients - Handling of recipient fields }

  TMailRecipients = class(TObject)
  private

    FMessage: TMailMessage2000;
    FField: String;
    FNames: TStringList;
    FAddresses: TStringList;
    FCheck: Integer;

    function GetName(const Index: Integer): String;
    function GetAddress(const Index: Integer): String;
    function GetCount: Integer;

    procedure SetName(const Index: Integer; const Name: String);
    procedure SetAddress(const Index: Integer; const Address: String);

    function FindName(const Name: String): Integer;
    function FindAddress(const Address: String): Integer;
    function GetAllNames: String;
    function GetAllAddresses: String;

    procedure HeaderToStrings;
    procedure StringsToHeader;

  public

    constructor Create(MailMessage: TMailMessage2000; Field: String); //override;
    destructor Destroy; override;

    procedure Add(const Name, Address: String);
    procedure Replace(const Index: Integer; const Name, Address: String);
    procedure Delete(const Index: Integer);
    procedure SetAll(const Names, Addresses: String);
    procedure AddNamesTo(const Str: TStrings);
    procedure AddAddressesTo(const Str: TStrings);
    procedure Clear;

    property Count: Integer read GetCount;
    property Name[const Index: Integer]: String read GetName write SetName;
    property Address[const Index: Integer]: String read GetAddress write SetAddress;
    property ByName[const Name: String]: Integer read FindName;
    property ByAddress[const Name: String]: Integer read FindAddress;
    property AllNames: String read GetAllNames;
    property AllAddresses: String read GetAllAddresses;
  end;

  { TMailMessage2000 - A descendant of TMailPart with some tools to handle the mail }

  TMailMessage2000 = class(TMailPart)
  private

    FAttachList: TMailPartList;
    FTextPlain: TStringList;
    FTextHTML: TStringList;
    FTextPlainPart: TMailPart;
    FTextHTMLPart: TMailPart;
    FMixedPart: TMailPart;
    FRelatedPart: TMailPart;
    FAlternativePart: TMailPart;
    FTextFather: TMailPart;
    FCharset: String;
    FOnProgress: TProgressEvent;
    FNameCount: Integer;
    FToList: TMailRecipients;
    FCcList: TMailRecipients;
    FBccList: TMailRecipients;
    FTextEncoding: TEncodingType;
    FAttachEncoding: TEncodingType;
    FEmbedMethod: TEmbedMethod;
    FContentLocationBase: String;

    FNeedRebuild: Boolean;
    FNeedNormalize: Boolean;
    FNeedFindParts: Boolean;

    procedure GetSenderData(const Field: String; var Name, Address: String);

    function GetReceivedCount: Integer;
    function GetReceived(const Index: Integer): TReceived;

    function GetAttach(const FileName: String): TMailPart;

    function GetFromName: String;
    function GetFromAddress: String;
    function GetReplyToName: String;
    function GetReplyToAddress: String;
    function GetReceiptName: String;
    function GetReceiptAddress: String;
    function GetPriority: TMailPriority;
    function GetSubject: String;
    function GetDate: TDateTime;
    function GetMessageId: String;

    procedure PutText(Text: String; var Part: TMailPart; Content: String);
    procedure RemoveText(var Part: TMailPart);

    procedure SetSubject(const Subject: String);
    procedure SetDate(const Date: TDateTime);
    procedure SetMessageId(const MessageId: String);
    procedure SetPriority(const Priority: TMailPriority);

  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetFrom(const Name, Address: String);                           // Create/modify the From: field
    procedure SetReplyTo(const Name, Address: String);                        // Create/modify the Reply-To: field
    procedure SetReceipt(const Name, Address: String);                        // Create/modify the Return-Receipt field

    procedure FindParts;                                                      // Search for the attachments and texts
    procedure Normalize(const Kind: TNormalizer = nrFirst);                                                      // Reconstruct message on Mail2000 standards (multipart/mixed)
    procedure RebuildBody;                                                    // Build the raw mail body according to mailparts
    procedure Reset;                                                          // Clear all stored data in the object
    procedure SetTextPlain(const Text: String);                               // Create/modify a mailpart for text/plain (doesn't rebuild body)
    procedure SetTextHTML(const Text: String);                                // Create/modify a mailpart for text/html (doesn't rebuild body)
    procedure RemoveTextPlain;                                                // Remove the text/plain mailpart (doesn't rebuild body)
    procedure RemoveTextHTML;                                                 // Remove the text/html mailpart (doesn't rebuild body)

    procedure AttachFile(const FileName: String; const ContentType: String = ''; const IsEmbedded: Boolean = False);
              // Create a mailpart and encode a file on it (doesn't rebuild body)
    procedure AttachString(const Text, FileName: String; const ContentType: String = ''; const IsEmbedded: Boolean = False);
              // Create a mailpart and encode a string on it (doesn't rebuild body)
    procedure AttachStream(const AStream: TStream; const FileName: String; const ContentType: String = ''; const IsEmbedded: Boolean = False);
              // Create a mailpart and encode a stream on it (doesn't rebuild body)
    procedure DetachFile(const FileName: String);
              // Remove attached file from message by name
    procedure DetachFileIndex(const Index: Integer);
              // Remove attached file from message by index of AttachList

    procedure AddHop(const From, By, Aplic, Address: String);                 // Add a 'Received:' in message header

    property Received[const Index: Integer]: TReceived read GetReceived;      // Retrieve the n-th 'Received' header
    property ReceivedCount: Integer read GetReceivedCount;                    // Count the instances of 'Received' fields (hops)
    property AttachByName[const FileName: String]: TMailPart read GetAttach;  // Returns the MailPart of an attachment by filename
    property ToList: TMailRecipients read FToList;                            // Handling of To: recipients
    property CcList: TMailRecipients read FCcList;                            // Handling of Cc: recipients
    property BccList: TMailRecipients read FBccList;                          // Handling of Bcc: recipients

    property MessageSource: String read GetSource write SetSource;
    property FromName: String read GetFromName;                               // Retrieve the From: name
    property FromAddress: String read GetFromAddress;                         // Retrieve the From: address
    property ReplyToName: String read GetReplyToName;                         // Retrieve the Reply-To: name
    property ReplyToAddress: String read GetReplyToAddress;                   // Retrieve the Reply-To: address
    property ReceiptName: String read GetReceiptName;                         // Retrieve the Return-Receipt name
    property ReceiptAddress: String read GetReceiptAddress;                   // Retrieve the Return-Receipt address
    property Subject: String read GetSubject write SetSubject;                // Retrieve or set the Subject: string
    property Date: TDateTime read GetDate write SetDate;                      // Retrieve or set the Date: in TDateTime format
    property MessageId: String read GetMessageId write SetMessageId;          // Retrieve or set the Message-Id:
    property Priority: TMailPriority read GetPriority write SetPriority;      // Retrieve or set the mail priority
    property AttachList: TMailPartList read FAttachList;                      // A list of all attached files
    property TextPlain: TStringList read FTextPlain;                          // A StringList with the text/plain from message
    property TextHTML: TStringList read FTextHTML;                            // A StringList with the text/html from message
    property TextPlainPart: TMailPart read FTextPlainPart;                    // The text/plain part
    property TextHTMLPart: TMailPart read FTextHTMLPart;                      // The text/html part
    property NeedRebuild: Boolean read FNeedRebuild;                          // True if RebuildBody is needed
    property NeedNormalize: Boolean read FNeedNormalize;                      // True if message needs to be normalized
    property NeedFindParts: Boolean read FNeedFindParts;                      // True if message has parts to be searched for

  published

    property Charset: String read FCharSet write FCharset;                                     // Charset to build headers and text
    property TextEncoding: TEncodingType read FTextEncoding write FTextEncoding;               // How text will be encoded
    property AttachEncoding: TEncodingType read FAttachEncoding write FAttachEncoding;         // How attachments will be encoded
    property EmbedMethod: TEmbedMethod read FEmbedMethod write FEmbedMethod;                   // Embedded files attachment method
    property ContentLocationBase: String read FContentLocationBase write FContentLocationBase; // Base location for Content-Location embedded files
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;                    // Occurs when storing message in memory
  end;

  { TSocketTalk }

  TSocketTalk = class(TComponent)
  private

    FTimeOut: Integer;
    FExpectedEnd: String;
    FLastResponse: String;
    FDataSize: Integer;
    FPacketSize: Integer;
    FTalkError: TTalkError;
    FSessionState: TSessionState;
    FClientSocket: TClientSocket;
    FWaitingServer: Boolean;
    FTimer: TTimer;
    FServerResult: Boolean;

    FOnProgress: TProgressEvent;
    FOnEndOfData: TEndOfDataEvent;
    FOnSocketTalkError: TSocketTalkErrorEvent;
    FOnReceiveData: TReceiveDataEvent;
    FOnDisconnect: TNotifyEvent;

    procedure SocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure SocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure SocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Timer(Sender: TObject);

  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Talk(Buffer, EndStr: String; SessionState: TSessionState);
    procedure Cancel;
    procedure ForceState(SessionState: TSessionState);
    procedure WaitServer;

    property LastResponse: String read FLastResponse;
    property DataSize: Integer read FDataSize write FDataSize;
    property PacketSize: Integer read FPacketSize write FPacketSize;
    property TimeOut: Integer read FTimeOut write FTimeOut;
    property TalkError: TTalkError read FTalkError;
    property ClientSocket: TClientSocket read FClientSocket;
    property ServerResult: Boolean read FServerResult;

    property OnEndOfData: TEndOfDataEvent read FOnEndOfData write FOnEndOfData;
    property OnSocketTalkError: TSocketTalkErrorEvent read FOnSocketTalkError write FOnSocketTalkError;
    property OnReceiveData: TReceiveDataEvent read FOnReceiveData write FOnReceiveData;
    property OnProgress: TProgressEvent read FOnProgress write FOnProgress;
    property OnDisconnect: TNotifyEvent read FOnDisconnect write FOnDisconnect;
  end;

  { TPOP2000 }

  TPOP2000 = class(TComponent)
  private

    FMailMessage: TMailMessage2000;

    FSessionMessageCount: Integer;
    FSessionMessageSize: TMessageSize;
    FSessionConnected: Boolean;
    FSessionLogged: Boolean;
    FLastMessage: String;
    FSocketTalk: TSocketTalk;

    FUserName: String;
    FPassword: String;
    FPort: Integer;
    FHost: String;
    FDeleteOnRetrieve: Boolean;

    procedure EndOfData(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean);
    procedure SocketTalkError(Sender: TObject; SessionState: TSessionState; TalkError: TTalkError);
    procedure ReceiveData(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean);
    procedure SocketDisconnect(Sender: TObject);

    function GetTimeOut: Integer;
    procedure SetTimeOut(Value: Integer);

    function GetProgress: TProgressEvent;
    procedure SetProgress(Value: TProgressEvent);

    function GetLastResponse: String;

  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Connect: Boolean;                                                // Connect to mail server
    function Login: Boolean;                                                  // Autenticate to mail server
    function Quit: Boolean;                                                   // Logout and disconnect

    procedure Abort;                                                          // Force disconnect

    function RetrieveMessage(Number: Integer): Boolean;                       // Retrieve mail number # and put in MailMessage
    function RetrieveHeader(Number: Integer; Lines: Integer = 0): Boolean;    // Retrieve header and put in MailMessage
    function DeleteMessage(Number: Integer): Boolean;                         // Delete mail number #
    function GetUIDL(Number: Integer): String;                                // Get UIDL from mail number #

    property SessionMessageCount: Integer read FSessionMessageCount;          // Number of messages found on server
    property SessionMessageSize: TMessageSize read FSessionMessageSize;       // Dynamic array with size of the messages
    property SessionConnected: Boolean read FSessionConnected;                // True if conencted to server
    property SessionLogged: Boolean read FSessionLogged;                      // True if autenticated on server
    property LastMessage: String read FLastMessage;                           // Last integral message text
    property LastResponse: String read GetLastResponse;                       // Last string received from server

  published

    property UserName: String read FUserName write FUserName;                 // User name to login on server
    property Password: String read FPassword write FPassword;                 // Password
    property Port: Integer read FPort write FPort;                            // Port (usualy 110)
    property Host: String read FHost write FHost;                             // Host address
    property MailMessage: TMailMessage2000 read FMailMessage write FMailMessage;  // Message retrieved
    property TimeOut: Integer read GetTimeOut write SetTimeOut;               // Max time to wait for server reply in seconds
    property OnProgress: TProgressEvent read GetProgress write SetProgress;   // Occurs when receiving data from server
    property DeleteOnRetrieve: Boolean read FDeleteOnRetrieve write FDeleteOnRetrieve;  // If message will be deleted after successful retrieve
  end;

  { TSMTP2000 }

  TSMTP2000 = class(TComponent)
  private

    FMailMessage: TMailMessage2000;

    FSessionConnected: Boolean;
    FSocketTalk: TSocketTalk;
    FPacketSize: Integer;
    FNeedAuthentication: Boolean;
    FHandshaking: THandshaking;
    FUserName: String;
    FPassword: String;

    FPort: Integer;
    FHost: String;

    procedure EndOfData(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean);
    procedure SocketTalkError(Sender: TObject; SessionState: TSessionState; TalkError: TTalkError);
    procedure ReceiveData(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean);
    procedure SocketDisconnect(Sender: TObject);

    function GetTimeOut: Integer;
    procedure SetTimeOut(Value: Integer);

    function GetProgress: TProgressEvent;
    procedure SetProgress(Value: TProgressEvent);

    function GetLastResponse: String;

  public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Connect: Boolean;                                                // Connect to mail server
    function Helo: Boolean;                                                   // Sends a HELO command
    function Ehlo: Boolean;                                                   // Sends a EHLO command
    function AuthLogin: Boolean;                                              // Sends a AUTH LOGIN command
    function Login: Boolean;                                                  // Sends user name and password
    function Quit: Boolean;                                                   // Disconnect

    procedure Abort;                                                          // Force disconnect

    function SendMessage: Boolean;                                            // Send MailMessage to server
    function SendMessageTo(const From, Dests: String): Boolean;               // Send MailMessage to specified recipients
    function SendStringTo(const Msg, From, Dests: String): Boolean;           // Send string to specified recipients

    property SessionConnected: Boolean read FSessionConnected;                // True if conencted to server
    property LastResponse: String read GetLastResponse;                       // Last string received from server
    property NeedAuthentication: Boolean read FNeedAuthentication;            // If connected server requests authentication

  published

    property Port: Integer read FPort write FPort;                                // Port (usualy 25)
    property Host: String read FHost write FHost;                                 // Host address
    property TimeOut: Integer read GetTimeOut write SetTimeOut;                   // Max time to wait for a response in seconds
    property MailMessage: TMailMessage2000 read FMailMessage write FMailMessage;  // Message to send
    property PacketSize: Integer read FPacketSize write FPacketSize;              // Size of packets to send to server
    property OnProgress: TProgressEvent read GetProgress write SetProgress;       // Occurs when sending data to server
    property Handshaking: THandshaking read FHandshaking write FHandshaking;      // How connection will behave
    property UserName: String read FUserName write FUserName;                     // User name for authentication
    property Password: String read FPassword write FPassword;                     // Password for authentication
  end;

procedure Register;

{ Very useful functions ====================================================== }

function DecodeLine7Bit(Texto: String): String; forward;
function EncodeLine7Bit(const Texto, Charset: String): String; forward;
function DecodeQuotedPrintable(const Texto: String): String; forward;
function EncodeQuotedPrintable(const Texto: String; const HeaderLine: Boolean): String; forward;
function DecodeUUCODE(Encoded: PChar; Decoded: TMemoryStream): Boolean; forward;
function DecodeLineUUCODE(const Buffer: String; Decoded: PChar): Integer; forward;
function DecodeLineBASE64(const Buffer: String; Decoded: PChar): Integer; forward;
function EncodeBASE64(Encoded: TMemoryStream; Decoded: TMemoryStream): Integer; forward;
function EncodeBASE64String(const Decoded: String): String;
function NormalizeLabel(Texto: String): String; forward;
function LabelValue(cLabel: String): String; forward;
function WriteLabelValue(cLabel, Value: String): String; forward;
function LabelParamValue(cLabel, cParam: String): String; forward;
function WriteLabelParamValue(cLabel, cParam, Value: String): String; forward;
function GetTimeZoneBias: Double; forward;
function PadL(const Str: String; const Tam: Integer; const PadStr: String): String; forward;
function GetMimeType(const FileName: String): String; forward;
function GetMimeExtension(const MimeType: String): String; forward;
function GenerateBoundary: String; forward;
function SearchStringList(Lista: TStringList; const Chave: String; const Occorrence: Integer = 0): Integer; forward;
procedure DataLine(var Data, Line: String; var nPos: Integer); forward;
procedure DataLinePChar(const Data: PChar; const TotalLength: Integer; var LinePos, LineLen: Integer; var Line: PChar; var DataEnd: Boolean); forward;
function IsIPAddress(const SS: String): Boolean; forward;
function TrimSpace(const S: string): string; forward;
function TrimLeftSpace(const S: string): string; forward;
function TrimRightSpace(const S: string): string; forward;
function MailDateToDelphiDate(const DateStr: String): TDateTime; forward;
function DelphiDateToMailDate(const Date: TDateTime): String; forward;
function ValidFileName(FileName: String): String; forward;
function WrapHeader(Text: String): String; forward;
function GetToken(const Token: Integer; const Text, Separators, QuoteStart, QuoteEnd: String): String;

implementation

const
  _C_T  = 'Content-Type';
  _C_D  = 'Content-Disposition';
  _C_TE = 'Content-Transfer-Encoding';
  _C_ID = 'Content-ID';
  _C_L  = 'Content-Length';
  _C_LC = 'Content-Location';
  _CONT = 'Content-';
  _X_M2 = 'X-Mail2000-';
  _FFR  = 'From';
  _FRT  = 'Reply-To';
  _M_V  = 'Mime-Version';
  _M_ID = 'Message-ID';
  _X_M  = 'X-Mailer';
  _XM2A = 'X-Mail2000-Attachment';
  _XPRI = 'X-Priority';
  _DNT  = 'Disposition-Notification-To';

const
  _TXT  = 'text/';
  _TEX  = 'text';
  _T_P  = 'text/plain';
  _T_H  = 'text/html';
  _MP   = 'multipart/';
  _M_M  = 'multipart/mixed';
  _M_A  = 'multipart/alternative';
  _M_R  = 'multipart/related';
  _M_RP = 'multipart/report';
  _A_OS = 'application/octet-stream';
  _BDRY = 'boundary';
  _ATCH = 'attachment';
  _INLN = 'inline';
  _NAME = 'name';
  _FLNM = 'filename';
  _CSET = 'charset';
  _E_QP = 'quoted-printable';
  _E_UU = 'uucode';
  _E_XU = 'x-uuencode';
  _E_BA = 'base64';
  _E_7B = '7bit';
  _EMBD = 'embedded';
  _UUBG = 'begin 6';
  _UUEN = 'end';

const
  _MIME_Msg = 'This is a multipart message in mime format.'#13#10;
  _XMailer  = 'Mail2000 1.10 http://groups.yahoo.com/group/tmail2000';
  _TXTFN    = 'textpart.txt';
  _HTMLFN   = 'textpart.htm';
  _CHARSET  = 'iso-8859-1';
  _DATAEND1 = #13#10'.'#13#10;
  _DATAEND2 = #13#10'..'#13#10;
  _LINELEN  = 72;

const
  _E_UUCD = 'UUCODE message format error';
  _E_MLPT = '%s: TMailPart must be owned by a TMailMessage2000';
  _E_ATFN = '%s: Attachment filename not found "%s"';
  _E_ATIN = '%s: Attachment index not found';
  _E_MMUN = '%s: MailMessage unassigned';
  _E_MMNR = '%s: MailMessage need rebuild';
  _E_NRTS = '%s: No recipients to send message';

procedure Register;
begin

  RegisterComponents('TMail2000', [TPOP2000, TSMTP2000, TMailMessage2000]);
end;

// Decode an encoded field e.g. =?iso-8859-1?x?xxxxxx=?=

function DecodeLine7Bit(Texto: String): String;
var
  Buffer: PChar;
  Encoding: Char;
  Size: Integer;
  nPos0: Integer;
  nPos1: Integer;
  nPos2: Integer;
  nPos3: Integer;
  Found: Boolean;

begin

  Result := TrimSpace(Texto);

  repeat

    nPos0 := Pos('=?', Result);
    Found := False;

    if nPos0 > 0 then
    begin

      nPos1 := Pos('?', Copy(Result, nPos0+2, Length(Result)))+nPos0+1;
      nPos2 := Pos('?=', Copy(Result, nPos1+1, Length(Result)))+nPos1;
      nPos3 := Pos('?', Copy(Result, nPos2+1, Length(Result)))+nPos2;

      if nPos3 > nPos2 then
      begin

        if Length(Result) > nPos3 then
        begin

          if Result[nPos3+1] = '=' then
          begin

            nPos2 := nPos3;
          end;
        end;
      end;

      if (nPos1 > nPos0) and (nPos2 > nPos1) then
      begin

        Texto := Copy(Result, nPos1+1, nPos2-nPos1-1);

        if (Length(Texto) >= 2) and (Texto[2] = '?') and (UpCase(Texto[1]) in ['B', 'Q', 'U']) then
        begin

          Encoding := UpCase(Texto[1]);
        end
        else
        begin

          Encoding := 'Q';
        end;

        Texto := Copy(Texto, 3, Length(Texto)-2);

        case Encoding of

          'B':
          begin

            GetMem(Buffer, Length(Texto));
            Size := DecodeLineBASE64(Texto, Buffer);
            Buffer[Size] := #0;
            Texto := String(Buffer);
          end;

          'Q':
          begin

            while Pos('_', Texto) > 0 do
              Texto[Pos('_', Texto)] := #32;

            Texto := DecodeQuotedPrintable(Texto);
          end;

          'U':
          begin

            GetMem(Buffer, Length(Texto));
            Size := DecodeLineUUCODE(Texto, Buffer);
            Buffer[Size] := #0;
            Texto := String(Buffer);
          end;
        end;

        Result := Copy(Result, 1, nPos0-1)+Texto+Copy(Result,nPos2+2,Length(Result));
        Found := True;
      end;
    end;

  until not Found;
end;

// Encode a header field e.g. =?iso-8859-1?x?xxxxxx=?=

function EncodeLine7Bit(const Texto, Charset: String): String;
begin

  Result := EncodeQuotedPrintable(Texto, True);

  if Result <> Texto then
    Result := '=?'+Charset+'?Q?'+Result+'?='
  else
    Result := Texto;
end;

// Decode a quoted-printable encoded string

function DecodeQuotedPrintable(const Texto: String): String;
var
  nPos: Integer;
  nLastPos: Integer;
//lFound: Boolean;

begin

  Result := '';
  nPos := 1;

  while nPos <= Length(Texto) do
  begin

    if Texto[nPos] = '=' then
    begin

      if (Length(Texto)-nPos) >= 2 then
      begin

        if (Texto[nPos+1] = #13) and (Texto[nPos+2] = #10) then
        begin

          Inc(nPos, 3);
        end
        else
        begin

          if (Texto[nPos+1] in ['0'..'9', 'A'..'F'])
          and (Texto[nPos+2] in ['0'..'9', 'A'..'F']) then
          begin

            Result := Result + Char(StrToInt('$'+Texto[nPos+1]+Texto[nPos+2]));
            Inc(nPos, 3)
          end
          else
          begin

            Inc(nPos, 3);
          end;
        end;
      end
      else
      begin

        Break;
      end;
    end
    else
    begin

      nLastPos := nPos;
      nPos := Pos('=', Copy(Texto, nLastPos+1, High(Integer)));

      if nPos = 0 then
        nPos := Length(Texto)+1;

      Result := Result + Copy(Texto, nLastPos, nPos);

      Inc(nPos, nLastPos);
    end;
  end;
end;

// Encode a string in quoted-printable format

function EncodeQuotedPrintable(const Texto: String; const HeaderLine: Boolean): String;
var
  nPos: Integer;
  LineLen: Integer;
  Buffer: TStringList;
  Line2: String;

begin

  Result := '';

  for nPos := 1 to Length(Texto) do
  begin

    if (Texto[nPos] > #127) or
       (Texto[nPos] = '=') or
       ((Texto[nPos] < #32) and (not (Texto[nPos] in [#9, #10, #13]))) or
       ((nPos < Length(Texto)) and (Texto[nPos] = #13) and (Texto[nPos+1] <> #10)) or
       ((nPos = Length(Texto)) and (Texto[nPos] = #13)) or
       ((nPos > 1) and (Texto[nPos] = #10) and (Texto[nPos-1] <> #13)) or
       ((nPos = 1) and (Texto[nPos] = #10)) or
       ((Texto[nPos] in [#9..#32, #39, '?', '<', '>', '(', ')', '"', '_']) and HeaderLine) then
    begin

      Result := Result + '=' + PadL(Format('%2x', [Ord(Texto[nPos])]), 2, '0');
    end
    else
    begin

      Result := Result + Texto[nPos];
    end;

    // Encode trailing spaces/tabs

    if not HeaderLine then
    begin

      if (Length(Result) > 2)
      and (Result[Length(Result)] = #10)
      and (Result[Length(Result)-1] = #13)
      and (Result[Length(Result)-2] in [#9, #32]) then
      begin

        LineLen := Length(Result)-2;
        Line2 := '';

        while (LineLen >= 1) and (Result[LineLen] in [#9, #32]) do
        begin

          case Result[LineLen] of

            #09: Line2 := '=09'+Line2;
            #32: Line2 := '=20'+Line2;
          end;

          Dec(LineLen);
        end;

        Result := Copy(Result, 1, LineLen)+Line2+#13#10;
      end;
    end;
  end;

  // Insert soft linebreaks

  if not HeaderLine then
  begin

    Buffer := TStringList.Create;
    Buffer.Text := Result;

    nPos := 0;

    while nPos < Buffer.Count do
    begin

      LineLen := Length(Buffer[nPos]);

      while LineLen >= _LINELEN do
      begin

        if (LineLen >= 3)
        and (Buffer[nPos][LineLen] in ['0'..'9', 'A'..'F'])
        and (Buffer[nPos][LineLen-1] in ['0'..'9', 'A'..'F'])
        and (Buffer[nPos][LineLen-2] = '=') then
          Dec(LineLen, 3)
        else
          Dec(LineLen, 1);
      end;

      if LineLen < Length(Buffer[nPos]) then
      begin

        Buffer.Insert(nPos+1, Copy(Buffer[nPos], LineLen+1, Length(Buffer[nPos])));
        Buffer[nPos] := Copy(Buffer[nPos], 1, LineLen)+'=';
      end;

      Inc(nPos);
    end;

    Result := Buffer.Text;
  end;
end;

// Decode an UUCODE encoded line

function DecodeLineUUCODE(const Buffer: String; Decoded: PChar): Integer;
const
	CHARS_PER_LINE = 45;
	Table: String = '`!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_';

var
	A24Bits: array[0..8 * CHARS_PER_LINE] of Boolean;
	i, j, k, b: Word;
	LineLen, ActualLen: Byte;

	function p_ByteFromTable(Ch: Char): Byte;
	var
		ij: Integer;
	begin

		ij := Pos(Ch, Table);

		if (ij > 64) or (ij = 0) then
		begin
			if Ch = #32 then
				Result := 0 else
				raise Exception.Create(_E_UUCD);
		end else
			Result := ij - 1;
	end;

begin

  if Buffer = '' then
  begin

    Result := 0;
    Exit;
  end;

  try

    LineLen := p_ByteFromTable(Buffer[1]);
    ActualLen := 4 * LineLen div 3;

    FillChar(A24Bits, 8 * CHARS_PER_LINE + 1, 0);
    Result := LineLen;

    if ActualLen <> (4 * CHARS_PER_LINE div 3) then
      ActualLen := Length(Buffer) - 1;

    k := 0;
    for i := 2 to ActualLen + 1 do
    begin
      b := p_ByteFromTable(Buffer[i]);
      for j := 5 downto 0 do
      begin
        A24Bits[k] := b and (1 shl j) > 0;
        Inc(k);
      end;
    end;

    k := 0;
    for i := 1 to CHARS_PER_LINE do
    begin
      b := 0;
      for j := 7 downto 0 do
      begin
        if A24Bits[k] then b := b or (1 shl j);
        Inc(k);
      end;
      Decoded[i-1] := Char(b);
    end;

  except

    Result := 0;
  end;
end;

// Decode an UUCODE text

function DecodeUUCODE(Encoded: PChar; Decoded: TMemoryStream): Boolean;
var
  nTL, nPos, nLen: Integer;
  Line: PChar;
  LineDec: array[0..79] of Char;
  LineLen: Integer;
  DataEnd: Boolean;

begin

  Decoded.Clear;

  DataEnd := False;
  nPos := -1;
  nTL := StrLen(Encoded);

  DataLinePChar(Encoded, nTL, nPos, nLen, Line, DataEnd);

  while not DataEnd do
  begin

    if nLen > 0 then
    begin

      LineLen := DecodeLineUUCODE(String(Line), LineDec);

      if LineLen > 0 then
        Decoded.Write(LineDec[0], LineLen);
    end;

    DataLinePChar(Encoded, nTL, nPos, nLen, Line, DataEnd);
  end;

  Result := True;
end;

// Decode a BASE64 encoded line

function DecodeLineBASE64(const Buffer: String; Decoded: PChar): Integer;
var
  A1: array[1..4] of Byte;
  B1: array[1..3] of Byte;
  I, J: Integer;
  BytePtr, RealBytes: Integer;

begin

  BytePtr := 0;
  Result := 0;

  for J := 1 to Length(Buffer) do
  begin

    Inc(BytePtr);

    case Buffer[J] of

      'A'..'Z': A1[BytePtr] := Ord(Buffer[J])-65;

      'a'..'z': A1[BytePtr] := Ord(Buffer[J])-71;

      '0'..'9': A1[BytePtr] := Ord(Buffer[J])+4;

      '+': A1[BytePtr] := 62;

      '/': A1[BytePtr] := 63;

      '=': A1[BytePtr] := 64;
    end;

    if BytePtr = 4 then
    begin

      BytePtr := 0;
      RealBytes := 3;

      if A1[1] = 64 then RealBytes:=0;

      if A1[3] = 64 then
      begin

        A1[3] := 0;
        A1[4] := 0;
        RealBytes := 1;
      end;

      if A1[4] = 64 then
      begin

        A1[4] := 0;
        RealBytes := 2;
      end;

      B1[1] := A1[1]*4 + (A1[2] div 16);
      B1[2] := (A1[2] mod 16)*16+(A1[3] div 4);
      B1[3] := (A1[3] mod 4)*64 + A1[4];

      for I := 1 to RealBytes do
      begin

        Decoded[Result+I-1] := Chr(B1[I]);
      end;

      Inc(Result, RealBytes);
    end;
  end;
end;

// Padronize header labels; remove double spaces, decode quoted text, lower the cases, indentify mail addresses

function NormalizeLabel(Texto: String): String;
var
  Quote: Boolean;
  Quoted: String;
  Loop: Integer;
  lLabel: Boolean;
  sLabel: String;
  Value: String;

begin

  Quote := False;
  lLabel := True;
  Value := '';
  sLabel := '';

  for Loop := 1 to Length(Texto) do
  begin

    if (Texto[Loop] = '"') and (not lLabel) then
    begin

      Quote := not Quote;

      if Quote then
      begin

        Quoted := '';
      end
      else
      begin

        Value := Value + Quoted;
      end;
    end;

    if not Quote then
    begin

      if lLabel then
      begin

        if (sLabel = '') or (sLabel[Length(sLabel)] = '-') then
          sLabel := sLabel + UpCase(Texto[Loop])
        else
          if (Copy(sLabel, Length(sLabel)-1, 2) = '-I') and (UpCase(Texto[Loop]) = 'D') and
             (Loop < Length(Texto)) and (Texto[Loop+1] = ':') then
            sLabel := sLabel + 'D'
          else
            sLabel := sLabel + LowerCase(Texto[Loop]);

        if Texto[Loop] = ':' then
        begin

          lLabel := False;
          Value := '';
        end;
      end
      else
      begin

        if Texto[Loop] = #32 then
        begin

          Value := TrimRightSpace(Value) + #32;
        end
        else
        begin

          Value := Value + Texto[Loop];
        end;
      end;
    end
    else
    begin

      Quoted := Quoted + Texto[Loop];
    end;
  end;

  Result := TrimSpace(sLabel)+' '+TrimSpace(Value);
end;

// Return the value of a label; e.g. Label: value

function LabelValue(cLabel: String): String;
var
  Loop: Integer;
  Quote: Boolean;
  Value: Boolean;
  Ins: Boolean;

begin

  Quote := False;
  Value := False;
  Result := '';

  for Loop := 1 to Length(cLabel) do
  begin

    Ins := True;

    if cLabel[Loop] = '"' then
    begin

      Quote := not Quote;
//    Ins := False;
    end;

    if not Quote then
    begin

      if (cLabel[Loop] = ':') and (not Value) then
      begin

        Value := True;
        Ins := False;
      end
      else
      begin

        if (cLabel[Loop] = ';') and Value then
        begin

          Break;
        end;
      end;
    end;

    if Ins and Value then
    begin

      Result := Result + cLabel[Loop];
    end;
  end;

  Result := TrimSpace(Result);

  if (Copy(Result, 1, 1) = '"') and (Copy(Result, Length(Result), 1) = '"') then
    Result := Copy(Result, 2, Length(Result)-2);
end;

// Set the value of a label;

function WriteLabelValue(cLabel, Value: String): String;
var
  Loop: Integer;
  Quote: Boolean;
  ValPos, ValLen: Integer;

begin

  Quote := False;
  ValPos := 0;
  ValLen := -1;

  for Loop := 1 to Length(cLabel) do
  begin

    if cLabel[Loop] = '"' then
    begin

      Quote := not Quote;
    end;

    if not Quote then
    begin

      if (cLabel[Loop] = ':') and (ValPos = 0) then
      begin

        ValPos := Loop+1;
      end
      else
      begin

        if (cLabel[Loop] = ';') and (ValPos > 0) then
        begin

          ValLen := Loop - ValPos;
          Break;
        end;
      end;
    end;
  end;

  Result := cLabel;

  if (ValLen < 0) and (ValPos > 0) then
    ValLen := Length(cLabel) - ValPos + 1;

  if ValPos > 0 then
  begin

    Delete(Result, ValPos, ValLen);
    Insert(' '+TrimSpace(Value), Result, ValPos);
  end;
end;

// Return the value of a label parameter; e.g. Label: xxx; param=value

function LabelParamValue(cLabel, cParam: String): String;
var
  Loop: Integer;
  Quote: Boolean;
  Value: Boolean;
  Params: Boolean;
  ParamValue: Boolean;
  Ins: Boolean;
  Param: String;

begin

  Quote := False;
  Value := False;
  Params := False;
  ParamValue := False;

  Param := '';
  Result := '';

  cLabel := TrimSpace(cLabel);

  if Copy(cLabel, Length(cLabel), 1) <> ';' then cLabel := cLabel + ';';

  for Loop := 1 to Length(cLabel) do
  begin

    Ins := True;

    if cLabel[Loop] = '"' then
    begin

      Quote := not Quote;
//    Ins := False;
    end;

    if not Quote then
    begin

      if (cLabel[Loop] = ':') and (not Value) and (not Params) then
      begin

        Value := True;
        Params := False;
        ParamValue := False;
        Ins := False;
      end
      else
      begin

        if (cLabel[Loop] = ';') and (Value or Params) then
        begin

          Params := True;
          Value := False;
          ParamValue := False;
          Param := '';
          Ins := False;
        end
        else
        begin

          if (cLabel[Loop] = '=') and Params then
          begin

            ParamValue := UpperCase(TrimSpace(Param)) = UpperCase(TrimSpace(cParam));
            Ins := False;
            Param := '';
          end;
        end;
      end;
    end;

    if Ins and ParamValue then
    begin

      Result := Result + cLabel[Loop];
    end;

    if Ins and (not ParamValue) and Params then
    begin

      Param := Param + cLabel[Loop];
    end;
  end;

  Result := TrimSpace(Result);

  if (Copy(Result, 1, 1) = '"') and (Copy(Result, Length(Result), 1) = '"') then
    Result := Copy(Result, 2, Length(Result)-2);
end;

// Set the value of a label parameter;

function WriteLabelParamValue(cLabel, cParam, Value: String): String;
var
  Loop: Integer;
  Quote: Boolean;
  LabelValue: Boolean;
  Params: Boolean;
  ValPos, ValLen: Integer;
  Ins: Boolean;
  Param: String;

begin

  Quote := False;
  LabelValue := False;
  Params := False;
  ValPos := 0;
  ValLen := -1;

  Param := '';
  Result := '';

  cLabel := TrimSpace(cLabel);

  if cLabel[Length(cLabel)] <> ';' then
    cLabel := cLabel + ';';

  for Loop := 1 to Length(cLabel) do
  begin

    Ins := True;

    if cLabel[Loop] = '"' then
    begin

      Quote := not Quote;
//    Ins := False;
    end;

    if not Quote then
    begin

      if (cLabel[Loop] = ':') and (not LabelValue) and (not Params) then
      begin

        LabelValue := True;
        Params := False;
        ValPos := 0;
        ValLen := 0;
        Ins := False;
      end
      else
      begin

        if (cLabel[Loop] = ';') and (LabelValue or Params) then
        begin

          if Params and (ValPos > 0) then
          begin

            ValLen := Loop - ValPos;
            Break;
          end;

          Params := True;
          LabelValue := False;
          Param := '';
          Ins := False;
        end
        else
        begin

          if (cLabel[Loop] = '=') and Params then
          begin

            if UpperCase(TrimSpace(Param)) = UpperCase(TrimSpace(cParam)) then
            begin

              ValPos := Loop+1;
              ValLen := 0;
            end;

            Ins := False;
            Param := '';
          end;
        end;
      end;
    end;

    if Ins and (ValPos = 0) and Params then
    begin

      Param := Param + cLabel[Loop];
    end;
  end;

  Result := cLabel;

  if Result[Length(Result)] = ';' then
    Delete(Result, Length(Result), 1);

  if ValPos = 0 then
  begin

    Result := TrimSpace(Result) + '; ' + TrimSpace(cParam) + '=' + TrimSpace(Value);
  end
  else
  begin

    if (ValLen < 0) and (ValPos > 0) then
      ValLen := Length(cLabel) - ValPos + 1;

    Delete(Result, ValPos, ValLen);
    Insert(TrimSpace(Value), Result, ValPos);
  end;
end;

// Return the Timezone adjust in days

function GetTimeZoneBias: Double;
var
  TzInfo: TTimeZoneInformation;

begin

  case GetTimeZoneInformation(TzInfo) of

    1: Result := - (TzInfo.StandardBias + TzInfo.Bias) / (24*60);

    2: Result := - (TzInfo.DaylightBias + TzInfo.Bias) / (24*60);

    else Result := - TzInfo.Bias / (24*60);
  end;
end;

// Fills left of string with char

function PadL(const Str: String; const Tam: Integer; const PadStr: String): String;
var
  TempStr: String;

begin

  TempStr := TrimLeftSpace(Str);

  if Length(TempStr) <= Tam then
  begin

    while Length(TempStr) < Tam do
      TempStr := PadStr + TempStr;
  end
  else
  begin

    TempStr := Copy(TempStr, Length(TempStr) - Tam + 1, Tam);
  end;

  Result := TempStr;
end;

// Get mime type of a file extension

function GetMimeType(const FileName: String): String;
var
  Key: string;

begin

  Result := '';

  with TRegistry.Create do
    try

      RootKey := HKEY_CLASSES_ROOT;
      Key := ExtractFileExt(FileName);

      if KeyExists(Key) then
      begin

        OpenKey(Key, False);
        Result := ReadString('Content Type');
        CloseKey;
      end;

    finally

      if Result = '' then
        Result := _A_OS;

      Free;
    end;
end;

// Get file extension of a mime type

function GetMimeExtension(const MimeType: String): String;
var
  Key: string;

begin

  Result := '';

  with TRegistry.Create do
    try

      RootKey := HKEY_CLASSES_ROOT;

      if OpenKey('MIME\Database\Content Type', False) then
      begin

        Key := MimeType;

        if KeyExists(Key) then
        begin

          OpenKey(Key,false);
          Result := ReadString('Extension');
          CloseKey;
        end;
      end;

    finally

      Free;
    end;
end;

// Generate a random boundary

function GenerateBoundary: String;
begin

  Result := _BDRY + Format('%8.8x', [Random($FFFFFFFF)]);
end;

// Encode in base64

function EncodeBASE64(Encoded: TMemoryStream {TMailText}; Decoded: TMemoryStream): Integer;
const
  _Code64: String[64] =
    ('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/');
var
  I: LongInt;
  B: array[0..2279] of Byte;
  J, K, L, M, Quads: Integer;
  Stream: string[76];
  EncLine: String;

begin

  Encoded.Clear;

  Stream := '';
  Quads := 0;
  J := Decoded.Size div 2280;

  Decoded.Position := 0;

  for I := 1 to J do
  begin

    Decoded.Read(B, 2280);

    for M := 0 to 39 do
    begin

      for K := 0 to 18 do
      begin

        L:= 57*M + 3*K;

        Stream[Quads+1] := _Code64[(B[L] div 4)+1];
        Stream[Quads+2] := _Code64[(B[L] mod 4)*16 + (B[L+1] div 16)+1];
        Stream[Quads+3] := _Code64[(B[L+1] mod 16)*4 + (B[L+2] div 64)+1];
        Stream[Quads+4] := _Code64[B[L+2] mod 64+1];

        Inc(Quads, 4);

        if Quads = 76 then
        begin

          Stream[0] := #76;
          EncLine := Stream+#13#10;
          Encoded.Write(EncLine[1], Length(EncLine));
          Quads := 0;
        end;
      end;
    end;
  end;

  J := (Decoded.Size mod 2280) div 3;

  for I := 1 to J do
  begin

    Decoded.Read(B, 3);

    Stream[Quads+1] := _Code64[(B[0] div 4)+1];
    Stream[Quads+2] := _Code64[(B[0] mod 4)*16 + (B[1] div 16)+1];
    Stream[Quads+3] := _Code64[(B[1] mod 16)*4 + (B[2] div 64)+1];
    Stream[Quads+4] := _Code64[B[2] mod 64+1];

    Inc(Quads, 4);

    if Quads = 76 then
    begin

      Stream[0] := #76;
      EncLine := Stream+#13#10;
      Encoded.Write(EncLine[1], Length(EncLine));
      Quads := 0;
    end;
  end;

  if (Decoded.Size mod 3) = 2 then
  begin

    Decoded.Read(B, 2);

    Stream[Quads+1] := _Code64[(B[0] div 4)+1];
    Stream[Quads+2] := _Code64[(B[0] mod 4)*16 + (B[1] div 16)+1];
    Stream[Quads+3] := _Code64[(B[1] mod 16)*4 + 1];
    Stream[Quads+4] := '=';

    Inc(Quads, 4);
  end;

  if (Decoded.Size mod 3) = 1 then
  begin

    Decoded.Read(B, 1);

    Stream[Quads+1] := _Code64[(B[0] div 4)+1];
    Stream[Quads+2] := _Code64[(B[0] mod 4)*16 + 1];
    Stream[Quads+3] := '=';
    Stream[Quads+4] := '=';
    Inc(Quads, 4);
  end;

  Stream[0] := Chr(Quads);

  if Quads > 0 then
  begin

    EncLine := Stream+#13#10;
    Encoded.Write(EncLine[1], Length(EncLine));
  end;

  Result := Encoded.Size;
end;

// Encode string to base64

function EncodeBASE64String(const Decoded: String): String;
var
  S1, S2: TMemoryStream;
  slTemp: TStringList;
  sTemp: String;

begin

  S1 := TMemoryStream.Create;
  S2 := TMemoryStream.Create;
  slTemp := TStringList.Create;
  slTemp.Text := Decoded;
  slTemp.SaveToStream(S1);

  try

    S1.SetSize(S1.Size - 2 );
    S1.Position := 0;
    EncodeBASE64(S2, S1);
    S2.Position := 0;
    slTemp.LoadFromStream(S2);
    sTemp := slTemp.Strings[0];
    Result := sTemp;

  finally

    slTemp.Free;
    S1.Free;
    S2.Free;
  end;
end;

// Search in a StringList

function SearchStringList(Lista: TStringList; const Chave: String; const Occorrence: Integer = 0): Integer;
var
  nPos: Integer;
  lAchou: Boolean;
  Casas: Integer;
  Temp: String;
  nOccor: Integer;

begin

  Casas := Length(Chave);
  lAchou := False;
  nPos := 0;
  nOccor := 0;

  try

    if Lista <> nil then
    begin

      while (not lAchou) and (nPos < Lista.Count) do
      begin

        Temp := Lista[nPos];

        if UpperCase(Copy(Temp, 1, Casas)) = UpperCase(Chave) then
        begin

          if nOccor = Occorrence then
          begin

            lAchou := True;
          end
          else
          begin

            Inc(nOccor);
          end;
        end;

        if not lAchou then
          Inc(nPos);
      end;
    end;

  finally

    if lAchou then
      result := nPos
    else
      result := -1;
  end;
end;

// Search lines into a string

procedure DataLine(var Data, Line: String; var nPos: Integer);
begin

  Line := '';

  while True do
  begin

    Line := Line + Data[nPos];
    Inc(nPos);

    if nPos > Length(Data) then
    begin

      nPos := -1;
      Break;
    end
    else
    begin

      if Length(Line) >= 2 then
      begin

        if (Line[Length(Line)-1] = #13) and (Line[Length(Line)] = #10) then
        begin

          Break;
        end;
      end;
    end;
  end;
end;

// Search lines into a string
// I need to do in this confusing way in order to improve performance

procedure DataLinePChar(const Data: PChar; const TotalLength: Integer; var LinePos, LineLen: Integer; var Line: PChar; var DataEnd: Boolean); assembler;
begin

  if LinePos >= 0 then
  begin

    Data[LinePos+LineLen] := #13;
    LinePos := LinePos+LineLen+2;
    LineLen := 0;
  end
  else
  begin

    LinePos := 0;
    LineLen := 0;
  end;

  while (LinePos+LineLen) < TotalLength do
  begin

    if Data[LinePos+LineLen] = #13 then
    begin

      if (LinePos+LineLen+1) < TotalLength then
      begin

        if Data[LinePos+LineLen+1] = #10 then
        begin

          Data[LinePos+LineLen] := #0;
          Line := @Data[LinePos];
          Exit;
        end;
      end;
    end;

    Inc(LineLen);
  end;

  if LinePos < TotalLength then
    Line := @Data[LinePos]
  else
    DataEnd := True;
end;

// Determine if string is a numeric IP or not (Thanks to Hou Yg yghou@yahoo.com)

function IsIPAddress(const SS: String): Boolean;
var
  Loop: Integer;
  P: String;

begin

  Result := True;
  P := '';

  for Loop := 1 to Length(SS)+1 do
  begin

    if (Loop > Length(SS)) or (SS[Loop] = '.') then
    begin

      if StrToIntDef(P, -1) < 0 then
      begin

        Result := False;
        Break;
      end;

      P := '';
    end
    else
    begin

      P := P + SS[Loop];
    end;
  end;
end;

// Remove leading and trailing spaces from string
// Thanks to Yunarso Anang (yasx@hotmail.com)

function TrimSpace(const S: string): string;
var
  I, L: Integer;

begin

  L := Length(S);
  I := 1;

  while (I <= L) and (S[I] in [#9, #32]) do
    Inc(I);

  if I > L then Result := '' else
  begin

    while S[L] = ' ' do
      Dec(L);

    Result := Copy(S, I, L - I + 1);
  end;
end;

// Remove left spaces from string
// Thanks to Yunarso Anang (yasx@hotmail.com)

function TrimLeftSpace(const S: string): string;
var
  I, L: Integer;

begin

  L := Length(S);
  I := 1;

  while (I <= L) and (S[I] in [#9, #32]) do
    Inc(I);

  Result := Copy(S, I, Maxint);
end;

// Remove right spaces from string
// Thanks to Yunarso Anang (yasx@hotmail.com)

function TrimRightSpace(const S: string): string;
var
  I: Integer;

begin

  I := Length(S);

  while (I > 0) and (S[I] in [#9, #32]) do
    Dec(I);

  Result := Copy(S, 1, I);
end;

// Convert date from message to Delphi format
// Returns zero in case of error

function MailDateToDelphiDate(const DateStr: String): TDateTime;
const
  Months: String = 'Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,';

var
  Field, Loop: Integer;
  Hour, Min, Sec, Year, Month, Day: Double;
  sDate, sHour, sMin, sSec, sYear, sMonth, sDay, sTZ: String;
  HTZM, MTZM: Word;
  STZM: Integer;
  TZM: Double;
  Final: Double;

begin

  sHour := '';
  sMin := '';
  sSec := '';
  sYear := '';
  sMonth := '';
  sDay := '';
  sTZ := '';
  sDate := Trim(DateStr);

  if sDate <> '' then
  begin

    if sDate[1] in ['0'..'9'] then
      Field := 1
    else
      Field := 0;

    for Loop := 1 to Length(sDate) do
    begin

      if sDate[Loop] in [#32, ':', '/'] then
      begin

        Inc(Field);
        if (Field = 6) and (sDate[Loop] = #32) then Field := 7;
      end
      else
      begin

        case Field of

          1: sDay := sDay + sDate[Loop];
          2: sMonth := sMonth + sDate[Loop];
          3: sYear := sYear + sDate[Loop];
          4: sHour := sHour + sDate[Loop];
          5: sMin := sMin + sDate[Loop];
          6: sSec := sSec + sDate[Loop];
          7: sTZ := sTZ + sDate[Loop];
        end;
      end;
    end;

    Hour := StrToIntDef(sHour, 0);
    Min := StrToIntDef(sMin, 0);
    Sec := StrToIntDef(sSec, 0);
    Year := StrToIntDef(sYear, 0);
    Day := StrToIntDef(sDay, 0);

    if sMonth[1] in ['0'..'9'] then
      Month := StrToIntDef(sMonth, 0)
    else
      Month := (Pos(sMonth, Months)-1) div 4 + 1;

    if Year < 100 then
    begin

      if Year < 50 then
        Year := 2000 + Year
      else
        Year := 1900 + Year;
    end;

    if (Year = 0) or (Month = 0) or (Year = 0) then
    begin

      Result := 0;
    end
    else
    begin

      if (sTZ = 'GMT') or (Length(Trim(sTZ)) <> 5) then
      begin

        STZM := 1;
        HTZM := 0;
        MTZM := 0;
      end
      else
      begin

        STZM := StrToIntDef(Copy(sTZ, 1, 1)+'1', 1);
        HTZM := StrToIntDef(Copy(sTZ, 2, 2), 0);
        MTZM := StrToIntDef(Copy(sTZ, 4, 2), 0);
      end;

      try

        TZM := EncodeTime(HTZM, MTZM, 0, 0)*STZM;
        Final := EncodeDate(Trunc(Year), Trunc(Month), Trunc(Day));
        Final := Final + Hour*(1/24) + Min*(1/24/60) + Sec*(1/24/60/60);
        Final := Final - TZM + GetTimeZoneBias;

        Result := Final;

      except

        Result := 0;
      end;
    end;
  end
  else
  begin

    Result := 0;
  end;
end;

// Convert numeric date to mail format

function DelphiDateToMailDate(const Date: TDateTime): String;
const
  Months: String = 'Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,';
  Weeks: String = 'Sun,Mon,Tue,Wed,Thu,Fri,Sat,';

var
  TZH: Double;
  DateStr: String;
  TZStr: String;
  Day, Month, Year: Word;

begin

  TZH := GetTimeZoneBias;
  DecodeDate(Date, Year, Month, Day);

  if TZH < 0 then
  begin

    TZStr := '-'+FormatDateTime('hhmm', Abs(TZH));
  end
  else
  begin

    if TZH = 0 then
    begin

      TZStr := 'GMT'
    end
    else
    begin

      TZStr := '+'+FormatDateTime('hhmm', Abs(TZH));
    end;
  end;

  DateStr := Copy(Weeks, (DayOfWeek(Date)-1)*4+1, 3)+',';
  DateStr := DateStr + FormatDateTime(' dd ', Date);
  DateStr := DateStr + Copy(Months, (Month-1)*4+1, 3);
  DateStr := DateStr + FormatDateTime(' yyyy hh:nn:ss ', Date) + TZStr;

  Result := DateStr;
end;

// To make sure that a file name (without path!) is valid

function ValidFileName(FileName: String): String;
const
  InvChars: String = ':\/*?"<>|'#39;

var
  Loop: Integer;

begin

  FileName := Copy(TrimSpace(FileName), 1, 254);
  Result := '';

  for Loop := 1 to Length(FileName) do
  begin

    if (Ord(FileName[Loop]) < 32) or (Pos(FileName[Loop], InvChars) > 0) then
      Result := Result + '_'
    else
      Result := Result + FileName[Loop];
  end;
end;

// Wrap an entire message header

function WrapHeader(Text: String): String;
var
  Line: String;
  nPos: Integer;
  fPos: Integer;
  Quote: Char;
  Ok: Boolean;

begin

  Result := '';
  Text := AdjustLineBreaks(Text);

  while Copy(Text, Length(Text)-1, 2) = #13#10 do
    Delete(Text, Length(Text)-1, 2);

  while Text <> '' do
  begin

    nPos := Pos(#13#10, Text);

    if nPos > 0 then
    begin

      Line := Copy(Text, 1, nPos-1);
      Text := Copy(Text, nPos+2, Length(Text));
    end
    else
    begin

      Line := Text;
      Text := '';
    end;

    if Length(Line) <= _LINELEN then
    begin

      Result := Result + Line + #13#10;
    end
    else
    begin

      nPos := Length(Line);
      Quote := #0;
      Ok := False;

      if Line[1] <> #9 then
        fPos := Pos(':'#32, Line)+2
      else
        fPos := _LINELEN div 2;

      while nPos >= fPos do
      begin

        if (Quote = #0) and (Line[nPos] in [#39, '"']) then
          Quote := Line[nPos]
        else
          if (Quote <> #0) and (Line[nPos] = Quote) then
            Quote := #0;

        if (Quote = #0) and (nPos <= _LINELEN) and (Line[nPos] in [#32, ',', ';']) then
        begin

          Ok := True;
          Break;
        end;

        Dec(nPos);
      end;

      if Ok then
      begin

        if Line[nPos] = #32 then
          Result := Result + Copy(Line, 1, nPos-1) + #13#10#9
        else
          Result := Result + Copy(Line, 1, nPos) + #13#10#9;

        Text := Copy(Line, nPos+1, Length(Line)) + #13#10 + Text;
      end
      else
      begin

        Result := Result + Line + #13#10;
      end;
    end;
  end;
end;

// Parse text into tokens

function GetToken(const Token: Integer; const Text, Separators, QuoteStart, QuoteEnd: String): String;
var
  Quote: Integer;
  Loop: Integer;
  CountItem: Integer;
  nPos: Integer;
  EndQuote: Char;
  Jump: Boolean;

begin

  Result := '';
  Quote := 0;
  CountItem := 0;
  Jump := False;
  EndQuote := #0;

  for Loop := 1 to Length(Text) do
  begin

    nPos := Pos(Text[Loop], QuoteStart);

    if nPos > 0 then
    begin

      Inc(Quote);
      EndQuote := QuoteEnd[nPos];
    end
    else
    begin

      if (Quote > 0) and (Text[Loop] = EndQuote) then
      begin

        Dec(Quote);
      end
      else
      begin

        if (Quote = 0) and (Pos(Text[Loop], Separators) > 0) then
        begin

          Inc(CountItem);
          Jump := True;
        end;
      end;
    end;

    if (Quote = 0) and (not Jump) and (CountItem = Token) then
    begin

      Result := Result + Text[Loop];
    end;

    Jump := False;
  end;
end;

{ TMailPart ================================================================== }

// Initialize MailPart

constructor TMailPart.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FHeader := TStringList.Create;
  FBody := TMemoryStream.Create;
  FDecoded := TMemoryStream.Create;
  FSubPartList := TMailPartList.Create;
  FOwnerPart := nil;
  FOwnerMessage := nil;
  FEmbedded := False;
end;

// Finalize MailPart

destructor TMailPart.Destroy;
var
  Loop: Integer;

begin

  for Loop := 0 to FSubPartList.Count-1 do
    FSubPartList.Items[Loop].Destroy;

  FHeader.Free;
  FBody.Free;
  FDecoded.Free;
  FSubPartList.Free;

  inherited Destroy;
end;

// Return the value of a label from the header like "To", "Subject"

function TMailPart.GetLabelValue(const cLabel: String): String;
var
  Loop: Integer;

begin

  Result := '';
  Loop := SearchStringList(FHeader, cLabel+':');

  if Loop >= 0 then
    Result := TrimSpace(LabelValue(FHeader[Loop]));

  if Length(Result) > 2 then
  begin

    if (Result[1] in ['"', #39]) and
       (Result[Length(Result)] in ['"', #39]) then
      Result := Copy(Result, 2, Length(Result)-2);
  end;
end;

// Return de value of a parameter of a value from the header

function TMailPart.GetLabelParamValue(const cLabel, Param: String): String;
var
  Loop: Integer;

begin

  Result := '';
  Loop := SearchStringList(FHeader, cLabel+':');

  if Loop >= 0 then
    Result := TrimSpace(LabelParamValue(FHeader[Loop], Param));

  if Length(Result) > 2 then
  begin

    if (Result[1] in ['"', #39]) and
       (Result[Length(Result)] in ['"', #39]) then
      Result := Copy(Result, 2, Length(Result)-2);
  end;
end;

// Set the value of a label

procedure TMailPart.SetLabelValue(const cLabel, cValue: String);
var
  Loop: Integer;

begin

  Loop := SearchStringList(FHeader, cLabel+':');

  if cValue <> '' then
  begin

    if Loop < 0 then
    begin

      FHeader.Add(cLabel+': ');
      Loop := FHeader.Count-1;
    end;

    FHeader[Loop] := WriteLabelValue(FHeader[Loop], cValue);
  end
  else
  begin

    if Loop >= 0 then
    begin

      FHeader.Delete(Loop);
    end;
  end;
end;

// Set the value of a label parameter

procedure TMailPart.SetLabelParamValue(const cLabel, cParam, cValue: String);
var
  Loop: Integer;

begin

  Loop := SearchStringList(FHeader, cLabel+':');

  if Loop < 0 then
  begin

    FHeader.Add(cLabel+': ');
    Loop := FHeader.Count-1;
  end;

  FHeader[Loop] := WriteLabelParamValue(FHeader[Loop], cParam, cValue);
end;

// Look for a label in the header

function TMailPart.LabelExists(const cLabel: String): Boolean;
begin

  Result := SearchStringList(FHeader, cLabel+':') >= 0;
end;

// Look for a parameter in a label in the header

function TMailPart.LabelParamExists(const cLabel, Param: String): Boolean;
var
  Loop: Integer;

begin

  Result := False;
  Loop := SearchStringList(FHeader, cLabel+':');

  if Loop >= 0 then
    Result := TrimSpace(LabelParamValue(FHeader[Loop], Param)) <> '';
end;

// Divide header and body; normalize header;

procedure TMailPart.Fill(Data: PChar; HasHeader: Boolean);
const
  CRLF: array[0..2] of Char = (#13, #10, #0);

var
  Loop: Integer;
  BoundStart: array[0..99] of Char;
  BoundEnd: array[0..99] of Char;
  InBound: Boolean;
  IsBoundStart: Boolean;
  IsBoundEnd: Boolean;
  BoundStartLen: Integer;
  BoundEndLen: Integer;
  PartText: PChar;
  DataEnd: Boolean;
  MultPart: Boolean;
  NoParts: Boolean;
  InUUCode: Boolean;
  UUFile, UUBound: String;
  Part: TMailPart;
  nPos: Integer;
  nLen: Integer;
  nTL: Integer;
  nSPos: Integer;
  Line: PChar;
  SChar: Char;

begin

  if (FOwnerMessage = nil) or (not (FOwnerMessage is TMailMessage2000)) then
  begin

    Exception.CreateFmt(_E_MLPT, [Self.Name]);
    Exit;
  end;

  for Loop := 0 to FSubPartList.Count-1 do
    FSubPartList.Items[Loop].Destroy;

  FHeader.Clear;
  FBody.Clear;
  FDecoded.Clear;
  FSubPartList.Clear;
  FIsDecoded := False;
  FEmbedded := False;
  FOwnerMessage.FNeedRebuild := True;
  FOwnerMessage.FNeedNormalize := True;
  FOwnerMessage.FNeedFindParts := True;

  nPos := -1;
  DataEnd := False;
  nTL := StrLen(Data);
  nSPos := nTL+1;

  if (Self is TMailMessage2000) and Assigned(FOwnerMessage.FOnProgress) then
  begin

    FOwnerMessage.FOnProgress(Self, nTL, 0);
    Application.ProcessMessages;
  end;

  if HasHeader then
  begin

    // Get Header

    DataLinePChar(Data, nTL, nPos, nLen, Line, DataEnd);

    while not DataEnd do
    begin

      if nLen = 0 then
      begin

        Break;
      end
      else
      begin

        if (Line[0] in [#9, #32]) and (FHeader.Count > 0) then
        begin

          FHeader[FHeader.Count-1] := FHeader[FHeader.Count-1] + #32 + TrimLeftSpace(String(PChar(@Line[1])));
        end
        else
        begin

          FHeader.Add(String(Line));
        end;
      end;

      DataLinePChar(Data, nTL, nPos, nLen, Line, DataEnd);

      if (Self is TMailMessage2000) and Assigned(FOwnerMessage.FOnProgress) then
      begin

        FOwnerMessage.FOnProgress(Self, nTL, nPos+1);
        Application.ProcessMessages;
      end;
    end;

    for Loop := 0 to FHeader.Count-1 do
      FHeader[Loop] := NormalizeLabel(FHeader[Loop]);
  end;

  MultPart := LowerCase(Copy(GetLabelValue(_C_T), 1, 10)) = _MP;
  InBound := False;
  IsBoundStart := False;
  IsBoundEnd := False;
  UUBound := '';

  if MultPart then
  begin

    StrPCopy(BoundStart, '--'+GetBoundary);
    StrPCopy(BoundEnd, '--'+GetBoundary+'--');
    BoundStartLen := StrLen(BoundStart);
    BoundEndLen := StrLen(BoundEnd);
    NoParts := False;
  end
  else
  begin

    if LabelExists(_C_T) then
    begin

      NoParts := True;
      BoundStartLen := 0;
      BoundEndLen := 0;
    end
    else
    begin

      StrPCopy(BoundStart, _UUBG);
      StrPCopy(BoundEnd, _UUEN);
      BoundStartLen := StrLen(BoundStart);
      BoundEndLen := StrLen(BoundEnd);
      NoParts := False;
    end;
  end;

  PartText := nil;

  // Get Body

  DataLinePChar(Data, nTL, nPos, nLen, Line, DataEnd);

  while (not DataEnd) and (not InBound) do
  begin

    if (not NoParts) and (((Line[0] = '-') and (Line[1] = '-')) or ((Line[0] = 'b') and (Line[1] = 'e'))) then
    begin

      IsBoundStart := StrLComp(Line, BoundStart, BoundStartLen) = 0;
    end;

    if NoParts or (not IsBoundStart) then
    begin

      if PartText = nil then
      begin

        PartText := Line;
        nSPos := nPos;
      end;

      DataLinePChar(Data, nTL, nPos, nLen, Line, DataEnd);

      if (Self is TMailMessage2000) and Assigned(FOwnerMessage.FOnProgress) then
      begin

        FOwnerMessage.FOnProgress(Self, nTL, nPos+1);
        Application.ProcessMessages;
      end;
    end
    else
    begin

      InBound := True;
    end;
  end;

  if nPos > nSPos then
  begin

    SChar := Data[nPos];
    Data[nPos] := #0;

    if PartText <> nil then
      FBody.Write(PartText[0], nPos-nSPos);

    Data[nPos] := SChar;
  end;

  if not NoParts then
  begin

    PartText := nil;

    if MultPart then
    begin

      // Get Mime parts

      while not DataEnd do
      begin

        if IsBoundStart or IsBoundEnd then
        begin

          if (PartText <> nil) and (PartText[0] <> #0) then
          begin

            Part := TMailPart.Create(Self.FOwnerMessage);
            Part.FOwnerPart := Self;
            Part.FOwnerMessage := Self.FOwnerMessage;

            SChar := Data[nPos-2];
            Data[nPos-2] := #0;
            Part.Fill(PartText, True);
            Data[nPos-2] := SChar;

            Part.FParentBoundary := GetBoundary;
            FSubPartList.Add(Part);
            PartText := nil;
          end;

          if IsBoundEnd then
          begin

            Break;
          end;

          IsBoundStart := False;
          IsBoundEnd := False;
        end
        else
        begin

          if PartText = nil then
          begin

            PartText := Line;
          end;
        end;

        DataLinePChar(Data, nTL, nPos, nLen, Line, DataEnd);

        if (Self is TMailMessage2000) and Assigned(FOwnerMessage.FOnProgress) then
        begin

          FOwnerMessage.FOnProgress(Self, nTL, nPos+1);
          Application.ProcessMessages;
        end;

        if not DataEnd then
        begin

          if (Line[0] = '-') and (Line[1] = '-') then
          begin

            IsBoundStart := StrLComp(Line, BoundStart, BoundStartLen) = 0;

            if not IsBoundStart then
            begin

              IsBoundEnd := StrLComp(Line, BoundEnd, BoundEndLen) = 0;
            end;
          end;
        end;
      end;
    end
    else
    begin

      // Get UUCode parts

      InUUCode := IsBoundStart;

      while not DataEnd do
      begin

        if IsBoundStart then
        begin

          if UUBound = '' then
          begin

            GetMem(PartText, FBody.Size+1);
            UUBound := GenerateBoundary;
            StrLCopy(PartText, FBody.Memory, FBody.Size);
            PartText[FBody.Size] := #0;

            Part := TMailPart.Create(Self.FOwnerMessage);
            Part.FOwnerPart := Self;
            Part.FOwnerMessage := Self.FOwnerMessage;
            Part.Fill(PChar(EncodeQuotedPrintable(String(PartText), False)), False);
            Part.FParentBoundary := UUBound;
            Part.SetLabelValue(_C_T, _T_P);
            Part.SetLabelParamValue(_C_T, _CSET, '"'+FOwnerMessage.FCharset+'"');
            Part.SetLabelValue(_C_TE, _E_QP);

            FSubPartList.Add(Part);
            SetLabelValue(_C_T, '');
            SetLabelValue(_C_T, _M_M);
            SetLabelParamValue(_C_T, _BDRY, '"'+UUBound+'"');

            FreeMem(PartText);
          end;

          PartText := nil;
          IsBoundStart := False;
          UUFile := TrimSpace(Copy(String(Line), 11, 999));
        end
        else
        begin

          if IsBoundEnd then
          begin

            Part := TMailPart.Create(Self.FOwnerMessage);
            Part.FOwnerPart := Self;
            Part.FOwnerMessage := Self.FOwnerMessage;

            SChar := Data[nPos-2];
            Data[nPos-2] := #0;
            DecodeUUCODE(PartText, Part.FDecoded);
            Data[nPos-2] := SChar;

            Part.EncodeBinary;
            Part.FParentBoundary := UUBound;
            Part.SetLabelValue(_C_T, GetMimeType(UUFile));
            Part.SetLabelValue(_C_TE, _E_BA);
            Part.SetLabelValue(_C_D, _ATCH);
            Part.SetLabelParamValue(_C_T, _NAME, '"'+EncodeLine7Bit(UUFile, FOwnerMessage.FCharSet)+'"');
            Part.SetLabelParamValue(_C_D, _FLNM, '"'+EncodeLine7Bit(UUFile, FOwnerMessage.FCharSet)+'"');
            Part.SetLabelValue(_XM2A, '"'+EncodeLine7Bit(UUFile, FOwnerMessage.FCharSet)+'"');
            Part.SetLabelParamValue(_XM2A, _EMBD, 'no'); 

            FSubPartList.Add(Part);
            PartText := nil;
            IsBoundEnd := False;
          end
          else
          begin

            if PartText = nil then
            begin

              PartText := Line;
            end;
          end;
        end;

        DataLinePChar(Data, nTL, nPos, nLen, Line, DataEnd);

        if (Self is TMailMessage2000) and Assigned(FOwnerMessage.FOnProgress) then
        begin

          FOwnerMessage.FOnProgress(Self, nTL, nPos+1);
          Application.ProcessMessages;
        end;

        if not DataEnd then
        begin

          if (Line[0] = 'b') and (Line[1] = 'e') then
          begin

            IsBoundStart := StrLComp(Line, BoundStart, BoundStartLen) = 0;
            InUUCode := True;
          end;

          if (not IsBoundStart) and InUUCode then
          begin

            if (Line[0] = 'e') and (Line[1] = 'n') and (Line[2] = 'd') then
            begin

              IsBoundEnd := True;
              InUUCode := False;
            end;
          end;
        end;
      end;
    end;
  end;

  if (Self is TMailMessage2000) and Assigned(FOwnerMessage.FOnProgress) then
  begin

    FOwnerMessage.FOnProgress(Self, nTL, nTL);
    Application.ProcessMessages;
  end;
end;

// Remove mailpart from its owner

procedure TMailPart.Remove;
begin

  if (FOwnerPart <> nil) and (Self <> FOwnerMessage) and
     (FOwnerPart.FSubPartList.IndexOf(Self) >= 0) then
  begin

    FOwnerPart.FSubPartList.Delete(FOwnerPart.FSubPartList.IndexOf(Self));
    FOwnerPart := nil;
  end;
end;

// Fill part with a file contents

procedure TMailPart.LoadFromFile(FileName: String);
var
  SL: TStringList;

begin

  SL := TStringList.Create;
  SL.LoadFromFile(FileName);

  Fill(PChar(SL.Text), True);

  SL.Free;
end;

// Save the part data to a file

procedure TMailPart.SaveToFile(FileName: String);
var
  SL: TStringList;

begin

  SL := TStringList.Create;
  SL.Text := GetSource;

  try

    SL.SaveToFile(FileName);

  finally

    SL.Free;
  end;
end;

// Fill part with a stream contents

procedure TMailPart.LoadFromStream(Stream: TStream);
var
  Buffer: PChar;

begin

  GetMem(Buffer, Stream.Size+1);
  Stream.Position := 0;
  Stream.ReadBuffer(Buffer[0], Stream.Size);
  Buffer[Stream.Size] := #0;
  Fill(Buffer, True);
  FreeMem(Buffer);
end;

// Save the part data to a stream

procedure TMailPart.SaveToStream(Stream: TStream);
var
  Text: String;

begin

  Text := GetSource;
  Stream.Size := Length(Text);
  Stream.Position := 0;
  Stream.WriteBuffer(Text[1], Length(Text));
end;

// Fill part with a string contents

procedure TMailPart.SetSource(Text: String);
begin

  Fill(PChar(Text), True);
end;

// Copy the part data to a string

function TMailPart.GetSource: String;
begin

  SetLength(Result, FBody.Size);
  FBody.Position := 0;
  FBody.ReadBuffer(Result[1], FBody.Size);
  Result := WrapHeader(FHeader.Text)+#13#10+Result;
end;

// Get file name of attachment

function TMailPart.GetFileName: String;
var
  Name: String;

begin

  Name := '';

  if LabelExists(_XM2A) then
  begin

    Name := GetLabelValue(_XM2A);
  end
  else
  begin

    if LabelParamExists(_C_T, _NAME) then
    begin

      Name := GetLabelParamValue(_C_T, _NAME);
    end
    else
    begin

      if LabelParamExists(_C_D, _FLNM) then
      begin

        Name := GetLabelParamValue(_C_D, _FLNM);
      end
      else
      begin

        if LabelExists(_C_ID) then
        begin

          Name := GetLabelValue(_C_ID);
        end
        else
        begin

          if LabelExists(_C_LC) then
          begin

            Name := GetLabelValue(_C_LC);
          end
          else
          begin

            if LabelExists(_C_T) then
            begin

              Name := GetLabelValue(_C_T)+GetMimeExtension(GetLabelValue(_C_T));
            end
            else
            begin

              Name := 'unknown';
            end;
          end;
        end;
      end;
    end;
  end;

  Name := DecodeLine7Bit(Name);

  if (Pos('.', Name) = 0) and LabelExists(_C_T) then
    Name := Name + GetMimeExtension(GetLabelValue(_C_T));

  Result := ValidFileName(Name);
end;

// Get kind of attachment

function TMailPart.GetAttachInfo: String;
begin

  Result := LowerCase(GetLabelValue(_C_T));
end;

// Get boundary of this part (when it is a multipart header)

function TMailPart.GetBoundary: String;
begin

  Result := GetLabelParamValue(_C_T, _BDRY);
end;

// Decode mail part

function TMailPart.Decode;
var
  Content: String;
  Encoding: String;
  Data: String;
  DecoLine: String;
  Buffer: PChar;
  Size: Integer;
  nPos: Integer;

begin

  Result := True;

  if FIsDecoded then
    Exit;

  FIsDecoded := True;

  if FBody.Size = 0 then Exit;

  Content := GetAttachInfo;
  Encoding := LowerCase(GetLabelValue(_C_TE));

  FDecoded.Clear;

  if Encoding = _E_QP then
  begin

    GetMem(Buffer, FBody.Size+1);
    StrLCopy(Buffer, FBody.Memory, FBody.Size);
    Buffer[FBody.Size] := #0;
    DecoLine := DecodeQuotedPrintable(Buffer);
    FreeMem(Buffer);

    GetMem(Buffer, Length(DecoLine)+1);
    StrPCopy(Buffer, DecoLine);
    FDecoded.Write(Buffer^, Length(DecoLine));
    FreeMem(Buffer);
  end
  else
  begin

    if Encoding = _E_BA then
    begin

      nPos := 1;

      SetLength(Data, FBody.Size);
      FBody.Position := 0;
      FBody.ReadBuffer(Data[1], FBody.Size);

      while nPos >= 0 do
      begin

        DataLine(Data, DecoLine, nPos);

        GetMem(Buffer, 132);
        Size := DecodeLineBASE64(TrimSpace(DecoLine), Buffer);

        if Size > 0 then
          FDecoded.Write(Buffer^, Size);

        FreeMem(Buffer);
      end;
    end
    else
    begin

      if (Encoding = _E_UU) or (Encoding = _E_XU) then
      begin

        nPos := 1;

        SetLength(Data, FBody.Size);
        FBody.Position := 0;
        FBody.ReadBuffer(Data[1], FBody.Size);

        while nPos >= 0 do
        begin

          DataLine(Data, DecoLine, nPos);

          GetMem(Buffer, 80);
          Size := DecodeLineUUCODE(TrimSpace(DecoLine), Buffer);
          FDecoded.Write(Buffer^, Size);
          FreeMem(Buffer);
        end;

        EncodeBinary; // Convert to base64
      end
      else
      begin

        // 7bit, 8bit, binary and any other

        GetMem(Buffer, FBody.Size);
        FBody.Position := 0;
        FBody.Read(Buffer^, FBody.Size);
        FDecoded.Write(Buffer^, FBody.Size);
        FreeMem(Buffer);
      end;
    end;
  end;
end;

// Encode mail part

procedure TMailPart.Encode(const ET: TEncodingType);
begin

  case ET of

    etBase64: EncodeBinary;

    etQuotedPrintable: EncodeText;

    etNoEncoding:
    begin

      FDecoded.Position := 0;
      FBody.Clear;
      FBody.LoadFromStream(FDecoded);
      SetLabelValue(_C_TE, '');
    end;
  end;
end;

// Encode mail part in quoted-printable

procedure TMailPart.EncodeText;
var
  Buffer: String;
  Encoded: String;

begin

  FBody.Clear;
  SetLabelValue(_C_TE, _E_QP);

  if FDecoded.Size > 0 then
  begin

    SetLength(Buffer, FDecoded.Size);
    FDecoded.Position := 0;
    FDecoded.ReadBuffer(Buffer[1], FDecoded.Size);
    Encoded := EncodeQuotedPrintable(Buffer, False);
    FBody.Write(Encoded[1], Length(Encoded));
  end;
end;

// Encode mail part in base64

procedure TMailPart.EncodeBinary;
begin

  EncodeBASE64(FBody, FDecoded);
  SetLabelValue(_C_TE, _E_BA);
end;

{ TMailPartList ============================================================== }

// Retrieve an item from the list

function TMailPartList.Get(const Index: Integer): TMailPart;
begin

	Result := inherited Items[Index];
end;

// Finalize MailPartList

destructor TMailPartList.Destroy;
begin

  inherited Destroy;
end;

{ TMailRecipients ================================================================ }

// Initialize MailRecipients

constructor TMailRecipients.Create(MailMessage: TMailMessage2000; Field: String);
begin

  inherited Create;

  FMessage := MailMessage;
  FField := Field;
  FNames := TStringList.Create;
  FAddresses := TStringList.Create;
  FCheck := -1;
end;

// Finalize MailRecipients

destructor TMailRecipients.Destroy;
begin

  FNames.Free;
  FAddresses.Free;

  inherited Destroy;
end;

// Copy recipients to temporary string list

procedure TMailRecipients.HeaderToStrings;
var
  Dests: String;
  Loop, Occur, PL: Integer;
  Quote: Boolean;
  EndQuote: Char;
  IsName: Boolean;
  sName: String;
  sAddress: String;

begin

  if Length(FMessage.FHeader.Text) = FCheck then
    Exit;

  Occur := 0;
  PL := SearchStringList(FMessage.FHeader, FField+':', Occur);

  FNames.Clear;
  FAddresses.Clear;

  while PL >= 0 do
  begin

    Dests := LabelValue(FMessage.FHeader[PL]);
    FCheck := Length(FMessage.FHeader.Text);
    sName := '';
    sAddress := '';
    Quote := False;
    EndQuote := #0;
    IsName := True;

    for Loop := 1 to Length(Dests) do
    begin

      if ((not Quote) and (Dests[Loop] in ['"', '(']))
      or (Quote and (Dests[Loop] = EndQuote)) then
      begin

        case Dests[Loop] of

          '"': EndQuote := '"';
          '(': EndQuote := ')';
        end;

        Quote := not Quote;

        if Quote and IsName and (sName <> '') and (sAddress = '') then
        begin

          sAddress := TrimSpace(sName);
          sName := '';
        end;
      end
      else
      begin

        if (not Quote) and (Dests[Loop] in [',', ';']) then
        begin

          if sAddress = '' then
          begin

            FNames.Add('');
            FAddresses.Add(TrimSpace(sName));
          end
          else
          begin

            FNames.Add(DecodeLine7Bit(TrimSpace(sName)));
            FAddresses.Add(TrimSpace(sAddress));
          end;

          sName := '';
          sAddress := '';
          IsName := True;
        end;

        if IsName then
        begin

          if Quote then
            sName := sName + Dests[Loop]
          else
            if not (Dests[Loop] in [',', ';', '<', '>']) then
              sName := sName + Dests[Loop];
        end
        else
        begin

          if (not Quote) and (not (Dests[Loop] in [',', ';', '<', '>', #32])) then
            sAddress := sAddress + Dests[Loop];
        end;

        if (not Quote) and (Dests[Loop] = '<') then
          IsName := False;

        if (not Quote) and (Dests[Loop] = '>') then
          IsName := True;

        if Quote and (sAddress <> '') then
          IsName := True;
      end;
    end;

    if Dests <> '' then
    begin

      if sAddress = '' then
      begin

        FNames.Add('');
        FAddresses.Add(TrimSpace(sName));
      end
      else
      begin

        FNames.Add(DecodeLine7Bit(TrimSpace(sName)));
        FAddresses.Add(TrimSpace(sAddress));
      end;
    end;

    Inc(Occur);
    PL := SearchStringList(FMessage.FHeader, FField+':', Occur);
  end;
end;

// Replace recipients with temporary string list

procedure TMailRecipients.StringsToHeader;
var
  Dests: String;
  Loop: Integer;

begin

  repeat

    FMessage.SetLabelValue(FField, '');

  until SearchStringList(FMessage.FHeader, FField+':') < 0;

  if FAddresses.Count > 0 then
  begin

    Dests := '';

    for Loop := 0 to FAddresses.Count-1 do
    begin

      if TrimSpace(FNames[Loop]) <> '' then
        Dests := Dests+'"'+EncodeLine7Bit(TrimSpace(FNames[Loop]), FMessage.FCharSet)+'"'#32'<'+TrimSpace(FAddresses[Loop])+'>'
      else
        Dests := Dests+'<'+TrimSpace(FAddresses[Loop])+'>';

      if Loop < FAddresses.Count-1 then
        Dests := Dests+','#32;
    end;

    FMessage.SetLabelValue(FField, Dests);
  end
  else
  begin

    FMessage.SetLabelValue(FField, '');
  end;

  FCheck := Length(FMessage.FHeader.Text);
end;

// Retrieve a name by index

function TMailRecipients.GetName(const Index: Integer): String;
begin

  HeaderToStrings;
  Result := FNames[Index];
end;

// Retrieve a address by index

function TMailRecipients.GetAddress(const Index: Integer): String;
begin

  HeaderToStrings;
  Result := FAddresses[Index];
end;

// Returns number of recipients

function TMailRecipients.GetCount: Integer;
begin

  HeaderToStrings;
  Result := FAddresses.Count;
end;

// Replace a name by index

procedure TMailRecipients.SetName(const Index: Integer; const Name: String);
begin

  HeaderToStrings;
  FNames[Index] := Name;
  StringsToHeader;
end;

// Replace an address by index

procedure TMailRecipients.SetAddress(const Index: Integer; const Address: String);
begin

  HeaderToStrings;
  FAddresses[Index] := Address;
  StringsToHeader;
end;

// Find an recipient by name

function TMailRecipients.FindName(const Name: String): Integer;
begin

  HeaderToStrings;
  Result := SearchStringList(FNames, Name);
end;

// Find an recipient by address

function TMailRecipients.FindAddress(const Address: String): Integer;
begin

  HeaderToStrings;
  Result := SearchStringList(FAddresses, Address);
end;

// Put all names on commatext

function TMailRecipients.GetAllNames: String;
begin

  HeaderToStrings;
  Result := FNames.CommaText;
end;

// Put all addresses on commatext

function TMailRecipients.GetAllAddresses: String;
begin

  HeaderToStrings;
  Result := FAddresses.CommaText;
end;

// Set all recipients from commatext

procedure TMailRecipients.SetAll(const Names, Addresses: String);
begin

  FNames.CommaText := Names + ',';
  FAddresses.CommaText := Addresses + ',';
  FCheck := -1;

  while FNames.Count < FAddresses.Count do
    FNames.Add('');

  while FAddresses.Count < FNames.Count do
    FNames.Delete(FNames.Count-1);

  StringsToHeader;
end;

// Add recipient names to TStrings

procedure TMailRecipients.AddNamesTo(const Str: TStrings);
begin

  HeaderToStrings;
  Str.AddStrings(FNames);
end;

// Add recipient addresses to TStrings

procedure TMailRecipients.AddAddressesTo(const Str: TStrings);
begin

  HeaderToStrings;
  Str.AddStrings(FAddresses);
end;

// Add a new recipient

procedure TMailRecipients.Add(const Name, Address: String);
begin

  HeaderToStrings;
  FNames.Add(Name);
  FAddresses.Add(Address);
  StringsToHeader;
end;

// Replace an recipient by index

procedure TMailRecipients.Replace(const Index: Integer; const Name, Address: String);
begin

  HeaderToStrings;
  FNames[Index] := Name;
  FAddresses[Index] := Address;
  StringsToHeader;
end;

// Delete an recipient by index

procedure TMailRecipients.Delete(const Index: Integer);
begin

  HeaderToStrings;
  FNames.Delete(Index);
  FAddresses.Delete(Index);
  StringsToHeader;
end;

// Delete all recipients

procedure TMailRecipients.Clear;
begin

  FNames.Clear;
  FAddresses.Clear;
  FMessage.SetLabelValue(FField, '');
  FCheck := Length(FMessage.FHeader.Text);
end;

{ TMailMessage2000 =============================================================== }

// Initialize MailMessage

constructor TMailMessage2000.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FAttachList := TMailPartList.Create;
  FTextPlain := TStringList.Create;
  FTextHTML := TStringList.Create;
  FTextPlainPart := nil;
  FTextHTMLPart := nil;
  FMixedPart := nil;
  FRelatedPart := nil;
  FAlternativePart := nil;
  FNeedRebuild := False;
  FNeedNormalize := False;
  FNeedFindParts := False;
  FCharset := _CHARSET;
  FNameCount := 0;
  FOwnerMessage := Self;
  FToList := TMailRecipients.Create(Self, 'To');
  FCcList := TMailRecipients.Create(Self, 'Cc');
  FBccList := TMailRecipients.Create(Self, 'Bcc');
  FTextEncoding := etQuotedPrintable;
  FAttachEncoding := etBase64;
  FEmbedMethod := emContentLocation;
  FContentLocationBase := 'http://localhost/';
end;

// Finalize MailMessage

destructor TMailMessage2000.Destroy;
begin

  inherited Destroy;

  FAttachList.Free;
  FTextPlain.Free;
  FTextHTML.Free;
  FToList.Free;
  FCcList.Free;
  FBccList.Free;
end;

// Get a dest. name from a field

procedure TMailMessage2000.GetSenderData(const Field: String; var Name, Address: String);
var
  Dests: String;
  Loop: Integer;
  Quote: Boolean;
  Unknown: String;
  EndQuote, Phase: Char;

begin

  Dests := TrimSpace(GetLabelValue(Field));
  Name := '';
  Address := '';
  Unknown := '';
  Quote := False;
  EndQuote := #0;
  Phase := 'U';

  for Loop := 1 to Length(Dests) do
  begin

    if ((not Quote) and (Dests[Loop] in ['"', '(']))
    or (Quote and (Dests[Loop] = EndQuote)) then
    begin

      case Dests[Loop] of

        '"': EndQuote := '"';
        '(': EndQuote := ')';
      end;

      Quote := not Quote;

      if Quote then
      begin

        if Phase = 'U' then
          Address := Unknown;

        Phase := 'N';
      end
      else
      begin

        Phase := 'A';
      end;
    end
    else
    begin

      if (not Quote) and (Dests[Loop] = '<') then
      begin

        if Phase = 'U' then
          Name := Unknown;
          
        Phase := 'A';
      end
      else
      begin

        if (not Quote) and (Dests[Loop] = '>') then
        begin

          Phase := 'N';
        end
        else
        begin

          if Phase = 'A' then
            Address := Address + Dests[Loop];

          if Phase = 'N' then
            Name := Name + Dests[Loop];

          if Phase = 'U' then
            Unknown := Unknown + Dests[Loop];
        end;
      end;
    end;
  end;

  if Phase = 'U' then
    Address := Unknown;

  Name := DecodeLine7Bit(TrimSpace(Name));
  Address := TrimSpace(Address);
end;

// Count the instances of 'Received' fields in header

function TMailMessage2000.GetReceivedCount: Integer;
begin

  Result := 0;

  while SearchStringList(FHeader, 'Received:', Result) >= 0 do
    Inc(Result);
end;

// Retrieve a 'Received' field

function TMailMessage2000.GetReceived(const Index: Integer): TReceived;
var
  Dests: String;
  Loop: Integer;
  Quote: Integer;
  Value: String;
  Field: TReceivedField;

begin

  Result.From := '';
  Result.By := '';
  Result.Address := '';
  Result.Date := 0;

  Dests := Trim(Copy(FHeader[SearchStringList(FHeader, 'Received', Index)], 10, 9999))+#1;
  Value := '';
  Field := reNone;
  Quote := 0;

  for Loop := 1 to Length(Dests) do
  begin

    if Dests[Loop] in ['(', '['] then
      Inc(Quote);

    if Dests[Loop] in [')', ']'] then
      Dec(Quote);

    if Quote < 0 then
      Quote := 0;

    if (not (Dests[Loop] in ['"', '<', '>', #39, ')', ']'])) and (Quote = 0) then
    begin

      if (Dests[Loop] = #32) and (Field = reNone) then
      begin

        if LowerCase(Trim(Value)) = 'from' then
          Field := reFrom;

        if LowerCase(Trim(Value)) = 'by' then
          Field := reBy;

        if LowerCase(Trim(Value)) = 'for' then
          Field := reFor;

        Value := '';
      end;

      if Dests[Loop] in [#32, ';'] then
      begin

        if (Trim(Value) <> '') and (Field in [reFrom, reBy, reFor]) then
        begin

          case Field of

            reFrom: Result.From := Trim(Value);

            reBy: Result.By := Trim(Value);

            reFor: Result.Address := Trim(Value);
          end;

          Value := '';
          Field := reNone;
        end;
      end;

      if not (Dests[Loop] in [#32, ';']) then
      begin

        Value := Value + Dests[Loop];
      end;

      if Dests[Loop] = ';' then
      begin

        Value := Copy(Dests, Loop+1, Length(Dests));
        Result.Date := MailDateToDelphiDate(Trim(Value));
        Break;
      end;
    end;
  end;
end;

// Add a 'Received:' in message header

procedure TMailMessage2000.AddHop(const From, By, Aplic, Address: String);
var
  Text: String;

begin

  Text := 'Received:';

  if From <> '' then
    Text := Text + #32'from'#32+From;

  if By <> '' then
    Text := Text + #32'by'#32+By;

  if Aplic <> '' then
    Text := Text + #32'with'#32+Aplic;

  if Address <> '' then
    Text := Text + #32'for'#32'<'+Address+'>';

  Text := Text + ';'#32+DelphiDateToMailDate(Now);

  FHeader.Insert(0, Text);
end;

// Get the From: name

function TMailMessage2000.GetFromName: String;
var
  Void: String;

begin

  GetSenderData(_FFR, Result, Void);
end;

// Get the From: address

function TMailMessage2000.GetFromAddress: String;
var
  Void: String;

begin

  GetSenderData(_FFR, Void, Result);
end;

// Get the Reply-To: name

function TMailMessage2000.GetReplyToName: String;
var
  Void: String;

begin

  GetSenderData(_FRT, Result, Void);
end;

// Get the Reply-To: address

function TMailMessage2000.GetReplyToAddress: String;
var
  Void: String;

begin

  GetSenderData(_FRT, Void, Result);
end;

// Get the Retrun-Receipt name

function TMailMessage2000.GetReceiptName: String;
var
  Void: String;

begin

  GetSenderData(_DNT, Result, Void);
end;

// Get the Return-Receipt address

function TMailMessage2000.GetReceiptAddress: String;
var
  Void: String;

begin

  GetSenderData(_DNT, Void, Result);
end;

// Set the From: name/address

procedure TMailMessage2000.SetFrom(const Name, Address: String);
begin

  if (Name <> '') and (Address <> '') then
    SetLabelValue(_FFR, '"' + EncodeLine7Bit(Name, FCharset) + '" <' + Address + '>')
  else
    if Address <> '' then
      SetLabelValue(_FFR, '<' + Address + '>')
    else
      SetLabelValue(_FFR, '');
end;

// Set the Reply-To: name/address

procedure TMailMessage2000.SetReplyTo(const Name, Address: String);
begin

  if (Name <> '') and (Address <> '') then
    SetLabelValue(_FRT, '"' + EncodeLine7Bit(Name, FCharset) + '" <' + Address + '>')
  else
    if Address <> '' then
      SetLabelValue(_FRT, '<' + Address + '>')
    else
      SetLabelValue(_FRT, '');
end;

// Set the Return-Receipt name/address

procedure TMailMessage2000.SetReceipt(const Name, Address: String);
begin

  if (Name <> '') and (Address <> '') then
    SetLabelValue(_DNT, '"' + EncodeLine7Bit(Name, FCharset) + '" <' + Address + '>')
  else
    if Address <> '' then
      SetLabelValue(_DNT, '<' + Address + '>')
    else
      SetLabelValue(_DNT, '');
end;

// Get the subject

function TMailMessage2000.GetSubject: String;
begin

  Result := DecodeLine7Bit(GetLabelValue('Subject'));
end;

// Set the subject

procedure TMailMessage2000.SetSubject(const Subject: String);
begin

  SetLabelValue('Subject', EncodeLine7Bit(Subject, FCharset))
end;

// Get the mail priority

function TMailMessage2000.GetPriority: TMailPriority;
begin

  Result := TMailPriority(StrToIntDef(GetToken(0, GetLabelValue(_XPRI), #32, '("', ')"'), 3)-1);
end;

// Set the mail priority

procedure TMailMessage2000.SetPriority(const Priority: TMailPriority);
begin

  SetLabelValue(_XPRI, IntToStr(Ord(Priority)+1));
end;

// Get the date in TDateTime format

function TMailMessage2000.GetDate: TDateTime;
begin

  Result := MailDateToDelphiDate(TrimSpace(GetLabelValue('Date')));
end;

// Set the date in RFC822 format

procedure TMailMessage2000.SetDate(const Date: TDateTime);
begin

  SetLabelValue('Date', DelphiDateToMailDate(Date));
end;

// Get message id

function TMailMessage2000.GetMessageId: String;
begin

  Result := GetLabelValue(_M_ID);
end;

// Set a unique message id (the parameter is just the host)

procedure TMailMessage2000.SetMessageId(const MessageId: String);
var
  IDStr: String;

begin

  IDStr := '<'+FormatDateTime('yyyymmddhhnnss', Now)+'.'+TrimSpace(Format('%8x', [Random($FFFFFFFF)]))+'.'+TrimSpace(Format('%8x', [Random($FFFFFFFF)]))+'@'+MessageId+'>';

  SetLabelValue(_M_ID, IDStr);
end;

// Searches for attached files and determines AttachList, TextPlain, TextHTML.

procedure TMailMessage2000.FindParts;

  function GetPart(Part: TMailPart): Boolean;

    function GetText(Info: String): Boolean;
    var
      Buffer: PChar;

    begin

      Result := False;

      if FTextPlainPart = nil then
      begin

        if (Info = _T_P) or (Info = _TEX) then
        begin

          if Part.Decode and (Part.Decoded.Size > 0) then
          begin

            FTextPlainPart := Part;

            GetMem(Buffer, Part.FDecoded.Size+1);
            StrLCopy(Buffer, Part.FDecoded.Memory, Part.FDecoded.Size);
            Buffer[Part.FDecoded.Size] := #0;
            FTextPlain.SetText(Buffer);
            FreeMem(Buffer);

            Result := True;
          end;
        end;
      end;

      if (FTextHTMLPart = nil) and (Info = _T_H) then
      begin

        if Part.Decode and (Part.Decoded.Size > 0) then
        begin

          FTextHTMLPart := Part;

          GetMem(Buffer, Part.FDecoded.Size+1);
          StrLCopy(Buffer, Part.FDecoded.Memory, Part.FDecoded.Size);
          Buffer[Part.FDecoded.Size] := #0;
          FTextHTML.SetText(Buffer);
          FreeMem(Buffer);

          Result := True;
        end;
      end;
    end;

  begin

    Result := True;

    // Check for multipart/mixed

    if (FMixedPart = nil) and (Part.GetAttachInfo = _M_M) then
    begin

      FMixedPart := Part;
      Exit;
    end;

    // Check for multipart/related

    if (FRelatedPart = nil) and (Part.GetAttachInfo = _M_R) then
    begin

      FRelatedPart := Part;
      Exit;
    end;

    // Check for multipart/alternative

    if (FAlternativePart = nil) and (Part.GetAttachInfo = _M_A) then
    begin

      FAlternativePart := Part;
      Exit;
    end;

    // Check for texts (when message is only one text)

    if (Part = Self) and ((Copy(Part.GetAttachInfo, 1, Length(_TXT)) = _TXT) or (Part.GetAttachInfo = _TEX)) and (FSubPartList.Count = 0) then
    begin

      if GetText(Part.GetAttachInfo) then
        Exit;
    end;

    // Check for texts (when message is only one text - no mime info)

    if (Part = Self) and (Part.GetAttachInfo = '') and (FSubPartList.Count = 0) then
    begin

      if GetText(_T_P) then
        Exit;
    end;

    // Check for texts (when message has one text plus attachs)

    if (FMixedPart <> nil) and (Part.FOwnerPart = FMixedPart) and (FAlternativePart = nil) then
    begin

      if GetText(Part.GetAttachInfo) then
        Exit;
    end;

    // Check for texts (when message one text with embedded)

    if (FRelatedPart <> nil) and (Part.FOwnerPart = FRelatedPart) then
    begin

      if GetText(Part.GetAttachInfo) then
        Exit;
    end;

    // Check for texts (when message has alternative texts)

    if (FAlternativePart <> nil) and (Part.FOwnerPart = FAlternativePart) then
    begin

      if GetText(Part.GetAttachInfo) then
        Exit;
    end;

    // If everything else failed, assume attachment

    if Part.FSubPartList.Count = 0 then
    begin

      Part.FEmbedded := Part.FOwnerPart = FRelatedPart;
      FAttachList.Add(Part);
    end;
  end;

  procedure DecodeRec(MP: TMailPart);
  var
    Loop: Integer;

  begin

    if GetPart(MP) then
    begin

      for Loop := 0 to MP.FSubPartList.Count-1 do
      begin

        DecodeRec(MP.FSubPartList[Loop]);
      end;
    end;
  end;

begin

  if not FNeedFindParts then
    Exit;

  FAttachList.Clear;
  FTextPlainPart := nil;
  FTextHTMLPart := nil;
  FMixedPart := nil;
  FRelatedPart := nil;
  FAlternativePart := nil;
  FTextPlain.Clear;
  FTextHTML.Clear;
  FNeedFindParts := False;

  DecodeRec(Self);
end;

// Ajust parts to the Mail2000 standards

procedure TMailMessage2000.Normalize(const Kind: TNormalizer = nrFirst);
var
  nLoop, nOcor: Integer;
  SaveBody, TmpPart, TmpMixed, TmpRelated, TmpAlternative: TMailPart;
  FName: String;
  nTexts, nAttachs, nEmbedded: Integer;

  procedure CreateMixed(Father: TMailPart);
  begin

    if Father = nil then
    begin

      SetLabelValue(_C_T, _M_M);
      SetLabelParamValue(_C_T, _BDRY, '"'+GenerateBoundary+'_mixed"');
      TmpMixed := Self;
    end
    else
    begin

      TmpMixed := TMailPart.Create(Self);
      TmpMixed.FOwnerMessage := Self;
      TmpMixed.FOwnerPart := Father;
      TmpMixed.FParentBoundary := Father.GetBoundary;
      TmpMixed.SetLabelValue(_C_T, _M_R);
      TmpMixed.SetLabelParamValue(_C_T, _BDRY, '"'+GenerateBoundary+'_Mixed"');
      Father.FSubPartList.Add(TmpMixed);
    end;
  end;

  procedure CreateRelated(Father: TMailPart);
  begin

    if Father = nil then
    begin

      SetLabelValue(_C_T, _M_R);
      SetLabelParamValue(_C_T, _BDRY, '"'+GenerateBoundary+'_related"');
      TmpRelated := Self;
    end
    else
    begin

      TmpRelated := TMailPart.Create(Self);
      TmpRelated.FOwnerMessage := Self;
      TmpRelated.FOwnerPart := Father;
      TmpRelated.FParentBoundary := Father.GetBoundary;
      TmpRelated.SetLabelValue(_C_T, _M_R);
      TmpRelated.SetLabelParamValue(_C_T, _BDRY, '"'+GenerateBoundary+'_related"');
      Father.FSubPartList.Add(TmpRelated);
    end;
  end;

  procedure CreateAlternative(Father: TMailPart);
  begin

    if Father = nil then
    begin

      SetLabelValue(_C_T, _M_A);
      SetLabelParamValue(_C_T, _BDRY, '"'+GenerateBoundary+'_alternative"');
      TmpAlternative := Self;
    end
    else
    begin

      TmpAlternative := TMailPart.Create(Self);
      TmpAlternative.FOwnerMessage := Self;
      TmpAlternative.FOwnerPart := Father;
      TmpAlternative.FParentBoundary := Father.GetBoundary;
      TmpAlternative.SetLabelValue(_C_T, _M_A);
      TmpAlternative.SetLabelParamValue(_C_T, _BDRY, '"'+GenerateBoundary+'_alternative"');
      Father.FSubPartList.Add(TmpAlternative);
    end;
  end;

  procedure CreateTextPlain(Father: TMailPart);
  begin

    FTextPlainPart.Remove;

    if Father = nil then
    begin

      SetLabelValue(_C_T, _T_P);
      SetLabelValue(_C_D, _INLN);
      FTextPlainPart.Decode;
      FTextPlainPart.FDecoded.Position := 0;
      FDecoded.LoadFromStream(FTextPlainPart.FDecoded);
      Encode(FTextEncoding);
      FTextPlainPart.Free;
      FTextPlainPart := Self;
    end
    else
    begin

      FTextPlainPart.FOwnerPart := Father;
      FTextPlainPart.FParentBoundary := Father.GetBoundary;
      FTextPlainPart.SetLabelValue(_C_T, _T_P);
      FTextPlainPart.SetLabelValue(_C_D, _INLN);
      FTextPlainPart.Decode;
      FTextPlainPart.Encode(FTextEncoding);
      FTextPlainPart.SetLabelValue(_C_L, IntToStr(FTextPlainPart.FBody.Size));
      FTextPlainPart.FSubPartList.Clear;
      Father.FSubPartList.Add(FTextPlainPart);
    end;
  end;

  procedure CreateTextHTML(Father: TMailPart);
  begin

    FTextHTMLPart.Remove;

    if Father = nil then
    begin

      SetLabelValue(_C_T, _T_H);
      SetLabelValue(_C_D, _INLN);
      FTextHTMLPart.Decode;
      FTextHTMLPart.FDecoded.Position := 0;
      FDecoded.LoadFromStream(FTextHTMLPart.FDecoded);
      Encode(FTextEncoding);
      FTextHTMLPart.Free;
      FTextHTMLPart := Self;
    end
    else
    begin

      FTextHTMLPart.FOwnerPart := Father;
      FTextHTMLPart.FParentBoundary := Father.GetBoundary;
      FTextHTMLPart.SetLabelValue(_C_T, _T_H);
      FTextHTMLPart.SetLabelValue(_C_D, _INLN);
      FTextHTMLPart.Decode;
      FTextHTMLPart.Encode(FTextEncoding);
      FTextHTMLPart.SetLabelValue(_C_L, IntToStr(FTextHTMLPart.FBody.Size));
      FTextHTMLPart.FSubPartList.Clear;
      Father.FSubPartList.Add(FTextHTMLPart);
    end;
  end;

  procedure CreateAttachment(var Part: TMailPart; Father: TMailPart);
  begin

    Part.Remove;

    if Part.GetLabelValue(_C_T) = '' then
    begin

      Part.SetLabelValue(_C_T, _A_OS);
    end;

    FName := Part.GetFileName;

    if (FName = '') then
    begin

      FName := 'file_'+IntToStr(FNameCount)+GetMimeExtension(Part.GetLabelValue(_C_T));
      Inc(FNameCount);
    end;

    Part.SetLabelValue(_XM2A, '"'+EncodeLine7Bit(FName, FCharSet)+'"');

    if Part.FEmbedded then
    begin

      Part.SetLabelParamValue(_XM2A, _EMBD, 'yes');

      case FEmbedMethod of

        emContentID:
          if Part.GetLabelValue(_C_ID) = '' then
            Part.SetLabelValue(_C_ID, '<'+FName+'>');

        emContentLocation:
          Part.SetLabelValue(_C_LC, FContentLocationBase+FName);
      end;

      Part.SetLabelValue(_C_D, _INLN);
      Part.FOwnerPart := TmpRelated;
      Part.FParentBoundary := TmpRelated.GetBoundary;
      TmpRelated.FSubPartList.Add(Part);
    end
    else
    begin

      Part.SetLabelParamValue(_XM2A, _EMBD, 'no');

      if (Part.GetLabelParamValue(_C_T, _NAME) = '') then
      begin

        Part.SetLabelParamValue(_C_T, _NAME, '"'+EncodeLine7Bit(FName, FCharSet)+'"');
      end;

      if (Part.GetLabelParamValue(_C_D, _FLNM) = '') then
      begin

        Part.SetLabelParamValue(_C_D, _FLNM, '"'+EncodeLine7Bit(FName, FCharSet)+'"');
      end;

      if Father <> nil then
      begin

        Part.SetLabelValue(_C_D, _ATCH);
        Part.FOwnerPart := Father;
        Part.FParentBoundary := Father.GetBoundary;
        Father.FSubPartList.Add(Part);
      end
      else
      begin

        // Search for "Content-"

        nOcor := 0;

        repeat
        begin

          nLoop := SearchStringList(Part.FHeader, _CONT, nOcor);
          Inc(nOcor);
          if nLoop >= 0 then
            FHeader.Add(Part.FHeader[nLoop]);
        end
        until nLoop < 0;

        // Search for "X-Mail2000-"

        nOcor := 0;

        repeat
        begin

          nLoop := SearchStringList(Part.FHeader, _X_M2, nOcor);
          Inc(nOcor);
          if nLoop >= 0 then
            FHeader.Add(Part.FHeader[nLoop]);
        end
        until nLoop < 0;

        if not Part.FIsDecoded then
          Part.Decode; 

        Part.FDecoded.Position := 0;
        FDecoded.LoadFromStream(Part.FDecoded);
        Encode(etBase64);
        FAttachList.Delete(FAttachList.IndexOf(Part));
        FAttachList.Add(Self);
        Part.Free;
      end;
    end;
  end;

begin

  if (not FNeedNormalize) and (Kind = nrFirst) then
    Exit;

  FindParts;

  FNeedRebuild := True;
  FNeedNormalize := False;
  FNameCount := 0;
  nTexts := 0;
  nAttachs := 0;
  nEmbedded := 0;

  // What content has this mail?

  case Kind of

    nrAddText: Inc(nTexts);
    nrAddAttach: Inc(nAttachs);
    nrAddEmbedded: Inc(nEmbedded);
  end;

  if FTextPlainPart <> nil then
    Inc(nTexts);

  if FTextHTMLPart <> nil then
    Inc(nTexts);

  for nLoop := 0 to FAttachList.Count-1 do
    if FAttachList[nLoop].FEmbedded then
      Inc(nEmbedded)
    else
      Inc(nAttachs);

  // Save current main body

  if (FBody.Size > 0) then
  begin

    SaveBody := TMailPart.Create(Self);
    SaveBody.FBody.LoadFromStream(FBody);
    SaveBody.FOwnerMessage := Self;

    // Copy content fields from main header

    nOcor := 0;

    repeat
    begin

      nLoop := SearchStringList(FHeader, _CONT, nOcor);
      Inc(nOcor);
      if nLoop >= 0 then
        SaveBody.FHeader.Add(FHeader[nLoop]);
    end
    until nLoop < 0;

    // Classify main body

    if Self = FTextPlainPart then
      FTextPlainPart := SaveBody
    else
      if Self = FTextHTMLPart then
        FTextHTMLPart := SaveBody
      else
        if Self = FMixedPart then
          FMixedPart := SaveBody
        else
          if Self = FRelatedPart then
            FRelatedPart := SaveBody
          else
            if Self = FAlternativePart then
              FAlternativePart := SaveBody
            else
              if (FSubPartList.Count = 0) then
                FAttachList.Add(SaveBody)
              else
                SaveBody.Free;
  end;

  // If entire mail is an attach, remove from list.

  if FAttachList.IndexOf(Self) >= 0 then
    FAttachList.Delete(FAttachList.IndexOf(Self));

  // Create new multiparts

  SetLabelValue(_C_T, '');
  SetLabelValue(_C_TE, '');
  SetLabelValue(_C_D, '');
  SetLabelValue(_C_ID, '');
  SetLabelValue(_C_LC, '');
  SetLabelValue(_C_L, '');
  SetLabelValue(_M_V, '1.0');
  SetLabelValue(_X_M, _XMailer);
  SetLabelValue(_XM2A, '');

  TmpMixed := nil;
  TmpRelated := nil;
  TmpAlternative := nil;
  FTextFather := nil;

  // There are more than one attachment?

  if nAttachs > 1 then
  begin

    CreateMixed(nil);
    FTextFather := TmpMixed;
  end;

  // There are texts plus attachments?

  if (nAttachs > 0) and (nTexts > 0) then
  begin

    CreateMixed(nil);
    FTextFather := TmpMixed;
  end;

  // There are attachments and embedded attachments?

  if (nAttachs > 0) and (nEmbedded > 0) then
  begin

    CreateMixed(nil);
    FTextFather := TmpMixed;
  end;

  // There are embedded attachments?

  if nEmbedded > 0 then
  begin

    CreateRelated(TmpMixed);
    FTextFather := TmpRelated;
  end;

  // There are more than one text?

  if nTexts > 1 then
  begin

    CreateAlternative(FTextFather);
    FTextFather := TmpAlternative;
  end;

  // Normalize text parts

  if FTextPlainPart <> nil then
    CreateTextPlain(FTextFather);

  if FTextHTMLPart <> nil then
    CreateTextHTML(FTextFather);

  // Normalize attachments

  for nLoop := 0 to FAttachList.Count-1 do
  begin

    TmpPart := FAttachList[nLoop];
    CreateAttachment(TmpPart, TmpMixed);
  end;

  // Remove old multiparts

  if (FAlternativePart <> nil) and (FAlternativePart <> Self) then
  begin

    FAlternativePart.Remove;
    FAlternativePart.Free;
  end;

  if (FRelatedPart <> nil) and (FRelatedPart <> Self) then
  begin

    FRelatedPart.Remove;
    FRelatedPart.Free;
  end;

  if (FMixedPart <> nil) and (FMixedPart <> Self) then
  begin

    FMixedPart.Remove;
    FMixedPart.Free;
  end;

  FMixedPart := TmpMixed;
  FRelatedPart := TmpRelated;
  FAlternativePart := TmpAlternative;
end;

// Insert a text on message

procedure TMailMessage2000.PutText(Text: String; var Part: TMailPart; Content: String);
begin

  if Part = nil then
    Normalize(nrAddText)
  else
    Normalize(nrFirst);

  Text := AdjustLineBreaks(Text);

  if Part = nil then
  begin

    if FTextFather <> nil then
    begin

      Part := TMailPart.Create(Self);
      Part.FOwnerPart := FTextFather;
      Part.FOwnerMessage := Self.FOwnerMessage;
      Part.FParentBoundary := FTextFather.GetBoundary;

      // Keep texts on beginning of this section

      if LowerCase(Content) = _T_P then
      begin

        FTextFather.FSubPartList.Insert(0, Part);
      end
      else
      begin

        if LowerCase(Content) = _T_H then
        begin

          if FTextFather.FSubPartList.Items[0].GetAttachInfo = _T_P then
          begin

            FTextFather.FSubPartList.Insert(1, Part);
          end
          else
          begin

            FTextFather.FSubPartList.Insert(0, Part);
          end;
        end
        else
        begin

          FTextFather.FSubPartList.Add(Part);
        end;
      end;
    end
    else
    begin

      Part := Self;
    end;
  end;

  Part.Decoded.Clear;
  Part.Decoded.Write(Text[1], Length(Text));
  Part.Encode(FTextEncoding);

  Part.SetLabelValue(_C_T, Content);
  Part.SetLabelParamValue(_C_T, _CSET, '"'+FCharset+'"');
  Part.SetLabelValue(_C_D, _INLN);
  Part.SetLabelValue(_C_L, IntToStr(Part.FBody.Size));

  FNeedRebuild := True;
end;

// Remove a text from message

procedure TMailMessage2000.RemoveText(var Part: TMailPart);
begin

  Normalize(nrFirst);

  if Part <> nil then
  begin

    if Part <> Self then
    begin

      Part.Remove;
      Part.Free;
    end
    else
    begin

      FBody.Clear;
      FDecoded.Clear;
      SetLabelValue(_C_T, '');
      SetLabelValue(_C_TE, '');
      SetLabelValue(_C_D, '');
      SetLabelValue(_C_L, '');
      SetLabelValue(_XM2A, '');
    end;
  end;

  Part := nil;
  Normalize(nrForce);
  FNeedRebuild := True;
end;

// Replace or create a mailpart for text/plain

procedure TMailMessage2000.SetTextPlain(const Text: String);
begin

  PutText(Text, FTextPlainPart, _T_P);
  FTextPlain.Text := Text;
end;

// Replace or create a mailpart for text/html

procedure TMailMessage2000.SetTextHTML(const Text: String);
begin

  PutText(Text, FTextHTMLPart, _T_H);
  FTextHTML.Text := Text;
end;

// Remove text/plain mailpart

procedure TMailMessage2000.RemoveTextPlain;
begin

  if FTextPlainPart <> nil then
  begin

    RemoveText(FTextPlainPart);
    FTextPlain.Clear;
  end;
end;

// Remove text/html mailpart

procedure TMailMessage2000.RemoveTextHTML;
begin

  if FTextHTMLPart <> nil then
  begin

    RemoveText(FTextHTMLPart);
    FTextHTML.Clear;
  end;
end;

// Create a mailpart and encode the file

procedure TMailMessage2000.AttachFile(const FileName: String; const ContentType: String = ''; const IsEmbedded: Boolean = False);
var
  MemFile: TMemoryStream;

begin

  MemFile := TMemoryStream.Create;
  MemFile.LoadFromFile(FileName);

  AttachStream(MemFile, FileName, ContentType, IsEmbedded);

  MemFile.Free;
end;

// Create a mailpart and encode the string

procedure TMailMessage2000.AttachString(const Text, FileName: String; const ContentType: String = ''; const IsEmbedded: Boolean = False);
var
  MemFile: TMemoryStream;

begin

  MemFile := TMemoryStream.Create;
  MemFile.WriteBuffer(Text[1], Length(Text));

  AttachStream(MemFile, FileName, ContentType, IsEmbedded);

  MemFile.Free;
end;

// Create a mailpart and encode the stream

procedure TMailMessage2000.AttachStream(const AStream: TStream; const FileName: String; const ContentType: String = ''; const IsEmbedded: Boolean = False);
var
  Part, Father: TMailPart;

begin

  if IsEmbedded then
  begin

    Normalize(nrAddEmbedded);
    Father := FRelatedPart;
  end
  else
  begin

    Normalize(nrAddAttach);
    Father := FMixedPart;
  end;

  if Father <> nil then
  begin

    Part := TMailPart.Create(Self);
    Part.FOwnerMessage := Self;
    Part.FOwnerPart := Father;
    Part.FParentBoundary := Father.GetBoundary;
    Father.FSubPartList.Add(Part);
  end
  else
  begin

    Part := Self;
  end;

  AStream.Position := 0;
  Part.Decoded.LoadFromStream(AStream);
  Part.Decoded.Position := 0;
  Part.Encode(FAttachEncoding);

  if ContentType = '' then
    Part.SetLabelValue(_C_T, GetMimeType(ExtractFileName(FileName)))
  else
    Part.SetLabelValue(_C_T, ContentType);

  Part.SetLabelValue(_XM2A, '"'+EncodeLine7Bit(ExtractFileName(FileName), FCharSet)+'"');
  Part.SetLabelValue(_C_L, IntToStr(Part.FBody.Size));
  Part.FEmbedded := IsEmbedded;

  if IsEmbedded then
  begin

    Part.SetLabelValue(_C_D, _INLN);
    Part.SetLabelParamValue(_XM2A, _EMBD, 'yes');

    case FEmbedMethod of

      emContentID:
        Part.SetLabelValue(_C_ID, '<'+ ExtractFileName(FileName) +'>');

      emContentLocation:
        Part.SetLabelValue(_C_LC, FContentLocationBase + ExtractFileName(FileName));
    end;
  end
  else
  begin

    Part.SetLabelValue(_C_D, _ATCH);
    Part.SetLabelParamValue(_C_T, _NAME, '"'+EncodeLine7Bit(ExtractFileName(FileName), FCharSet)+'"');
    Part.SetLabelParamValue(_C_D, _FLNM, '"'+EncodeLine7Bit(ExtractFileName(FileName), FCharSet)+'"');
    Part.SetLabelParamValue(_XM2A, _EMBD, 'no');
  end;

  FAttachList.Add(Part);

  FNeedRebuild := True;
end;

// Remove attached file from message

procedure TMailMessage2000.DetachFile(const FileName: String);
var
  nLoop: Integer;

begin

  Normalize(nrFirst);

  for nLoop := 0 to FAttachList.Count-1 do
  begin

    if LowerCase(FAttachList[nLoop].FileName) = LowerCase(ExtractFileName(FileName)) then
    begin

      if FAttachList[nLoop] <> Self then
      begin

        FAttachList[nLoop].Remove;
        FAttachList[nLoop].Free;
      end
      else
      begin

        SetLabelValue(_C_T, '');
        SetLabelValue(_C_TE, '');
        SetLabelValue(_C_D, '');
        SetLabelValue(_C_L, '');
        SetLabelValue(_C_ID, '');
        SetLabelValue(_C_LC, '');
        SetLabelValue(_XM2A, '');
        FBody.Clear;
        FDecoded.Clear;
      end;

      FAttachList.Delete(nLoop);
      FNeedRebuild := True;
      Break;
    end;
  end;

  if not FNeedRebuild then
    raise Exception.CreateFmt(_E_ATFN, [Self.Name, FileName])
  else
    Normalize(nrForce);
end;

// Remove attached file from message by AttachList index

procedure TMailMessage2000.DetachFileIndex(const Index: Integer);
begin

  Normalize(nrFirst);

  if (Index < FAttachList.Count) and (Index >= 0) then
  begin

    if FAttachList[Index] <> Self then
    begin

      FAttachList[Index].Remove;
      FAttachList[Index].Free;
    end
    else
    begin

      SetLabelValue(_C_T, '');
      SetLabelValue(_C_TE, '');
      SetLabelValue(_C_D, '');
      SetLabelValue(_C_L, '');
      SetLabelValue(_C_ID, '');
      SetLabelValue(_C_LC, '');
      SetLabelValue(_XM2A, '');
      FBody.Clear;
      FDecoded.Clear;
    end;

    FAttachList.Delete(Index);
    FNeedRebuild := True;
    Normalize(nrForce);
  end
  else
    raise Exception.CreateFmt(_E_ATIN, [Self.Name]);
end;

// Find the part containing the specified attachment

function TMailMessage2000.GetAttach(const FileName: String): TMailPart;
var
  nLoop: Integer;

begin

  Normalize(nrFirst);

  Result := nil;

  for nLoop := 0 to FAttachList.Count-1 do
  begin

    if LowerCase(FAttachList[nLoop].FileName) = LowerCase(FileName) then
    begin

      Result := FAttachList[nLoop];
      Break;
    end;
  end;
end;

// Rebuild body text according to the mailparts

procedure TMailMessage2000.RebuildBody;
var
  sLine: String;

  procedure RebuildBodyRec(MP: TMailPart);
  var
    Loop: Integer;
    Line: Integer;
    Data: String;
    nPos: Integer;

  begin

    for Loop := 0 to MP.SubPartList.Count-1 do
    begin

      sLine := #13#10;
      FBody.Write(sLine[1], Length(sLine));

      sLine :=  '--'+MP.SubPartList[Loop].FParentBoundary+#13#10;
      FBody.Write(sLine[1], Length(sLine));

      for Line := 0 to MP.SubPartList[Loop].FHeader.Count-1 do
      begin

        if Length(MP.SubPartList[Loop].FHeader[Line]) > 0 then
        begin

          sLine := MP.SubPartList[Loop].FHeader[Line]+#13#10;
          FBody.Write(sLine[1], Length(sLine));
        end;
      end;

      sLine := #13#10;
      FBody.Write(sLine[1], Length(sLine));

      if MP.SubPartList[Loop].SubPartList.Count > 0 then
      begin

        RebuildBodyRec(MP.SubPartList[Loop]);
      end
      else
      begin

        SetLength(Data, MP.SubPartList[Loop].FBody.Size);

        if MP.SubPartList[Loop].FBody.Size > 0 then
        begin

          MP.SubPartList[Loop].FBody.Position := 0;
          MP.SubPartList[Loop].FBody.ReadBuffer(Data[1], MP.SubPartList[Loop].FBody.Size);

          nPos := 1;

          while nPos >= 0 do
          begin

            DataLine(Data, sLine, nPos);

            sLine := sLine;
            FBody.Write(sLine[1], Length(sLine));
          end;
        end;
      end;
    end;

    if MP.SubPartList.Count > 0 then
    begin

      sLine := #13#10;
      FBody.Write(sLine[1], Length(sLine));

      sLine := '--'+MP.SubPartList[0].FParentBoundary+'--'#13#10;
      FBody.Write(sLine[1], Length(sLine));
    end;
  end;

begin

  if not FNeedRebuild then
    Exit;

  if SubPartList.Count > 0 then
  begin

    FBody.Clear;

    sLine := _MIME_Msg;
    FBody.Write(sLine[1], Length(sLine));

    RebuildBodyRec(Self);
  end;

  SetLabelValue(_C_L, IntToStr(FBody.Size));

  FNeedRebuild := False;
end;

// Empty data stored in the object

procedure TMailMessage2000.Reset;
var
  Loop: Integer;

begin

  for Loop := 0 to FSubPartList.Count-1 do
    FSubPartList.Items[Loop].Destroy;

  FHeader.Clear;
  FBody.Clear;
  FDecoded.Clear;
  FSubPartList.Clear;

  FAttachList.Clear;
  FTextPlain.Clear;
  FTextHTML.Clear;
  FTextPlainPart := nil;
  FTextHTMLPart := nil;
  FMixedPart := nil;
  FRelatedPart := nil;
  FAlternativePart := nil;
  FNeedRebuild := False;
  FNeedNormalize := False;
  FNeedFindParts := False;
  FNameCount := 0;
end;

{ TSocketTalk =================================================================== }

// Initialize TSocketTalk

constructor TSocketTalk.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  FClientSocket := TClientSocket.Create(Self);
  FClientSocket.ClientType := ctNonBlocking;
  FClientSocket.OnRead := SocketRead;
  FClientSocket.OnDisconnect := SocketDisconnect;
  FClientSocket.Socket.OnErrorEvent := SocketError;

  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.OnTimer := Timer;

  FTimeOut := 60;
  FLastResponse := '';
  FExpectedEnd := '';
  FDataSize := 0;
  FPacketSize := 0;
  FTalkError := teNoError;
end;

// Finalize TSocketTalk

destructor TSocketTalk.Destroy;
begin

  FClientSocket.Free;
  FTimer.Free;

  inherited Destroy;
end;

// Occurs when data is comming from the socket

procedure TSocketTalk.SocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
  Buffer: String;
  BufLen: Integer;

begin

  SetLength(Buffer, Socket.ReceiveLength);
  BufLen := Socket.ReceiveBuf(Buffer[1], Length(Buffer));
  FLastResponse := FLastResponse + Copy(Buffer, 1, BufLen);
  FTalkError := teNoError;
  FTimer.Enabled := False;

  if Assigned(FOnReceiveData) then
  begin

    FOnReceiveData(Self, FSessionState, Buffer, FServerResult);
  end;

  if (FDataSize > 0) and Assigned(FOnProgress) then
  begin

    FOnProgress(Self.Owner, FDataSize, Length(FLastResponse));
  end;

  if (FExpectedEnd = '') or (Copy(FLastResponse, Length(FLastResponse)-Length(FExpectedEnd)+1, Length(FExpectedEnd)) = FExpectedEnd) then
  begin

    FTalkError := teNoError;
    FDataSize := 0;
    FExpectedEnd := '';
    FWaitingServer := False;

    if Assigned(FOnEndOfData) then
    begin

      FOnEndOfData(Self, FSessionState, FLastResponse, FServerResult);
    end;

    FSessionState := stNone;
  end
  else
  begin

    FTimer.Enabled := True;
  end;
end;

// Occurs when socket is disconnected

procedure TSocketTalk.SocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin

  if Assigned(FOnDisconnect) then
    FOnDisconnect(Self);

  FTimer.Enabled := False;
  FWaitingServer := False;
  FSessionState := stNone;
  FExpectedEnd := '';
  FDataSize := 0;
  FPacketSize := 0;
end;

// Occurs on socket error

procedure TSocketTalk.SocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin

  FTimer.Enabled := False;
  FTalkError := TTalkError(Ord(ErrorEvent));
  FDataSize := 0;
  FExpectedEnd := '';
  FWaitingServer := False;
  FServerResult := False;

  if Assigned(FOnSocketTalkError) then
  begin

    FOnSocketTalkError(Self, FSessionState, FTalkError);
  end;

  FSessionState := stNone;
  ErrorCode := 0;
end;

// Occurs on timeout

procedure TSocketTalk.Timer(Sender: TObject);
begin

  FTimer.Enabled := False;
  FTalkError := teTimeout;
  FDataSize := 0;
  FExpectedEnd := '';
  FWaitingServer := False;
  FServerResult := False;

  if Assigned(FOnSocketTalkError) then
  begin

    FOnSocketTalkError(Self, FSessionState, FTalkError);
  end;

  FSessionState := stNone;
end;

// Cancel the waiting for server response

procedure TSocketTalk.Cancel;
begin

  FTimer.Enabled := False;
  FTalkError := teNoError;
  FSessionState := stNone;
  FExpectedEnd := '';
  FDataSize := 0;
  FWaitingServer := False;
  FServerResult := False;
end;

// Inform that the data comming belongs

procedure TSocketTalk.ForceState(SessionState: TSessionState);
begin

  FExpectedEnd := '';
  FLastResponse := '';
  FTimer.Interval := FTimeOut * 1000;
  FTimer.Enabled := True;
  FDataSize := 0;
  FTalkError := teNoError;
  FSessionState := SessionState;
  FWaitingServer := True;
  FServerResult := False;
end;

// Send a command to server

procedure TSocketTalk.Talk(Buffer, EndStr: String; SessionState: TSessionState);
var
  nPos: Integer;
  nLen: Integer;

begin

  FExpectedEnd := EndStr;
  FSessionState := SessionState;
  FLastResponse := '';
  FTimer.Interval := FTimeOut * 1000;
  FTalkError := teNoError;
  FWaitingServer := True;
  FServerResult := False;
  nPos := 1;

  if (FPacketSize > 0) and (Length(Buffer) > FPacketSize) then
  begin

    if Assigned(OnProgress) then
      OnProgress(Self.Owner, Length(Buffer), 0);

    while nPos <= Length(Buffer) do
    begin

      Application.ProcessMessages;

      if (nPos+FPacketSize-1) > Length(Buffer) then
        nLen := Length(Buffer)-nPos+1
      else
        nLen := FPacketSize;

      FTimer.Enabled := True;

      while (FClientSocket.Socket.SendBuf(Buffer[nPos], nLen) = -1) do
        Sleep(10);

      FTimer.Enabled := False;
      nPos := nPos + nLen;

      if Assigned(OnProgress) then
        OnProgress(Self.Owner, Length(Buffer), nPos-1);
    end;

    if Assigned(OnProgress) then
      OnProgress(Self.Owner, Length(Buffer), Length(Buffer));
  end
  else
  begin

    while (FClientSocket.Socket.SendBuf(Buffer[1], Length(Buffer)) = -1 )
       do Sleep (10);
  end;

  FPacketSize := 0;
end;

// Wait for server response
// by Rene de Jong (rmdejong@ism.nl)

procedure TSocketTalk.WaitServer;
begin

  FTimer.Interval := FTimeOut * 1000;

  while FWaitingServer and (not FServerResult) do
  begin

    FTimer.Enabled := True;
    Application.ProcessMessages;
  end;

  FTimer.Enabled := False;
end;

{ TPOP2000 ====================================================================== }

// Initialize TPOP2000

constructor TPOP2000.Create;
begin

  FSocketTalk := TSocketTalk.Create(Self);
  FSocketTalk.OnEndOfData := EndOfData;
  FSocketTalk.OnSocketTalkError := SocketTalkError;
  FSocketTalk.OnReceiveData := ReceiveData;
  FSocketTalk.OnDisconnect := SocketDisconnect;

  FHost := '';
  FPort := 110;
  FUserName := '';
  FPassword := '';
  FSessionMessageCount := -1;
  FSessionConnected := False;
  FSessionLogged := False;
  FMailMessage := nil;
  FDeleteOnRetrieve := False;

  SetLength(FSessionMessageSize, 0);

  inherited Create(AOwner);
end;

// Finalize TPOP2000

destructor TPOP2000.Destroy;
begin

  FSocketTalk.Free;

  SetLength(FSessionMessageSize, 0);

  inherited Destroy;
end;

// Set timeout

procedure TPOP2000.SetTimeOut(Value: Integer);
begin

  FSocketTalk.TimeOut := Value;
end;

// Get timeout

function TPOP2000.GetTimeOut: Integer;
begin

  Result := FSocketTalk.TimeOut;
end;

// Set OnProgress event

procedure TPOP2000.SetProgress(Value: TProgressEvent);
begin

  FSocketTalk.OnProgress := Value;
end;

// Get OnProgress event

function TPOP2000.GetProgress: TProgressEvent;
begin

  Result := FSocketTalk.OnProgress;
end;

// Get LastResponse

function TPOP2000.GetLastResponse: String;
begin

  Result := FSocketTalk.LastResponse;
end;

// When data from server ends

procedure TPOP2000.EndOfData(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean);
begin

  case SessionState of

    stConnect, stUser, stPass, stStat, stList, stRetr, stQuit, stDele, stUIDL:
    if Copy(Data, 1, 3) = '+OK' then
      ServerResult := True;
  end;
end;

// On socket error

procedure TPOP2000.SocketTalkError(Sender: TObject; SessionState: TSessionState; TalkError: TTalkError);
begin

  FSocketTalk.Cancel;
end;

// On data received

procedure TPOP2000.ReceiveData(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean);
begin

  if (Copy(Data, 1, 4) = '-ERR') and (Copy(Data, Length(Data)-1, 2) = #13#10) then
  begin

    ServerResult := False;
    FSocketTalk.Cancel;
  end;
end;

// On socket disconnected

procedure TPOP2000.SocketDisconnect(Sender: TObject);
begin

  FSessionMessageCount := -1;
  FSessionConnected := False;
  FSessionLogged := False;

  SetLength(FSessionMessageSize, 0);
end;

// Connect socket

function TPOP2000.Connect: Boolean;
begin

  if FSessionConnected or FSocketTalk.ClientSocket.Active then
  begin

    Result := False;
    Exit;
  end;

  if Length(FHost) = 0 then
  begin

    Result := False;
    Exit;
  end;

  if not IsIPAddress(FHost) then
  begin

    FSocketTalk.ClientSocket.Host := FHost;
    FSocketTalk.ClientSocket.Address := '';
  end
  else
  begin

    FSocketTalk.ClientSocket.Host := '';
    FSocketTalk.ClientSocket.Address := FHost;
  end;

  FSocketTalk.ClientSocket.Port := FPort;
  FSocketTalk.ForceState(stConnect);
  FSocketTalk.ClientSocket.Open;

  FSocketTalk.WaitServer;

  FSessionConnected := FSocketTalk.ServerResult;
  Result := FSocketTalk.ServerResult;
end;

// POP3 Logon

function TPOP2000.Login: Boolean;
var
  MsgList: TStringList;
  Loop: Integer;
  cStat: String;

begin

  Result := False;

  if (not FSessionConnected) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.Talk('USER'#32+FUserName+#13#10, #13#10, stUser);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    FSocketTalk.Talk('PASS'#32+FPassword+#13#10, #13#10, stPass);
    FSocketTalk.WaitServer;

    if FSocketTalk.ServerResult then
    begin

      FSessionLogged := True;

      FSocketTalk.Talk('LIST'#13#10, _DATAEND1, stList);
      FSocketTalk.WaitServer;

      if FSocketTalk.ServerResult then
      begin

        MsgList := TStringList.Create;
        MsgList.Text := FSocketTalk.LastResponse;

        if MsgList.Count > 2 then
        begin

          cStat := TrimSpace(MsgList[MsgList.Count-2]);

          FSessionMessageCount := StrToIntDef(Copy(cStat, 1, Pos(#32, cStat)-1), -1);

          if FSessionMessageCount > 0 then
          begin

            for Loop := 1 to MsgList.Count-2 do
            begin

              cStat := TrimSpace(MsgList[Loop]);
              cStat := Copy(cStat, 1, Pos(#32, cStat)-1);

              SetLength(FSessionMessageSize, StrToInt(cStat)+1);

              if StrToIntDef(cStat, 0) > 0 then
                FSessionMessageSize[StrToInt(cStat)] := StrToIntDef(Copy(MsgList[Loop], Pos(#32, MsgList[Loop])+1, 99), 0);
            end;

            FSessionMessageSize[0] := 0;
          end;
        end
        else
        begin

          FSessionMessageCount := 0;
          SetLength(FSessionMessageSize, 0);
        end;

        MsgList.Free;
      end;
    end;
  end;

  Result := FSessionLogged;
end;

// POP3 Quit

function TPOP2000.Quit: Boolean;
begin

  Result := False;

  if (not FSessionConnected) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.Talk('QUIT'#13#10, #13#10, stQuit);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    FSocketTalk.ClientSocket.Close;
    FSessionConnected := False;
    FSessionLogged := False;
    FSessionMessageCount := -1;
    Result := True;
  end;
end;

// Force disconnection

procedure TPOP2000.Abort;
begin

  FSocketTalk.ClientSocket.Close;
  FSessionConnected := False;
  FSessionLogged := False;
  FSessionMessageCount := -1;
end;

// Retrieve message#

function TPOP2000.RetrieveMessage(Number: Integer): Boolean;
var
  MailTxt: TStringList;

begin

  Result := False;
  FLastMessage := '';

  if (not FSessionConnected) or (not FSessionLogged) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.DataSize := FSessionMessageSize[Number-1];
  FSocketTalk.Talk('RETR'#32+IntToStr(Number)+#13#10, _DATAEND1, stRetr);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    MailTxt := TStringList.Create;
    MailTxt.Text := FSocketTalk.LastResponse;
    MailTxt.Delete(MailTxt.Count-1);
    MailTxt.Delete(0);
    FLastMessage := MailTxt.Text;
    MailTxt.Free;

    if Assigned(FMailMessage) then
    begin

      FMailMessage.Reset;
      FMailMessage.Fill(PChar(FLastMessage), True);
    end;

    Result := True;

    if FDeleteOnRetrieve then
      DeleteMessage(Number);
  end;
end;

// Retrieve message# (only header)

function TPOP2000.RetrieveHeader(Number: Integer; Lines: Integer = 0): Boolean;
var
  MailTxt: TStringList;

begin

  Result := False;
  FLastMessage := '';

  if (not FSessionConnected) or (not FSessionLogged) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.DataSize := FSessionMessageSize[Number-1];
  FSocketTalk.Talk('TOP'#32+IntToStr(Number)+#32+IntToStr(Lines)+#13#10, _DATAEND1, stRetr);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    MailTxt := TStringList.Create;
    MailTxt.Text := FSocketTalk.LastResponse;
    MailTxt.Delete(MailTxt.Count-1);
    MailTxt.Delete(0);
    FLastMessage := MailTxt.Text;
    MailTxt.Free;

    if Assigned(FMailMessage) then
    begin

      FMailMessage.Reset;
      FMailMessage.FHeader.Text := PChar(FLastMessage);
    end;

    Result := True;
  end;
end;

// Delete message#

function TPOP2000.DeleteMessage(Number: Integer): Boolean;
begin

  Result := False;

  if (not FSessionConnected) or (not FSessionLogged) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.Talk('DELE'#32+IntToStr(Number)+#13#10, #13#10, stDele);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    Result := True;
  end;
end;

// Get UIDL from message#

function TPOP2000.GetUIDL(Number: Integer): String;
var
  MsgNum: String;

begin

  Result := '';
  MsgNum := IntToStr(Number);

  if (not FSessionConnected) or (not FSessionLogged) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.Talk('UIDL'#32+MsgNum+#13#10, #13#10, stUIDL);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    Result := FSocketTalk.LastResponse;
    Result := Trim(Copy(Result, Pos(MsgNum+#32, Result)+Length(MsgNum)+1, Length(Result)));
  end;
end;

{ TSMTP2000 ====================================================================== }

// Initialize TSMTP2000

constructor TSMTP2000.Create;
begin

  FSocketTalk := TSocketTalk.Create(Self);
  FSocketTalk.OnEndOfData := EndOfData;
  FSocketTalk.OnSocketTalkError := SocketTalkError;
  FSocketTalk.OnReceiveData := ReceiveData;
  FSocketTalk.OnDisconnect := SocketDisconnect;

  FHost := '';
  FPort := 25;
  FSessionConnected := False;
  FPacketSize := 102400;
  FUserName := '';
  FPassword := '';
  FHandshaking := hsAuto;

  inherited Create(AOwner);
end;

// Finalize TSMTP2000

destructor TSMTP2000.Destroy;
begin

  FSocketTalk.Free;

  inherited Destroy;
end;

// Set timeout

procedure TSMTP2000.SetTimeOut(Value: Integer);
begin

  FSocketTalk.TimeOut := Value;
end;

// Get timeout

function TSMTP2000.GetTimeOut: Integer;
begin

  Result := FSocketTalk.TimeOut;
end;

// Set OnProgress event

procedure TSMTP2000.SetProgress(Value: TProgressEvent);
begin

  FSocketTalk.OnProgress := Value;
end;

// Get OnProgress event

function TSMTP2000.GetProgress: TProgressEvent;
begin

  Result := FSocketTalk.OnProgress;
end;

// Get LastResponse

function TSMTP2000.GetLastResponse: String;
begin

  Result := FSocketTalk.LastResponse;
end;

// When data from server ends

procedure TSMTP2000.EndOfData(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean);
begin

  case SessionState of

    stConnect:
    if Copy(Data, 1, 3) = '220' then
      ServerResult := True;

    stHelo, stEhlo, stMail, stRcpt, stSendData:
    if Copy(Data, 1, 3) = '250' then
      ServerResult := True;

    stData:
    if Copy(Data, 1, 3) = '354' then
      ServerResult := True;

    stQuit:
    if Copy(Data, 1, 3) = '221' then
      ServerResult := True;

    stAuthLogin, stSMTPUser:
    if Copy(Data, 1, 3) = '334' then
      ServerResult := True;

    stSMTPPass:
    if Copy(Data, 1, 3) = '235' then
      ServerResult := True;

    stNoop: ServerResult := True;
  end;
end;

// On socket error

procedure TSMTP2000.SocketTalkError(Sender: TObject; SessionState: TSessionState; TalkError: TTalkError);
begin

  FSocketTalk.Cancel;
end;

// On data received

procedure TSMTP2000.ReceiveData(Sender: TObject; SessionState: TSessionState; Data: String; var ServerResult: Boolean);
begin

  if (StrToIntDef(Copy(Data, 1, 3), 0) >= 500) and (Copy(Data, Length(Data)-1, 2) = #13#10) then
  begin

    ServerResult := False;
    FSocketTalk.Cancel;
  end;
end;

// On socket disconnected

procedure TSMTP2000.SocketDisconnect(Sender: TObject);
begin

  FSessionConnected := False;
end;

// Connect socket

function TSMTP2000.Connect: Boolean;
var
  Buffer: String;

begin

  Result := False;

  if FSessionConnected or FSocketTalk.ClientSocket.Active then
  begin

    Exit;
  end;

  if Length(FHost) = 0 then
  begin

    Exit;
  end;

  if not IsIPAddress(FHost) then
  begin

    FSocketTalk.ClientSocket.Host := FHost;
    FSocketTalk.ClientSocket.Address := '';
  end
  else
  begin

    FSocketTalk.ClientSocket.Host := '';
    FSocketTalk.ClientSocket.Address := FHost;
  end;

  FNeedAuthentication := False;
  FSocketTalk.ClientSocket.Port := FPort;
  FSocketTalk.ForceState(stConnect);
  FSocketTalk.ClientSocket.Open;

  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    case FHandshaking of

      hsAuto:
      begin

        FSessionConnected := True;
        Buffer := FSocketTalk.FLastResponse;
        Result := Ehlo;
        Buffer := Buffer + FSocketTalk.FLastResponse;

        if not Result then
        begin

          Result := Helo;
          Buffer := Buffer + FSocketTalk.FLastResponse;
        end;

        if Result then
        begin

          if AuthLogin then
          begin

            Buffer := Buffer + FSocketTalk.FLastResponse;
            Result := Login;
            Buffer := Buffer + FSocketTalk.FLastResponse;
          end;
        end;

        FSocketTalk.FLastResponse := Buffer;
      end;

      hsManual:
      begin

        Result := True;
      end;
    end;
  end;

  FSessionConnected := Result;
end;

// Sends a HELO command

function TSMTP2000.Helo: Boolean;
begin

  Result := False;

  if (not FSessionConnected) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.Talk('HELO'#32+FSocketTalk.FClientSocket.Socket.LocalHost+#13#10, #13#10, stHelo);
  FSocketTalk.WaitServer;
  Result := FSocketTalk.ServerResult;
end;

// Sends a EHLO command

function TSMTP2000.Ehlo: Boolean;
begin

  Result := False;

  if (not FSessionConnected) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.Talk('EHLO'#32+FSocketTalk.FClientSocket.Socket.LocalHost+#13#10, #13#10, stEhlo);
  FSocketTalk.WaitServer;
  Result := FSocketTalk.ServerResult;
end;

// Sends a AUTH LOGIN command

function TSMTP2000.AuthLogin: Boolean;
begin

  Result := False;

  if (not FSessionConnected) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.Talk('AUTH LOGIN'#13#10, #13#10, stAuthLogin);
  FSocketTalk.WaitServer;
  FNeedAuthentication := FSocketTalk.ServerResult;
  Result := FSocketTalk.ServerResult;
end;

// Login to server

function TSMTP2000.Login: Boolean;
var
  EncUser, EncPass: String;

begin

  Result := False;

  if (not FSessionConnected) or (not FNeedAuthentication) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  EncUser := EncodeBASE64String(FUserName);
  EncPass := EncodeBASE64String(FPassword);

  FSocketTalk.Talk(EncUser+#13#10, #13#10, stSMTPUser);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    FSocketTalk.Talk(EncPass+#13#10, #13#10, stSMTPPass);
    FSocketTalk.WaitServer;
    Result := FSocketTalk.ServerResult;
  end;
end;

// SMTP Quit

function TSMTP2000.Quit: Boolean;
begin

  Result := False;

  if (not FSessionConnected) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  FSocketTalk.Talk('QUIT'#13#10, #13#10, stQuit);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    FSocketTalk.ClientSocket.Close;
    FSessionConnected := False;
    Result := True;
  end;
end;

// Force disconnection

procedure TSMTP2000.Abort;
begin

  FSocketTalk.ClientSocket.Close;
  FSessionConnected := False;
end;

// Send message

function TSMTP2000.SendMessage: Boolean;
var
  sDests: String;

begin

  if not Assigned(FMailMessage) then
  begin

    Exception.CreateFmt(_E_MMUN, [Self.Name]);
    Result := False;
    Exit;
  end;

  if FMailMessage.ToList.Count > 0 then
    sDests := FMailMessage.ToList.AllAddresses;

  if FMailMessage.CcList.Count > 0 then
  begin

    if sDests <> '' then sDests := sDests + ',';
    sDests := sDests + FMailMessage.CcList.AllAddresses;
  end;

  if FMailMessage.BccList.Count > 0 then
  begin

    if sDests <> '' then sDests := sDests + ',';
    sDests := sDests + FMailMessage.BccList.AllAddresses;
  end;

  Result := SendMessageTo(FMailMessage.FromAddress, sDests);
end;

// Send message to specified recipients

function TSMTP2000.SendMessageTo(const From, Dests: String): Boolean;
var
  Loop: Integer;
  AllOk: Boolean;
  sDests: TStringList;
  sHeader: String;

begin

  Result := False;

  if (not FSessionConnected) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  if not Assigned(FMailMessage) then
  begin

    Exception.CreateFmt(_E_MMUN, [Self.Name]);
    Exit;
  end;

  if FMailMessage.FNeedRebuild then
  begin

    Exception.CreateFmt(_E_MMNR, [Self.Name]);
    Exit;
  end;

  sDests := TStringList.Create;
  sDests.Sorted := True;
  sDests.Duplicates := dupIgnore;
  sDests.CommaText := Dests;

  if sDests.Count = 0 then
  begin

    Exception.CreateFmt(_E_NRTS, [Self.Name]);
    Exit;
  end;

  FSocketTalk.Talk('MAIL FROM: <'+From+'>'#13#10, #13#10, stMail);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    AllOk := True;

    for Loop := 0 to sDests.Count-1 do
    begin

      FSocketTalk.Talk('RCPT TO: <'+sDests[Loop]+'>'#13#10, #13#10, stRcpt);
      FSocketTalk.WaitServer;

      if not FSocketTalk.ServerResult then
      begin

        AllOk := False;
        Break;
      end;
    end;

    if AllOk then
    begin

      FMailMessage.SetMessageId(FSocketTalk.ClientSocket.Socket.LocalAddress);
      sHeader := FMailMessage.FHeader.Text;
      FMailMessage.SetLabelValue('Bcc', '');

      FSocketTalk.Talk('DATA'#13#10, #13#10, stData);
      FSocketTalk.WaitServer;

      if FSocketTalk.ServerResult then
      begin

        FSocketTalk.PacketSize := FPacketSize;
        FSocketTalk.Talk(StringReplace(FMailMessage.MessageSource, _DATAEND1, _DATAEND2, [rfReplaceAll])+_DATAEND1, #13#10, stSendData);
        FSocketTalk.WaitServer;

        if FSocketTalk.ServerResult then
        begin

          Result := True;
        end;
      end;

      FMailMessage.FHeader.Text := sHeader;
    end;
  end;

  sDests.Free;
end;

// Send string to specified recipients

function TSMTP2000.SendStringTo(const Msg, From, Dests: String): Boolean;
var
  Loop: Integer;
  AllOk: Boolean;
  sDests: TStringList;

begin

  Result := False;

  if (not FSessionConnected) or (not FSocketTalk.ClientSocket.Active) then
  begin

    Exit;
  end;

  sDests := TStringList.Create;
  sDests.Sorted := True;
  sDests.Duplicates := dupIgnore;
  sDests.CommaText := Dests;

  if sDests.Count = 0 then
  begin

    Exception.CreateFmt(_E_NRTS, [Self.Name]);
    Exit;
  end;

  FSocketTalk.Talk('MAIL FROM: <'+From+'>'#13#10, #13#10, stMail);
  FSocketTalk.WaitServer;

  if FSocketTalk.ServerResult then
  begin

    AllOk := True;

    for Loop := 0 to sDests.Count-1 do
    begin

      FSocketTalk.Talk('RCPT TO: <'+sDests[Loop]+'>'#13#10, #13#10, stRcpt);
      FSocketTalk.WaitServer;

      if not FSocketTalk.ServerResult then
      begin

        AllOk := False;
        Break;
      end;
    end;

    if AllOk then
    begin

      FSocketTalk.Talk('DATA'#13#10, #13#10, stData);
      FSocketTalk.WaitServer;

      if FSocketTalk.ServerResult then
      begin

        FSocketTalk.PacketSize := FPacketSize;
        FSocketTalk.Talk(StringReplace(Msg, _DATAEND1, _DATAEND2, [rfReplaceAll])+_DATAEND1, #13#10, stSendData);
        FSocketTalk.WaitServer;

        if FSocketTalk.ServerResult then
        begin

          Result := True;
        end;
      end;
    end;
  end;

  sDests.Free;
end;

// =============================================================================

begin

  Randomize;
end.
