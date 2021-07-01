defmodule TestApiWeb.DefaultController do
  use TestApiWeb, :controller

  def index(conn, _params) do
    text(conn, "TestApi!")
  end
end
