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
    Regex.scan(~r/mul\((\d{1,3}),(\d{1,3})\)/, input)
    |> Enum.map(fn [_, a, b] -> String.to_integer(a) * String.to_integer(b) end)
    |> Enum.sum()
  end

  defp solve_part2(input) do
    Regex.scan(~r/(mul)\((\d{1,3}),(\d{1,3})\)|don't|do(?!n't)/, input)
    |> Enum.map(fn x ->
      case x do
        [_, "mul", a, b] -> String.to_integer(a) * String.to_integer(b)
        ["don't"] -> :off
        ["do"] -> :on
      end
    end)
    |> then(&process(&1, true, 0))
  end

  defp process(stack, running, acc)

  defp process([:off | tail], _, acc) do
    process(tail, false, acc)
  end

  defp process([:on | tail], _, acc) do
    process(tail, true, acc)
  end

  defp process([value | tail], true, acc) do
    process(tail, true, acc + value)
  end

  defp process([_value | tail], false, acc) do
    process(tail, false, acc)
  end

  defp process([], _, acc), do: acc
end
