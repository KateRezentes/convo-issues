defmodule ConvoTest do
  use ExUnit.Case
  doctest Convo

  test "greets the world" do
    assert Convo.hello() == :world
  end
end
