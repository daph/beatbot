defmodule Beatbot.Beat do
  def beat() do
    DateTime.utc_now()
    |> (&((&1.second + (&1.minute * 60) + (((&1.hour + 1) * 3600))) / 86.4)).()
    |> wrap()
  end

  defp wrap(beats) do
    if beats >= 1000.0 do
      Float.round((beats - 1000.000), 3)
    else
      Float.round(beats, 3)
    end
  end
end
