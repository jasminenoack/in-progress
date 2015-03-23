# six dice
class Die
  VALUES = [1,2,3,4,5,6]
  DISPLAY = {
  6 => [" ** ",'*   ','*** ','*  *',' ** '],
  5 => ["****",'*   ','*** ','   *','*** '],
  4 => [" *  ",'*  *','****','   *','   *'],
  3 => ["*** ",'   *',' ** ','   *','*** '],
  2 => ["*** ",'   *',' ** ','*   ','****'],
  1 => ["  * ",' ** ','  * ','  * ',' ***']
}

  attr_accessor :value, :saved

  def roll_die
    @value = VALUES.sample
    @saved = false
  end

  def display_rolling
    DISPLAY[roll_die]
  end

  def toggle_saved
    saved = !saved
  end

end



