unit create;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls;

type
  TFormNew = class(TForm)
    LabelGame: TLabel;
    BevelGame: TBevel;
    LabelName: TLabel;
    EditName: TEdit;
    LabelKind: TLabel;
    cbKind: TComboBox;

    BevelClient: TBevel;
    LabelClient: TLabel;
    LabelIP: TLabel;
    EditIP: TEdit;
    ButtonClient: TButton;

    BevelServer: TBevel;
    LabelServer: TLabel;
    LabelPlayer2: TLabel;
    cbPlayer2: TComboBox;
    LabelPlayer3: TLabel;
    cbPlayer3: TComboBox;
    LabelPlayer4: TLabel;
    cbPlayer4: TComboBox;
    ButtonServer: TButton;

    BevelMsg: TBevel;
    LabelMsg: TLabel;
    MemoMsg: TMemo;
    EditMsg: TEdit;
    ButtonMsg: TButton;

    BevelButton: TBevel;
    ButtonStart: TButton;
    ButtonCancel: TButton;

    procedure FormCreate(Sender: TObject);

    procedure cbKindSelect(Sender: TObject);
    procedure EditMsgEnter(Sender: TObject);
    procedure EditMsgExit(Sender: TObject);

    procedure ButtonMsgClick(Sender: TObject);
    procedure ButtonClientClick(Sender: TObject);
    procedure ButtonServerClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNew: TFormNew;

implementation

uses
  main;

{$R *.dfm}

procedure TFormNew.FormCreate(Sender: TObject);
begin
  MemoMsg.Lines.Clear;
  EditName.Text := FormGaple.ConfigFile.ReadString('PLAYERS','1','Player 1');
  EditIP.Text := FormGaple.ConfigFile.ReadString('NETWORK','SERVER','172.17.3.145');
end;

procedure TFormNew.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = char(VK_ESCAPE) then
    ModalResult := mrCancel
  else
    ModalResult := mrNone;
end;

procedure TFormNew.cbKindSelect(Sender: TObject);
begin
  EditIP.Enabled := (cbKind.ItemIndex = 2);
  ButtonClient.Enabled := (cbKind.ItemIndex = 2);
  cbPlayer2.Enabled := (cbKind.ItemIndex = 1);
  cbPlayer3.Enabled := (cbKind.ItemIndex = 1);
  cbPlayer4.Enabled := (cbKind.ItemIndex = 1);
  ButtonServer.Enabled := (cbKind.ItemIndex = 1);
  MemoMsg.Enabled := (cbKind.ItemIndex = 1) or (cbKind.ItemIndex = 2);
  ButtonStart.Enabled := (cbKind.ItemIndex = 0);

  if cbKind.ItemIndex = 0 then FormGaple.GameKind := gkAlone
  else if cbKind.ItemIndex = 1 then FormGaple.GameKind := gkServer
  else if cbKind.ItemIndex = 2 then FormGaple.GameKind := gkClient;
end;

procedure TFormNew.EditMsgEnter(Sender: TObject);
begin
  ButtonMsg.Default := true;
  ButtonStart.Default := false;
end;

procedure TFormNew.EditMsgExit(Sender: TObject);
begin
  ButtonMsg.Default := false;
  ButtonStart.Default := true;
end;

procedure TFormNew.ButtonMsgClick(Sender: TObject);
var
  i: integer;
begin
  if EditMsg.Text <> '' then
  begin
    if FormGaple.ServerSocket.Active then
    begin
      for i := 0 to FormGaple.ServerSocket.Socket.ActiveConnections-1 do
        FormGaple.ServerSocket.Socket.Connections[i].SendText(EditName.Text+' > '+EditMsg.Text);

      MemoMsg.Lines.Add(EditName.Text+' > '+EditMsg.Text);
      EditMsg.Text := '';
      EditMsg.SetFocus;
    end
    else if FormGaple.ClientSocket.Active then
    begin
      FormGaple.ClientSocket.Socket.SendText(EditName.Text+' > '+EditMsg.Text);
      EditMsg.Text := '';
      EditMsg.SetFocus;
    end;
  end;
end;

procedure TFormNew.ButtonStartClick(Sender: TObject);
begin
  FormGaple.ConfigFile.WriteString('PLAYERS','1',EditName.Text);
  FormGaple.ConfigFile.WriteString('NETWORK','SERVER',EditIP.Text);
end;

procedure TFormNew.ButtonCancelClick(Sender: TObject);
begin
  FormGaple.ServerSocket.Active := false;
  FormGaple.ClientSocket.Active := false;
end;

procedure TFormNew.ButtonClientClick(Sender: TObject);
begin
  if EditIP.Text <> '' then
  begin
    FormGaple.ClientSocket.Address := EditIP.Text;

    if FormGaple.ClientSocket.Active then
      FormGaple.ClientSocket.Close
    else
      FormGaple.ClientSocket.Open;
  end
  else
    FormGaple.NoServerError;
end;

procedure TFormNew.ButtonServerClick(Sender: TObject);
var
  np2,np3,np4: boolean;
begin
  // open server
  if not FormGaple.ServerSocket.Active then
  begin
    np2 := (cbPlayer2.ItemIndex = 0);
    np3 := (cbPlayer3.ItemIndex = 0);
    np4 := (cbPlayer4.ItemIndex = 0);

    // determine number of network players
    FormGaple.NetworkPlayers := 0;
    if np2 then Inc(FormGaple.NetworkPlayers);
    if np3 then Inc(FormGaple.NetworkPlayers);
    if np4 then Inc(FormGaple.NetworkPlayers);

    // ascociate players kind
    if np2 then FormGaple.Players[2].Kind := plNetwork else FormGaple.Players[2].Kind := plComputer;
    if np3 then FormGaple.Players[3].Kind := plNetwork else FormGaple.Players[3].Kind := plComputer;
    if np4 then FormGaple.Players[4].Kind := plNetwork else FormGaple.Players[4].Kind := plComputer;

    // start game server
    if FormGaple.NetworkPlayers > 0 then
      FormGaple.ServerSocket.Open
    else
    begin
      FormGaple.NoNetPlayerError;
      Exit;
    end;

    // enable components
    cbKind.Enabled := not FormGaple.ServerSocket.Active;
    EditName.Enabled := not FormGaple.ServerSocket.Active;
    cbPlayer2.Enabled := not FormGaple.ServerSocket.Active;
    cbPlayer3.Enabled := not FormGaple.ServerSocket.Active;
    cbPlayer4.Enabled := not FormGaple.ServerSocket.Active;
    EditMsg.Enabled := FormGaple.ServerSocket.Active;
    ButtonMsg.Enabled := FormGaple.ServerSocket.Active;

    ButtonServer.Caption := '&Close';
    MemoMsg.Lines.Add('Waiting for '+IntToStr(FormGaple.NetworkPlayers)+' network players...');
  end
  // closing server
  else
  begin
    FormGaple.ServerSocket.Close;

    // disable components
    cbKind.Enabled := not FormGaple.ServerSocket.Active;
    EditName.Enabled := not FormGaple.ServerSocket.Active;
    cbPlayer2.Enabled := not FormGaple.ServerSocket.Active;
    cbPlayer3.Enabled := not FormGaple.ServerSocket.Active;
    cbPlayer4.Enabled := not FormGaple.ServerSocket.Active;
    EditMsg.Enabled := FormGaple.ServerSocket.Active;
    ButtonMsg.Enabled := FormGaple.ServerSocket.Active;

    ButtonServer.Caption := '&Create';
    MemoMsg.Lines.Add('Game server has been closed.');
  end;
end;

end.

