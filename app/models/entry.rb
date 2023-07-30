class Entry < ApplicationRecord
  has_many :users
  belongs_to :hackathon
end
