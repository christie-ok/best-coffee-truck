defmodule BestCoffeeTruck.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BestCoffeeTruckWeb.Telemetry,
      # Start the Ecto repository
      BestCoffeeTruck.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: BestCoffeeTruck.PubSub},
      # Start Finch
      {Finch, name: BestCoffeeTruck.Finch},
      # Start the Endpoint (http/https)
      BestCoffeeTruckWeb.Endpoint
      # Start a worker by calling: BestCoffeeTruck.Worker.start_link(arg)
      # {BestCoffeeTruck.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BestCoffeeTruck.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BestCoffeeTruckWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
