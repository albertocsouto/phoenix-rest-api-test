defmodule TestApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    drop_if_exists table(:users) 
    create table(:users) do
      add :email, :string
      add :hash_pass, :string
      add :phone, :string
      add :name, :string
      add :lastname, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
