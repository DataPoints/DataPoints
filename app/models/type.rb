class Type < ActiveRecord::Base
  has_many :columns
  validates :name, :uniqueness => true
end
