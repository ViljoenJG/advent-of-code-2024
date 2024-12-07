defmodule AdventOfCode.Year2024.Day7.Solution do
  @moduledoc """
  Solution for day 7
  """

  alias AdventOfCode.Utils

  def part1(input) do
    input
    |> parse()
    |> solve(false)
  end

  def part2(input) do
    input
    |> parse()
    |> solve(true)
  end

  defp solve(input, with_concat) do
    input
    |> Enum.map(fn {result, [a | rest]} ->
      if calculate(a, rest, result, with_concat), do: result, else: 0
    end)
    |> Enum.sum()
  end

  defp calculate(a, [b | rest], result, with_concat) do
    cond do
      a > result -> false
      calculate(a + b, rest, result, with_concat) -> true
      calculate(a * b, rest, result, with_concat) -> true
      with_concat and calculate(concat(a, b), rest, result, with_concat) -> true
      true -> false
    end
  end

  defp calculate(n, [], result, _), do: n === result

  defp concat(a, b) do
    [a, b]
    |> Enum.map(&Integer.to_string/1)
    |> Enum.join()
    |> String.to_integer()
  end

  defp parse(input) do
    input
    |> Utils.parse()
    |> Enum.map(&Utils.parse(&1, ": ", trim: true))
    |> Enum.map(fn [ans, eq] ->
      {String.to_integer(ans), Utils.parse_int(eq, " ")}
    end)
  end
end
