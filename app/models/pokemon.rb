class Pokemon
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :type, :avatar, :health, :agility, :attack, :defense, :attacks, :received_damage, :received_attack, :damage_calculator

  validates_presence_of :name

  def initialize(attributes = {})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def hit(attack, against)
    against.received_attack = attack

    @damage_calculator = DamageCalculator.new(attack, against)
    against.received_damage = @damage_calculator.calculate.damage
    against.health = against.health.to_i - against.received_damage
  end

  def persisted?
    false
  end
end
