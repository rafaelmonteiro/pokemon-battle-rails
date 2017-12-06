class PokemonsController < ApplicationController
  before_action :pokemon_params, only: [:select]

  # GET /
  def index
    json_response('Pokémon API')
  end

  # GET /all
  def all
    json_response(repo.all)
  end

  # POST /select
  def select
    json_response('player'=>repo.find(pokemon_params[:name]),
                  'against'=>repo.random)
  end

  # POST /hit
  def hit
    json_response('hit')
  end    

  private

  def pokemon_params
    params.permit(:name, pokemon: {})
  end

  def repo 
    @repo ||= PokemonRepository.new
  end    
end
