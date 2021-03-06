defmodule Beatbot.Router do
  use Plug.Router

  alias Beatbot.SlackResp
  alias Beatbot.Beat

  plug Plug.Parsers, parsers: [:urlencoded]
  plug Beatbot.TokenPlug
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "")
  end

  post "/" do
    if conn.assigns[:token_valid] do
      text =
        Beat.beat()
        |> Float.to_string
        |> String.rjust(7, ?0)

      resp = %SlackResp{text: "@" <> text} |> Poison.encode!()
      put_resp_content_type(conn, "application/json")
      |> send_resp(200, resp)
    else
      send_resp(conn, 401, "incorrect token")
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
