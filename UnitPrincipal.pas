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
    img_more_g: TImage;
    lay_home: TLayout;
    lay_user: TLayout;
    img_user: TImage;
    lay_more: TLayout;
    img_more: TImage;
    lay: TLayout;
    img_home_g: TImage;
    img_user_g: TImage;
    procedure img_homeClick(Sender: TObject);
  private
    procedure MoveCircle(obj: Tobject;lay : Tlayout);
    procedure AnimaImg(tag : Integer);
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
    animaCircle.StopValue  := TLayout(lay).Position.X;
  if TImage(obj).Tag = 1 then
    animaCircle.StopValue  := TLayout(lay).Position.X - 10;
  if TImage(obj).Tag = 2 then
    animaCircle.StopValue  := TLayout(lay).Position.X - 20;

  animaCircle.Start;
  AnimaImg(TImage(obj).Tag);


end;
procedure TForm1.AnimaImg(tag : Integer);

begin

  img_home_g.Visible := False;
  img_more_g.Visible := False;
  img_user_g.Visible := False;

  if Tag = 0 then begin
    img_home_g.Opacity := 0;
    img_home_g.Visible := True;
    img_home_g.AnimateFloat('Opacity',1,0.4,TAnimationType.&In,TInterpolationType.Circular);
  end;

  if Tag = 1 then begin
    img_more_g.Opacity := 0;
    img_more_g.Visible := True;
    img_more_g.AnimateFloat('Opacity',1,0.4,TAnimationType.&In,TInterpolationType.Circular);
  end;

  if Tag = 2 then begin
    img_user_g.Opacity := 0;
    img_user_g.Visible := True;
    img_user_g.AnimateFloat('Opacity',1,0.4,TAnimationType.&In,TInterpolationType.Circular);
  end;





end;


end.
