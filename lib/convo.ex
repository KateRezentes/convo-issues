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
    {:ok, entries} = Jason.decode(text_result)
    result = []

    y = %{}

    Enum.reduce(entries, y, fn entry, y ->
      x = entry["user"]["login"]

      Map.put_new(y, x, 0)
      Map.get_and_update(y, x, fn val -> val + 1 end)
    end)
  end
end
