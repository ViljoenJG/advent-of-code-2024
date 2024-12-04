defmodule AdventOfCode.Year2024.Day4.SolutionTest do
  use ExUnit.Case, async: true

  alias AdventOfCode.Year2024.Day4.Solution, as: Day4

  describe "part1/1" do
    test "case1" do
      input = """
      MMMSXXMASM
      MSAMXMSMSA
      AMXSXMAAMM
      MSAMASMSMX
      XMASAMXAMM
      XXAMMXXAMA
      SMSMSASXSS
      SAXAMASAAA
      MAMMMXMMMM
      MXMXAXMASX
      """

      assert Day4.part1(input) == 18
    end
  end

  describe "part2/1" do
    test "case1" do
      input = """
      .M.S......
      ..A..MSMS.
      .M.S.MAA..
      ..A.ASMSM.
      .M.S.M....
      ..........
      S.S.S.S.S.
      .A.A.A.A..
      M.M.M.M.M.
      ..........
      """

      assert Day4.part2(input) == 9
    end
  end
end
