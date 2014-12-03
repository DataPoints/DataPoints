class Column < ActiveRecord::Base
	belongs_to :header
  belongs_to :type
	validates :header_id, presence: true
end
