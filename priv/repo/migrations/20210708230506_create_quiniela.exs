defmodule TestApi.Repo.Migrations.CreateQuiniela do
  use Ecto.Migration

  def change do
    drop_if_exists(table(:quiniela))

    create table(:quiniela) do
      add(:date, :date)
      add(:match1, {:array, :string})
      add(:match2, {:array, :string})
      add(:match3, {:array, :string})
      add(:match4, {:array, :string})
      add(:match5, {:array, :string})
      add(:match6, {:array, :string})
      add(:match7, {:array, :string})
      add(:match8, {:array, :string})
      add(:match9, {:array, :string})
      add(:match10, {:array, :string})
      add(:match11, {:array, :string})
      add(:match12, {:array, :string})
      add(:match13, {:array, :string})
      add(:match14, {:array, :string})
      add(:special1, {:array, :string})
      add(:special2, {:array, :string})
      timestamps()
    end
  end
end
