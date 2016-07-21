class Blog < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
end
