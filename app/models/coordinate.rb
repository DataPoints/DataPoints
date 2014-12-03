class Coordinate < ActiveRecord::Base
  validates :mesto, uniqueness: {case_sensitive: false}
  validates :lat, presence: true
  validates :lng, presence: true
end
