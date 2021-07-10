defmodule TestApi.Games.Quiniela do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quiniela" do
    field(:date, :date)
    field(:match1, {:array, :string})
    field(:match2, {:array, :string})
    field(:match3, {:array, :string})
    field(:match4, {:array, :string})
    field(:match5, {:array, :string})
    field(:match6, {:array, :string})
    field(:match7, {:array, :string})
    field(:match8, {:array, :string})
    field(:match9, {:array, :string})
    field(:match10, {:array, :string})
    field(:match11, {:array, :string})
    field(:match12, {:array, :string})
    field(:match13, {:array, :string})
    field(:match14, {:array, :string})
    field(:special1, {:array, :string})
    field(:special2, {:array, :string})
    timestamps()
  end

  @doc false
  def changeset(quiniela, attrs) do
    quiniela
    |> cast(attrs, [
      :date,
      :match1,
      :match2,
      :match3,
      :match4,
      :match5,
      :match6,
      :match7,
      :match8,
      :match9,
      :match10,
      :match11,
      :match12,
      :match13,
      :match14,
      :special1,
      :special2
    ])
    |> validate_required([
      :date,
      :match1,
      :match2,
      :match3,
      :match4,
      :match5,
      :match6,
      :match7,
      :match8,
      :match9,
      :match10,
      :match11,
      :match12,
      :match13,
      :match14,
      :special1,
      :special2
    ])
  end
end
