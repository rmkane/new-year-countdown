defmodule Math.UtilsTest do
  use ExUnit.Case, async: true

  alias Math.Utils

  describe "div_mod/2" do
    test "returns correct quotient and remainder for positive integers" do
      assert Utils.div_mod(10, 3) == {3, 1}
      assert Utils.div_mod(25, 5) == {5, 0}
    end

    test "works when dividend is less than divisor" do
      assert Utils.div_mod(2, 5) == {0, 2}
    end

    test "handles zero dividend" do
      assert Utils.div_mod(0, 5) == {0, 0}
    end

    test "raises ArithmeticError for division by zero" do
      assert_raise ArithmeticError, fn -> Utils.div_mod(5, 0) end
    end
  end
end
