class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.integer :train_no
      t.string :name
      t.string :starts
      t.string :ends

      t.timestamps
    end
  end
end
