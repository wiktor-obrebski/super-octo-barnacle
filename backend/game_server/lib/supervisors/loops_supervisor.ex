defmodule BernacleServer.Supervisors.LoopsSupervisor do
    use Supervisor
    alias BernacleServer.Supervisors.{MoveLoopSupervisor,CellSupervisor}
    alias BernacleServer.Loops.{LoopHolder,LoopMove}

    @name BernacleLoopSupervisor

    def start_link do
        IO.puts "LoopSupervisor stared"
        Supervisor.start_link(__MODULE__, :ok, name: @name)
    end

    def init(:ok) do
        children = [
            worker(LoopMove, []),
            worker(LoopHolder, [])
        ]
        supervise(children, [strategy: :one_for_one, max_restarts: 200000, max_seconds: 1] )
    end



end