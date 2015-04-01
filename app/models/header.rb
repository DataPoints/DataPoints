class Header < ActiveRecord::Base
  belongs_to :dataset
  has_many :columns, :dependent => :destroy
  validates :dataset_id, presence: true
end
