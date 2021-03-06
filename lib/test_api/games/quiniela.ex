defmodule TestApi.Games.Quiniela do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestApi.Games.Quiniela.Match

  schema "quiniela" do
    field(:date, :date)
    field(:season, :integer)
    field(:game_number, :integer)
    has_many(:matches, Match)
    timestamps()
  end

  @doc false
  def changeset(quiniela, attrs) do
    quiniela
    |> cast(attrs, [
      :date,
      :season,
      :game_number
    ])
    |> validate_required([
      :date,
      :season,
      :game_number
    ])
    |> cast_assoc(:matches, required: true)
    |> validate_length(:matches, min: 16, max: 16)
  end
end
