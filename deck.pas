unit deck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Domino, ExtCtrls;

type
  TFormDeck = class(TForm)
    DominoCard1: TDominoCard;
    DominoCard2: TDominoCard;
    DominoCard3: TDominoCard;
    DominoCard4: TDominoCard;
    DominoCard5: TDominoCard;
    DominoCard6: TDominoCard;
    DominoCard7: TDominoCard;
    DominoCard8: TDominoCard;
    DominoCard9: TDominoCard;
    DominoCard10: TDominoCard;
    DominoCard11: TDominoCard;
    DominoCard12: TDominoCard;
    DominoCard13: TDominoCard;
    DominoCard14: TDominoCard;
    DominoCard15: TDominoCard;
    DominoCard16: TDominoCard;
    DominoCard17: TDominoCard;
    DominoCard18: TDominoCard;
    DominoCard19: TDominoCard;
    DominoCard20: TDominoCard;
    DominoCard21: TDominoCard;
    DominoCard22: TDominoCard;
    DominoCard23: TDominoCard;
    DominoCard24: TDominoCard;
    DominoCard25: TDominoCard;
    DominoCard26: TDominoCard;
    DominoCard27: TDominoCard;
    DominoCard28: TDominoCard;
    DominoDeck: TDominoCard;
    LabelFirst: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TopIndex, BottomIndex: integer;

    procedure ResetDeckTable;
    procedure PlaceFirstCard(Top_Value, Bottom_Value: integer);
    procedure PlaceCardOnTop(Top_Value, Bottom_Value: integer);
    procedure PlaceCardOnBottom(Top_Value, Bottom_Value: integer);
  end;

var
  FormDeck: TFormDeck;

implementation

uses
  main;

{$R *.dfm}

procedure TFormDeck.FormCreate(Sender: TObject);
begin
  TopIndex := 28;
  BottomIndex := 2;
end;

procedure TFormDeck.FormShow(Sender: TObject);
begin
  ClientHeight := 401;
  ClientWidth := 401;
end;

procedure TFormDeck.FormHide(Sender: TObject);
begin
  FormGaple.ItemDeck.Checked := false;
end;

procedure TFormDeck.ResetDeckTable;
var
  i: integer;
begin
  TopIndex := 28;
  BottomIndex := 2;
  LabelFirst.Visible := false;

  for i := 1 to 28 do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    Visible := false;
end;

procedure TFormDeck.PlaceFirstCard;
begin
  with TDominoCard(FindComponent('DominoCard'+IntToStr(1))) do
  begin
    TopValue := Top_Value;
    BottomValue := Bottom_Value;
    Visible := true;
    LabelFirst.Visible := true;
  end;
end;

procedure TFormDeck.PlaceCardOnTop;
begin
  with TDominoCard(FindComponent('DominoCard'+IntToStr(TopIndex))) do
  begin
    TopValue := Top_Value;
    BottomValue := Bottom_Value;

    if (TopIndex <= 13) and (Orientation = coLandscape) then Flip
    else if (TopIndex <= 20) and (Orientation = coPortrait) then Flip
    else if (TopIndex <= 27) and (Orientation = coLandscape) then Flip;

    Visible := true;
    Dec(TopIndex);
  end;
end;

procedure TFormDeck.PlaceCardOnBottom;
begin
  with TDominoCard(FindComponent('DominoCard'+IntToStr(BottomIndex))) do
  begin
    TopValue := Top_Value;
    BottomValue := Bottom_Value;

    if (BottomIndex >= 20) and (Orientation = coPortrait) then Flip
    else if (BottomIndex >= 13) and (Orientation = coLandScape) then Flip
    else if (BottomIndex >= 6) and (Orientation = coPortrait) then Flip;

    Visible := true;
    Inc(BottomIndex);
  end;
end;

end.
