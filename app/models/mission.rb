class Mission < ApplicationRecord
  validates_presence_of :title, :time_in_space

  has_many :astronaut_missions
  has_many :astronauts, through: :astronaut_missions

  def self.sort_alphabetical
    order(:title)
  end
end
