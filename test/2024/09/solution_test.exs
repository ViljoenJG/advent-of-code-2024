defmodule AdventOfCode.Year2024.Day9.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day9.Solution, as: Day9

  describe "part1/1" do
    test "case1" do
      input = "2333133121414131402"
      assert Day9.part1(input) == 1928
    end
  end

  describe "part2/1" do
    test "case1" do
      input = "2333133121414131402"
      assert Day9.part2(input) == 2858
    end
  end
end
