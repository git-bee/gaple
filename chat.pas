unit chat;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls;

type
  TFormChat = class(TForm)
    LabelChat: TLabel;
    MemoChat: TMemo;
    LabelMsg: TLabel;
    EditChat: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure EditChatKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormChat: TFormChat;

implementation

uses
  main;

{$R *.dfm}

procedure TFormChat.FormShow(Sender: TObject);
begin
  Width := FormGaple.ClientWidth;

  Constraints.MinHeight := Height;
  Constraints.MinWidth := Width;
  Constraints.MaxHeight := FormGaple.Height div 2;
  Constraints.MaxWidth := FormGaple.Width;

  EditChat.Text := '';
  EditChat.SetFocus;
end;

procedure TFormChat.FormHide(Sender: TObject);
begin
  FormGaple.ItemChat.Checked := false;
end;

procedure TFormChat.EditChatKeyPress(Sender: TObject; var Key: Char);
var
  i: integer;
begin
  if (Key = #13) and (EditChat.Text <> '') then
  begin
    if FormGaple.ServerSocket.Active then
    begin
      for i := 0 to FormGaple.ServerSocket.Socket.ActiveConnections-1 do
        FormGaple.ServerSocket.Socket.Connections[i].SendText(EditChat.Text);

      MemoChat.Lines.Add(EditChat.Text);
      EditChat.Text := '';
    end
    else if FormGaple.ClientSocket.Active then
    begin
      FormGaple.ClientSocket.Socket.SendText(EditChat.Text);
      EditChat.Text := '';
    end;

    Key := #0;
  end;
end;

end.

