class CreateTareas < ActiveRecord::Migration[5.1]
  def change
    create_table :tareas do |t|
      t.string :titulo
      t.boolean :finalizada

      t.timestamps
    end
  end
end
