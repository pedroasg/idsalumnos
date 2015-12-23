class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :username
      t.text :text
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
