class Trap < ActiveRecord::Base
  belongs_to :user
  validates :lat, presence: true 
  validates :long, presence: true 
end
