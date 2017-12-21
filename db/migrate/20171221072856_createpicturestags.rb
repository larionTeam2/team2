class Createpicturestags < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures_tags, :id =>false do |t|
      t.references :picture, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
