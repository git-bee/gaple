unit score;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, Graphics;

type
  TFormScore = class(TForm)
    ImageProgram: TImage;
    LabelPlayer1: TLabel;
    LabelPlayer2: TLabel;
    LabelPlayer3: TLabel;
    LabelPlayer4: TLabel;
    BevelScore: TBevel;
    Score1: TLabel;
    Score2: TLabel;
    Score3: TLabel;
    Score4: TLabel;
    ButtonClose: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormScore: TFormScore;

implementation

uses
  main;

{$R *.dfm}

procedure TFormScore.FormCreate(Sender: TObject);
begin
  LabelPlayer1.Caption := FormGaple.Players[1].Name;
  LabelPlayer2.Caption := FormGaple.Players[2].Name;
  LabelPlayer3.Caption := FormGaple.Players[3].Name;
  LabelPlayer4.Caption := FormGaple.Players[4].Name;

  if FormGaple.GamePlayed > 10 then
    Height := Height + (FormGaple.GamePlayed-10)*16;
end;

procedure TFormScore.FormShow(Sender: TObject);
var
  p1,p2,p3,p4: integer;
  i,min,limit: integer;
begin
  if FormGaple.GameRunning then
    limit := High(FormGaple.Scores)-1
  else
    limit := High(FormGaple.Scores);

  p1 := 0;
  p2 := 0;
  p3 := 0;
  p4 := 0;
  for i := 0 to limit do
  begin
    p1 := p1 + FormGaple.Scores[i].Player1;
    p2 := p2 + FormGaple.Scores[i].Player2;
    p3 := p3 + FormGaple.Scores[i].Player3;
    p4 := p4 + FormGaple.Scores[i].Player4;
  end;
  min := 1000;
  if p1 < min then min := p1;
  if p2 < min then min := p2;
  if p3 < min then min := p3;
  if p4 < min then min := p4;

  if p1 = min then Score1.Font.Color := clMaroon else Score1.Font.Color := clNavy;
  if p2 = min then Score2.Font.Color := clMaroon else Score2.Font.Color := clNavy;
  if p3 = min then Score3.Font.Color := clMaroon else Score3.Font.Color := clNavy;
  if p4 = min then Score4.Font.Color := clMaroon else Score4.Font.Color := clNavy;

  Score1.Caption := IntToStr(p1);
  Score2.Caption := IntToStr(p2);
  Score3.Caption := IntToStr(p3);
  Score4.Caption := IntToStr(p4);

  if (p1 >= FormGaple.MaximumScore) or
     (p2 >= FormGaple.MaximumScore) or
     (p3 >= FormGaple.MaximumScore) or
     (p4 >= FormGaple.MaximumScore) then
  begin
    FormGaple.GamePlayed := -1;
    FormGaple.ReadConfigFile;
  end;
end;

procedure TFormScore.FormPaint(Sender: TObject);
var
  i,min,limit: integer;
begin
  Canvas.Pen.Color := clBlack;
  Canvas.MoveTo(50,22);
  Canvas.LineTo(50+261,22);

  if FormGaple.GameRunning then
    limit := High(FormGaple.Scores)-1
  else
    limit := High(FormGaple.Scores);

  for i := 0 to limit do
  begin
    min := 1000;
    if FormGaple.Scores[i].Player1 < min then
      min := FormGaple.Scores[i].Player1;
    if FormGaple.Scores[i].Player2 < min then
      min := FormGaple.Scores[i].Player2;
    if FormGaple.Scores[i].Player3 < min then
      min := FormGaple.Scores[i].Player3;
    if FormGaple.Scores[i].Player4 < min then
      min := FormGaple.Scores[i].Player4;

    if FormGaple.Scores[i].Player1 = min then
    begin
      Canvas.Font.Style := [fsBold];
      Canvas.TextOut(80,28+16*i,IntToStr(FormGaple.Scores[i].Player1));
    end
    else
    begin
      Canvas.Font.Style := [];
      Canvas.TextOut(80,28+16*i,IntToStr(FormGaple.Scores[i].Player1));
    end;

    if FormGaple.Scores[i].Player2 = min then
    begin
      Canvas.Font.Style := [fsBold];
      Canvas.TextOut(145,28+16*i,IntToStr(FormGaple.Scores[i].Player2));
    end
    else
    begin
      Canvas.Font.Style := [];
      Canvas.TextOut(145,28+16*i,IntToStr(FormGaple.Scores[i].Player2));
    end;

    if FormGaple.Scores[i].Player3 = min then
    begin
      Canvas.Font.Style := [fsBold];
      Canvas.TextOut(210,28+16*i,IntToStr(FormGaple.Scores[i].Player3));
    end
    else
    begin
      Canvas.Font.Style := [];
      Canvas.TextOut(210,28+16*i,IntToStr(FormGaple.Scores[i].Player3));
    end;

    if FormGaple.Scores[i].Player4 = min then
    begin
      Canvas.Font.Style := [fsBold];
      Canvas.TextOut(275,28+16*i,IntToStr(FormGaple.Scores[i].Player4));
    end
    else
    begin
      Canvas.Font.Style := [];
      Canvas.TextOut(275,28+16*i,IntToStr(FormGaple.Scores[i].Player4));
    end;
  end;
end;

procedure TFormScore.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.

