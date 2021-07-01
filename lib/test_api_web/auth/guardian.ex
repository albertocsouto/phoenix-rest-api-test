defmodule TestApiWeb.Auth.Guardian do
  use Guardian, otp_app: :test_api

  alias TestApi.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Accounts.get_users!(id)
    {:ok, resource}
  end
end
