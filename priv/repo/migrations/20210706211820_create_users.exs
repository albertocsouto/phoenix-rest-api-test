defmodule TestApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    drop_if_exists table(:user) 
    create table(:user) do
      add :email, :string
      add :hash_pass, :string
      add :phone, :string
      add :name, :string
      add :lastname, :string
      timestamps()
    end

    create unique_index(:user, [:email])
  end
end
