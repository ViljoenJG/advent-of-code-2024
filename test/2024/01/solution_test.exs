defmodule AdventOfCode.Year2024.Day1.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day1.Solution, as: Day1

  describe "part1/1" do
    test "case1" do
      input = """
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
      """

      assert Day1.part1(input) == 11
    end
  end

  describe "part2/1" do
    test "case1" do
      input = """
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
      """

      assert Day1.part2(input) == 31
    end
  end
end
