require 'rails_helper'
BRAZIL_IP='179.93.224.3'
ARGENTINA_IP='190.231.195.24'
RSpec.describe "MeaningOfLives", type: :request do
  describe "GET /index/:resource-id" do
    before do
      Content.create(id: 1, name: 'Xuxa', country: 'AR')
    end

    it "should return 42 for a valid country" do      
      get '/meaning_of_life/1', env: { "REMOTE_ADDR":  ARGENTINA_IP }

      expect(response.status).to eq(200)
      content = JSON.parse(response.body)
      expect(content['id']).to eq(1)
    end
    
    it "should return unauthorized request for an invalid country" do      
      get '/meaning_of_life/1', env: { "REMOTE_ADDR":  BRAZIL_IP }

      expect(response.body).to eq('')
      expect(response.status).to eq(401)
    end
  end
  
  describe "GET /index" do
    before do
      Content.create(name: 'Xuxa', country: 'BR')
      Content.create(name: 'Alguiño', country: 'BR')
      Content.create(name: 'Xuxa', country: 'AR')
      Content.create(name: 'Montaña Rusa', country: 'AR')
    end

    it "return resource for Argentina only" do      
      get '/meaning_of_life', env: { "REMOTE_ADDR":  ARGENTINA_IP }

      expect(response.status).to eq(200)
      expect(response.body).to eq([{ name: 'Xuxa' },{ name: 'Montaña Rusa' }].to_json)
    end
    
    it "return resource for Brazil" do      
      get '/meaning_of_life', env: { "REMOTE_ADDR":  BRAZIL_IP }

      expect(response.status).to eq(200)
      expect(response.body).to eq([{ name: 'Xuxa' },{ name: 'Alguiño' }].to_json)
    end
  end
end
