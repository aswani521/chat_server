defmodule ChatServer.ChatcontentController do
  use ChatServer.Web, :controller

  alias ChatServer.Chatcontent

  plug :scrub_params, "chatcontent" when action in [:create, :update]

  def index(conn, _params) do
    chatcontents = Repo.all(Chatcontent)
    render(conn, "index.html", chatcontents: chatcontents)
  end

  def new(conn, _params) do
    changeset = Chatcontent.changeset(%Chatcontent{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chatcontent" => chatcontent_params}) do
    changeset = Chatcontent.changeset(%Chatcontent{}, chatcontent_params)

    case Repo.insert(changeset) do
      {:ok, _chatcontent} ->
        conn
        |> put_flash(:info, "Chatcontent created successfully.")
        |> redirect(to: chatcontent_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chatcontent = Repo.get!(Chatcontent, id)
    render(conn, "show.html", chatcontent: chatcontent)
  end

  def edit(conn, %{"id" => id}) do
    chatcontent = Repo.get!(Chatcontent, id)
    changeset = Chatcontent.changeset(chatcontent)
    render(conn, "edit.html", chatcontent: chatcontent, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chatcontent" => chatcontent_params}) do
    chatcontent = Repo.get!(Chatcontent, id)
    changeset = Chatcontent.changeset(chatcontent, chatcontent_params)

    case Repo.update(changeset) do
      {:ok, chatcontent} ->
        conn
        |> put_flash(:info, "Chatcontent updated successfully.")
        |> redirect(to: chatcontent_path(conn, :show, chatcontent))
      {:error, changeset} ->
        render(conn, "edit.html", chatcontent: chatcontent, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chatcontent = Repo.get!(Chatcontent, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(chatcontent)

    conn
    |> put_flash(:info, "Chatcontent deleted successfully.")
    |> redirect(to: chatcontent_path(conn, :index))
  end
end
