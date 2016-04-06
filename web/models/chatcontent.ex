defmodule ChatServer.Chatcontent do
  use ChatServer.Web, :model

  schema "chatcontents" do
    field :body, :string
    field :from, :integer
    field :to, :integer
    field :chatroom, :integer

    timestamps
  end

  @required_fields ~w(body from to chatroom)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
