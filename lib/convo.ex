defmodule Convo do
  @moduledoc """
  Documentation for `Convo`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Convo.hello()
      :world

  """
  def hello do
    {:ok, text_result} = File.read("issues.txt")
    {:ok, jason_result} = Jason.decode(text_result)

    logins =
      Enum.reduce(jason_result, %{}, fn entry, acc ->
        x = String.to_atom(entry["user"]["login"])
        acc = Map.put_new(acc, x, 0)
        {_, updated_acc} = Map.get_and_update(acc, x, fn v -> {acc, v + 1} end)
        updated_acc
      end)

    IO.inspect(logins)
  end
end
