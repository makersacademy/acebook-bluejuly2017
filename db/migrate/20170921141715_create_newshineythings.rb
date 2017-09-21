class CreateNewshineythings < ActiveRecord::Migration[5.1]
  def change
    create_table :newshineythings do |t|

      t.timestamps
    end
  end
end
