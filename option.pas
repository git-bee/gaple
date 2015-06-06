unit option;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, Mask;

type
  TFormOptions = class(TForm)
    BevelPref: TBevel;
    LabelPref: TLabel;
    cbPassCard: TCheckBox;
    cbIncFirst: TCheckBox;
    LabelInitFirst: TLabel;
    EditInitFirst: TMaskEdit;

    BevelNames: TBevel;
    LabelNames: TLabel;
    LabelPlayer2: TLabel;
    EditPlayer2: TEdit;
    LabelPlayer3: TLabel;
    EditPlayer3: TEdit;
    LabelPlayer4: TLabel;
    EditPlayer4: TEdit;

    ButtonOK: TButton;
    ButtonCancel: TButton;

    procedure FormCreate(Sender: TObject);
    procedure cbIncFirstClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOptions: TFormOptions;

implementation

uses
  main;

{$R *.dfm}

procedure TFormOptions.FormCreate(Sender: TObject);
begin
  cbPassCard.Checked := FormGaple.PassCardRequired;
  cbIncFirst.Checked := FormGaple.IncFirstCardPair;
  EditInitFirst.Text := IntToStr(FormGaple.FirstCardPair);
  EditInitFirst.Enabled := not cbIncFirst.Checked;

  EditPlayer2.Text := FormGaple.Players[2].Name;
  EditPlayer3.Text := FormGaple.Players[3].Name;
  EditPlayer4.Text := FormGaple.Players[4].Name;
end;

procedure TFormOptions.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = char(VK_ESCAPE) then
    ModalResult := mrCancel
  else
    ModalResult := mrNone;

  Key := #0;
end;

procedure TFormOptions.cbIncFirstClick(Sender: TObject);
begin
  EditInitFirst.Enabled := not cbIncFirst.Checked;
end;

procedure TFormOptions.ButtonOKClick(Sender: TObject);
begin
  with FormGaple do
  if (EditPlayer2.Text <> EditPlayer3.Text) and
     (EditPlayer2.Text <> EditPlayer4.Text) and
     (EditPlayer3.Text <> EditPlayer4.Text) then
  begin
    ConfigFile.WriteBool('OPTIONS','PASSCARD',cbPassCard.Checked);
    ConfigFile.WriteBool('OPTIONS','INCFIRSTCARD',cbIncFirst.Checked);
    ConfigFile.WriteInteger('OPTIONS','FIRSTCARDPAIR',StrToInt(EditInitFirst.Text));

    ConfigFile.WriteString('PLAYERS','2',EditPlayer2.Text);
    ConfigFile.WriteString('PLAYERS','3',EditPlayer3.Text);
    ConfigFile.WriteString('PLAYERS','4',EditPlayer4.Text);
  end
  else
  begin
    PlayerNameError;
    EditPlayer2.SetFocus;
    self.ModalResult := mrNone;
  end;
end;

end.

