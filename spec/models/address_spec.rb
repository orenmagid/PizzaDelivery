require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build(:address)).to be_valid
    end

    it 'should validate the presence of the title' do
      address = build :address, title: ''
      expect(address).not_to be_valid
      expect(address.errors.messages[:title]).to include("can't be blank")
    end

    it 'should validate the presence of the content' do
      address = build :address, content: ''
      expect(address).not_to be_valid
      expect(address.errors.messages[:content]).to include("can't be blank")
    end

    it 'should validate the presence of the slug' do
      address = build :address, slug: ''
      expect(address).not_to be_valid
      expect(address.errors.messages[:slug]).to include("can't be blank")
    end

    it 'should validate uniqueness of the slug' do
      address = create :address
      invalid_address = build :address, slug: address.slug
      expect(invalid_address).not_to be_valid
    end
  end
end
