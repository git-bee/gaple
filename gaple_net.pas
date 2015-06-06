(* NETWORK ROUTINES *)

{ client side }

procedure TFormGaple.ClientSocketConnecting(Sender: TObject; Socket: TCustomWinSocket);
begin
  with FormNew do
  begin
    // disable control while connecting
    cbKind.Enabled := false;
    EditName.Enabled := false;
    EditIP.Enabled := false;
    cbPlayer2.Enabled := false;
    cbPlayer3.Enabled := false;
    cbPlayer4.Enabled := false;
    EditMsg.Enabled := false;
    ButtonMsg.Enabled := false;

    ButtonClient.Caption := '&Abort';
    MemoMsg.Lines.Add('Connecting to server...');
  end;
end;

procedure TFormGaple.ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  with FormNew do
  begin
    cbKind.Enabled := false;
    EditName.Enabled := false;
    EditIP.Enabled := false;
    EditMsg.Enabled := true;
    ButtonMsg.Enabled := true;

    ButtonClient.Caption := '&Abort';
    MemoMsg.Lines.Add('Connected to server.');

    // send client player info after connected
    Socket.SendText('INFO:Name='+EditName.Text);
  end;
end;

procedure TFormGaple.ClientSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  with FormNew do
  begin
    // enable control after disconnecting
    cbKind.Enabled := true;
    EditName.Enabled := true;
    EditIP.Enabled := true;
    EditMsg.Enabled := false;
    ButtonMsg.Enabled := false;

    ButtonClient.Caption := '&Join';
    MemoMsg.Lines.Add('Join game has aborted.');
  end;
end;

procedure TFormGaple.ClientSocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  with FormNew do
  begin
    // enable control on error
    cbKind.Enabled := true;
    EditName.Enabled := true;
    EditIP.Enabled := true;
    EditMsg.Enabled := false;
    ButtonMsg.Enabled := false;

    ButtonClient.Caption := '&Join';
    MemoMsg.Lines.Add('Unable to connect to server.');

    ErrorCode := 0;
  end;
end;

// read from server
procedure TFormGaple.ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
  data_text: string;
  cmd_text: string;
  cmd_del_pos: integer;
begin
  data_text := Socket.ReceiveText;
  cmd_del_pos := Pos(':',data_text);
  cmd_text := Copy(data_text,1,cmd_del_pos-1);
  data_text := Copy(data_text,cmd_del_pos+1,Length(data_text));

  if (cmd_del_pos > 0) and (cmd_del_pos < 9) then
  begin
    // read server banner
    if cmd_text = 'BANNER' then
      FormNew.MemoMsg.Lines.Add(data_text);
  end
  else
    FormNew.MemoMsg.Lines.Add(data_text);
end;

{ server side }

procedure TFormGaple.ServerSocketClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  // send server banner to connected client
  if ServerSocket.Socket.ActiveConnections <= NetworkPlayers then
    Socket.SendText(ConfigFile.ReadString('NETWORK','Greeting','Welcome to Gaple server.'))
  else
  // reject client if server is full
  begin
    Socket.SendText('Game server is full.');
    Socket.Disconnect(Socket.SocketHandle);
  end;
end;

procedure TFormGaple.ServerSocketClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  FormNew.MemoMsg.Lines.Add('A player has been disconnected.');
end;

// read from client
procedure TFormGaple.ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  data_text: string;
  cmd_text: string;
  i,cmd_del_pos: integer;
begin
  data_text := Socket.ReceiveText;
  cmd_del_pos := Pos(':',data_text);
  cmd_text := Copy(data_text,1,cmd_del_pos-1);
  data_text := Copy(data_text,cmd_del_pos+1,Length(data_text));

  if (cmd_del_pos > 0) and (cmd_del_pos < 9) then
  begin
    // send new player info to network
    if cmd_text = 'INFO' then
    begin
      FormNew.MemoMsg.Lines.Add(data_text+' connected.');

      for i := 0 to ServerSocket.Socket.ActiveConnections-1 do
        ServerSocket.Socket.Connections[i].SendText(data_text+' connected.');
    end;
  end
  else
  begin
    FormNew.MemoMsg.Lines.Add(data_text);

    for i := 0 to ServerSocket.Socket.ActiveConnections-1 do
      ServerSocket.Socket.Connections[i].SendText(data_text);
  end;
end;

