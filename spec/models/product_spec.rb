require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to :store }
end
