defmodule TestApi.Repo.Migrations.CreateQuiniela do
  use Ecto.Migration

  def change do
    drop_if_exists(table(:quiniela))

    create table(:quiniela) do
      add(:date, :date)
      add(:season, :integer)
      add(:game_number, :integer)
      timestamps()
    end

    create(index(:quiniela, [:season, :game_number]))
  end
end
