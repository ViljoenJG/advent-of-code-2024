defmodule Mix.Tasks.Solve do
  @moduledoc """
  Runs solution and optionally submits it, downloading part 2 description if part 1 succeeds
  """
  use Mix.Task
  alias AdventOfCode.Utils

  @valid_parts [:part1, :part2]

  @impl Mix.Task
  def run(args) do
    {opts, [year, day, part], _} =
      OptionParser.parse(args,
        switches: [benchmark: :boolean],
        aliases: [b: :benchmark]
      )

    Utils.setup_env!()

    if opts[:benchmark],
      do:
        Benchee.run(%{
          "part_#{part}" => fn ->
            execute_solution(year, day, part)
            |> IO.inspect(label: "Day #{day}, Part #{part} result: ")
          end
        }),
      else:
        execute_solution(year, day, part)
        |> IO.inspect(label: "Day #{day}, Part #{part} result: ")
  end

  defp execute_solution(year, day, part) do
    base_path = Utils.get_base_path(year, day)
    input = File.read!("#{base_path}/input.txt")

    try do
      module =
        Module.safe_concat([
          "AdventOfCode",
          "Year#{year}",
          "Day#{String.to_integer(day)}",
          "Solution"
        ])

      function = String.to_existing_atom("part#{part}")

      if function in @valid_parts do
        apply(module, function, [input])
      else
        Mix.shell().error("Invalid part number: #{part}")
        nil
      end
    rescue
      error in [ArgumentError, UndefinedFunctionError] ->
        Mix.shell().error("Error: #{Exception.message(error)}")
        nil
    end
  end
end
