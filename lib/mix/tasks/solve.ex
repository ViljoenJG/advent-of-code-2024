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

    input = read_input_file!(year, day)
    solution = solution_function(year, day, part)
    benchmark = if opts[:benchmark], do: true, else: false
    execute(input, solution, benchmark)
  end

  defp read_input_file!(year, day) do
    base_path = Utils.get_base_path(year, day)
    File.read!("#{base_path}/input.txt")
  end

  defp solution_function(year, day, part) do
    module =
      Module.safe_concat([
        "AdventOfCode",
        "Year#{year}",
        "Day#{String.to_integer(day)}",
        "Solution"
      ])

    {module, String.to_existing_atom("part#{part}")}
  end

  defp execute(input, {module, function}, false) do
    execute_solution(input, module, function)
    |> log_result("#{function} result")
  end

  defp execute(input, {module, function}, true) do
    Benchee.run(
      %{"Part #{function}" => fn input -> execute_solution(input, module, function) end},
      print: [benchmarking: false],
      inputs: [{"puzzle input", input}]
    )
  end

  defp execute_solution(input, module, function) do
    if function in @valid_parts do
      apply(module, function, [input])
    else
      error("Invalid part: #{function}")
    end
  end

  defp log_result(result, message), do: log("#{message}: #{result}", :info)
  defp error(message), do: log(message, :error)
  defp log(message, :info), do: Mix.shell().info(message)
  defp log(message, :error), do: Mix.shell().error(message)
end
