defmodule Chat.Communication.Supervisor do
  use Supervisor

  alias Chat.Communication

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    Supervisor.init(
      [Communication.Projectors.Room, Communication.Workflows.NotifyUserFromJoined],
      strategy: :one_for_one
    )
  end
end
