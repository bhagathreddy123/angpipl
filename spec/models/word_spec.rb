require 'rails_helper'

RSpec.describe Word, type: :model do
 it { should have_db_column(:value) }
 it { should have_db_column(:language) }
 describe 'validations' do
    it { is_expected.to validate_presence_of :value }
    it { is_expected.to validate_presence_of :language }
  end
end
