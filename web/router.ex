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
    resources "/users", UserController
    resources "/chatcontents", ChatcontentController
  end


  # Other scopes may use custom stacks.
  # scope "/api", ChatServer do
  #   pipe_through :api
  # end
end