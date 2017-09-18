class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :bio
      t.string :interests
      t.string :location
      t.string :dob
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
