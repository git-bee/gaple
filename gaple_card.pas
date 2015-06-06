(* CARD & DECK MANAGEMENT *)

{ clearing deck for new turn }

procedure TFormGaple.ReorganizeDeckCards;
begin
  // reset deck card
  with DeckGaple do
  begin
    TopCard.Top := 210;
    TopCard.Left := 230;
    TopCard.Orientation := coLandscape;
    BottomCard.Top := TopCard.Top;
    BottomCard.Left := TopCard.Left;
    BottomCard.Orientation := coLandscape;
  end;

  // re-organize player card
  CardPlayer1.Visible := false;
  CardPlayer1.Orientation := coPortrait;
  CardPlayer1.Left := 230;
  CardPlayer1.Top := 300;
  CardPlayer2.Visible := false;
  CardPlayer2.Orientation := coLandscape;
  CardPlayer2.Left := 380;
  CardPlayer2.Top := 230;
  CardPlayer3.Visible := false;
  CardPlayer3.Orientation := coPortrait;
  CardPlayer3.Left := 230;
  CardPlayer3.Top := 120;
  CardPlayer4.Visible := false;
  CardPlayer4.Orientation := coLandscape;
  CardPlayer4.Left := 140;
  CardPlayer4.Top := 230;
end;

{ card placement algorithm }

procedure TFormGaple.FirstCard(SelectedCard: TDominoCard);
var
  turn_info: string;
begin
  // hide given card
  Inc(TurnStep);
  SelectedCard.Enabled := false;
  SelectedCard.Visible := false;

  // set player card to given card
  with DeckGaple do
  begin
    IsEmpty := false;

    // copy given card value to player card
    TopValue := SelectedCard.TopValue;
    BottomValue := SelectedCard.BottomValue;
  end;

  // update deck
  with TDominoCard(FindComponent('CardPlayer'+IntToStr(SelectedCard.Tag))) do
  begin
    // copy player card value to deck
    TopValue := SelectedCard.TopValue;
    BottomValue := SelectedCard.BottomValue;

    // place on deck position
    Orientation := DominoDeck.Orientation;
    Left := DominoDeck.Left;
    Top := DominoDeck.Top;
    Visible := true;
    BringToFront;
  end;

  LabelDeck.Visible := true;
  LabelDeck.Caption := 'Deck value: '+IntToStr(DeckGaple.TopValue)+'_'+IntToStr(DeckGaple.BottomValue);
  LabelStatus.Caption := Players[CurrentPlayer].Name+' is thinking... done.';

  // update deck table window
  FormDeck.PlaceFirstCard(SelectedCard.TopValue,SelectedCard.BottomValue);

  // write game info
  turn_info := IntToStr(TurnStep)+': ';
  turn_info := turn_info + IntToStr(SelectedCard.TopValue)+'_';
  turn_info := turn_info + IntToStr(SelectedCard.BottomValue)+' = ';
  turn_info := turn_info + IntToStr(DeckGaple.TopValue)+'_';
  turn_info := turn_info + IntToStr(DeckGaple.BottomValue);
  StepList.Add(turn_info);

  // move to next player
  NextPlayerTurn;
end;

procedure TFormGaple.PlaceCardOnTop(SelectedCard: TDominoCard);
var
  turn_info: string;
begin
  Inc(TurnStep);
  SelectedCard.Enabled := false;
  SelectedCard.Visible := false;

  if SelectedCard.TopValue = DeckGaple.TopValue then SelectedCard.Flip;

  with DeckGaple do
  begin
    IsEmpty := false;
    TopValue := SelectedCard.TopValue;

    if TopCard.Orientation = coLandscape then
    begin
      DeckGaple.TopCard.Top := DeckGaple.TopCard.Top - 5;
      DeckGaple.TopCard.Left := DeckGaple.TopCard.Left - 46;
    end;
    if TopCard.Orientation = coPortrait then
    begin
      DeckGaple.TopCard.Left := DeckGaple.TopCard.Left - 5;
      DeckGaple.TopCard.Top := DeckGaple.TopCard.Top - 46;
    end;
  end;

  with TDominoCard(FindComponent('CardPlayer'+IntToStr(SelectedCard.Tag))) do
  begin
    TopValue := SelectedCard.TopValue;
    BottomValue := SelectedCard.BottomValue;

    Left := DeckGaple.TopCard.Left;
    Top := DeckGaple.TopCard.Top;
    Orientation := DeckGaple.TopCard.Orientation;
    Visible := true;
    BringToFront;

    if Orientation = coPortrait then DeckGaple.TopCard.Orientation := coLandscape
      else DeckGaple.TopCard.Orientation := coPortrait;
  end;

  LabelDeck.Visible := true;
  LabelDeck.Caption := 'Deck value: '+IntToStr(DeckGaple.TopValue)+'_'+IntToStr(DeckGaple.BottomValue);
  LabelStatus.Caption := Players[CurrentPlayer].Name+' is thinking... done.';

  FormDeck.PlaceCardOnTop(SelectedCard.TopValue,SelectedCard.BottomValue);

  turn_info := IntToStr(TurnStep)+': ';
  turn_info := turn_info + IntToStr(SelectedCard.TopValue)+'_';
  turn_info := turn_info + IntToStr(SelectedCard.BottomValue)+' = ';
  turn_info := turn_info + IntToStr(DeckGaple.TopValue)+'_';
  turn_info := turn_info + IntToStr(DeckGaple.BottomValue);
  StepList.Add(turn_info);

  NextPlayerTurn;
end;

procedure TFormGaple.PlaceCardOnBottom(SelectedCard: TDominoCard);
var
  turn_info: string;
begin
  // hide given vard
  Inc(TurnStep);
  SelectedCard.Enabled := false;
  SelectedCard.Visible := false;

  // flip card if the player card value reverse to the deck value
  if SelectedCard.BottomValue = DeckGaple.BottomValue then SelectedCard.Flip;

  // update deck
  with DeckGaple do
  begin
    // copy player card value to deck, bottom only
    IsEmpty := false;
    BottomValue := SelectedCard.BottomValue;

    // prepare bottom deck position for the next card
    if BottomCard.Orientation = coPortrait then
    begin
      DeckGaple.BottomCard.Top := DeckGaple.BottomCard.Top + 5;
      DeckGaple.BottomCard.Left := DeckGaple.BottomCard.Left + 46;
    end;
    if BottomCard.Orientation = coLandscape then
    begin
      DeckGaple.BottomCard.Left := DeckGaple.BottomCard.Left + 5;
      DeckGaple.BottomCard.Top := DeckGaple.BottomCard.Top + 46;
    end;
  end;

  // update player card
  with TDominoCard(FindComponent('CardPlayer'+IntToStr(SelectedCard.Tag))) do
  begin
    // copy given card value to player card
    TopValue := SelectedCard.TopValue;
    BottomValue := SelectedCard.BottomValue;

    // position player card on deck using deck info
    Left := DeckGaple.BottomCard.Left;
    Top := DeckGaple.BottomCard.Top;
    Orientation := DeckGaple.BottomCard.Orientation;
    Visible := true;
    BringToFront;

    // prepare bottom deck orientation for the next card
    if Orientation = coPortrait then DeckGaple.BottomCard.Orientation := coLandscape
      else DeckGaple.BottomCard.Orientation := coPortrait;
  end;

  LabelDeck.Visible := true;
  LabelDeck.Caption := 'Deck value: '+IntToStr(DeckGaple.TopValue)+'_'+IntToStr(DeckGaple.BottomValue);
  LabelStatus.Caption := Players[CurrentPlayer].Name+' is thinking... done.';

  // update deck table window
  FormDeck.PlaceCardOnBottom(SelectedCard.TopValue,SelectedCard.BottomValue);

  // write game info
  turn_info := IntToStr(TurnStep)+': ';
  turn_info := turn_info + IntToStr(SelectedCard.TopValue)+'_';
  turn_info := turn_info + IntToStr(SelectedCard.BottomValue)+' = ';
  turn_info := turn_info + IntToStr(DeckGaple.TopValue)+'_';
  turn_info := turn_info + IntToStr(DeckGaple.BottomValue);
  StepList.Add(turn_info);

  // move to next player
  NextPlayerTurn;
end;

procedure TFormGaple.DisableCard(SelectedCard: TDominoCard);
var
  turn_info: string;
begin
  Inc(TurnStep);

  LabelStatus.Caption := Players[CurrentPlayer].Name+' by passing the turn.';

  turn_info := IntToStr(TurnStep)+': ';
  turn_info := turn_info + 'pass = ';
  turn_info := turn_info + IntToStr(DeckGaple.TopValue)+'_';
  turn_info := turn_info + IntToStr(DeckGaple.BottomValue);
  StepList.Add(turn_info);

  if PassCardRequired then
  begin
    SelectedCard.Enabled := false;

    turn_info := IntToStr(TurnStep)+': ';
    turn_info := turn_info + IntToStr(CurrentPlayer) + ' = ';
    turn_info := turn_info + IntToStr(SelectedCard.TopValue)+'_';
    turn_info := turn_info + IntToStr(SelectedCard.BottomValue);
    DisabledList.Add(turn_info);
  end;

  NextPlayerTurn;
end;

{ card management algorithm }

procedure TFormGaple.ScrambleCards;
var
  numbers: array[1..NumberOfCards] of integer;
  duplicated: boolean;
  i,j,k: integer;
begin
  // generate unique and selected random numbers
  i := 1;
  duplicated := false;
  repeat
    // generate random numbers
    k := Random(67);

    // check for duplicates
    for j := 1 to i do
    begin
      duplicated := (numbers[j] = k);
      if duplicated then Break;
    end;

    // store only unique and known numbers
    if (not duplicated) and
       (k in [0,1,2,3,4,5,6,11,12,13,14,15,16,22,23,24,25,26,33,34,35,36,44,45,46,55,56,66])
       then
    begin
      numbers[i] := k;
      duplicated := false;
      Cards[i] := FormatFloat('00',numbers[i]);

      Inc(i);
    end;
  until i > NumberOfCards;

  // distribute to cards
  for i := 1 to NumberOfCards do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
  begin
    TopValue := StrToInt(Cards[i][1]);
    BottomValue := StrToInt(Cards[i][2]);
  end;
end;

function TFormGaple.CardMatchBoth(SelectedCard: TDominoCard): boolean;
var
  diff_top, diff_bottom: boolean;
begin
  with SelectedCard do
  begin
    diff_top := (DeckGaple.TopValue <> TopValue) or (DeckGaple.BottomValue <> BottomValue);
    diff_bottom := (DeckGaple.TopValue <> BottomValue) or (DeckGaple.BottomValue <> TopValue);
  end;

  Result := not (diff_top and diff_bottom);
end;

function TFormGaple.CardMatchTop(SelectedCard: TDominoCard): boolean;
begin
  with SelectedCard do
    Result := (TopValue = DeckGaple.TopValue) or (BottomValue = DeckGaple.TopValue);
end;

function TFormGaple.CardMatchBottom(SelectedCard: TDominoCard): boolean;
begin
  with SelectedCard do
    Result := (TopValue = DeckGaple.BottomValue) or (BottomValue = DeckGaple.BottomValue);
end;

function  TFormGaple.NoCardLeft(Player: integer): boolean;
var
  i: integer;
  is_left: boolean;
begin
  is_left := false;

  for i := 1 to NumberOfCards do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
  begin
    if Tag = Player then
    begin
      is_left := (Visible and Enabled);
      if is_left then Break;
    end;
  end;

  Result := not is_left;
end;

function  TFormGaple.NoCardMatch(Player: integer): boolean;
var
  i: integer;
  is_match: boolean;
begin
  is_match := false;

  for i := 1 to NumberOfCards do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
  begin
    if (Tag = Player) and Visible and Enabled then
    begin
      is_match := (TopValue = DeckGaple.TopValue) or (BottomValue = DeckGaple.TopValue) or
                  (TopValue = DeckGaple.BottomValue) or (BottomValue = DeckGaple.BottomValue);
      if is_match then Break;
    end;
  end;

  Result := not is_match;
end;

function TFormGaple.GameIsOver: boolean;
var
  i,p: integer;
  is_over, is_match, is_empty: boolean;
begin
  // check for finish player
  for p := 1 to NumberOfPlayers do
  begin
    is_empty := true;
    for i := 1 to NumberOfCards do
    with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
      if Tag = p then
        is_empty := is_empty and (not Visible) and (not Enabled);
    if is_empty then Break;
  end;

  // check for available cards
  for i := 1 to NumberOfCards do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
  begin
    is_over := not Enabled;
    if not is_over then Break;
  end;

  // check for match cards
  is_match := false;
  for i := 1 to NumberOfCards do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    if Visible and Enabled then
    begin
      is_match := (TopValue = DeckGaple.TopValue) or (BottomValue = DeckGaple.TopValue) or
                  (TopValue = DeckGaple.BottomValue) or (BottomValue = DeckGaple.BottomValue);
      if is_match then Break;
    end;

  result := is_empty or is_over or (not is_match);
end;

