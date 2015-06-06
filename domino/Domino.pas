unit Domino;

{
  TDominoCard - Freeware
  Version 1.0 - 6 February 2003
  -----------------------------
  Created by: Bee Jay
  Copyright (C) BeeSoft Technology, 2003.

  DESCRIPTION
  -----------
  TDominoCard is a domino card component for Delphi and Kylix.

  * PROPERTIES
  - TopValue
    The value of the top side card, between 0 and 6.
  - BottomValue
    The value of the bottom side card, between 0 and 6.
  - Deck
    The type of deck that is shown if ShowDeck is True.
  - ShowDeck
    If True shows the back of the card.
  - Orientation
    Select card orientation, portrait or landscape.

  * METHODS
  - procedure Turn
    Turn the card and show the deck, or viceversa.
  - procedure Flip
    Flip the top side down, or viceversa.
  - procedure SelectRandom
    Randomly choose value card.
  - procedure SelectCard
    Quickly set domino card's Value.
  - function DifferentFrom
    Returns True if the card is different from the specified one.
  - function CompareCard
    Returns comparison result between two specified domino card.

  ACKNOWLEDGMENT
  --------------
  My big thank goes to all people who share their knowledges
  about Delphi for free, I learned a lot from them. This
  component is a small contribution from me to the community.

  LICENSE
  -------
  This component is a freeware. Feel free to use, copy, modify,
  and distribute it as long as for non-commercial use. However,
  if you do some modification, please send me a copy of it.

  DISCLAIMER
  ----------
  This component is provided 'as is', and the author is under
  no circumstances responsible for any damage, what soever,
  that it might cause to anyone or anything.

  CONTACT
  -------
  ICQ: 232400751
  Email: bee.ography@gmail.com
}

interface

uses
{$IFDEF LINUX}
  Messages, SysUtils, Classes, QGraphics, QControls, QForms, QDialogs;
{$ELSE}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;
{$ENDIF}

type
  TDominoValue = 0..6;
  TDominoDecks = (cdDeck, cdDefault);
  TDominoCardMatch = (cmExact, cmReversed, cmTop, cmBottom, cmTopBottom, cmBottomTop, cmDifferent);
  TDominoCardOrientation = (coPortrait, coLandscape);

  (* TDominoCard *)

  TDominoCard = class(TGraphicControl)
    private
      FTopValue: TDominoValue;
      FBottomValue: TDominoValue;
      FOrientation: TDominoCardOrientation;
      FDeck: TDominoDecks;
      FShowDeck: Boolean;
      FFlipped: Boolean;

      procedure SetTopValue(TheValue : TDominoValue);
      procedure SetBottomValue(TheValue : TDominoValue);
      procedure SetDeck(const TheDeck: TDominoDecks);
      procedure SetShowDeck(const TheShowDeck: Boolean);
      procedure SetOrientation(const TheOrientation: TDominoCardOrientation);
    protected
      property  Height default 82;
      property  Width default 41;
      property  Constraints;

      procedure Paint; override;
    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Flip;
      procedure Turn;
      procedure SelectRandom;
      function  DifferentFrom(const AnotherCard: TDominoCard): Boolean;

      procedure SelectCard(const TheTopValue, TheBottomValue: TDominoValue);
      function  CompareCard(const FirstCard, SecondCard: TDominoCard): TDominoCardMatch;
    published
      property TopValue: TDominoValue read FTopValue write SetTopValue;
      property BottomValue: TDominoValue read FBottomValue write SetBottomValue;
      property Orientation: TDominoCardOrientation read FOrientation write SetOrientation default coPortrait;
      property Deck: TDominoDecks read FDeck write SetDeck default cdDefault;
      property ShowDeck: Boolean read FShowDeck write SetShowDeck default False;

      property Action;
      property Anchors;
      property Cursor;
      property DragMode;
      property Enabled;
      property ShowHint;
      property Visible;
      property PopupMenu;

      property OnClick;
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDrag;
      property OnMouseDown;
      property OnMouseMove;
      property OnMouseUp;
      property OnStartDrag;
  end;

procedure Register;

implementation

{$R DOMINO.RES}

procedure Register;
begin
  RegisterComponents('Samples', [TDominoCard]);
end;

(* === TDominoCard component === *)

(* TDominoCard constructor/destructor *)

constructor TDominoCard.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Randomize;
  FTopValue := 0;
  FBottomValue := 0;
  FOrientation := coPortrait;
  FDeck := cdDefault;
  FShowDeck := False;
  FFlipped := False;

  // unchangeable size
  Height := 82;
  Width := 41;
  Constraints.MaxHeight := Height;
  Constraints.MaxWidth := Width;
  Constraints.MinHeight := Height;
  Constraints.MinWidth := Width;
end;

destructor TDominoCard.Destroy;
begin
  inherited Destroy;
end;

(* TDominoCard private methods *)

procedure TDominoCard.SetTopValue(TheValue : TDominoValue);
begin
  if TheValue < 0 then TheValue := 0;
  if TheValue > 6 then TheValue := 6;
  FTopValue := TheValue;
  Repaint;
end;

procedure TDominoCard.SetBottomValue(TheValue : TDominoValue);
begin
  if TheValue < 0 then TheValue := 0;
  if TheValue > 6 then TheValue := 6;
  FBottomValue := TheValue;
  Repaint;
end;

procedure TDominoCard.SetDeck(const TheDeck: TDominoDecks);
begin
  FDeck := TheDeck;
  Repaint;
end;

procedure TDominoCard.SetShowDeck(const TheShowDeck: Boolean);
begin
  FShowDeck := TheShowDeck;
  Repaint;
end;

procedure TDominoCard.SetOrientation(const TheOrientation: TDominoCardOrientation);
begin
  FOrientation := TheOrientation;

  Constraints.MaxHeight := 0;
  Constraints.MaxWidth := 0;
  Constraints.MinHeight := 0;
  Constraints.MinWidth := 0;

  case FOrientation of
    coPortrait:
      begin
        Height := 82;
        Width := 41;
      end;
    coLandscape:
      begin
        Height := 41;
        Width := 82;
      end;
  end;

  Constraints.MaxHeight := Height;
  Constraints.MaxWidth := Width;
  Constraints.MinHeight := Height;
  Constraints.MinWidth := Width;

  Repaint;
end;

(* TDominoCard protected methods *)

procedure TDominoCard.Paint;
var
  CardBmp: TBitmap;
  ResName: string;
  i,j: integer;
begin
  FFlipped := (FTopValue > FBottomValue);

  // show selected card
  if not FShowDeck then
  begin
    if FFlipped then
      ResName := IntToStr(FBottomValue)+'_'+IntToStr(FTopValue)
    else
      ResName := IntToStr(FTopValue)+'_'+IntToStr(FBottomValue);
  end
  // show selected deck
  else
    begin
      case FDeck of
        cdDeck:    ResName := 'DECK';
        cdDefault: ResName := 'BACK';
      end;
      if FOrientation = coLandscape then ResName := ResName+'_LS';
    end;

  // load bitmap from resources
  if Visible then
  begin
    CardBmp := TBitmap.Create;
    CardBmp.LoadFromResourceName(HInstance,ResName);

    if FShowDeck then
      Canvas.Draw(0,0,CardBmp)
    else
    begin
      case FOrientation of
        coPortrait:
          if not FFlipped then
            Canvas.Draw(0,0,CardBmp)
          else
          begin
            Canvas.Draw(0,-41,CardBmp);
            Canvas.Draw(0,41,CardBmp);
          end;
        coLandscape:
          begin
            ResName := IntToStr(FTopValue)+'_LS';
            CardBmp.LoadFromResourceName(HInstance,ResName);
            Canvas.Draw(0,0,CardBmp);
            ResName := IntToStr(FBottomValue)+'_LS';
            CardBmp.LoadFromResourceName(HInstance,ResName);
            Canvas.Draw(41,0,CardBmp);
          end;
      end;

      // gray disabled card
      if not Enabled then
        for i := 1 to (Width div 2)-1 do
          for j := 1 to (Height div 2)-1 do
            Canvas.Pixels[i*2,j*2] := clBlue;
    end;

    CardBmp.Free;
  end
  else
  begin
    // design state
    if csDesigning in self.ComponentState then
      Canvas.Rectangle(0,0,Width,Height);
  end;
end;

(* TDominoCard public methods *)

procedure TDominoCard.Turn;
begin
  ShowDeck := not ShowDeck;
end;

procedure TDominoCard.Flip;
var
  tempval: TDominoValue;
begin
  tempval := FTopValue;
  FTopValue := FBottomValue;
  FBottomValue := tempval;
  Repaint;
end;

procedure TDominoCard.SelectRandom;
var
  rand: Integer;
begin
  rand := Random(7);
  FTopValue := rand;
  rand := Random(7);
  FBottomValue := rand;

  Repaint;
end;

function TDominoCard.DifferentFrom(const AnotherCard: TDominoCard): Boolean;
begin
  Result := ((FTopValue <> AnotherCard.TopValue) or (FBottomValue <> AnotherCard.BottomValue)) and
            ((FTopValue <> AnotherCard.BottomValue) or (FBottomValue <> AnotherCard.TopValue));
end;

procedure TDominoCard.SelectCard(const TheTopValue, TheBottomValue: TDominoValue);
begin
  if (TheTopValue >= 0) and (TheTopValue <= 6) then TopValue := TheTopValue;
  if (TheBottomValue >= 0) and (TheBottomValue <= 6) then BottomValue := TheBottomValue;
end;

function  TDominoCard.CompareCard(const FirstCard, SecondCard: TDominoCard): TDominoCardMatch;
begin
  // first card equal second card in exact order
  if (FirstCard.TopValue = SecondCard.TopValue) and (FirstCard.BottomValue = SecondCard.BottomValue) then
    Result := cmExact
  // first card equal second card in reverse order
  else if (FirstCard.TopValue = SecondCard.BottomValue) and (FirstCard.BottomValue = SecondCard.TopValue) then
    Result := cmReversed
  // first card equal second card only on top side
  else if (FirstCard.TopValue = SecondCard.TopValue) and (FirstCard.BottomValue <> SecondCard.BottomValue) then
    Result := cmTop
  // first card equal second card only on bottom side
  else if (FirstCard.BottomValue = SecondCard.BottomValue) and (FirstCard.TopValue <> SecondCard.TopValue) then
    Result := cmBottom
  // first card top_value equal second card bottom_value
  else if (FirstCard.TopValue = SecondCard.BottomValue) and (FirstCard.BottomValue <> SecondCard.TopValue) then
    Result := cmTopBottom
  // first card bottom_value equal second card top_value
  else if (FirstCard.BottomValue = SecondCard.TopValue) and (FirstCard.TopValue <> SecondCard.BottomValue) then
    Result := cmBottomTop
  // first card different from second card 
  else Result := cmDifferent;
end;

end.

