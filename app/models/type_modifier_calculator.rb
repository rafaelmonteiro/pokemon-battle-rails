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
    return @type_modifier = calculate_type_modifier(@player_attack)    
  end

  def calculate_type_modifier(player_attack)
    @defense = ATTACK_TYPE[0].key(@against_pokemon.type)
    @attack = ATTACK_TYPE[0].key(player_attack.type)
    @multiplier = TYPE_MODIFIER[@attack][@defense]
    @accuracy = rand(1..100)

    if @multiplier > 0
      if @accuracy <= 10
        return TypeModifier.new(DAMAGE_TYPE[0]['MISSED'])
      end

      if @multiplier == 1 && @accuracy >= 90
        return TypeModifier.new(DAMAGE_TYPE[0]['CRITICAL'])
      end

      if @multiplier == 1    
        return TypeModifier.new(DAMAGE_TYPE[0]['NORMAL'])
      end

      if @multiplier > 1 && @accuracy >= 90
        return TypeModifier.new(DAMAGE_TYPE[0]['CRITICAL_2XDAMAGE'])
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
