defmodule Math.Utils do
  @doc """
  Returns a `{quotient, remainder}` tuple from integer division.
  """
  @spec div_mod(integer(), integer()) :: {integer(), integer()}
  def div_mod(dividend, divisor) do
    {div(dividend, divisor), rem(dividend, divisor)}
  end
end
