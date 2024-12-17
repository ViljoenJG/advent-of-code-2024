defmodule AdventOfCode.Year2024.Day8.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day8.Solution, as: Day8

  @input """
  ............
  ........0...
  .....0......
  .......0....
  ....0.......
  ......A.....
  ............
  ............
  ........A...
  .........A..
  ............
  ............
  """

  describe "part1/1" do
    test "case1" do
      assert Day8.part1(@input) == 14
    end
  end

  describe "part2/1" do
    test "case1" do
      assert Day8.part2(@input) == 34
    end
  end
end
