defmodule AdventOfCode.Year2024.Day5.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day5.Solution, as: Day5

  @input """
  47|53
  97|13
  97|61
  97|47
  75|29
  61|13
  75|53
  29|13
  97|29
  53|29
  61|53
  97|53
  61|29
  47|13
  75|47
  97|75
  47|61
  75|61
  47|29
  75|13
  53|13

  75,47,61,53,29
  97,61,53,29,13
  75,29,13
  75,97,47,61,53
  61,13,29
  97,13,75,29,47
  """

  describe "part1/1" do
    test "case1" do
      assert Day5.part1(@input) == 143
    end
  end

  describe "part2/1" do
    test "case1" do
      assert Day5.part2(@input) == 123
    end
  end
end
