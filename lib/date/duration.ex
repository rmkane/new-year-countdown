defmodule Date.Duration do
  @moduledoc """
  Provides utilities for calculating time durations, particularly until the next new year.
  """

  import Math.Utils, only: [div_mod: 2]

  @seconds_per_day 86_400
  @seconds_per_hour 3_600
  @seconds_per_minute 60

  @doc """
  Calculates the duration from the given `datetime` until midnight on January 1st of the next year,
  using the provided `time_zone`.

  ## Parameters

    - `datetime`: a `DateTime` struct representing the starting point
    - `time_zone`: a string like `"America/New_York"` used to build the target datetime

  ## Returns

    A map with keys:
    - `:days`
    - `:hours`
    - `:minutes`
    - `:seconds`

  All values are non-negative integers.
  """
  @spec duration_until_next_year(DateTime.t(), String.t()) :: %{
          days: non_neg_integer(),
          hours: non_neg_integer(),
          minutes: non_neg_integer(),
          seconds: non_neg_integer()
        }
  def duration_until_next_year(datetime, time_zone) do
    next_year = Date.new!(datetime.year + 1, 1, 1)
    end_datetime = DateTime.new!(next_year, Time.new!(0, 0, 0), time_zone)
    DateTime.diff(end_datetime, datetime) |> seconds_to_duration()
  end

  @doc """
  Converts a number of seconds into a duration map containing days, hours, minutes, and seconds.

  ## Example

      iex> Date.Duration.seconds_to_duration(90061)
      %{days: 1, hours: 1, minutes: 1, seconds: 1}

  ## Parameters

    - `seconds`: the total number of seconds to convert

  ## Returns

    A map with the breakdown:
    - `:days`
    - `:hours`
    - `:minutes`
    - `:seconds`
  """
  @spec seconds_to_duration(non_neg_integer()) :: %{
          days: non_neg_integer(),
          hours: non_neg_integer(),
          minutes: non_neg_integer(),
          seconds: non_neg_integer()
        }
  def seconds_to_duration(seconds) do
    {days, seconds} = div_mod(seconds, @seconds_per_day)
    {hours, seconds} = div_mod(seconds, @seconds_per_hour)
    {minutes, seconds} = div_mod(seconds, @seconds_per_minute)

    %{
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds
    }
  end
end
