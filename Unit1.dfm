object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 627
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 544
    Top = 56
    Width = 273
    Height = 281
    Stretch = True
  end
  object Button1: TButton
    Left = 32
    Top = 343
    Width = 145
    Height = 37
    Caption = 'Ler Base64'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 32
    Top = 56
    Width = 425
    Height = 281
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button2: TButton
    Left = 544
    Top = 352
    Width = 121
    Height = 33
    Caption = 'salvar base64'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo2: TMemo
    Left = 544
    Top = 391
    Width = 273
    Height = 228
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object Button3: TButton
    Left = 200
    Top = 354
    Width = 75
    Height = 25
    Caption = 'load'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 742
    Top = 360
    Width = 75
    Height = 25
    Caption = 'clear'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 32
    Top = 408
    Width = 145
    Height = 25
    Caption = 'Read by Indy'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 304
    Top = 352
    Width = 75
    Height = 25
    Caption = 'exportar'
    TabOrder = 7
    OnClick = Button6Click
  end
  object cxImage1: TcxImage
    Left = 272
    Top = 408
    TabOrder = 8
    Height = 185
    Width = 233
  end
  object OpenDialog1: TOpenDialog
    Left = 424
    Top = 320
  end
end
