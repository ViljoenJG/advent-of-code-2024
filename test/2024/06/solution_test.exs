defmodule AdventOfCode.Year2024.Day6.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day6.Solution, as: Day6

  @input """
  ....#.....
  .........#
  ..........
  ..#.......
  .......#..
  ..........
  .#..^.....
  ........#.
  #.........
  ......#...
  """

  describe "part1/1" do
    test "case1" do
      assert Day6.part1(@input) == 41
    end
  end

  describe "part2/1" do
    test "case1" do
      assert Day6.part2(@input) == 6
    end
  end
end
