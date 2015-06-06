unit main;

{
  Gaple - Freeware Game
  Version 1.0 - 22 March 2003
  -----------------------------
  Created by: Bee Jay
  Copyright (C) BeeSoft Technology, 2003.

  ACKNOWLEDGMENT
  --------------
  My big thank goes to all people who share their knowledges
  about Delphi for free, I've learned a lot from them. This
  game is a small contribution from me to the community.

  LICENSE
  -------
  This game is a freeware. Feel free to use, copy, modify,
  and distribute it as long as for non-commercial use. However,
  if you do some modification, please send me a copy of it.

  DISCLAIMER
  ----------
  This game is provided 'as is', and the author is under
  no circumstances responsible for any damage, what soever,
  that it might cause to anyone or anything.

  CONTACT
  -------
  ICQ: 232400751
  Email: bee.ography@gmail.com
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, StdCtrls,
  ExtCtrls, Controls, Dialogs, Menus, INIFiles, ScktComp, Domino, Sockets;

const
  // game constants
  NumberOfCards = 28;
  NumberOfPlayers = 4;

type
  // player kind
  TGameKind = (gkAlone, gkServer, gkClient);
  TNetCommand = (ncBanner, ncChat, ncCard, ncInfo, ncStatus);
  TPlayerKind = (plHuman, plNetwork, plComputer);

  // player info
  TPlayer = record
    Kind: TPlayerKind;
    Name: string[80];
  end;

  // game score
  TScore = record
    Player1: integer;
    Player2: integer;
    Player3: integer;
    Player4: integer;
  end;

  // card position
  TCardPosition = record
     Top: integer;
     Left: integer;
     Orientation: TDominoCardOrientation;
  end;

  // game table information
  TDeckGaple = record
    IsEmpty: boolean;
    TopCard: TCardPosition;
    BottomCard: TCardPosition;
    TopValue: TDominoValue;
    BottomValue: TDominoValue;
  end;

  // game form
  TFormGaple = class(TForm)
    // domino cards
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
    CardPlayer1: TDominoCard;
    CardPlayer2: TDominoCard;
    CardPlayer3: TDominoCard;
    CardPlayer4: TDominoCard;
    DominoDeck: TDominoCard;

    // info labels
    LabelPlayer1: TLabel;
    LabelPlayer2: TLabel;
    LabelPlayer3: TLabel;
    LabelPlayer4: TLabel;
    LabelStatus: TLabel;
    LabelDeck: TLabel;

    // menu items
    MainMenu: TMainMenu;
    MenuGame: TMenuItem;
    ItemNew: TMenuItem;
    ItemOptions: TMenuItem;
    Separator1: TMenuItem;
    ItemExit: TMenuItem;
    MenuView: TMenuItem;
    ItemChat: TMenuItem;
    ItemCards: TMenuItem;
    ItemDeck: TMenuItem;
    ItemScores: TMenuItem;
    Separator2: TMenuItem;
    ItemSort: TMenuItem;
    MenuHelp: TMenuItem;
    ItemAbout: TMenuItem;
    ItemHelp: TMenuItem;
    ShapeStatus: TShape;

    ListBoxCards: TListBox;
    LabelCards: TLabel;
    BevelCards: TBevel;
    PanelBee: TPanel;
    ImageBee: TImage;
    ClientSocket: TClientSocket;
    ServerSocket: TServerSocket;

    // form's event handler
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure DominoCardClick(Sender: TObject);
    procedure DominoCardMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ItemExitClick(Sender: TObject);
    procedure ItemNewClick(Sender: TObject);
    procedure ItemCardsClick(Sender: TObject);
    procedure ItemAboutClick(Sender: TObject);
    procedure ItemChatClick(Sender: TObject);
    procedure ItemOptionsClick(Sender: TObject);
    procedure ItemScoresClick(Sender: TObject);

    procedure ClientSocketConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);

    procedure ServerSocketClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ItemSortClick(Sender: TObject);
    procedure ItemDeckClick(Sender: TObject);
  public
    // game info
    Players: array[1..NumberOfPlayers] of TPlayer;
    Cards: array[1..NumberOfCards] of string[5];
    Scores: array of TScore;
    ConfigFile: TINIFile;
    DeckGaple: TDeckGaple;
    GameKind: TGameKind;
    StepList: TStringList;
    DisabledList: TStringList;

    // game control
    NeverStarted: boolean;
    PlayerPass: boolean;
    PlayerPlay: boolean;
    GameRunning: boolean;
    IncFirstCardPair: boolean;
    PassCardRequired: boolean;
    FirstCardPair: integer;
    CurrentPlayer: integer;
    TurnStep: integer;
    GamePlayed: integer;
    MaximumScore: integer;
    NetworkPlayers: integer;

    // misc methods
    procedure ReadConfigFile;

    // message methods
    function  WrongCardWarning: integer;
    function  WrongTurnWarning: integer;
    function  PassCardQuestion: integer;
    function  SelectCardQuestion: integer;
    function  QuitGameQuestion: integer;
    function  NoCardInformation: integer;
    function  ApplyChangesInformation: integer;
    function  GameOverInformation: integer;
    function  NoServerError: integer;
    function  NoNetPlayerError: integer;
    function  PlayerNameError: integer;

    // card placement methods
    procedure ScrambleCards;
    procedure ReorganizeDeckCards;
    procedure FirstCard(SelectedCard: TDominoCard);
    procedure PlaceCardOnTop(SelectedCard: TDominoCard);
    procedure PlaceCardOnBottom(SelectedCard: TDominoCard);
    procedure DisableCard(SelectedCard: TDominoCard);

    // card mathing methods
    function  CardMatchBoth(SelectedCard: TDominoCard): boolean;
    function  CardMatchTop(SelectedCard: TDominoCard): boolean;
    function  CardMatchBottom(SelectedCard: TDominoCard): boolean;
    function  NoCardLeft(Player: integer): boolean;
    function  NoCardMatch(Player: integer): boolean;
    function  GameIsOver: boolean;

    // game logics
    procedure CreateGame;
    function  FirstPlayer(PairValue: integer): integer;
    procedure NextPlayerTurn;
    procedure HumanPlaying(SelectedCard: TDominoCard);
    procedure NetworkPlaying(Player: integer);
    procedure ComputerPlaying(Player: integer);

    // network command parser
  end;

var
  FormGaple: TFormGaple;

implementation

uses
  create, option, chat, score, about, deck;

{$R *.dfm}

{$I gaple_ai.pas}       // game ai and algorithm
{$I gaple_net.pas}      // network playing algorithm
{$I gaple_msg.pas}      // game message management
{$I gaple_card.pas}     // card placement and selection algorithm

(* FORM EVENT HANDLER *)

procedure TFormGaple.FormCreate(Sender: TObject);
begin
  ClientWidth := 501;
  StepList := TStringList.Create;
  DisabledList := TStringList.Create;

  Randomize;
  GameKind := gkAlone;
  GamePlayed := -1;
  NetworkPlayers := 0;
  NeverStarted := true;
  ConfigFile := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\gaple.ini');
  ReadConfigFile;
end;

procedure TFormGaple.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StepList.Free;
  DisabledList.Free;
  ServerSocket.Active := false;
  ClientSocket.Active := false;

  if ItemChat.Checked then FormChat.Free;
end;

procedure TFormGaple.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if GameRunning and not GameIsOver then
    CanClose := (QuitGameQuestion = mrYes)
  else
    CanClose := true;
end;

procedure TFormGaple.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (CurrentPlayer = 1) and (Key in ['1'..'7']) then
  begin
    case Key of
      '1': if DominoCard1.Visible and DominoCard1.Enabled then DominoCardClick(DominoCard1);
      '2': if DominoCard2.Visible and DominoCard2.Enabled then DominoCardClick(DominoCard2);
      '3': if DominoCard3.Visible and DominoCard3.Enabled then DominoCardClick(DominoCard3);
      '4': if DominoCard4.Visible and DominoCard4.Enabled then DominoCardClick(DominoCard4);
      '5': if DominoCard5.Visible and DominoCard5.Enabled then DominoCardClick(DominoCard5);
      '6': if DominoCard6.Visible and DominoCard6.Enabled then DominoCardClick(DominoCard6);
      '7': if DominoCard7.Visible and DominoCard7.Enabled then DominoCardClick(DominoCard7);
    end;

    Key := #0;
  end;
end;

procedure TFormGaple.DominoCardClick(Sender: TObject);
begin
  HumanPlaying(Sender as TDominoCard);
end;

procedure TFormGaple.DominoCardMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then (Sender as TDominoCard).Flip;
end;

(* MENU EVENT HANDLER *)

procedure TFormGaple.ItemNewClick(Sender: TObject);
begin
  if NeverStarted then
  begin
    FormNew := TFormNew.Create(self);
    if FormNew.ShowModal = mrOK then CreateGame;
    FormNew.Free;

    ItemChat.Enabled := (GameKind <> gkAlone);
    ItemSort.Enabled := true;
  end
  else if GameRunning then
  begin
    if (QuitGameQuestion = mrYes) then
    begin
      Dec(GamePlayed);
      CreateGame;
    end;
  end
  else
    CreateGame;
end;

procedure TFormGaple.ItemOptionsClick(Sender: TObject);
begin
  FormOptions := TFormOptions.Create(self);
  if FormOptions.ShowModal = mrOK then ApplyChangesInformation;
  FormOptions.Free;
end;

procedure TFormGaple.ItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormGaple.ItemChatClick(Sender: TObject);
begin
  if ItemChat.Checked then
  begin
    FormChat := TFormChat.Create(self);
    FormChat.Show;
  end
  else
    FormChat.Free;
end;

procedure TFormGaple.ItemCardsClick(Sender: TObject);
begin
  BevelCards.Visible := ItemCards.Checked;
  LabelCards.Visible := ItemCards.Checked;
  ListBoxCards.Visible := ItemCards.Checked;

  if ItemCards.Checked then
    ClientWidth := 606
  else
    ClientWidth := 501;
end;

procedure TFormGaple.ItemDeckClick(Sender: TObject);
begin
  FormDeck.Visible := ItemDeck.Checked;
end;

procedure TFormGaple.ItemScoresClick(Sender: TObject);
begin
  FormScore := TFormScore.Create(self);
  FormScore.ShowModal;
  FormScore.Free;
end;

procedure TFormGaple.ItemAboutClick(Sender: TObject);
begin
  FormAbout := TFormAbout.Create(self);
  FormAbout.ShowModal;
  FormAbout.Free;
end;

procedure TFormGaple.ItemSortClick(Sender: TObject);
var
  i: integer;
  play,dead: boolean;
  card_list: TStringList;
begin
  card_list := TStringList.Create;
  card_list.Clear;

  for i := 1 to 7 do
    with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    begin
      if Visible and Enabled then
        card_list.Add('p_'+IntToStr(TopValue)+'_'+IntToStr(BottomValue))
      else if Visible and (not Enabled) then
        card_list.Add('v_'+IntToStr(TopValue)+'_'+IntToStr(BottomValue))
      else
        card_list.Add('x_'+IntToStr(TopValue)+'_'+IntToStr(BottomValue));

      ShowDeck := true;
    end;

  card_list.Sort;

  for i := 1 to 7 do
    with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    begin
      TopValue := StrToInt(Copy(card_list[i-1],3,1));
      BottomValue := StrToInt(Copy(card_list[i-1],5,1));
      play := (Copy(card_list[i-1],1,1) = 'p');
      dead := (Copy(card_list[i-1],1,1) = 'v');

      Visible := play or dead;
      Enabled := play;
      ShowDeck := false;
    end;

  card_list.Free;
end;

(* MISC ROUTINES *)

procedure TFormGaple.ReadConfigFile;
begin
  ServerSocket.Port := ConfigFile.ReadInteger('NETWORK','PORT',2700);
  ClientSocket.Port := ConfigFile.ReadInteger('NETWORK','PORT',2700);

  PassCardRequired := ConfigFile.ReadBool('OPTIONS','PASSCARD',false);
  IncFirstCardPair := ConfigFile.ReadBool('OPTIONS','INCFIRSTCARD',true);
  FirstCardPair := ConfigFile.ReadInteger('OPTIONS','FIRSTCARDPAIR',0);
  MaximumScore := ConfigFile.ReadInteger('OPTIONS','MAXSCORES',0);;

  Players[1].Name := ConfigFile.ReadString('PLAYERS','1','Player 1');
  Players[2].Name := ConfigFile.ReadString('PLAYERS','2','Player 2');
  Players[3].Name := ConfigFile.ReadString('PLAYERS','3','Player 3');
  Players[4].Name := ConfigFile.ReadString('PLAYERS','4','Player 4');

  if (Pos('PLAYER',UpperCase(Players[1].Name)) = 0) then
    LabelPlayer1.Caption := Players[1].Name;
  if (Pos('PLAYER',UpperCase(Players[2].Name)) = 0) then
    LabelPlayer2.Caption := Players[2].Name;
  if (Pos('PLAYER',UpperCase(Players[3].Name)) = 0) then
    LabelPlayer3.Caption := Players[3].Name;
  if (Pos('PLAYER',UpperCase(Players[4].Name)) = 0) then
    LabelPlayer4.Caption := Players[4].Name;
end;

procedure TFormGaple.CreateGame;
var
  i: integer;
begin
  { initial values }
  LabelStatus.Caption := 'Scrambling card...';
  Application.ProcessMessages;
  Sleep(250);

  StepList.Clear;
  DisabledList.Clear;
  ReadConfigFile;

  NeverStarted := false;
  PlayerPass := false;
  PlayerPlay := true;
  GameRunning := true;

  Inc(GamePlayed);
  TurnStep := 0;

  Players[1].Kind := plHuman;
  Players[2].Kind := plComputer;
  Players[3].Kind := plComputer;
  Players[4].Kind := plComputer;

  SetLength(Scores,GamePlayed+1);
  with Scores[GamePlayed] do
  begin
    Player1 := 0;
    Player2 := 0;
    Player3 := 0;
    Player4 := 0;
  end;

  with DeckGaple do
  begin
    IsEmpty := true;
    TopValue := 0;
    BottomValue := 0;

    TopCard.Top := 210;
    TopCard.Left := 230;
    TopCard.Orientation := coLandscape;
    BottomCard.Top := TopCard.Top;
    BottomCard.Left := TopCard.Left;
    BottomCard.Orientation := coLandscape;
  end;

  { table management }

  FormDeck.ResetDeckTable;

  // hide all cards
  for i := 1 to NumberOfCards do
    with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
      Visible := false;

  // reorganize table
  ScrambleCards;
  ReorganizeDeckCards;
  DominoDeck.ShowDeck := true;

  // redisplay all cards
  for i := 1 to NumberOfCards do
    with TDominoCard(FindComponent('DominoCard'+IntToStr(i))) do
    begin
      ShowDeck := (Players[Tag].Kind <> plHuman);
      Enabled := true;
      Visible := true;

      Application.ProcessMessages;
      Sleep(15);
    end;

  LabelStatus.Caption := 'Scrambling card... done.';
  Application.ProcessMessages;
  Sleep(250);

  { player management }

  CurrentPlayer := FirstPlayer(GamePlayed);
  LabelStatus.Caption := 'Waiting for '+Players[CurrentPlayer].Name+' ... ';
  ListBoxCards.Items.Clear;

  for i := 1 to 4 do
  with TLabel(FindComponent('LabelPlayer'+IntToStr(i))) do
    if i = CurrentPlayer then
      Font.Color := clLime
    else
      Font.Color := clWhite;

  case Players[CurrentPlayer].Kind of
    plNetwork: NetworkPlaying(CurrentPlayer);
    plComputer: ComputerPlaying(CurrentPlayer);
  end;
end;

end.

