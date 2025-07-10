defmodule App do
  @moduledoc """
  Entry point for the New Year Countdown application.

  On start, it prints the app version and how long remains until
  January 1st in the local time zone.
  """

  alias Timex.Timezone, as: Timezone

  import Date.Duration, only: [duration_until_next_year: 2]
  import Date.Formatter, only: [format_duration: 1]

  @app_name "New Year Countdown"

  @doc """
  Application entry point called by the BEAM runtime.

  Accepts startup arguments, prints the version, runs the countdown logic,
  and starts a dummy supervisor (no children).
  """
  @spec start(:normal | :takeover | :failover, [String.t()]) :: {:ok, pid()}
  def start(_type, args) do
    version = List.first(args) || "unknown"
    IO.puts("#{@app_name} | Version: #{version}\n")
    main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  @doc """
  Calculates the time remaining until next New Year in the user's local time zone
  and prints it in a human-readable format.
  """
  @spec main() :: :ok
  def main do
    time_zone = Timezone.local().full_name
    {:ok, now} = DateTime.now(time_zone)

    duration_until_next_year(now, time_zone)
    |> format_duration()
    |> then(fn formatted ->
      IO.puts("The next New Year (#{time_zone}) will occur in: #{formatted}")
    end)

    :ok
  end
end
