defmodule AdventOfCode.Year2024.Day1.Solution do
  @moduledoc """
  Solution for day 1
  """

  alias AdventOfCode.Utils

  def part1(input) do
    input
    |> parse()
    |> solve_part1()
  end

  def part2(input) do
    input
    |> parse()
    |> solve_part2()
  end

  defp solve_part1(input) do
    input
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(fn [a, b] -> abs(a - b) end)
    |> Enum.sum()
  end

  defp solve_part2(input) do
    [first, second] =
      input
      |> Enum.zip()
      |> Enum.map(&Tuple.to_list/1)

    frequencies = Enum.frequencies(second)

    first
    |> Enum.map(&(&1 * Map.get(frequencies, &1, 0)))
    |> Enum.sum()
  end

  defp parse(input) do
    input
    |> Utils.parse()
    |> Enum.map(&Utils.parse_int(&1, ~r(\s{1,})))
  end
end
