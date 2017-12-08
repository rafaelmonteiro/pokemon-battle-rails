class DamageCalculator
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :description, :multiplier

  def initialize(attack, against)
    @attack = attack
    @against = against
  end

  def calculate

  end

  def persisted?
    false
  end
end
