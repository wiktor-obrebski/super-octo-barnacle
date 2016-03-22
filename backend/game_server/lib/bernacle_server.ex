defmodule BernacleServer do
  use Application
  alias BernacleServer.Supervisors.ServerSupervisor

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    ServerSupervisor.start_link()
  end


end