unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Soap.EncdDecd, System.NetEncoding, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,
  IdCoderMIME, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxImage;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    Button6: TButton;
    cxImage1: TcxImage;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    function BitmapFromBase64(const base64: string): TPicture;
    function BitmapToBase64String(filename: string): string; overload;
    function BitmapToBase64String(filename: TImage): string; overload;

    function Base64FromBitmap(Bitmap: TGraphic): string;
    procedure DecodeFile(const Base64, FileName: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  const filenameB64 = 'G:\sources\javascript\Delphi_JS_Base64\filebase.txt';
  const fileimg = 'C:/Users/Administrador/Pictures/Screenshot_2021-09-04-12-05-25.png';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

begin
  if Memo1.Lines.Text = '' then
    Memo1.Lines.LoadFromFile(filenameB64);

  Image1.Picture :=   BitmapFromBase64(Memo1.Text);
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Text :=  BitmapToBase64String(Image1);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  OpenDialog1.Execute();
  Image1.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Image1.Picture.Bitmap := nil;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  Strm: TMemoryStream;
begin
  Strm := TMemoryStream.Create;
  try
    TIdDecoderMIME.DecodeStream(Memo1.Text, Strm);
    Strm.Position := 0;
    Image1.Picture.Bitmap.LoadFromStream(Strm);
  finally
    Strm.Free;
  end;

end;
procedure TForm1.Button6Click(Sender: TObject);
begin
  DecodeFile(Memo1.Text, GetCurrentDir+ '\imagem.jpeg');
end;

//
function TForm1.BitmapFromBase64(const base64: string): TPicture;
var
  BStream: TBytesStream;
begin
  BStream:= TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(Base64));
  try
    Result := TPicture.Create;
    BStream.Position := 0;
//    Image1.Picture.LoadFromStream(BStream);
    Result.LoadFromStream(BStream);
  finally
    BStream.Free;
  end;

end;


function TForm1.BitmapToBase64String(filename: string): string;
var
  LInput : TMemoryStream;
  LOutput: TMemoryStream;
  Image : TImage;
begin
  Image := TImage.Create(nil);
  Image.Picture.LoadFromFile(filename);
  LInput := TMemoryStream.Create;
  LOutput := TMemoryStream.Create;
  // write picture to stream and encode
  try
    Image.Picture.SaveToStream(LInput);
    LInput.Position := 0;
    TNetEncoding.Base64.Encode( LInput, LOutput );
    LOutput.Position := 0;
    SetString(Result, PAnsiChar(LOutput.Memory), LOutput.Size);
   // Result := LOutput.ToString;
    Memo2.Lines.LoadFromStream( LOutput );
  finally
    LInput.Free;
    LOutput.Free;
    Image.Free;
  end;

end;



function TForm1.Base64FromBitmap(Bitmap: TGraphic): string;
var
  Input: TMemoryStream;
  Output: TMemoryStream;
begin
  Input := TMemoryStream.Create;
  try
    Input.Position := 0;
    Bitmap.SaveToStream(Input);
    try
      Output := TMemoryStream.Create();
      TNetEncoding.Base64.Encode( Input, Output );
     // Soap.EncdDecd.EncodeStream(Input, Output);
      Output.Position := 0;
     SetString(Result, PAnsiChar(Output.Memory), Output.Size);
     // Result := Output.DataString;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

//function TForm1.BitmapFromBase64(const base64: string): TBitmap;
//var
//  Input: TStringStream;
//  Output: TBytesStream;
//begin
//  Input := TStringStream.Create(base64, TEncoding.ASCII);
//  try
//    Output := TBytesStream.Create;
//    try
//      Soap.EncdDecd.DecodeStream(Input, Output);
//      Output.Position := 0;
//      Result := TBitmap.Create;
//      try
//        Result.LoadFromStream(Output);
//      except
//        Result.Free;
//        raise;
//      end;
//    finally
//      Output.Free;
//    end;
//  finally
//    Input.Free;
//  end;
//end;


function TForm1.BitmapToBase64String(filename: TImage): string;
var
  LInput : TMemoryStream;
  LOutput: TMemoryStream;
  Image : TImage;
begin
  Image := filename;
  LInput := TMemoryStream.Create;
  LOutput := TMemoryStream.Create;
  // write picture to stream and encode
  try
    filename.Picture.SaveToStream(LInput);
    LInput.Position := 0;
    TNetEncoding.Base64.Encode( LInput, LOutput );
    LOutput.Position := 0;
    SetString(Result, PAnsiChar(LOutput.Memory), LOutput.Size);
   // Result := LOutput.ToString;
    Memo2.Lines.LoadFromStream( LOutput );
  finally
    LInput.Free;
    LOutput.Free;
   //mage.Free;
  end;

end;


procedure TForm1.DecodeFile(const Base64: String; const FileName: string);
var
  BStream: TBytesStream;
begin
  BStream:= TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(Base64));
  try
    BStream.SaveToFile(Filename);
  finally
    BStream.Free;
  end;
end;


end.

