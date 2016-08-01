class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true

  has_many :notifications, dependent: :destroy
  has_many :conversations, through: :notifications, source: :comment

  accepts_nested_attributes_for :notifications
end
