(* GAME MESSAGES *)

function  TFormGaple.PlayerNameError: integer;
begin
  result := Application.MessageBox
            ('Player name must be unique.'#13'Please correct the players name. '#13,
             'Name Conflict',MB_OK or MB_ICONERROR);
end;

function  TFormGaple.NoNetPlayerError: integer;
begin
  result := Application.MessageBox
            ('No network player involved.'#13'Cannot start game server.'#13,
             'No Player',MB_OK or MB_ICONERROR);
end;

function  TFormGaple.NoServerError: integer;
var
  s: string;
begin
  s := 'You haven''t enter the server IP address.'#13+
       'Please enter IP address of game server.';

  result := Application.MessageBox
            (PChar(s),'Error',MB_OK or MB_ICONERROR);
end;

function  TFormGaple.WrongCardWarning: integer;
var
  s: string;
begin
  s := 'Your card does not match with any deck cards.'#13+
       'Please select another card that mathes.'#13#13+
       'The deck is expecting value '+IntToStr(DeckGaple.TopValue)+' or '+IntToStr(DeckGaple.BottomValue)+'.'#13;

  result := Application.MessageBox
            (PChar(s),'Wrong card', MB_OK or MB_ICONWARNING);
end;

function  TFormGaple.WrongTurnWarning: integer;
begin
  result := Application.MessageBox
            ('This card belongs to player who is not on the turn.'#13+
             'Please select card of player currently playing.'#13,
             'Wrong turn', MB_OK or MB_ICONWARNING);
end;

function  TFormGaple.PassCardQuestion: integer;
begin
  result := Application.MessageBox
            ('There is no card on your hand that matches with any deck cards.'#13+
             'Are you sure make this card as passing card?'#13,
             'Pass card', MB_YESNO or MB_ICONQUESTION);
end;

function  TFormGaple.SelectCardQuestion: integer;
begin
  result := Application.MessageBox
            ('Your card matches with both sides of the deck cards.'#13+
             'Will you place your card on the top side of the deck?'#13#13+
             'Click Yes, if you want to place your card on the top side.   '#13+
             'Click No, if you want to place your card on the bottom side.   '#13+
             'Click Cancel, if you want to change or select another card.   '#13,
             'Select card', MB_YESNOCANCEL or MB_ICONQUESTION);
end;

function  TFormGaple.ApplyChangesInformation: integer;
begin
  result := Application.MessageBox
            ('The changes will apply after you restart the game or  '#13+
             'maximum game scores has reached by the players.',
             'Information',MB_OK or MB_ICONINFORMATION);
end;

function  TFormGaple.NoCardInformation: integer;
begin
  result := Application.MessageBox
            ('There is no card available on your hand.'#13+
             'The game is by passing your turn.'#13,
             'No card', MB_OK or MB_ICONINFORMATION);
end;

function  TFormGaple.GameOverInformation: integer;
var
  i: integer;
begin
  for i := 1 to 7 do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    if Visible then Scores[GamePlayed].Player1 := Scores[GamePlayed].Player1 + TopValue + BottomValue;
  for i := 8 to 14 do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    if Visible then Scores[GamePlayed].Player2 := Scores[GamePlayed].Player2 + TopValue + BottomValue;
  for i := 15 to 21 do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    if Visible then Scores[GamePlayed].Player3 := Scores[GamePlayed].Player3 + TopValue + BottomValue;
  for i := 22 to 28 do
  with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    if Visible then Scores[GamePlayed].Player4 := Scores[GamePlayed].Player4 + TopValue + BottomValue;

  FormScore := TFormScore.Create(self);
  result := FormScore.ShowModal;
  FormScore.Free;
end;

function  TFormGaple.QuitGameQuestion: integer;
begin
  result :=  Application.MessageBox
             ('Current game is still running.'#13+
              'Are you sure want to quit the game?'#13,
              'Confirm',MB_YESNO or MB_ICONQUESTION);
end;

