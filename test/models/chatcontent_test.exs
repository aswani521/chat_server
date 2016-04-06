defmodule ChatServer.ChatcontentTest do
  use ChatServer.ModelCase

  alias ChatServer.Chatcontent

  @valid_attrs %{body: "some content", chatroom: 42, from: 42, to: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Chatcontent.changeset(%Chatcontent{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Chatcontent.changeset(%Chatcontent{}, @invalid_attrs)
    refute changeset.valid?
  end
end
