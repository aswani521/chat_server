defmodule ChatServer.ChatController do
 use ChatServer.Web, :controller

 def index(conn, _params) do 
 	render conn, "lobby.html" 
 end 
end