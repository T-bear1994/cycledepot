require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation test of User model' do
    context 'when name is empty' do
      it 'is invalid' do
        user = User.create(name: "", email: "admin@gmail.com", password: "sample", admin: true)
        expect(user).not_to be_valid
      end
    end
  end
end
