defmodule TestApi.Games.Quiniela.Match do
  use Ecto.Schema
  import Ecto.Changeset


  schema "match" do
    field(:date, :date)
    field(:team1, :string) 
    field(:team2, :string)
    field(:team1_goals, :integer)
    field(:team2_goals, :integer) 
    field(:result, :string)
    field(:played, :boolean)
    belongs_to :quiniela, TestApi.Games.Quiniela
    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [
      :date,
      :team1,
      :team2,
      :team1_goals,
      :team2_goals,
      :result,
      :played
    ])
    |> validate_required([
      :date,
      :team1,
      :team2,
      :team1_goals,
      :team2_goals,
      :result,
      :played
    ])
  end
end
