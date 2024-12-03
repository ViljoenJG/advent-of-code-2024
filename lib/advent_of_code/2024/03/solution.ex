defmodule AdventOfCode.Year2024.Day3.Solution do
  @moduledoc """
  Solution for day 3
  """

  def part1(input) do
    input
    |> solve_part1()
  end

  def part2(input) do
    input
    |> solve_part2()
  end

  defp solve_part1(input) do
    Regex.scan(~r/mul\((\d+),(\d+)\)/, input)
    |> Enum.map(fn [_, a, b] -> String.to_integer(a) * String.to_integer(b) end)
    |> Enum.sum()
  end

  defp solve_part2(input) do
    input
    |> String.replace(~r/(*CR)don't\(\).*?do\(\)/, "")
    |> solve_part1
  end
end
