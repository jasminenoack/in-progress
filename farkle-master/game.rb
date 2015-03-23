# game to 10,000
# must set aside at least one die
# end turn or bank score
# no score means farkle

# Each 1  100
# Each 5  50
# Three 1s  1000
# Three 2s  200
# Three 3s  300
# Three 4s  400
# Three 5s  500
# Three 6s  600

# In a variant described as "piggybacking" or "high-stakes", each player after the first can choose to begin their turn either with a fresh set of six dice, or by throwing the dice remaining after the previous player has completed their turn. For example, if a player banks three 1's for a score of 1000, the next player may choose to roll the remaining three dice.


class Game
  attr_reader :farkles, :dice

  def initialize
    @dice = Array.new(6) {Die.new}
    @farkles = 0
  end

  def roll_dice
    @dice.each(&:roll_die)
  end

  def increase_farkle
    @farkles += 1
  end

  def farkle_penalty?
    @farkles == 3
  end

  def reset_farkle
    @farkles == 0
  end

#create a player that holds this information
  def make_first_play?(points)
    points > 350
  end

#player nedded
  def first_turn?
    total_points == 0
  end

  def hot_dice?
    dice.all?(&:saved)
  end


#player needed
  def bank_score
  end

  def saved_dice
    dice.select(&:saved).count
  end



end



# Three farkles in a row can result in a deduction of 500[10] or 1000 points from the player's score.

# Players may be required to achieve a certain threshold score in their opening turn or turns, before they can begin scoring. Thresholds of 350
# hot dice can roll all again