require 'rails_helper'

RSpec.describe Store, type: :model do
  it { is_expected.to validate_presence_of(:lonlat) }
  it { is_expected.to validate_presence_of(:name) }
end
