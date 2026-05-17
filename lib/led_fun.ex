defmodule LedFun do
  @moduledoc """
  Documentation for `LedFun`.

  - blinky assumes gpio pin is open. pin arg is the reference returned by Circuits.GPIO.open/2
    secs arg specifies number of seconds the function will run.
  """
  alias Circuits.GPIO


  def blinky(pin, secs, state \\ 0) do
    if secs > 0 do
      new_state = case state do
        0 ->
          GPIO.write(pin, 1)
          1
        1 ->
          GPIO.write(pin, 0)
          0
      end
      Process.sleep(1000)
      blinky(pin, secs - 1, new_state)
    end
  end
end
