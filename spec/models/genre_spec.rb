require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Validation test of Genre model' do
    context 'when name is empty' do
      it 'is invalid' do
        genre = Genre.create(name: "")
        expect(genre).to be_invalid
      end
    end

    context 'when everything is inputted successfully' do
      it 'is valid' do
        genre = Genre.create(name: "カフェ")
        expect(genre).to be_valid
      end
    end
  end
end
