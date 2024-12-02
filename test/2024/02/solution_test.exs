defmodule AdventOfCode.Year2024.Day2.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day2.Solution, as: Day2

  describe "part1/1" do
    test "case1" do
      input = """
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
      """

      assert Day2.part1(input) == 2
    end
  end

  describe "part2/1" do
    test "case1" do
      input = """
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
      """

      assert Day2.part2(input) == 4
    end
  end
end
