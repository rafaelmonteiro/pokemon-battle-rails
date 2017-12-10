class Attack
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :pokemon, :name, :power, :type, :accuracy

  validates_presence_of :name

  def initialize(attributes = {}, pokemon)
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
    self.pokemon = pokemon
  end

  def persisted?
    false
  end
end
