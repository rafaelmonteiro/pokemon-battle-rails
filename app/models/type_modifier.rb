class TypeModifier
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :description, :multiplier

  def initialize(id)
    self.id = id
    self.description = TYPE_MODIFIER_DESCRIPTION[0][id]
    self.multiplier = TYPE_MODIFIER_MULTIPLIER[0][id] 
  end

  def persisted?
    false
  end
end
