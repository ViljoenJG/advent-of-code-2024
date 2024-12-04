defmodule AdventOfCode.Year2024.Day4.Solution do
  @moduledoc """
  Solution for day 4
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

  def solve_part1(input) do
    input
    |> Enum.flat_map(fn {sp, _} ->
      directions()
      |> Enum.map(&step(input, sp, &1, []))
    end)
    |> Enum.filter(&(&1 == "XMAS"))
    |> Enum.count()
  end

  defp step(list, {x, y}, {dx, dy}, col) do
    if Enum.count(col) == 4 do
      col
      |> Enum.reverse()
      |> Enum.join()
    else
      step(list, {x + dx, y + dy}, {dx, dy}, [Map.get(list, {x, y}, ".") | col])
    end
  end

  defp directions(),
    do: [
      {1, 0},
      {1, 1},
      {0, 1},
      {-1, 1},
      {-1, 0},
      {-1, -1},
      {0, -1},
      {1, -1}
    ]

  def solve_part2(input) do
    input
    |> Enum.map(fn {{x, y}, _} ->
      diagonals()
      |> Enum.map(fn {dx, dy} -> Map.get(input, {x + dx, y + dy}, ".") end)
      |> Enum.join()
    end)
    |> Enum.filter(&Enum.member?(valid_x(), &1))
    |> Enum.count()
  end

  defp diagonals,
    do: [
      {0, 0},
      {1, -1},
      {1, 1},
      {-1, 1},
      {-1, -1}
    ]

  defp valid_x do
    [
      "ASSMM",
      "AMSSM",
      "ASMMS",
      "AMMSS"
    ]
  end

  def parse(input) do
    input
    |> Utils.parse()
    |> Enum.with_index()
    |> Enum.flat_map(fn {line, y} ->
      line
      |> Utils.parse("", trim: true)
      |> Enum.with_index()
      |> Enum.map(fn {char, x} -> {{x, y}, char} end)
    end)
    |> Enum.into(%{})
  end
end
