defmodule Beatbot.Beat do
  def beat() do
    beats =
      DateTime.utc_now()
      |> (&((&1.second + (&1.minute * 60) + (((&1.hour + 1) * 3600))) / 86.4)).()
      |> Float.round(3)

    if beats >= 1000.000 do
      "0" <> (Float.round((beats - 1000.000), 3) |> Float.to_string())
    else
      beats |> Float.to_string()
    end
  end
end
