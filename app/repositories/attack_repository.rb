class AttackRepository
  def initialize(pokemon)
    @pokemon = pokemon
    @attacks = pokemon.attacks
  end 

  def find(name)
    Attack.new(@attacks.find {|h1| h1['name']==name}, @pokemon)
  end

  def random()
    Attack.new(@attacks.sample, @pokemon)
  end
end