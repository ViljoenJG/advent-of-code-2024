defmodule AdventOfCode.Template do
  @moduledoc """
  Template content for solution and test files
  """
  def build_solution(year, day) do
    """
    defmodule AdventOfCode.Year#{year}.Day#{day}.Solution do
      @moduledoc \"""
      Solution for day #{day}
      \"""

      alias AdventOfCode.Utils

      def part1(input) do
        input
        |> parse()
        |> solve_part1()
      end

      def part2(input) do
        input
        |> parse()
        |> solve_part2()
      end

      defp solve_part1(_input) do

      end

      defp solve_part2(_input) do

      end

      # Update the parse function to match the input format
      defp parse(input) do
        input
        |> Utils.parse()
      end
    end
    """
  end

  def build_test(year, day) do
    """
    defmodule AdventOfCode.Year#{year}.Day#{day}.SolutionTest do
      use ExUnit.Case, async: true

      alias AdventOfCode.Year#{year}.Day#{day}.Solution, as: Day#{day}

      describe "part1/1" do
        @tag :skip
        test "case1" do
          input = ""

          assert Day#{day}.part1(input) == nil
        end

        @tag :skip
        test "case2" do
          input = ""

          assert Day#{day}.part1(input) == nil
        end
      end

      describe "part2/1" do
        @tag :skip
        test "case1" do
          input = ""

          assert Day#{day}.part2(input) == nil
        end

        @tag :skip
        test "case2" do
          input = ""

          assert Day#{day}.part2(input) == nil
        end
      end
    end
    """
  end
end
