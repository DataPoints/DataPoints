class Grouping < ActiveRecord::Base
  belongs_to :coordinate
  belongs_to :dataset
  validates_uniqueness_of :dataset_id, :scope => :coordinate_id
end
