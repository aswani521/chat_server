defmodule ChatServer.Repo.Migrations.CreateChatcontent do
  use Ecto.Migration

  def change do
    create table(:chatcontents) do
      add :body, :text
      add :from, :integer
      add :to, :integer
      add :chatroom, :integer

      timestamps
    end

  end
end
