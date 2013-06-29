class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :is_done, :title
  validates :title, presence: true
end
