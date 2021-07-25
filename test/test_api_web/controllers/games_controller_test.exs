defmodule TestApiWeb.GamesControllerTest do
  use TestApiWeb.ConnCase

  alias TestApi.Games

  @create_match %{
    date: Date.utc_today(),
    team1: "Madrid",
    team2: "Barcelona",
    team1_goals: 0,
    team2_goals: 0,
    result: "X",
    played: true,
    isSpecial: false
  }

  @create_special_match %{
    date: Date.utc_today(),
    team1: "Madrid",
    team2: "Barcelona",
    team1_goals: 0,
    team2_goals: 0,
    result: "X",
    played: true,
    isSpecial: true
  }

  @create_attrs %{
    date: Date.utc_today(),
    season: 2020,
    game_number: 1,
    matches: [
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_match,
      @create_special_match,
      @create_special_match
    ]
  }
  @invalid_attrs %{
    date: Date.utc_today(),
    matches: [@create_match]
  }

  def fixture(:quiniela) do
    {:ok, quiniela} = Games.create_quiniela(@create_attrs)
    quiniela
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create quiniela" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.games_path(conn, :create), quiniela: @create_attrs)
      assert response(conn, 201)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.games_path(conn, :create), quiniela: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
