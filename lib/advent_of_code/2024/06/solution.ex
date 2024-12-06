defmodule AdventOfCode.Year2024.Day6.Solution do
  @moduledoc """
  Solution for day 6
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

  defp solve_part1({start, direction, grid}) do
    move(start, direction, grid, [start])
    |> MapSet.new()
    |> MapSet.size()
  end

  defp solve_part2({start, direction, grid}) do
    grid
    |> get_permutations()
    |> Stream.filter(&loop?(start, direction, &1, 10000))
    |> Enum.count()
  end

  defp get_permutations(grid) do
    grid
    |> Map.keys()
    |> Stream.flat_map(fn position ->
      case Map.get(grid, position) do
        "." -> [Map.put(grid, position, "#")]
        _ -> []
      end
    end)
  end

  defp loop?(_start, _position, _grid, 0), do: true

  defp loop?(start, position, grid, steps) do
    next_position = next_position(start, position)

    case Map.get(grid, next_position) do
      nil -> false
      "#" -> loop?(start, clockwise_90(position), grid, steps)
      "." -> loop?(next_position, position, grid, steps - 1)
    end
  end

  defp move(position, direction, grid, breadcrumbs) do
    next = next_position(position, direction)

    case Map.get(grid, next) do
      "#" -> move(position, clockwise_90(direction), grid, breadcrumbs)
      "." -> move(next, direction, grid, [next | breadcrumbs])
      nil -> breadcrumbs
    end
  end

  defp next_position({x, y}, dir) do
    case dir do
      "^" -> {x, y - 1}
      ">" -> {x + 1, y}
      "v" -> {x, y + 1}
      "<" -> {x - 1, y}
    end
  end

  defp clockwise_90(dir) do
    case dir do
      "^" -> ">"
      ">" -> "v"
      "v" -> "<"
      "<" -> "^"
    end
  end

  def parse(input) do
    grid =
      input
      |> Utils.parse()
      |> Stream.with_index()
      |> Stream.flat_map(fn {line, y} ->
        line
        |> Utils.parse("", trim: true)
        |> Stream.with_index()
        |> Stream.map(fn {char, x} -> {{x, y}, char} end)
      end)
      |> Enum.into(%{})

    start =
      Map.filter(grid, fn {_k, v} -> String.match?(v, ~r/\^|<|>|v/) end)
      |> Map.keys()
      |> List.first()

    direction = Map.get(grid, start)

    {start, direction, Map.put(grid, start, ".")}
  end
end
