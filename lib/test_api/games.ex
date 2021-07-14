defmodule TestApi.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias TestApi.Repo

  alias TestApi.Games.Quiniela
  alias TestApi.Games.Quiniela.Match

  @doc """
  Returns the list of quinielas.

  ## Examples

      iex> list_quinielas()
      [%Quiniela{}, ...]

  """
  def list_quinielas() do
    Ecto.Query.from(q in Quiniela,
      preload: [:matches]
    )
    |> Repo.all()
  end

  @doc """
  Creates a quiniela.

  ## Examples

      iex> create_quiniela(%{field: value})
      {:ok, %Quiniela{}}

      iex> create_quiniela(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quiniela(attrs \\ %{}) do
    %Quiniela{}
    |> Quiniela.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:matches, with: &Match.changeset/2)
    |> Repo.insert()
  end
end
