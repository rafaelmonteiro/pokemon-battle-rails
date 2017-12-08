class TypeModifier
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :description, :multiplier

  def initialize(attributes = {})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def critical
    self.id = DAMAGE_TYPE[0]['CRITICAL']
    self.description = TYPE_MODIFIER_DESCRIPTION[0][DAMAGE_TYPE[0]['CRITICAL']]
    self.multiplier = TYPE_MODIFIER_MULTIPLIER[0][DAMAGE_TYPE[0]['CRITICAL']]
  end

  def missed
    self.id = DAMAGE_TYPE[0]['MISSED']
    self.description = TYPE_MODIFIER_DESCRIPTION[0][DAMAGE_TYPE[0]['MISSED']]
    self.multiplier = TYPE_MODIFIER_MULTIPLIER[0][DAMAGE_TYPE[0]['MISSED']]
  end  

  def persisted?
    false
  end
end
