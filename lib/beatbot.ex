defmodule Beatbot do
  use Application
   def start(_type, _args) do
     children = [
       Plug.Adapters.Cowboy.child_spec(:http, Beatbot.Router, [], [port: 4004])
     ]

     opts = [strategy: :one_for_one, name: Beatbot.Supervisor]
     Supervisor.start_link(children, opts)
   end
end
