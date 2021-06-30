defmodule RestartProcesses.ManualGen do
  use GenServer

  def start_link(options) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(nil) do
    {:ok, nil}
  end

  def print_msg, do: GenServer.cast(__MODULE__, :print_msg)
  def handle_cast(:print_msg, state) do
    IO.puts("Hello Manual")
    {:noreply, state}
  end

  def crash do
    GenServer.cast(__MODULE__, :hey)
  end
end
