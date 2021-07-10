defmodule TestApi.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias TestApi.Repo

  alias TestApi.Games.Quiniela

  @doc """
  Returns the list of quinielas.

  ## Examples

      iex> list_quinielas()
      [%Quiniela{}, ...]

  """
  def list_quinielas do
    Repo.all(Quiniela)
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
    |> Repo.insert()
  end

end


