class Voter < ActiveRecord::Base
  has_many :votes
end
