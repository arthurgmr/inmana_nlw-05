defmodule Inmana.Welcomer do
  # Tratar o nome do usuario, colocando sempre minusculo sem espaco;

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)
    IO.inspect(age)

    name
    |> String.trim()
    |> String.downcase()
    # o valor utilizado no pipe sempre fica implicito no primeiro argumento;
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
