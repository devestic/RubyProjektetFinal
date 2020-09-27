require 'rails_helper'

RSpec.describe "Coffes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/coffe/index"
      expect(response).to have_http_status(:success)
    end
  end

end
