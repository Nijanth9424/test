class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :item_category
      t.string :name
      t.float :rate
      t.timestamps null: false
    end
  end
end
