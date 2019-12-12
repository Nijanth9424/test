class CreateItemTaxes < ActiveRecord::Migration
  def change
    create_table :item_taxes do |t|
      t.belongs_to :item_id
      t.float :tax_type
      t.float :tax
      t.timestamps null: false
    end
  end
end
