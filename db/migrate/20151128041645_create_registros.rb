class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.string :nombres
      t.string :apellidos
      t.string :matricula
      t.string :campus
      t.string :carrera
      t.string :email

      t.timestamps null: false
    end
  end
end
