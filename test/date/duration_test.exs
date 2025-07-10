defmodule Date.DurationTest do
  use ExUnit.Case, async: true

  alias Date.Duration

  describe "seconds_to_duration/1" do
    test "correctly converts seconds to days, hours, minutes, and seconds" do
      assert Duration.seconds_to_duration(90061) == %{
               days: 1,
               hours: 1,
               minutes: 1,
               seconds: 1
             }

      assert Duration.seconds_to_duration(0) == %{
               days: 0,
               hours: 0,
               minutes: 0,
               seconds: 0
             }
    end
  end
end
