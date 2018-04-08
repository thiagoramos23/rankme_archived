require 'spec_helper'
require './app/domain/category/repositories/create'

RSpec.describe ::Domain::Category::Repositories::Create, :repository, :categories do

  context "When name is informed" do
    let(:category_entity) { ::Domain::Category::Entities::CategoryEntity.new(name: "Music") }

    it "should save a category with the name informed" do
      result = described_class.new(category: category_entity).call
      expect(result).to be_a_kind_of(::Domain::Category::Entities::CategoryEntity)
      expect(result.name).to eq 'Music'
      expect(result.id).not_to be_nil
    end

  end

  context "When name is empty" do

    it "should raise an error" do
      expect {
        described_class.new(category: ::Domain::Category::Entities::CategoryEntity.new(name: "")).call
      }.to raise_error(::Domain::Exceptions::NotNull, "Name needs to be informed")
    end
  end

  context "When name is nil" do

    it "should raise an error" do
      expect {
        described_class.new(category: ::Domain::Category::Entities::CategoryEntity.new(name: nil)).call
      }.to raise_error(::Domain::Exceptions::NotNull, "Name needs to be informed")
    end
  end

end
