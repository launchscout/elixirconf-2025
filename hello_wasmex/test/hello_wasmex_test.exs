defmodule HelloWasmexTest do
  use ExUnit.Case
  doctest HelloWasmex

  test "greets the world" do
    assert HelloWasmex.hello() == :world
  end
end
