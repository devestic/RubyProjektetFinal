require 'rails_helper'

  #describe kan sägas vara beskrivningen av gruppen av dessa tester...
  RSpec.describe "Coffes", type: :request do

    describe 'GET /coffe' do
    FactoryBot.build(:coffe )

    #medan "it" är de enskilda testerna
    it 'return all coffe articles' do 

    get '/api/v1/coffe'
    expect(response).to have_http_status(:success)
    end
  end

  #Testar att det är möjligt att skapa artiklar
  describe 'POST /coffe' do 
  it 'create a new coffe article' do 

  post '/api/v1/coffe', params: {coffe: {name: 'Zoegas', articlenbr: '997', price: '129', description: 'Drickbart'} } 
  expect(response).to have_http_status(:ok)
  end			
  end
end
 
 