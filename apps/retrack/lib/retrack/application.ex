defmodule Retrack.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Retrack.Repo,
      {DNSCluster, query: Application.get_env(:retrack, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Retrack.PubSub}
      # Start a worker by calling: Retrack.Worker.start_link(arg)
      # {Retrack.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Retrack.Supervisor)
  end
end
