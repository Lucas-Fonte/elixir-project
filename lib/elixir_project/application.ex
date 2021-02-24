defmodule ElixirProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirProject.Repo,
      # Start the Telemetry supervisor
      ElixirProjectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirProject.PubSub},
      # Start the Endpoint (http/https)
      ElixirProjectWeb.Endpoint
      # Start a worker by calling: ElixirProject.Worker.start_link(arg)
      # {ElixirProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
