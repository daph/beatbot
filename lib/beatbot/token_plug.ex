defmodule Beatbot.TokenPlug do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    token =
      __MODULE__
      |> Application.get_application
      |> Application.get_env(:slack_token)

    in_token = Map.get(conn.params, "token", "")
    assign(conn, :token_valid, (in_token == token))
  end
end
