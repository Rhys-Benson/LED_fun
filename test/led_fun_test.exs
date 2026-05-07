defmodule LedFunTest do
  use ExUnit.Case
  doctest LedFun

  test "greets the world" do
    assert LedFun.hello() == :world
  end
end
