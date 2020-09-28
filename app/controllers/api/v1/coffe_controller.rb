module Api
  module V1
    class CoffeController < ApplicationController

   #INDEX
   def index
      #Hämtar allt som finns tillgängligt samt sorterar det
      Coffe.all
      coffe   = Coffe.order('created_at DESC')
      render json: {status: 'SUCCESS', message: 'Shows every coffe article in descending order', data:coffe}, status: :ok
   end


    #SHOW
    def show
      #Aldrig bra att låta användarinput komma för nära databasen så
      #använder parametrar istället
      if coffe = Coffe.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded single coffe article', data:coffe}, status: :ok
      else
        render json: {status: 'ERROR', message:'Coffe article could not be loaded', data:coffe.errors}, status: :unprocessable_entity 
    end
  end
 

    #CREATE
    def create
        coffe = Coffe.new(coffe_params)
      if coffe.save
        render json: {status: 'SUCCESS', message: 'Coffe article is saved', data:coffe}, status: :ok
      else
        render json: {status: 'ERROR', message:'Coffe article is not saved', data:coffe.errors}, status: :unprocessable_entity 
      end
    end
    

    #PUT
  def update
      coffe = Coffe.find(params[:id]) 
    if coffe.update(coffe_params)
      render json: {status: 'SUCCESS', message: 'Coffe article is updated', data:coffe}, status: :ok
   else
    render json: {status: 'ERROR', message:'Coffe article is not updated', data:coffe.errors}, status: :unprocessable_entity 
    end
  end


  #DESTROY
  def destroy
    if  Coffe.find(params[:id]).destroy!
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
 