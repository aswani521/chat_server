defmodule ChatServer.ChatcontentControllerTest do
  use ChatServer.ConnCase

  alias ChatServer.Chatcontent
  @valid_attrs %{body: "some content", chatroom: 42, from: 42, to: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, chatcontent_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing chatcontents"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, chatcontent_path(conn, :new)
    assert html_response(conn, 200) =~ "New chatcontent"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, chatcontent_path(conn, :create), chatcontent: @valid_attrs
    assert redirected_to(conn) == chatcontent_path(conn, :index)
    assert Repo.get_by(Chatcontent, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, chatcontent_path(conn, :create), chatcontent: @invalid_attrs
    assert html_response(conn, 200) =~ "New chatcontent"
  end

  test "shows chosen resource", %{conn: conn} do
    chatcontent = Repo.insert! %Chatcontent{}
    conn = get conn, chatcontent_path(conn, :show, chatcontent)
    assert html_response(conn, 200) =~ "Show chatcontent"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, chatcontent_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    chatcontent = Repo.insert! %Chatcontent{}
    conn = get conn, chatcontent_path(conn, :edit, chatcontent)
    assert html_response(conn, 200) =~ "Edit chatcontent"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    chatcontent = Repo.insert! %Chatcontent{}
    conn = put conn, chatcontent_path(conn, :update, chatcontent), chatcontent: @valid_attrs
    assert redirected_to(conn) == chatcontent_path(conn, :show, chatcontent)
    assert Repo.get_by(Chatcontent, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    chatcontent = Repo.insert! %Chatcontent{}
    conn = put conn, chatcontent_path(conn, :update, chatcontent), chatcontent: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit chatcontent"
  end

  test "deletes chosen resource", %{conn: conn} do
    chatcontent = Repo.insert! %Chatcontent{}
    conn = delete conn, chatcontent_path(conn, :delete, chatcontent)
    assert redirected_to(conn) == chatcontent_path(conn, :index)
    refute Repo.get(Chatcontent, chatcontent.id)
  end
end
