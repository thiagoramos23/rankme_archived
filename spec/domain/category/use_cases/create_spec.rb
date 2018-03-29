require 'spec_helper'
require './app/domain/category/use_cases/create'
require './app/api/v1/categories/entities/category_request_entity'

RSpec.describe ::Domain::Category::UseCases::Create, :use_cases, :category do

    let(:service)          { ::Domain::Category::Services::Create }
    let(:service_instance) { instance_double("::Domain::Category::Services::Create") }
    let(:category_entity)  { spy }

    context "When category is informed" do
      let(:request_object) { ::Api::V1::Categories::Entities::CategoryRequestEntity.new(name: "Music") }
      
      before {
        allow(request_object).to receive(:to_domain).and_return(category_entity)
        allow(service).to receive(:new).with(category: category_entity).and_return(service_instance)
        allow(service_instance).to receive(:call)
        described_class.new(request_object: request_object).call
      }

      it "delegates to the service" do
        expect(service).to have_received(:new).with(category: category_entity)
        expect(service_instance).to have_received(:call)
      end

    end
end