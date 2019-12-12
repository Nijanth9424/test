class Item < ActiveRecord::Base
  belongs_to :item_categories
  has_one :item_tax
  validates :name, :presence => {:message => "can't be blank."}
  validates :name, uniqueness: true
  validates :rate, numericality: true
end
