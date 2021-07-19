defmodule TestApiWeb.GamesView do
  use TestApiWeb, :view

  alias TestApiWeb.MatchView

  def render("index.json", %{quinielas: quinielas}) do
    render_many(quinielas, __MODULE__, "quiniela.json", as: :quiniela)
  end

  def render("show.json", %{quiniela: quiniela}) do
    render_one(quiniela, __MODULE__, "quiniela.json", as: :quiniela)
  end

  def render("quiniela.json", %{quiniela: quiniela}) do
    %{
      id: quiniela.id,
      season: quiniela.season,
      match_number: quiniela.match_number,
      date: quiniela.date,
      matches: render_many(quiniela.matches, MatchView, "match.json")
    }
  end
end
