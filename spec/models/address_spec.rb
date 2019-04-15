require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(build(:address)).to be_valid
    end

    it 'should return an error if no location' do
      address = build :address, location: ''
      expect(address).not_to be_valid
      expect(address.errors.messages[:location]).to include("can't be blank")
    end

    it 'should return an error if too far from the Chronicle' do
      address = build :address, location: '1645 Branch Valley Drive'
      expect(address).not_to be_valid
      expect(address.errors.messages[:base]).not_to be_nil
    end

    it 'should return an error if address cannot be geocoded' do
      address = build :address, location: ',sd,'
      expect(address).not_to be_valid
      expect(address.errors.messages[:base]).not_to be_nil
    end
  end
end
