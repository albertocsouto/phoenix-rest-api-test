defmodule TestApi.Games.Quiniela do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestApi.Games.Quiniela.Match

  schema "quiniela" do
    field(:date, :date)
    has_many(:matches, Match)
    timestamps()
  end

  @doc false
  def changeset(quiniela, attrs) do
    quiniela
    |> cast(attrs, [
      :date
    ])
    |> validate_required([
      :date
    ])
    |> cast_assoc(:matches, required: true)
    |> validate_length(:matches, min: 16, max: 16)
  end
end
