class TypeModifierCalculator
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :player_attack, :against_pokemon

  def initialize(attributes = {})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def calculate
    @accuracy = rand(1..100)
    @type_modifier = calculate_type_modifier(player_attack)

    if @accuracy >= 90
      @type_modifier.critical
    end

    if @accuracy <= 10
      @type_modifier.missed
    end    

    @type_modifier
  end

  def calculate_type_modifier(player_attack)
    @defense = ATTACK_TYPE.find {|h1| h1==againstPokemon.type} 
  end

  def persisted?
    false
  end
end
