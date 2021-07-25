defmodule TestApi.GamesTest do
  use TestApi.DataCase

  alias TestApi.Games
  alias TestApi.Games.Quiniela

  describe "quiniela" do
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

    test "list_quinielas/0 returns all quinielas" do
      {:ok, quiniela} = Games.create_quiniela(@create_attrs)
      quinielas = Games.list_quinielas()
      assert [quiniela] == quinielas
      assert Enum.count(quiniela.matches) == 16
      [first_quiniela | _] = quinielas
      assert Enum.count(first_quiniela.matches) == 16
    end

    test "list_quinielas/1 returns quinielas by season" do
      {:ok, quiniela} = Games.create_quiniela(@create_attrs)
      quinielas = Games.list_quinielas(2020)
      assert [quiniela] == quinielas
      assert Enum.count(quiniela.matches) == 16
      [first_quiniela | _] = quinielas
      assert Enum.count(first_quiniela.matches) == 16
    end

    test "get_quiniela/2 returns quiniela by season and game_number" do
      {:ok, quiniela} = Games.create_quiniela(@create_attrs)
      found = Games.get_quiniela(2020, 1)
      assert quiniela == found
    end

    test "create_quiniela/1 valid attrs" do
      assert {:ok, %Quiniela{} = _quiniela} = Games.create_quiniela(@create_attrs)
    end

    test "create_quiniela/1 invalid attrs" do
      assert {:error, %Ecto.Changeset{}} = Games.create_quiniela(@invalid_attrs)
    end
  end
end
