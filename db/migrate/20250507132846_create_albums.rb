class CreateAlbums < ActiveRecord::Migration[7.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
