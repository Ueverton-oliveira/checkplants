require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { is_expected.to belong_to :store }
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_presence_of(:opinion) }
  it { is_expected.to validate_presence_of(:user_name) }
end
