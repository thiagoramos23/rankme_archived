require 'spec_helper'
require './app/domain/category/services/create'

RSpec.describe ::Domain::Category::Services::Create, :services, :category do

  let(:repository)            { ::Domain::Category::Repositories::Create }
  let(:repository_instance)   { instance_double("::Domain::Category::Repositories::Create") }
  let(:category_entity)       { spy }

  context "When is trying to create a category" do

      before {
        allow(repository).to receive(:new).with(category: category_entity).and_return(repository_instance)
        allow(repository_instance).to receive(:call)
        described_class.new(category: category_entity).call
      }

    it "delegates to repository" do
      expect(repository).to have_received(:new).with(category: category_entity)
      expect(repository_instance).to have_received(:call)
    end
  end
end