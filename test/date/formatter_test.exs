defmodule Date.FormatterTest do
  use ExUnit.Case, async: true

  alias Date.Formatter

  describe "format_duration/1" do
    test "formats full duration with all non-zero units" do
      duration = %{days: 2, hours: 3, minutes: 4, seconds: 5}

      assert Formatter.format_duration(duration) ==
               "2 Days, 3 Hours, 4 Minutes, 5 Seconds"
    end

    test "uses singular form for units with value 1" do
      duration = %{days: 1, hours: 1, minutes: 1, seconds: 1}

      assert Formatter.format_duration(duration) ==
               "1 Day, 1 Hour, 1 Minute, 1 Second"
    end

    test "skips zero-value units" do
      duration = %{days: 0, hours: 2, minutes: 0, seconds: 30}

      assert Formatter.format_duration(duration) ==
               "2 Hours, 30 Seconds"
    end

    test "returns empty string for all-zero duration" do
      duration = %{days: 0, hours: 0, minutes: 0, seconds: 0}

      assert Formatter.format_duration(duration) == ""
    end
  end
end
