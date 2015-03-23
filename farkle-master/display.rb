require './dice.rb'
require './game.rb'
require 'dispel'

DISPLAY_SPACE = ["    ","    ","    ","    ","    "]


# puts "\e[H\e[2J"


def display_rolling
  d = Die.new
  display_array = Array.new(6,'    ')
  6.times do
    5.times do |i|
      num_display = d.display_rolling
      display_array[i] += num_display[i] + DISPLAY_SPACE[i]
    end
  end
  display_array.join("\n")
end



require 'dispel'

# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  Dispel::Keyboard.output :timeout => 0.1 do |key|
    if key == :timeout
      screen.draw display_rolling
    elsif key == :"Ctrl+c"
      break
    else
      screen.draw "You pressed #{key}"
    end
  end
end


