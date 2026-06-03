defmodule LedFun.Blinky do
  @moduledoc """
  Documentation for `Blinky`.
  """
  use GenServer
  alias Circuits.GPIO

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    {:ok, led_pin} = GPIO.open("GPIO17", :output)
    GPIO.write(led_pin, 0)
    Process.send_after(self(), :flicker, 1000)

    {:ok, %{led_pin: led_pin, led_state: 0, timer: 1000}}
  end

  def handle_info(:flicker, state) do
    new_led_state = case state.led_state do
      0 -> 1
      1 -> 0
    end

    GPIO.write(state.led_pin, new_led_state)
    Process.send_after(self(), :flicker, state.timer)

    {:noreply, %{state | led_state: new_led_state}}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end
end
