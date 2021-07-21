# races = {'dwarf': modifier,
#          'elf',
#          'halfling',
#          'human',
#          'dragonborn',
#          'gnome',
#          'half-elf',
#          'half-orc',
#          'tiefling'}

# classes = {'barbarian': ,
#             'bard',
#             'cleric',
#             'druid',
#             'fighter',
#             'monk',
#             'paladin',
#             'ranger',
#             'rogue',
#             'sorcerer',
#             'warlock',
#             'wizard'}

# ability_score = ['Strength': "Measure: Natural athleticism, bodily power"

# , 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma']

  Dice_1d4 = (1..4)
  dice_1d6 = (1..6)
  dice_1d8 = (1..8)
  dice_1d10 = (1..10)
  dice_1d12 = (1..12)
  dice_1d100 = (1..100)

  class Dices
  # attr_reader :dice_1d4, :dice_1d6, :dice_1d8, :dice_1d10, :dice_1d12,  :dice_1d100

  # def initialize
  # @dice_1d4 = (1..4)
  # @dice_1d6 = (1..6)
  # @dice_1d8 = (1..8)
  # @dice_1d10 = (1..10)
  # @dice_1d12 = (1..12)
  # @dice_1d100 = (1..100)
end


def ability_score_roll(dice)
  scores = []
  roll = []
  6.times do
    4.times do
    roll << rand(dice)
    end
    roll.sort!
    roll.shift
    scores << roll.sum
    roll = []
  end
  p scores.sort!
end

class Player
  attr_accessor :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

  def initialize
    @strength = nil
    @dexterity = nil
    @constitution = nil
    @intelligence = nil
    @wisdom = nil
    @charisma = nil
  end
end

module DnD_Classes
    # hit_point
    # hit_dice
    # hit_point at first level # make default setting
    # hit point at higher level
  # proficiencies
    #  armor
    #  weapons
    #  tools
    #  saving throws
    #  skills


end

module AttributeModifier
  score = attribute_score
  case score
  when 1 then -5
  when 2-3 then -4
  when 4-5 then -3
  when 6-7 then -2
  when 8-9 then -1
  when 10-11 then 0
  when 12-13 then 1
  when 14-15 then 2
  when 16-17 then 3
  when 18-19 then 4
  when 20-21 then 5
  when 22-23 then 6
  when 24-25 then 7
  when 26-27 then 8
  when 28-29 then 9
  when 30 then 10
+4
+5
+6
+7
+8
+9
+10
end



class Barbarian

  def initialize
    @hit_point = 12 +
    @hit_dice = rand(1..12)
  end
end

20.times {ability_score_roll(dice_1d6)}

Solmoa = Barbarian.new
