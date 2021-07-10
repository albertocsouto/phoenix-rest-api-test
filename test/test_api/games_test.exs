defmodule TestApi.GamesTest do
  use TestApi.DataCase

  alias TestApi.Games

  describe "quiniela" do
    @create_attrs %{
      date: Date.utc_today(),
      match1: ["1"],
      match2: ["1"],
      match3: ["1"],
      match4: ["1"],
      match5: ["1"],
      match6: ["1"],
      match7: ["1"],
      match8: ["1"],
      match9: ["1"],
      match10: ["1"],
      match11: ["1"],
      match12: ["1"],
      match13: ["1"],
      match14: ["1"],
      special1: ["1"],
      special2: ["1"]
    }
    @invalid_attrs %{
      date: Date.utc_today(),
      match1: ["A"],
      match2: ["B"],
      match3: ["C"],
      match4: ["D"],
      match5: ["E"],
      match6: ["F"],
      match7: ["G"],
      match8: ["H"],
      match9: ["I"],
      match10: ["J"],
      match11: ["K"],
      match12: ["L"],
      match13: ["M"],
      match14: ["N"],
      special1: ["3"],
      special2: ["4"]
    }

    test "list_quinielas/0 returns all quinielas" do
      assert {:ok, quiniela} = Games.create_quiniela(@create_attrs)
      quinielas = Games.list_quinielas()
      assert [quiniela] == quinielas
    end

    # FIXME: This test should pass when data validation added
    test "create_quiniela/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_quiniela(@invalid_attrs)
    end
  end
end
