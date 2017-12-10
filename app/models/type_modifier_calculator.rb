class TypeModifierCalculator
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :player_attack, :against_pokemon, :type_modifier

  def initialize(attack, against)
    @player_attack = attack
    @against_pokemon = against
  end

  def calculate
    @accuracy = rand(1..100)
    @type_modifier = calculate_type_modifier(@player_attack)

    if @accuracy >= 90
      @type_modifier.critical
    end

    if @accuracy <= 10
      @type_modifier.missed
    end    

    return @type_modifier
  end

  def calculate_type_modifier(player_attack)
    @defense = ATTACK_TYPE[0].key(@against_pokemon.type)
    @attack = ATTACK_TYPE[0].key(player_attack.type)
    @multiplier = TYPE_MODIFIER[@attack][@defense]

    if @multiplier > 0
      if @multiplier == 1    
        return TypeModifier.new(DAMAGE_TYPE[0]['NORMAL'])
      end

      if @multiplier > 1
        return TypeModifier.new(DAMAGE_TYPE[0]['DOUBLE_DAMAGE'])
      end

      if @multiplier < 1
        return TypeModifier.new(DAMAGE_TYPE[0]['HALF_DAMAGE'])
      end
    end

    return TypeModifier.new(DAMAGE_TYPE[0]['NO_DAMAGE'])
  end

  def persisted?
    false
  end
end
