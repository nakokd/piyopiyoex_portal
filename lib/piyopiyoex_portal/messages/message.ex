defmodule PiyopiyoexPortal.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :deleted_at, :naive_datetime
    field :display_name, :string
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:display_name, :message])
    |> validate_required([:display_name, :message])
  end
end
