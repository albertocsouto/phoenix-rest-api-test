defmodule TestApiWeb.MatchView do
  use TestApiWeb, :view

  def render("index.json", %{matches: matches}) do
    render_many(matches, __MODULE__, "match.json")
  end

  def render("show.json", %{match: match}) do
    render_one(match, __MODULE__, "match.json")
  end

  def render("match.json", %{match: match}) do
    %{
      id: match.id,
      date: match.date,
      team1: match.team1,
      team2: match.team2,
      isSpecial: match.isSpecial
    }
  end
end
