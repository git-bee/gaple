program gaple;

uses
  Forms,
  main in 'main.pas' {FormGaple},
  create in 'create.pas' {FormNew},
  option in 'option.pas' {FormOptions},
  chat in 'chat.pas' {FormChat},
  score in 'score.pas' {FormScore},
  deck in 'deck.pas' {FormDeck},
  about in 'about.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormGaple, FormGaple);
  Application.CreateForm(TFormDeck, FormDeck);
  Application.Run;
end.
