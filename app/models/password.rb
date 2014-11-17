class Password < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 50}
  validates :description, length: {maximum: 150}
  VALID_URL_REGEX = /\Ahttps?:\/\/[\S]+\z/i
  validates :link, presence: true, format: {with: VALID_URL_REGEX}
end