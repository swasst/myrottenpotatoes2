class Movie < ActiveRecord::Base
  validates :title, :presence => true
  has_many :reviews
end
