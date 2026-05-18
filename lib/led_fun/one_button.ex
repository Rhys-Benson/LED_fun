defmodule LedFun.OneButton do
  @moduledoc """
  turns an LED on or off when a button is pressed.
  Preset to use GPIO17 as the output pin (LED) and GPIO27 as the input pin (button).

  Improvements:
  - Allow GPIO pin names to be variables passed into start_link.
  - Utilize timestamps of the interrupts to filter out "multi-clicks" caused by button bouncing.
  """
  use GenServer
  alias Circuits.GPIO

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    {:ok, led} = GPIO.open("GPIO17", :output)
    {:ok, button} = GPIO.open("GPIO27", :input)

    GPIO.write(led, 0)
    GPIO.set_interrupts(button, :rising)

    {:ok, %{button_pin: button, led_pin: led, led_state: :off}}
  end


  def handle_info({:circuits_gpio,_,_,_}, state) do
    IO.inspect(state)
    case state.led_state do
      :off ->
        GPIO.write(state.led_pin, 1)
        IO.puts("Turn LED on")
        {:noreply, %{state | led_state: :on}}
      :on ->
        GPIO.write(state.led_pin, 0)
        IO.puts("Turn LED off")
        {:noreply, %{state | led_state: :off}}
    end
  end

  def handle_info(_msg, state) do
    IO.puts("Something went wrong")
    {:noreply, state}
  end
end
