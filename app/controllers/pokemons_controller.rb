class PokemonsController < ApplicationController
  before_action :get_pokemons, only: [:all, :select]
  before_action :pokemon_params, only: [:select]

  # GET /
  def index
    json_response('Pokémon API')
  end

  # GET /all
  def all
    json_response(@pokemons)
  end

  # POST /select
  def select
    data_hash = JSON.parse(@pokemons)
    json_response('player'=>data_hash.find {|h1| h1['name']==pokemon_params[:name]},
                  'against'=>data_hash.sample)
  end

  # POST /hit
  def hit
    json_response('hit')
  end    

  private

  def pokemon_params
    params.permit(:name, pokemon: {})
  end

  def get_pokemons
    @pokemons = File.read('storage/pokemons.json')
  end    
end
