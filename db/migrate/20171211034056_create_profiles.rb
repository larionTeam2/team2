class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :image
      t.string :age
      t.string :address
      t.string :phone
      t.string :about

      t.timestamps
    end
  end
end
