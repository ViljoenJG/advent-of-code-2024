defmodule AdventOfCode.Year2024.Day2.Solution do
  @moduledoc """
  Solution for day 2
  """
  alias AdventOfCode.Utils

  def part1(input) do
    parse(input)
    |> Enum.count(fn levels -> is_safe(levels) end)
  end

  def part2(input) do
    parse(input)
    |> Enum.count(fn levels -> dampened(levels, []) end)
  end

  defp is_safe([a, a | _]), do: false

  defp is_safe([a, b | _] = levels) do
    diff = a - b
    is_safe(levels, div(diff, abs(diff)))
  end

  defp is_safe(levels, sign) do
    Enum.chunk_every(levels, 2, 1)
    |> Enum.all?(fn chunks ->
      case chunks do
        [a, b] -> (sign * (a - b)) in 1..3
        [_] -> true
      end
    end)
  end

  defp dampened([level | levels], prefix) do
    is_safe(Enum.reverse(prefix, levels)) or dampened(levels, [level | prefix])
  end

  defp dampened([], prefix) do
    is_safe(prefix)
  end

  defp parse(input) do
    input
    |> Utils.parse()
    |> Enum.map(&Utils.parse_int(&1, " "))
  end
end
