class ItemTax < ActiveRecord::Base
  belongs_to :item
  validates :tax, :tax_type, numericality: true
end
