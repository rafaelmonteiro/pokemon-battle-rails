class DamageCalculator
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :description, :multiplier, :type_modifier_calc

  def initialize(attack, against)
    @attack = attack
    @against = against
  end

  def calculate
    @type_modifier_calc = TypeModifierCalculator.new(@attack, @against)
    @@type_modifier = @type_modifier_calc.calculate
    @strength = 10 * @attack.pokemon.attack * @attack.power
    @caused_damage = (((((((@strength / @against.defense) / 50) + 2) * 1) * @@type_modifier.multiplier / 10) * rand(217..255)) / 255).ceil

    return Damage.new(@caused_damage, @@type_modifier)
  end

  def persisted?
    false
  end
end
