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
    @pokemon = Pokemon.new(repo.find(pokemon_params[:name]))
    if @pokemon.valid?
      return json_response('player'=>@pokemon,
                    'against'=>repo.random)
    end
    render json: { error: { unknown_values: 'Pokémon not found' } }, 
           status: :unprocessable_entity
  end

  # POST /hit
  def hit
    @player = Pokemon.new(repo.find(params[:player][:name]))
    @player.health = params[:player][:currentHealth]

    @against = Pokemon.new(repo.find(params[:against][:name]))
    @against.health = params[:against][:currentHealth]

    @random_against_attack = AttackRepository.new(@against).random
    @player_attack = AttackRepository.new(@player).find(params[:player][:attack])

    @player.hit(@player_attack, @against)
    @against.hit(@random_against_attack, @player)

    json_response(['player'=> 
      ['name' => @player.name,
        'currentHealth' => @player.health,
        'damage' => @against.received_damage,
        'desc' => @player.damage_calculator.type_modifier_calc.type_modifier.description,
        'desc_id' => @player.damage_calculator.type_modifier_calc.type_modifier.id,
      ],
      'against' => 
        ['name' => @against.name,
          'currentHealth' => @against.health,
          'attack' => @player.received_attack.name,
          'damage' => @player.received_damage,
          'desc' => @against.damage_calculator.type_modifier_calc.type_modifier.description,
          'desc_id' => @against.damage_calculator.type_modifier_calc.type_modifier.id,
        ]
    ])
  end    

  private

  def pokemon_params
    params.permit(:name, :player, :against, pokemon: {})
  end

  def repo 
    @repo ||= PokemonRepository.new
  end    
end
