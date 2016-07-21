class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :charge, class_name: 'User', foreign_key: 'charge_id'
  has_many :submit_requests, dependent: :destroy
  validates :title, presence: true
end
