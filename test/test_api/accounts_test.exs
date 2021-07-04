defmodule TestApi.AccountsTest do
  use TestApi.DataCase

  alias TestApi.Accounts

  describe "users" do
    alias TestApi.Accounts.Users

    
    @create_attrs %{email: "email@test.com", password: "some password"}
    @valid_attrs %{email: "email@test.com", password: nil}
    @update_attrs %{email: "email2@test.com", password: "some updated password"}
    @invalid_attrs %{email: nil, password: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@create_attrs)
        |> Accounts.create_users()

      users
    end
   
    test "list_users/0 returns all users" do
      assert {:ok, user} = Accounts.create_users(@create_attrs)
      users = Accounts.list_users()
      created_user = List.first(users)
      assert created_user.email == user.email
      assert created_user.password == nil
    end

    test "get_users!/1 returns the users with given id" do
      assert {:ok, user} = Accounts.create_users(@create_attrs)
      assert user.email == "email@test.com"
      assert user.password == "some password"
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Accounts.create_users(@create_attrs)
      assert users.email == "email@test.com"
      assert users.password  == "some password"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

  end
end
