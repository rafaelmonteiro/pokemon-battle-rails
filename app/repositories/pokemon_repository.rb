class PokemonRepository
  def all
    get_pokemons
  end

  def find(name)
    parsed_data.find {|h1| h1['name']==name}
  end

  def random()
    parsed_data.sample
  end

  private

  def parsed_data
    JSON.parse(get_pokemons)
  end

  def get_pokemons
    @pokemons = File.read('storage/pokemons.json')
  end    
end