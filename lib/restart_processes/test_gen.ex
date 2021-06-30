defmodule RestartProcesses.TestGen do
  use GenServer

  def start_link(options) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(nil) do
    {:ok, nil}
  end

  def print_msg, do: GenServer.cast(__MODULE__, :print_msg)
  def handle_cast(:print_msg, state) do
    IO.puts("Hello")
    {:noreply, state}
  end

  def start_manual, do: GenServer.cast(__MODULE__, :start_manual)
  def handle_cast(:start_manual, state) do
    RestartProcesses.ManualGen.start_link(nil) |> IO.inspect
    {:noreply, state}
  end
end
