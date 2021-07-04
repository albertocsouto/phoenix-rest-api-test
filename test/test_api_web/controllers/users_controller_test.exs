defmodule TestApiWeb.UsersControllerTest do
  use TestApiWeb.ConnCase

  alias TestApi.Accounts
  alias TestApi.Accounts.Users

  @create_attrs %{
    email: "email@test.com",
    password: "some password"
  }
  @invalid_attrs %{
    email: nil,
    password: nil
  }

  def fixture(:users) do
    {:ok, users} = Accounts.create_users(@create_attrs)
    users
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create users" do
    test "renders users when data is valid", %{conn: conn} do
      conn = post(conn, Routes.users_path(conn, :create), user: @create_attrs)
      assert response(conn, 201)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.users_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_users(_) do
    users = fixture(:users)
    %{users: users}
  end
end
