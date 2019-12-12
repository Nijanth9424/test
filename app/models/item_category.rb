class ItemCategory < ActiveRecord::Base
  has_many :items
  validates :name, :presence => {:message => "can't be blank."}
  validates :name, uniqueness: true
end
