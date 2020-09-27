module Api
  module V1
  class CoffeController < ApplicationController

  #INDEX
  def index
    #Hämtar allt som finns tillgängligt samt sorterar
    coffe   = Coffe.order('created_at ASC')
    render json: {status: 'SUCCESS', message: 'Shows every coffe article in ascending order', data:coffe}, status: :ok
  end

  #SHOW
  def show
    coffe = Coffe.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded single coffe article', data:coffe}, status: :ok
  end

    #CREATE
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
   
    #PUT
     def update
      #Aldrig bra att låta användarinput komma för nära databasen så
      #använder parametrar istället
     coffe = Coffe.find(params[:id]) 
      if coffe = Coffe.find(params[:id]) 
         render json: {status: 'SUCCESS', message: 'Coffe article is updated', data:coffe}, status: :ok
       else
        render json: {status: 'ERROR', message:'Coffe article is not updated', data:coffe.errors}, status: :unprocessable_entity 
       end
    end

  #DESTROY
  def destroy
    #The specific exception does get raised by destroy bang is called record not destroyed
    #we write a rescue block to handle this
  if  Coffe.find(params[:id]).destroy! #Skickar tillbaka exception om den inte finns att radera
    render json: {status: 'SUCCESS', message: 'Coffe article is deleted' }, status: :ok
  else
   render json: {status: 'ERROR', message:'Coffe article is not deleted' }, status: :unprocessable_entity 
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