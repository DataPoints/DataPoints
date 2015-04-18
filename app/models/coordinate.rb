class Coordinate < ActiveRecord::Base
  validates :mesto, uniqueness: {case_sensitive: false}
  validates :lat, presence: true
  validates :lng, presence: true

  has_many :groupings, :dependent => :destroy
  has_many :datasets, :through => :groupings
end
