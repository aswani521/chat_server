defmodule HelloPhoenix.HelloController do
  use ChatServer.Web, :controller

  def index(conn, _params) do
  	render conn, "index.html"
  end
end