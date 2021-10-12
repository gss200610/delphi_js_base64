unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Soap.EncdDecd, System.NetEncoding, Vcl.Imaging.pnglang, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    function BitmapFromBase64(const base64: string): TBitmap;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  const filenameB64 = 'G:\sources\teste\filebase.txt';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

begin
  Memo1.Lines.LoadFromFile(filenameB64);

   BitmapFromBase64(Memo1.Text) ;
end;


function TForm1.BitmapFromBase64(const base64: string): TBitmap;
var
  Output: TMemoryStream;
  inputStream : TBytes;
  png : TPngImage;
begin
  Output := TMemoryStream.Create;
  try
    inputStream := DecodeBase64(base64);
    Output.Write(inputStream, Length(inputStream) );
    Output.Position := 0;
    Result := TBitmap.Create;
    try
      png:= TPngImage.Create;
      png.LoadFromStream(Output);

      Image1.Picture.Assign(png);
      png.Destroy;
    except
      Result.Free;
      raise;
    end;
  finally
    Output.Free;
  end;

end;


end.
