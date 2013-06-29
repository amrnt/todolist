class List < ActiveRecord::Base
  attr_accessible :is_public, :title
  validates :title, presence: true

  belongs_to :user
  has_many :tasks, dependent: :destroy
end
