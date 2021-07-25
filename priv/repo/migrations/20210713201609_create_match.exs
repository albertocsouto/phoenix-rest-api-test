defmodule TestApi.Repo.Migrations.CreateMatch do
  use Ecto.Migration

  def change do
    create table(:match) do
      add(:date, :date)
      add(:team1, :string)
      add(:team2, :string)
      add(:team1_goals, :integer)
      add(:team2_goals, :integer)
      add(:result, :string)
      add(:played, :boolean)
      add(:isSpecial, :boolean)
      add(:quiniela_id, references(:quiniela))

      timestamps()
    end

    create(index(:match, [:quiniela_id]))
  end
end
