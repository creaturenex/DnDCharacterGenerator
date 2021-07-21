module HelperMethods
  def sym_to_s(symbol)
  symbol.to_s.gsub('_', ' ')
  end

  def s_to_const(string)
    object.const_get('@' + string)
  end

  # def array_choice(prompt, variable, array)
  #   prompt
  #   choice = gets.chomp.to_i - 1
  #   variable = object(array[choice]).new
  # end
end

module Prompts
  def banner
    system 'clear'
    puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><"
    puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><"
    puts "                       Never Winter Nights"
    puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><"
    puts "<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><"
    puts ''
  end

  def hello
    puts "Welcome adventurer! Are you ready to enter NeverWinter Nights?"
    puts ''
  end

  def choose_species
    puts 'Please choose your species: press the following number'
    Player::SPECIES.each_with_index { |species, i| puts "#{i + 1} for #{species}" }
  end

  def choose_job
    puts 'Please choose your class: press the following number'
    Player::JOBS.each_with_index { |job, i| puts "#{i + 1} for #{job}" }
  end
end

module AttributeModifier
  def attribute_modifier(score)
    case score
    when 1 then -5
    when 2..3 then -4
    when 4..5 then -3
    when 6..7 then -2
    when 8..9 then -1
    when 10..11 then 0
    when 12..13 then 1
    when 14..15 then 2
    when 16..17 then 3
    when 18..19 then 4
    when 20..21 then 5
    when 22..23 then 6
    when 24..25 then 7
    when 26..27 then 8
    when 28..29 then 9
    when 30 then 10
    end
  end
end

module DnDSpecies
  class Species
    attr_accessor :modifier

    def to_s
      "Species: #{self.class.to_s.delete_prefix("DnDSpecies::").gsub('_','-')}"
    end
  end

  class Human < Species
    def initialize
      @modifier = { Strength: 1, Dexterity: 1, Constitution: 1, Intelligence: 1,
                     Wisdom: 1, Charisma: 1 }
    end
  end

  class Elf < Species
    def initialize
      @modifier = { Dexterity: 1 }
    end
  end

  class Dwarf < Species
    def initialize
      @modifier = { Constitution: 2 }
    end
  end

  class Halfling < Species
    def initialize
      @modifier = { Dexterity: 2 }
    end
  end

  class Dragonborn < Species
    def initialize
      @modifier = { Strength: 2, Charisma: 1 }
    end
  end

  class Gnome < Species
    def initialize
      @modifier = { Intelligence: 2 }
    end
  end

  class Half_Elf < Species

    def initialize
      @ability = [:Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom]
      @modifier = { Charisma: 2 }
      choose_ability_increase
    end

    def choose_ability_increase
      puts "Please choose the first attribute you would like to increase by one"
      @ability.each_with_index { |atr, i| puts "#{i + 1} for #{atr}"}
      first_choice = gets.chomp.to_i - 1
      @modifier[@ability.delete_at(first_choice)] = 1

      puts "Please choose the second attribute you would like to increase by one"
      @ability.each_with_index { |atr, i| puts "#{i + 1} for #{atr}"}
      second_choice = gets.chomp.to_i - 1
      @modifier[@ability.delete_at(second_choice)] = 1
    end
  end

  class Half_Orc < Species
    def initialize
      @modifier = { Strength: 2, Constitution: 1 }
    end
  end

  class Tiefling < Species
    def initialize
      @modifier = { Intelligence: 1, Charisma: 2 }
    end
  end
end

module DnDClasses
  JOBS = %w(Barbarian Bard Cleric Druid Fighter Monk Paladin Ranger Rogue
                Sorcerer Warlock Wizard)
  class JobClasses
    def to_s
      "Class: #{self.class.to_s.delete_prefix("DnDClasses::")}"
    end
  end

  class Barbarian < JobClasses
    attr_accessor :hit_points, :armor,:weapons, :tools, :saving_throws,
                  :initial_skills, :rage, :features, :sub_job

    def initialize
      @hit_points = 12
      @armor = %s(Light_Armor Medium_Armor Shields)
      @weapons = %s(Simple_Weapons Martial_Weapons)
      @tools = []
      @saving_throws = %s(Strength Constitution)
      @initial_skills = %s(Animal_Handling Athletics Intimidation Nature Perception Survival)
      @rage = false
      @features = %s(Rage Unarmored_Defence Reckless_Attack Danger_Sense Primal_Path Ability_Score_Improvement Fast_Movement Feral_Instinct Brutal_Critical Relentless_Rage Persistent_Rage Indomitable_Might Primal Champion)
      @sub_job = { Berserker: %s(Frenzy Mindless_Rage Intimidating_Presence Retaliation), Totem_Warrior: %s(Spirit_Seeker, Totemic_Spirit, Aspect_of_the_Beast Spirit_Walker Totemic_Attunement) }
    end

    def pick_skills
      puts 'Please choose two skills by pressing the following number'
      @initial_skills.each_with_index { |skill, i| puts "#{i + 1} for #{skill}" }
      choice = gets.chomp.to_i - 1
      @skills<< initial_skills.delete_at[choice]
      puts 'Please choose your second skill:'
      @initial_skills.each_with_index { |skill, i| puts "#{i + 1} for #{skill}" }
      choice = gets.chomp.to_i - 1
    end
  end
# =begin
  class Bard < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Cleric < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Druid < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Fighter < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 10
    end
  end

  class Monk < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Paladin < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Ranger < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Rogue < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Sorcerer < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Warlock < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end

  class Wizard < JobClasses
    attr_accessor :hit_points

    def initialize
      @hit_points = 12
    end
  end
# =end
end

class Player
  SPECIES = %w(Human Elf Dwarf Halfling Dragonborn Gnome Half-Elf Half-Orc Tiefling)
  JOBS = %w(Barbarian Bard Cleric Druid Fighter Monk Paladin Ranger Rogue
    Sorcerer Warlock Wizard)

  modules = [Prompts, AttributeModifier, DnDSpecies, DnDClasses]
  modules.each { |mod| include mod}

  attr_accessor :ability_score, :score_modifier, :species, :job,
                :hit_points, :armor,:weapons, :tools, :saving_throws,
                :initial_skills, :rage, :features, :sub_job

  def initialize
    @ability_score = { Strength: 15, Dexterity: 14, Constitution: 13,
                        Intelligence: 12, Wisdom: 10, Charisma: 8 }
    @score_modifier = {}
    pick_species # species is set
    pick_job # class is set
    get_score_modifier
    @hit_points = job.hit_points
    @armor = job.armor
    @weapons = job.weapons
    @tools = job.tools
    @saving_throws = job.saving_throws
    @initial_skills = job.initial_skills
    # this is unique to barbarians, how to capture unique abilities?
    @rage = job.rage
    @features = job.features
    @sub_job = job.sub_job
  end

  def list_player_info
    system 'clear'
    banner
    puts species
    puts job
    list_score_and_modifiers
  end

  private

  def pick_species
    @species = array_choice(choose_species, SPECIES)
    modify_attributes
  end

  def modify_attributes
    species.modifier.each { |key, value| self.ability_score[key] += value }
  end

  def pick_job
    @job = array_choice(choose_job, JOBS)
  end

  def list_score_and_modifiers
    puts ''
    puts 'Ability Scores & Modifiers:'
    ability_score.each do |ability, score|
      puts ''
      puts "#{ability}"
      puts "  #{score} <#{score_modifier[ability]}>"
    end
  end

  def get_score_modifier
    ability_score.each { |key, value| @score_modifier[key] = attribute_modifier(value) }
  end

  def array_choice(prompt, array)
    prompt
    choice = gets.chomp.to_i - 1
    Kernel.const_get( "Player::" + array[choice]).new
  end
end

class CharacterCreation
  include DnDSpecies
  include Prompts
  attr_accessor :player

  def initialize
    banner
    hello
    @player = Player.new
  end
end

new_char = CharacterCreation.new
new_char.player.list_player_info
# puts new_char.player.hit_points
# puts new_char.player.armor
# puts new_char.player.weapons
# puts new_char.player.tools
# puts new_char.player.saving_throws
# puts new_char.player.initial_skills
# puts new_char.player.rage
# puts new_char.player.features
# puts new_char.player.sub_job
