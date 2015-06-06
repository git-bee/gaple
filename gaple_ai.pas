(* GAME AI & ALGORITHM *)

{ player selection algorithm }

function  TFormGaple.FirstPlayer(PairValue: integer): integer;
var
  i: integer;
begin
  // selecting start card
  if IncFirstCardPair then
    PairValue := PairValue mod 7
  else
    PairValue := FirstCardPair;

  // selecting player who has the start card
  for i := 1 to NumberOfCards do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    if (TopValue = PairValue) and (BottomValue = PairValue) then
    begin
      DeckGaple.TopValue := TopValue;
      DeckGaple.BottomValue := BottomValue;

      LabelDeck.Visible := true;
      LabelDeck.Caption := 'Deck expecting: '+IntToStr(DeckGaple.TopValue)+'_'+IntToStr(DeckGaple.BottomValue);

      result := Tag;
      Break;
    end
    else
      result := 1;
end;

procedure TFormGaple.NextPlayerTurn;
var
  i: integer;
begin
  if GameRunning then
  begin
    ListBoxCards.Items := StepList;

    with TLabel(FindComponent('LabelPlayer'+IntToStr(CurrentPlayer))) do Font.Color := clWhite;

    repeat
      Inc(CurrentPlayer);
      if CurrentPlayer > 4 then CurrentPlayer := 1;
    until not NoCardLeft(CurrentPlayer) or GameIsOver;

    Application.ProcessMessages;
    Sleep(250);

    if not GameIsOver then
    begin
      with TLabel(FindComponent('LabelPlayer'+IntToStr(CurrentPlayer))) do Font.Color := clLime;

      if Players[CurrentPlayer].Kind = plComputer then
        ComputerPlaying(CurrentPlayer)
      else if Players[CurrentPlayer].Kind = plNetwork then
        NetworkPlaying(CurrentPlayer)
      else
        LabelStatus.Caption := 'Waiting for '+Players[CurrentPlayer].Name+' ... ';
    end
    else
    begin
      GameRunning := false;
      for i := 1 to NumberOfCards do
        with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
          if Visible then ShowDeck := false;

      LabelStatus.Caption := 'Game is over.';
      GameOverInformation;
      Exit;
    end;
  end;
end;

{ player algorithm }

procedure TFormGaple.HumanPlaying(SelectedCard: TDominoCard);
var
  turn_info: string;
  answer: integer;
  i: integer;
begin
  if GameRunning then
  begin
    // check player turn
    if (SelectedCard.Tag = CurrentPlayer) and
       (Players[CurrentPlayer].Kind = plHuman) then
    begin
      // check player status
      if not DeckGaple.IsEmpty then
      begin
        PlayerPass := NoCardMatch(SelectedCard.Tag);
        PlayerPlay := not NoCardLeft(SelectedCard.Tag);

        // check for deck reorganizing
        if (TurnStep mod 4 = 0) then
        begin
          ReorganizeDeckCards;
          DominoDeck.TopValue := DeckGaple.TopValue;
          DominoDeck.BottomValue := DeckGaple.BottomValue;
          DominoDeck.ShowDeck := false;
        end;
      end;

      // player allowed to play
      if PlayerPlay and (not PlayerPass) then
      begin
        // first turn
        if DeckGaple.IsEmpty then
        begin
          if not CardMatchBoth(SelectedCard) then
          begin
            WrongCardWarning;
            Exit;
          end;
            FirstCard(SelectedCard);
        end
        // next turn
        else if CardMatchBoth(SelectedCard) then
        begin
          if (DeckGaple.TopValue = DeckGaple.BottomValue) then
            PlaceCardOnTop(SelectedCard)
          else
          // player must select card
          begin
            answer := SelectCardQuestion;

            if answer = mrYes then
              PlaceCardOnTop(SelectedCard)
            else if answer = mrNo then
              PlaceCardOnBottom(SelectedCard)
            else
              Exit;
          end;
        end
        else if CardMatchBottom(SelectedCard) then
          PlaceCardOnBottom(SelectedCard)
        else if CardMatchTop(SelectedCard) then
          PlaceCardOnTop(SelectedCard)
        // player select unmatch card
        else
        begin
          WrongCardWarning;
          LabelStatus.Caption := Players[CurrentPlayer].Name+' is thinking... wrong!';
        end;
      end

      // player has no card to play then pass the turn
      else if PlayerPass then
      begin
        // passing card required
        if PassCardRequired then
        begin
          answer := PassCardQuestion;
          if answer = mrYes then DisableCard(SelectedCard);
        end
        // no passing card required
        else
        begin
          NoCardInformation;
          DisableCard(SelectedCard);
        end;
      end

      // player not allowed to play
      else if not PlayerPlay then
      begin
        // by passing turn
        Inc(TurnStep);
        NoCardInformation;

        // write game info
        turn_info := IntToStr(TurnStep)+': ';
        turn_info := turn_info + 'pass = ';
        turn_info := turn_info + IntToStr(DeckGaple.TopValue)+'_';
        turn_info := turn_info + IntToStr(DeckGaple.BottomValue);
        StepList.Add(turn_info);

        // move to next player
        NextPlayerTurn;
      end;
    end
    // wrong turn
    else
      WrongTurnWarning;

    // no more turn
    if GameIsOver and GameRunning then
    begin
      // show all disabled cards
      GameRunning := false;
      for i := 1 to NumberOfCards do
        with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
          if Visible then ShowDeck := false;

      LabelStatus.Caption := 'Game is over.';
      GameOverInformation;
      Exit;
    end;
  end;
end;

procedure TFormGaple.NetworkPlaying(Player: integer);
begin

end;

procedure TFormGaple.ComputerPlaying(Player: integer);
type
  card = record
    top_value: integer;
    bottom_value: integer;
    is_match: boolean;
    index: integer;
  end;
var
  place_on_top: boolean;
  card_match,some_match: boolean;
  i,highest,lowest: integer;
  card_idx,lowest_idx,highest_idx: integer;
  play_cards_count: integer;
  play_cards: array of card;
begin
  if GameRunning then
  begin
    // check player turn
    if (Player = CurrentPlayer) and
       (Players[CurrentPlayer].Kind = plComputer) then
    begin
      Cursor := crHourGlass;
      LabelStatus.Caption := Players[Player].Name+' is thinking... ';
      Application.ProcessMessages;
      Sleep(250);

      // check for deck reorganizing
      if (TurnStep mod 4 = 0) then
      begin
        ReorganizeDeckCards;
        DominoDeck.TopValue := DeckGaple.TopValue;
        DominoDeck.BottomValue := DeckGaple.BottomValue;
        DominoDeck.ShowDeck := false;
      end;

      // store value of available cards
      play_cards_count := 0;
      for i := 1 to NumberOfCards do
      with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
      begin
        if (Tag = Player) and Visible and Enabled then
        begin
          SetLength(play_cards,play_cards_count+1);

          play_cards[play_cards_count].top_value := TopValue;
          play_cards[play_cards_count].bottom_value := BottomValue;
          play_cards[play_cards_count].index := i;

          Inc(play_cards_count);
        end;
      end;

      // search for match cards
      some_match := false;
      for i := 0 to play_cards_count-1 do
      begin
        card_match := (play_cards[i].top_value = DeckGaple.TopValue) or
                      (play_cards[i].bottom_value = DeckGaple.TopValue) or
                      (play_cards[i].top_value = DeckGaple.BottomValue) or
                      (play_cards[i].bottom_value = DeckGaple.BottomValue);

        play_cards[i].is_match := card_match;
        if card_match then some_match := true;
      end;

      // player allowed to play
      if some_match then
      begin
        // selecting play card algorithm
        highest := -1;
        card_idx := -1;
        highest_idx := -1;

        for i := 0 to play_cards_count-1 do
        // if first turn, select card which match the deck
        if DeckGaple.IsEmpty then
        begin
          if (play_cards[i].is_match) and
             (play_cards[i].top_value = DeckGaple.TopValue) and
             (play_cards[i].bottom_value = DeckGaple.BottomValue) then
          begin
            highest_idx := play_cards[i].index;
            card_idx := i;
            Break;
          end;
        end
        // else, select card with biggest value
        else
        begin
          if (play_cards[i].is_match) and
             ((play_cards[i].top_value + play_cards[i].bottom_value) >= highest) then
          begin
            highest := play_cards[i].top_value + play_cards[i].bottom_value;
            highest_idx := play_cards[i].index;
            card_idx := i;
          end;
        end;

        // place selected card
        if DeckGaple.IsEmpty then
          FirstCard(TDominoCard(FindComponent('DominoCard'+IntToStr(highest_idx))))
        else if CardMatchBoth(TDominoCard(FindComponent('DominoCard'+IntToStr(highest_idx)))) then
        begin
          place_on_top := false;

          // place on value which there's same value on hand
          for i := 0 to play_cards_count-1 do
          begin
            if play_cards[i].top_value = play_cards[card_idx].top_value then
              place_on_top := true
            else if play_cards[i].bottom_value = play_cards[card_idx].bottom_value then
              place_on_top := false;
          end;

          if place_on_top then
            PlaceCardOnTop(TDominoCard(FindComponent('DominoCard'+IntToStr(highest_idx))))
          else
            PlaceCardOnBottom(TDominoCard(FindComponent('DominoCard'+IntToStr(highest_idx))));
        end
        else if CardMatchBottom(TDominoCard(FindComponent('DominoCard'+IntToStr(highest_idx)))) then
          PlaceCardOnBottom(TDominoCard(FindComponent('DominoCard'+IntToStr(highest_idx))))
        else
          PlaceCardOnTop(TDominoCard(FindComponent('DominoCard'+IntToStr(highest_idx))));

        // no more turn
        if GameIsOver and GameRunning then
        begin
          // show all disabled cards
          GameRunning := false;
          for i := 1 to NumberOfCards do
            with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
              if Visible then ShowDeck := false;

          LabelStatus.Caption := 'Game is over.';
          GameOverInformation;
          Exit;
        end;
      end

      // selecting disable card algorithm
      else 
      begin
        if play_cards_count > 0 then
        begin
          lowest := 111;
          lowest_idx := -1;

          // select card with lowest value
          for i := 0 to play_cards_count-1 do
          begin
            if ((play_cards[i].top_value + play_cards[i].bottom_value) <= lowest) then
            begin
              lowest := play_cards[i].top_value + play_cards[i].bottom_value;
              lowest_idx := play_cards[i].index;
            end;
          end;

          DisableCard(TDominoCard(FindComponent('DominoCard'+IntToStr(lowest_idx))));
        end
        else
          NextPlayerTurn;
      end;
    end
    else
      NextPlayerTurn;

    Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

