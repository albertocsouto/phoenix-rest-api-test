defmodule TestApiWeb.UsersController do
  use TestApiWeb, :controller

  alias TestApi.Accounts
  alias TestApi.Accounts.Users
  alias TestApiWeb.Auth.Guardian

  action_fallback TestApiWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end
  
  def create(conn, %{"user" => user_params}) do
  with {:ok, %Users{} = user} <- Accounts.create_users(user_params),
  {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
    conn
    |> put_resp_cookie("token", token)
    |> send_resp(:created, "")
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_resp_cookie("token", token)
      |> send_resp(:created, "")
    end
  end

  def show(conn, %{"id" => id}) do
    users = Accounts.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = Accounts.get_users!(id)

    with {:ok, %Users{} = users} <- Accounts.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = Accounts.get_users!(id)

    with {:ok, %Users{}} <- Accounts.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
