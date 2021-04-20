unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Ani, System.ImageList, FMX.ImgList;

type
  TForm1 = class(TForm)
    rect_bottom: TRectangle;
    cir_white: TCircle;
    cir_gray: TCircle;
    img_home: TImage;
    animaCircle: TFloatAnimation;
    img_click: TImage;
    lay_home: TLayout;
    lay_user: TLayout;
    img_user: TImage;
    lay_more: TLayout;
    img_more: TImage;
    lay: TLayout;
    procedure img_homeClick(Sender: TObject);
  private
    procedure MoveCircle(obj: Tobject;lay : Tlayout);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.img_homeClick(Sender: TObject);
begin
  MoveCircle(Sender, TLayout(TImage(Sender).Parent ) );
end;

procedure TForm1.MoveCircle(obj : Tobject; lay : Tlayout ) ;
begin
  img_home.Visible := True;
  img_more.Visible := True;
  img_user.Visible := True;
  TImage(obj).Visible := False;

  animaCircle.StartValue := cir_gray.Position.X;
  if TImage(obj).Tag = 0 then
    animaCircle.StopValue  := TLayout(lay).Position.X + 5;
  if TImage(obj).Tag = 1 then
    animaCircle.StopValue  := TLayout(lay).Position.X - 10 ;
  if TImage(obj).Tag = 2 then
    animaCircle.StopValue  := TLayout(lay).Position.X - 25;



  animaCircle.Start;



end;

end.
