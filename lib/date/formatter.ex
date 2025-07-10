defmodule Date.Formatter do
  @moduledoc """
  Provides formatting utilities for human-readable time durations.
  """

  # Converts plural unit label to singular.
  defp singular("Days"), do: "Day"
  defp singular("Hours"), do: "Hour"
  defp singular("Minutes"), do: "Minute"
  defp singular("Seconds"), do: "Second"

  # Returns the label unchanged (already plural).
  defp plural(label), do: label

  # Skips units with value zero.
  defp format_unit(0, _label), do: nil

  # Formats singular and plural units accordingly.
  defp format_unit(1, label), do: "1 #{singular(label)}"
  defp format_unit(value, label), do: "#{value} #{plural(label)}"

  @doc """
  Formats a duration map into a human-readable string.

  Filters out zero-valued units and properly pluralizes each time component.

  ## Parameters

    - `duration`: a map with the keys `:days`, `:hours`, `:minutes`, and `:seconds`.

  ## Example

      iex> Date.Formatter.format_duration(%{days: 1, hours: 0, minutes: 2, seconds: 1})
      "1 Day, 2 Minutes, 1 Second"

  ## Returns

    A string such as: `"1 Day, 2 Minutes, 1 Second"`
  """
  @spec format_duration(%{
          days: non_neg_integer(),
          hours: non_neg_integer(),
          minutes: non_neg_integer(),
          seconds: non_neg_integer()
        }) :: String.t()
  def format_duration(duration) do
    %{days: d, hours: h, minutes: m, seconds: s} = duration

    [
      format_unit(d, "Days"),
      format_unit(h, "Hours"),
      format_unit(m, "Minutes"),
      format_unit(s, "Seconds")
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(", ")
  end
end
