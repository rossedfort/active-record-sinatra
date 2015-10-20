class Task < ActiveRecord::Base
  belongs_to :users
  belongs_to :status

  validates_presence_of :title

  # validates :title, presence: true
end
