defmodule TestApi.AccountTest do
  use TestApi.DataCase

  alias TestApi.Account

  describe "users" do
    alias TestApi.Account.User

    
    @create_attrs %{email: "email@test.com", password: "some password"}
    @valid_attrs %{email: "email@test.com", password: nil}
    @update_attrs %{email: "email2@test.com", password: "some updated password"}
    @invalid_attrs %{email: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@create_attrs)
        |> Account.create_user()

      user
    end
   
    test "list_users/0 returns all users" do
      assert {:ok, user} = Account.create_user(@create_attrs)
      users = Account.list_users()
      created_user = List.first(users)
      assert created_user.email == user.email
      assert created_user.password == nil
    end

    test "get_user!/1 returns the user with given id" do
      assert {:ok, user} = Account.create_user(@create_attrs)
      assert user.email == "email@test.com"
      assert user.password == "some password"
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@create_attrs)
      assert user.email == "email@test.com"
      assert user.password  == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

  end
end
