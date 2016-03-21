ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ChatServer.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ChatServer.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ChatServer.Repo)

