require 'spec_helper'

RSpec.describe 'POST /api/v1/categories', :api, :category do
  let(:headers) { { "Accept" => "application/json", "Content-Type" => "application/json", "CONTENT_TYPE" => "application/json" } }

  context "When creating categories" do
    let(:params) {
      {
        name: 'Music'
      }
    }

    before {
      post '/api/v1/categories', params.to_json, headers
    }

    it "creates the category with the name" do
      json = JSON.parse(last_response.body)
      expect(last_response.status).to eq 201
      expect(json["name"]).to eq "Music"
    end
  end
end
