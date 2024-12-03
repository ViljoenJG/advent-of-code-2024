defmodule AdventOfCode.Year2024.Day3.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day3.Solution, as: Day3

  describe "part1/1" do
    test "case1" do
      input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
      assert Day3.part1(input) == 161
    end
  end

  describe "part2/1" do
    test "case1" do
      input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
      assert Day3.part2(input) == 48
    end

    test "case2" do
      input = """
      xmul(2,4)&mul[3,7]!^don't()_mul(5,5)
      +mul(32,64](mul(11,8)undo()?mul(8,5))
      """

      assert Day3.part2(input) == 48
    end
  end
end
