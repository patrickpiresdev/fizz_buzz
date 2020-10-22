defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_number/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_number(number) do
    number
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) do
    case [rem(number, 3), rem(number, 5)] do
      [0, 0] -> :fizzbuzz
      [0, _] -> :fizz
      [_, 0] -> :buzz
      [_, _] -> number
    end
  end
end
