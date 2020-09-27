module Api
  module V1
  class CoffeController < ApplicationController
  def index
    render json: Coffe.all
  end
end
end 
end