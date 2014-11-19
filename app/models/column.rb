class Column < ActiveRecord::Base
	belongs_to :header
	validates :header_id, presence: true
end
