defmodule AdventOfCode.Year2024.Day7.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day7.Solution, as: Day7

  @input """
  190: 10 19
  3267: 81 40 27
  83: 17 5
  156: 15 6
  7290: 6 8 6 15
  161011: 16 10 13
  192: 17 8 14
  21037: 9 7 18 13
  292: 11 6 16 20
  """

  describe "part1/1" do
    test "case1" do
      assert Day7.part1(@input) == 3749
    end
  end

  describe "part2/1" do
    test "case1" do
      assert Day7.part2(@input) == 11387
    end
  end
end
