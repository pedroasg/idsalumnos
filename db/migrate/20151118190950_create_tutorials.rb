class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :name
      t.string :url
      t.text :description
      t.string :language

      t.timestamps null: false
    end
  end
end
