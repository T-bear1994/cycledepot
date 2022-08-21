require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Validation test of Genre model' do
    context 'when name is empty' do
      it 'is invalid' do
        shop = Shop.create(name: "")
        expect(shop).to be_invalid
      end
    end
  end
end
