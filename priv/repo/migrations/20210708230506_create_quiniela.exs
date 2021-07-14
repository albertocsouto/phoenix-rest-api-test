defmodule TestApi.Repo.Migrations.CreateQuiniela do
  use Ecto.Migration

  def change do
    drop_if_exists(table(:quiniela))

    create table(:quiniela) do
      add(:date, :date)
      timestamps()
    end
  end
end
