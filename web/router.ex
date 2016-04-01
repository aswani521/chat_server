defmodule ChatServer.Router do
  use ChatServer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatServer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    get "/chats", ChatController, :index
  end

  resources "/users", UserController

  # Other scopes may use custom stacks.
  # scope "/api", ChatServer do
  #   pipe_through :api
  # end
end

# defmodule Chat.Channels.Rooms do
#   use Phoenix.Channel

#   def join(socket, "lobby", message) do
#     IO.puts "JOIN #{socket.channel}:#{socket.topic}"
#     broadcast socket, "user:entered", username: message["username"]
#     {:ok, socket}
#   end

#   def event("new:message", socket, message) do
#     broadcast socket, "new:message", content: message["content"],
#                                      username: messages["username"]

#     socket
#   end
# end
