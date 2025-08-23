defmodule HelloWasmex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Wasmex.Components, path: "../hello_world/target/wasm32-wasip1/debug/hello_world.wasm", name: HelloWasmex},
      {HelloWorld, path: "../hello_world/target/wasm32-wasip1/debug/hello_world.wasm", name: HelloWorld}
      # Starts a worker by calling: HelloWasmex.Worker.start_link(arg)
      # {HelloWasmex.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloWasmex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
