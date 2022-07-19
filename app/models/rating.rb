class Rating < ApplicationRecord
  belongs_to :store
  validates_presence_of :value, :opinion, :user_name

  def ratings_average
    return 0 if self.ratings.empty?
    (self.ratings.sum(:value) / self.ratings.count).to_i
  end
end
