defmodule TestApiWeb.GamesController do
  use TestApiWeb, :controller

  alias TestApi.Games
  alias TestApi.Games.Quiniela

  action_fallback(TestApiWeb.FallbackController)

  def index(conn, %{"season" => season, "game_number" => game_number} = _params) do
    quiniela = Games.get_quiniela(season, game_number)
    render(conn, "show.json", quiniela: quiniela)
  end

  def index(conn, %{"season" => season} = _params) do
    quinielas = Games.list_quinielas(season)
    render(conn, "index.json", quinielas: quinielas)
  end

  def index(conn, _params) do
    quinielas = Games.list_quinielas()
    render(conn, "index.json", quinielas: quinielas)
  end

  def show(conn, %{"id" => id}) do
    quiniela = Games.get_quiniela(id)

    case quiniela do
      nil -> send_resp(conn, :not_found, "")
      _ -> render(conn, "show.json", quiniela: quiniela)
    end
  end

  def create(conn, %{"quiniela" => quiniela_params}) do
    with {:ok, %Quiniela{} = quiniela} <- Games.create_quiniela(quiniela_params) do
      conn
      |> put_status(:created)
      |> render("quiniela.json", quiniela: quiniela)
    end
  end
end
