class Type < ActiveRecord::Base
  has_many :columns
  validates :type_id, presence: true
end
