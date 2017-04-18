defmodule Beatbot.Beat do
  def beat() do
    DateTime.utc_now()
    |> (&((&1.second + (&1.minute * 60) + ((&1.hour * 3600))) / 86.4)).()
    |> Float.round(1)
    |> Float.to_string
  end
end
