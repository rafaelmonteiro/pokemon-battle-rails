require 'rails_helper'

RSpec.describe 'Pokemon API', type: :request do

  describe 'GET /all' do
    before { get '/all' }

    it 'returns pokemons' do
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /select' do
    let(:valid_attributes) { { name: 'Pikachu' } }

    context 'when the request is valid' do
      before { post '/select', params: valid_attributes }

      it 'selects a Pokemon' do
        expect(json['player']['name']).to eq('Pikachu')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/select', params: { title: 'Agumon' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/unknown_parameters/)
      end
    end
  end

  describe 'POST /hit' do
    let(:valid_attributes) {{
        player: {
            name: "Squirtle",
            currentHealth: 60,
            attack: "Water Gun"
        },
        against: {
            name: "Charmander",
            currentHealth: 50
        }
    }}

    context 'when the request is valid' do
      before { post '/hit', params: valid_attributes }

      it 'hits an opponent' do
        expect(json[0]['player'][0]['name']).to eq('Squirtle')
        expect(json[0]['against'][0]['name']).to eq('Charmander')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

  end
  
end