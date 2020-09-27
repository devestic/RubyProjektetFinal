module Api
  module V1
  class CoffeController < ApplicationController

  def index
    #Hämtar allt som finns tillgängligt
    render json: Coffe.all
  end

    def create
      
      #Aldrig bra att låta användarinput komma för nära databasen så
      #använder parametrar istället
      coffe = Coffe.new(coffe_params)
  
      if coffe.save
        render json: {status: 'SUCCESS', message: 'Coffe article is saved', data:coffe}, status: :ok
      else
        render json: {status: 'ERROR', message:'Coffe article is not saved', data:coffe.errors}, status: :unprocessable_entity 
      end
    end
   

    private
    #Tillåter endast de fyra olika parametrarna som gäller för vår tabell
    def coffe_params
      params.require(:coffe).permit(:name, :articlenbr, :price, :description )
    
    end
  end
 
end
end