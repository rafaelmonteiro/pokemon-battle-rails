class Damage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :damage, :type_modifier

  validates_presence_of :damage

  def initialize(damage, type_modifier)
    self.damage = damage
    self.type_modifier = type_modifier
  end

  def persisted?
    false
  end
end
